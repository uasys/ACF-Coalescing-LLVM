; ModuleID = 'pathfinder.cu'
source_filename = "pathfinder.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@rows = global i32 0, align 4, !dbg !0
@cols = global i32 0, align 4, !dbg !16
@data = global i32* null, align 8, !dbg !18
@wall = global i32** null, align 8, !dbg !20
@result = global i32* null, align 8, !dbg !22
@pyramid_height = global i32 0, align 4, !dbg !23
@.str = private unnamed_addr constant [47 x i8] c"Usage: dynproc row_len col_len pyramid_height\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [11 x i8] c"error: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [92 x i8] c"pyramidHeight: %d\0AgridSize: [%d]\0Aborder:[%d]\0AblockSize: %d\0AblockGrid:[%d]\0AtargetBlock:[%d]\0A\00", align 1

; Function Attrs: uwtable
define void @_Z4initiPPc(i32 %argc, i8** %argv) #0 !dbg !582 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %seed = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i29 = alloca i32, align 4
  %j33 = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !586, metadata !587), !dbg !588
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !589, metadata !587), !dbg !590
  %0 = load i32, i32* %argc.addr, align 4, !dbg !591
  %cmp = icmp eq i32 %0, 4, !dbg !593
  br i1 %cmp, label %if.then, label %if.else, !dbg !594

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !595
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !595
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !595
  %call = call i32 @atoi(i8* %2) #11, !dbg !597
  store i32 %call, i32* @cols, align 4, !dbg !598
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !599
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 2, !dbg !599
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !599
  %call2 = call i32 @atoi(i8* %4) #11, !dbg !600
  store i32 %call2, i32* @rows, align 4, !dbg !601
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !602
  %arrayidx3 = getelementptr inbounds i8*, i8** %5, i64 3, !dbg !602
  %6 = load i8*, i8** %arrayidx3, align 8, !dbg !602
  %call4 = call i32 @atoi(i8* %6) #11, !dbg !603
  store i32 %call4, i32* @pyramid_height, align 4, !dbg !604
  br label %if.end, !dbg !605

if.else:                                          ; preds = %entry
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str, i32 0, i32 0)), !dbg !606
  call void @exit(i32 0) #12, !dbg !608
  unreachable, !dbg !608

if.end:                                           ; preds = %if.then
  %7 = load i32, i32* @rows, align 4, !dbg !609
  %8 = load i32, i32* @cols, align 4, !dbg !610
  %mul = mul nsw i32 %7, %8, !dbg !611
  %9 = sext i32 %mul to i64, !dbg !612
  %10 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %9, i64 4), !dbg !612
  %11 = extractvalue { i64, i1 } %10, 1, !dbg !612
  %12 = extractvalue { i64, i1 } %10, 0, !dbg !612
  %13 = select i1 %11, i64 -1, i64 %12, !dbg !612
  %call6 = call i8* @_Znam(i64 %13) #13, !dbg !612
  %14 = bitcast i8* %call6 to i32*, !dbg !612
  store i32* %14, i32** @data, align 8, !dbg !613
  %15 = load i32, i32* @rows, align 4, !dbg !614
  %16 = sext i32 %15 to i64, !dbg !615
  %17 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %16, i64 8), !dbg !615
  %18 = extractvalue { i64, i1 } %17, 1, !dbg !615
  %19 = extractvalue { i64, i1 } %17, 0, !dbg !615
  %20 = select i1 %18, i64 -1, i64 %19, !dbg !615
  %call7 = call i8* @_Znam(i64 %20) #13, !dbg !615
  %21 = bitcast i8* %call7 to i32**, !dbg !615
  store i32** %21, i32*** @wall, align 8, !dbg !616
  call void @llvm.dbg.declare(metadata i32* %n, metadata !617, metadata !587), !dbg !619
  store i32 0, i32* %n, align 4, !dbg !619
  br label %for.cond, !dbg !620

for.cond:                                         ; preds = %for.inc, %if.end
  %22 = load i32, i32* %n, align 4, !dbg !621
  %23 = load i32, i32* @rows, align 4, !dbg !624
  %cmp8 = icmp slt i32 %22, %23, !dbg !625
  br i1 %cmp8, label %for.body, label %for.end, !dbg !626

for.body:                                         ; preds = %for.cond
  %24 = load i32*, i32** @data, align 8, !dbg !627
  %25 = load i32, i32* @cols, align 4, !dbg !628
  %26 = load i32, i32* %n, align 4, !dbg !629
  %mul9 = mul nsw i32 %25, %26, !dbg !630
  %idx.ext = sext i32 %mul9 to i64, !dbg !631
  %add.ptr = getelementptr inbounds i32, i32* %24, i64 %idx.ext, !dbg !631
  %27 = load i32**, i32*** @wall, align 8, !dbg !632
  %28 = load i32, i32* %n, align 4, !dbg !633
  %idxprom = sext i32 %28 to i64, !dbg !632
  %arrayidx10 = getelementptr inbounds i32*, i32** %27, i64 %idxprom, !dbg !632
  store i32* %add.ptr, i32** %arrayidx10, align 8, !dbg !634
  br label %for.inc, !dbg !632

for.inc:                                          ; preds = %for.body
  %29 = load i32, i32* %n, align 4, !dbg !635
  %inc = add nsw i32 %29, 1, !dbg !635
  store i32 %inc, i32* %n, align 4, !dbg !635
  br label %for.cond, !dbg !637, !llvm.loop !638

for.end:                                          ; preds = %for.cond
  %30 = load i32, i32* @cols, align 4, !dbg !640
  %31 = sext i32 %30 to i64, !dbg !641
  %32 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %31, i64 4), !dbg !641
  %33 = extractvalue { i64, i1 } %32, 1, !dbg !641
  %34 = extractvalue { i64, i1 } %32, 0, !dbg !641
  %35 = select i1 %33, i64 -1, i64 %34, !dbg !641
  %call11 = call i8* @_Znam(i64 %35) #13, !dbg !641
  %36 = bitcast i8* %call11 to i32*, !dbg !641
  store i32* %36, i32** @result, align 8, !dbg !642
  call void @llvm.dbg.declare(metadata i32* %seed, metadata !643, metadata !587), !dbg !644
  store i32 9, i32* %seed, align 4, !dbg !644
  %37 = load i32, i32* %seed, align 4, !dbg !645
  call void @srand(i32 %37) #14, !dbg !646
  call void @llvm.dbg.declare(metadata i32* %i, metadata !647, metadata !587), !dbg !649
  store i32 0, i32* %i, align 4, !dbg !649
  br label %for.cond12, !dbg !650

for.cond12:                                       ; preds = %for.inc26, %for.end
  %38 = load i32, i32* %i, align 4, !dbg !651
  %39 = load i32, i32* @rows, align 4, !dbg !654
  %cmp13 = icmp slt i32 %38, %39, !dbg !655
  br i1 %cmp13, label %for.body14, label %for.end28, !dbg !656

for.body14:                                       ; preds = %for.cond12
  call void @llvm.dbg.declare(metadata i32* %j, metadata !657, metadata !587), !dbg !660
  store i32 0, i32* %j, align 4, !dbg !660
  br label %for.cond15, !dbg !661

for.cond15:                                       ; preds = %for.inc23, %for.body14
  %40 = load i32, i32* %j, align 4, !dbg !662
  %41 = load i32, i32* @cols, align 4, !dbg !665
  %cmp16 = icmp slt i32 %40, %41, !dbg !666
  br i1 %cmp16, label %for.body17, label %for.end25, !dbg !667

for.body17:                                       ; preds = %for.cond15
  %call18 = call i32 @rand() #14, !dbg !668
  %rem = srem i32 %call18, 10, !dbg !670
  %42 = load i32**, i32*** @wall, align 8, !dbg !671
  %43 = load i32, i32* %i, align 4, !dbg !672
  %idxprom19 = sext i32 %43 to i64, !dbg !671
  %arrayidx20 = getelementptr inbounds i32*, i32** %42, i64 %idxprom19, !dbg !671
  %44 = load i32*, i32** %arrayidx20, align 8, !dbg !671
  %45 = load i32, i32* %j, align 4, !dbg !673
  %idxprom21 = sext i32 %45 to i64, !dbg !671
  %arrayidx22 = getelementptr inbounds i32, i32* %44, i64 %idxprom21, !dbg !671
  store i32 %rem, i32* %arrayidx22, align 4, !dbg !674
  br label %for.inc23, !dbg !675

for.inc23:                                        ; preds = %for.body17
  %46 = load i32, i32* %j, align 4, !dbg !676
  %inc24 = add nsw i32 %46, 1, !dbg !676
  store i32 %inc24, i32* %j, align 4, !dbg !676
  br label %for.cond15, !dbg !678, !llvm.loop !679

for.end25:                                        ; preds = %for.cond15
  br label %for.inc26, !dbg !681

for.inc26:                                        ; preds = %for.end25
  %47 = load i32, i32* %i, align 4, !dbg !682
  %inc27 = add nsw i32 %47, 1, !dbg !682
  store i32 %inc27, i32* %i, align 4, !dbg !682
  br label %for.cond12, !dbg !684, !llvm.loop !685

for.end28:                                        ; preds = %for.cond12
  call void @llvm.dbg.declare(metadata i32* %i29, metadata !687, metadata !587), !dbg !689
  store i32 0, i32* %i29, align 4, !dbg !689
  br label %for.cond30, !dbg !690

for.cond30:                                       ; preds = %for.inc46, %for.end28
  %48 = load i32, i32* %i29, align 4, !dbg !691
  %49 = load i32, i32* @rows, align 4, !dbg !694
  %cmp31 = icmp slt i32 %48, %49, !dbg !695
  br i1 %cmp31, label %for.body32, label %for.end48, !dbg !696

for.body32:                                       ; preds = %for.cond30
  call void @llvm.dbg.declare(metadata i32* %j33, metadata !697, metadata !587), !dbg !700
  store i32 0, i32* %j33, align 4, !dbg !700
  br label %for.cond34, !dbg !701

for.cond34:                                       ; preds = %for.inc42, %for.body32
  %50 = load i32, i32* %j33, align 4, !dbg !702
  %51 = load i32, i32* @cols, align 4, !dbg !705
  %cmp35 = icmp slt i32 %50, %51, !dbg !706
  br i1 %cmp35, label %for.body36, label %for.end44, !dbg !707

for.body36:                                       ; preds = %for.cond34
  %52 = load i32**, i32*** @wall, align 8, !dbg !708
  %53 = load i32, i32* %i29, align 4, !dbg !710
  %idxprom37 = sext i32 %53 to i64, !dbg !708
  %arrayidx38 = getelementptr inbounds i32*, i32** %52, i64 %idxprom37, !dbg !708
  %54 = load i32*, i32** %arrayidx38, align 8, !dbg !708
  %55 = load i32, i32* %j33, align 4, !dbg !711
  %idxprom39 = sext i32 %55 to i64, !dbg !708
  %arrayidx40 = getelementptr inbounds i32, i32* %54, i64 %idxprom39, !dbg !708
  %56 = load i32, i32* %arrayidx40, align 4, !dbg !708
  %call41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %56), !dbg !712
  br label %for.inc42, !dbg !713

for.inc42:                                        ; preds = %for.body36
  %57 = load i32, i32* %j33, align 4, !dbg !714
  %inc43 = add nsw i32 %57, 1, !dbg !714
  store i32 %inc43, i32* %j33, align 4, !dbg !714
  br label %for.cond34, !dbg !716, !llvm.loop !717

for.end44:                                        ; preds = %for.cond34
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !719
  br label %for.inc46, !dbg !720

for.inc46:                                        ; preds = %for.end44
  %58 = load i32, i32* %i29, align 4, !dbg !721
  %inc47 = add nsw i32 %58, 1, !dbg !721
  store i32 %inc47, i32* %i29, align 4, !dbg !721
  br label %for.cond30, !dbg !723, !llvm.loop !724

for.end48:                                        ; preds = %for.cond30
  ret void, !dbg !726
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #1

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #5

; Function Attrs: nounwind
declare void @srand(i32) #6

; Function Attrs: nounwind
declare i32 @rand() #6

; Function Attrs: uwtable
define void @_Z5fatalPc(i8* %s) #0 !dbg !727 {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !730, metadata !587), !dbg !731
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !732
  %1 = load i8*, i8** %s.addr, align 8, !dbg !733
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* %1), !dbg !734
  ret void, !dbg !735
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: uwtable
define void @_Z14dynproc_kerneliPiS_S_iiii(i32 %iteration, i32* %gpuWall, i32* %gpuSrc, i32* %gpuResults, i32 %cols, i32 %rows, i32 %startStep, i32 %border) #0 !dbg !736 {
entry:
  %iteration.addr = alloca i32, align 4
  %gpuWall.addr = alloca i32*, align 8
  %gpuSrc.addr = alloca i32*, align 8
  %gpuResults.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %startStep.addr = alloca i32, align 4
  %border.addr = alloca i32, align 4
  store i32 %iteration, i32* %iteration.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %iteration.addr, metadata !739, metadata !587), !dbg !740
  store i32* %gpuWall, i32** %gpuWall.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gpuWall.addr, metadata !741, metadata !587), !dbg !742
  store i32* %gpuSrc, i32** %gpuSrc.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gpuSrc.addr, metadata !743, metadata !587), !dbg !744
  store i32* %gpuResults, i32** %gpuResults.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gpuResults.addr, metadata !745, metadata !587), !dbg !746
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !747, metadata !587), !dbg !748
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !749, metadata !587), !dbg !750
  store i32 %startStep, i32* %startStep.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %startStep.addr, metadata !751, metadata !587), !dbg !752
  store i32 %border, i32* %border.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %border.addr, metadata !753, metadata !587), !dbg !754
  %0 = bitcast i32* %iteration.addr to i8*, !dbg !755
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !755
  %2 = icmp eq i32 %1, 0, !dbg !755
  br i1 %2, label %setup.next, label %setup.end, !dbg !755

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %gpuWall.addr to i8*, !dbg !756
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !756
  %5 = icmp eq i32 %4, 0, !dbg !756
  br i1 %5, label %setup.next1, label %setup.end, !dbg !756

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32** %gpuSrc.addr to i8*, !dbg !758
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !758
  %8 = icmp eq i32 %7, 0, !dbg !758
  br i1 %8, label %setup.next2, label %setup.end, !dbg !758

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32** %gpuResults.addr to i8*, !dbg !760
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !760
  %11 = icmp eq i32 %10, 0, !dbg !760
  br i1 %11, label %setup.next3, label %setup.end, !dbg !760

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %cols.addr to i8*, !dbg !762
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 32), !dbg !762
  %14 = icmp eq i32 %13, 0, !dbg !762
  br i1 %14, label %setup.next4, label %setup.end, !dbg !762

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %rows.addr to i8*, !dbg !764
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 36), !dbg !764
  %17 = icmp eq i32 %16, 0, !dbg !764
  br i1 %17, label %setup.next5, label %setup.end, !dbg !764

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %startStep.addr to i8*, !dbg !766
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 40), !dbg !766
  %20 = icmp eq i32 %19, 0, !dbg !766
  br i1 %20, label %setup.next6, label %setup.end, !dbg !766

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %border.addr to i8*, !dbg !768
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 44), !dbg !768
  %23 = icmp eq i32 %22, 0, !dbg !768
  br i1 %23, label %setup.next7, label %setup.end, !dbg !768

setup.next7:                                      ; preds = %setup.next6
  %24 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32*, i32*, i32*, i32, i32, i32, i32)* @_Z14dynproc_kerneliPiS_S_iiii to i8*)), !dbg !770
  br label %setup.end, !dbg !770

setup.end:                                        ; preds = %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !772
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define i32 @_Z9calc_pathPiPS_iiiii(i32* %gpuWall, i32** %gpuResult, i32 %rows, i32 %cols, i32 %pyramid_height, i32 %blockCols, i32 %borderCols) #0 !dbg !773 {
entry:
  %gpuWall.addr = alloca i32*, align 8
  %gpuResult.addr = alloca i32**, align 8
  %rows.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  %pyramid_height.addr = alloca i32, align 4
  %blockCols.addr = alloca i32, align 4
  %borderCols.addr = alloca i32, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %dimGrid = alloca %struct.dim3, align 4
  %src = alloca i32, align 4
  %dst = alloca i32, align 4
  %t = alloca i32, align 4
  %temp = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp1 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp1.coerce = alloca { i64, i32 }, align 4
  store i32* %gpuWall, i32** %gpuWall.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gpuWall.addr, metadata !776, metadata !587), !dbg !777
  store i32** %gpuResult, i32*** %gpuResult.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %gpuResult.addr, metadata !778, metadata !587), !dbg !779
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !780, metadata !587), !dbg !781
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !782, metadata !587), !dbg !783
  store i32 %pyramid_height, i32* %pyramid_height.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pyramid_height.addr, metadata !784, metadata !587), !dbg !785
  store i32 %blockCols, i32* %blockCols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %blockCols.addr, metadata !786, metadata !587), !dbg !787
  store i32 %borderCols, i32* %borderCols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %borderCols.addr, metadata !788, metadata !587), !dbg !789
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !790, metadata !587), !dbg !814
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlock, i32 256, i32 1, i32 1), !dbg !814
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !815, metadata !587), !dbg !816
  %0 = load i32, i32* %blockCols.addr, align 4, !dbg !817
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGrid, i32 %0, i32 1, i32 1), !dbg !816
  call void @llvm.dbg.declare(metadata i32* %src, metadata !818, metadata !587), !dbg !819
  store i32 1, i32* %src, align 4, !dbg !819
  call void @llvm.dbg.declare(metadata i32* %dst, metadata !820, metadata !587), !dbg !821
  store i32 0, i32* %dst, align 4, !dbg !821
  call void @llvm.dbg.declare(metadata i32* %t, metadata !822, metadata !587), !dbg !824
  store i32 0, i32* %t, align 4, !dbg !824
  br label %for.cond, !dbg !825

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %t, align 4, !dbg !826
  %2 = load i32, i32* %rows.addr, align 4, !dbg !829
  %sub = sub nsw i32 %2, 1, !dbg !830
  %cmp = icmp slt i32 %1, %sub, !dbg !831
  br i1 %cmp, label %for.body, label %for.end, !dbg !832

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !833, metadata !587), !dbg !835
  %3 = load i32, i32* %src, align 4, !dbg !836
  store i32 %3, i32* %temp, align 4, !dbg !835
  %4 = load i32, i32* %dst, align 4, !dbg !837
  store i32 %4, i32* %src, align 4, !dbg !838
  %5 = load i32, i32* %temp, align 4, !dbg !839
  store i32 %5, i32* %dst, align 4, !dbg !840
  %6 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !841
  %7 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !841
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 4, i1 false), !dbg !841
  %8 = bitcast %struct.dim3* %agg.tmp1 to i8*, !dbg !842
  %9 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !842
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 12, i32 4, i1 false), !dbg !842
  %10 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !843
  %11 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !843
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 4, i1 false), !dbg !843
  %12 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !843
  %13 = load i64, i64* %12, align 4, !dbg !843
  %14 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !843
  %15 = load i32, i32* %14, align 4, !dbg !843
  %16 = bitcast { i64, i32 }* %agg.tmp1.coerce to i8*, !dbg !843
  %17 = bitcast %struct.dim3* %agg.tmp1 to i8*, !dbg !843
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 12, i32 4, i1 false), !dbg !843
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp1.coerce, i32 0, i32 0, !dbg !843
  %19 = load i64, i64* %18, align 4, !dbg !843
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp1.coerce, i32 0, i32 1, !dbg !843
  %21 = load i32, i32* %20, align 4, !dbg !843
  %call = call i32 @cudaConfigureCall(i64 %13, i32 %15, i64 %19, i32 %21, i64 0, %struct.CUstream_st* null), !dbg !843
  %tobool = icmp ne i32 %call, 0, !dbg !843
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !844

kcall.configok:                                   ; preds = %for.body
  %22 = load i32, i32* %pyramid_height.addr, align 4, !dbg !845
  %23 = load i32, i32* %rows.addr, align 4, !dbg !845
  %24 = load i32, i32* %t, align 4, !dbg !845
  %sub2 = sub nsw i32 %23, %24, !dbg !845
  %sub3 = sub nsw i32 %sub2, 1, !dbg !845
  %cmp4 = icmp sle i32 %22, %sub3, !dbg !845
  br i1 %cmp4, label %cond.true, label %cond.false, !dbg !845

cond.true:                                        ; preds = %kcall.configok
  %25 = load i32, i32* %pyramid_height.addr, align 4, !dbg !846
  br label %cond.end, !dbg !846

cond.false:                                       ; preds = %kcall.configok
  %26 = load i32, i32* %rows.addr, align 4, !dbg !848
  %27 = load i32, i32* %t, align 4, !dbg !848
  %sub5 = sub nsw i32 %26, %27, !dbg !848
  %sub6 = sub nsw i32 %sub5, 1, !dbg !848
  br label %cond.end, !dbg !848

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %25, %cond.true ], [ %sub6, %cond.false ], !dbg !850
  %28 = load i32*, i32** %gpuWall.addr, align 8, !dbg !852
  %29 = load i32**, i32*** %gpuResult.addr, align 8, !dbg !853
  %30 = load i32, i32* %src, align 4, !dbg !854
  %idxprom = sext i32 %30 to i64, !dbg !853
  %arrayidx = getelementptr inbounds i32*, i32** %29, i64 %idxprom, !dbg !853
  %31 = load i32*, i32** %arrayidx, align 8, !dbg !853
  %32 = load i32**, i32*** %gpuResult.addr, align 8, !dbg !855
  %33 = load i32, i32* %dst, align 4, !dbg !856
  %idxprom7 = sext i32 %33 to i64, !dbg !855
  %arrayidx8 = getelementptr inbounds i32*, i32** %32, i64 %idxprom7, !dbg !855
  %34 = load i32*, i32** %arrayidx8, align 8, !dbg !855
  %35 = load i32, i32* %cols.addr, align 4, !dbg !857
  %36 = load i32, i32* %rows.addr, align 4, !dbg !858
  %37 = load i32, i32* %t, align 4, !dbg !859
  %38 = load i32, i32* %borderCols.addr, align 4, !dbg !860
  call void @_Z14dynproc_kerneliPiS_S_iiii(i32 %cond, i32* %28, i32* %31, i32* %34, i32 %35, i32 %36, i32 %37, i32 %38), !dbg !861
  br label %kcall.end, !dbg !861

kcall.end:                                        ; preds = %cond.end, %for.body
  br label %for.inc, !dbg !862

for.inc:                                          ; preds = %kcall.end
  %39 = load i32, i32* %pyramid_height.addr, align 4, !dbg !863
  %40 = load i32, i32* %t, align 4, !dbg !865
  %add = add nsw i32 %40, %39, !dbg !865
  store i32 %add, i32* %t, align 4, !dbg !865
  br label %for.cond, !dbg !866, !llvm.loop !867

for.end:                                          ; preds = %for.cond
  %41 = load i32, i32* %dst, align 4, !dbg !869
  ret i32 %41, !dbg !870
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #7 comdat align 2 !dbg !871 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !872, metadata !587), !dbg !874
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !875, metadata !587), !dbg !876
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !877, metadata !587), !dbg !878
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !879, metadata !587), !dbg !880
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !881
  %0 = load i32, i32* %vx.addr, align 4, !dbg !882
  store i32 %0, i32* %x, align 4, !dbg !881
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !883
  %1 = load i32, i32* %vy.addr, align 4, !dbg !884
  store i32 %1, i32* %y, align 4, !dbg !883
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !885
  %2 = load i32, i32* %vz.addr, align 4, !dbg !886
  store i32 %2, i32* %z, align 4, !dbg !885
  ret void, !dbg !887
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #8

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #9 !dbg !888 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %num_devices = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !891, metadata !587), !dbg !892
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !893, metadata !587), !dbg !894
  call void @llvm.dbg.declare(metadata i32* %num_devices, metadata !895, metadata !587), !dbg !896
  %call = call i32 @cudaGetDeviceCount(i32* %num_devices), !dbg !897
  %0 = load i32, i32* %num_devices, align 4, !dbg !898
  %cmp = icmp sgt i32 %0, 1, !dbg !900
  br i1 %cmp, label %if.then, label %if.end, !dbg !901

if.then:                                          ; preds = %entry
  %call1 = call i32 @cudaSetDevice(i32 0), !dbg !902
  br label %if.end, !dbg !902

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %argc.addr, align 4, !dbg !904
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !905
  call void @_Z3runiPPc(i32 %1, i8** %2), !dbg !906
  ret i32 0, !dbg !907
}

declare i32 @cudaGetDeviceCount(i32*) #3

declare i32 @cudaSetDevice(i32) #3

; Function Attrs: uwtable
define void @_Z3runiPPc(i32 %argc, i8** %argv) #0 !dbg !908 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %borderCols = alloca i32, align 4
  %smallBlockCol = alloca i32, align 4
  %blockCols = alloca i32, align 4
  %gpuWall = alloca i32*, align 8
  %gpuResult = alloca [2 x i32*], align 16
  %size = alloca i32, align 4
  %final_ret = alloca i32, align 4
  %i = alloca i32, align 4
  %i32 = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !909, metadata !587), !dbg !910
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !911, metadata !587), !dbg !912
  %0 = load i32, i32* %argc.addr, align 4, !dbg !913
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !914
  call void @_Z4initiPPc(i32 %0, i8** %1), !dbg !915
  call void @llvm.dbg.declare(metadata i32* %borderCols, metadata !916, metadata !587), !dbg !917
  %2 = load i32, i32* @pyramid_height, align 4, !dbg !918
  %mul = mul nsw i32 %2, 1, !dbg !919
  store i32 %mul, i32* %borderCols, align 4, !dbg !917
  call void @llvm.dbg.declare(metadata i32* %smallBlockCol, metadata !920, metadata !587), !dbg !921
  %3 = load i32, i32* @pyramid_height, align 4, !dbg !922
  %mul1 = mul nsw i32 %3, 1, !dbg !923
  %mul2 = mul nsw i32 %mul1, 2, !dbg !924
  %sub = sub nsw i32 256, %mul2, !dbg !925
  store i32 %sub, i32* %smallBlockCol, align 4, !dbg !921
  call void @llvm.dbg.declare(metadata i32* %blockCols, metadata !926, metadata !587), !dbg !927
  %4 = load i32, i32* @cols, align 4, !dbg !928
  %5 = load i32, i32* %smallBlockCol, align 4, !dbg !929
  %div = sdiv i32 %4, %5, !dbg !930
  %6 = load i32, i32* @cols, align 4, !dbg !931
  %7 = load i32, i32* %smallBlockCol, align 4, !dbg !932
  %rem = srem i32 %6, %7, !dbg !933
  %cmp = icmp eq i32 %rem, 0, !dbg !934
  %cond = select i1 %cmp, i32 0, i32 1, !dbg !935
  %add = add nsw i32 %div, %cond, !dbg !936
  store i32 %add, i32* %blockCols, align 4, !dbg !927
  %8 = load i32, i32* @pyramid_height, align 4, !dbg !937
  %9 = load i32, i32* @cols, align 4, !dbg !938
  %10 = load i32, i32* %borderCols, align 4, !dbg !939
  %11 = load i32, i32* %blockCols, align 4, !dbg !940
  %12 = load i32, i32* %smallBlockCol, align 4, !dbg !941
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.4, i32 0, i32 0), i32 %8, i32 %9, i32 %10, i32 256, i32 %11, i32 %12), !dbg !942
  call void @llvm.dbg.declare(metadata i32** %gpuWall, metadata !943, metadata !587), !dbg !944
  call void @llvm.dbg.declare(metadata [2 x i32*]* %gpuResult, metadata !945, metadata !587), !dbg !949
  call void @llvm.dbg.declare(metadata i32* %size, metadata !950, metadata !587), !dbg !951
  %13 = load i32, i32* @rows, align 4, !dbg !952
  %14 = load i32, i32* @cols, align 4, !dbg !953
  %mul3 = mul nsw i32 %13, %14, !dbg !954
  store i32 %mul3, i32* %size, align 4, !dbg !951
  %arrayidx = getelementptr inbounds [2 x i32*], [2 x i32*]* %gpuResult, i64 0, i64 0, !dbg !955
  %15 = bitcast i32** %arrayidx to i8**, !dbg !956
  %16 = load i32, i32* @cols, align 4, !dbg !957
  %conv = sext i32 %16 to i64, !dbg !957
  %mul4 = mul i64 4, %conv, !dbg !958
  %call5 = call i32 @cudaMalloc(i8** %15, i64 %mul4), !dbg !959
  %arrayidx6 = getelementptr inbounds [2 x i32*], [2 x i32*]* %gpuResult, i64 0, i64 1, !dbg !960
  %17 = bitcast i32** %arrayidx6 to i8**, !dbg !961
  %18 = load i32, i32* @cols, align 4, !dbg !962
  %conv7 = sext i32 %18 to i64, !dbg !962
  %mul8 = mul i64 4, %conv7, !dbg !963
  %call9 = call i32 @cudaMalloc(i8** %17, i64 %mul8), !dbg !964
  %arrayidx10 = getelementptr inbounds [2 x i32*], [2 x i32*]* %gpuResult, i64 0, i64 0, !dbg !965
  %19 = load i32*, i32** %arrayidx10, align 16, !dbg !965
  %20 = bitcast i32* %19 to i8*, !dbg !965
  %21 = load i32*, i32** @data, align 8, !dbg !966
  %22 = bitcast i32* %21 to i8*, !dbg !966
  %23 = load i32, i32* @cols, align 4, !dbg !967
  %conv11 = sext i32 %23 to i64, !dbg !967
  %mul12 = mul i64 4, %conv11, !dbg !968
  %call13 = call i32 @cudaMemcpy(i8* %20, i8* %22, i64 %mul12, i32 1), !dbg !969
  %24 = bitcast i32** %gpuWall to i8**, !dbg !970
  %25 = load i32, i32* %size, align 4, !dbg !971
  %26 = load i32, i32* @cols, align 4, !dbg !972
  %sub14 = sub nsw i32 %25, %26, !dbg !973
  %conv15 = sext i32 %sub14 to i64, !dbg !974
  %mul16 = mul i64 4, %conv15, !dbg !975
  %call17 = call i32 @cudaMalloc(i8** %24, i64 %mul16), !dbg !976
  %27 = load i32*, i32** %gpuWall, align 8, !dbg !977
  %28 = bitcast i32* %27 to i8*, !dbg !977
  %29 = load i32*, i32** @data, align 8, !dbg !978
  %30 = load i32, i32* @cols, align 4, !dbg !979
  %idx.ext = sext i32 %30 to i64, !dbg !980
  %add.ptr = getelementptr inbounds i32, i32* %29, i64 %idx.ext, !dbg !980
  %31 = bitcast i32* %add.ptr to i8*, !dbg !978
  %32 = load i32, i32* %size, align 4, !dbg !981
  %33 = load i32, i32* @cols, align 4, !dbg !982
  %sub18 = sub nsw i32 %32, %33, !dbg !983
  %conv19 = sext i32 %sub18 to i64, !dbg !984
  %mul20 = mul i64 4, %conv19, !dbg !985
  %call21 = call i32 @cudaMemcpy(i8* %28, i8* %31, i64 %mul20, i32 1), !dbg !986
  call void @llvm.dbg.declare(metadata i32* %final_ret, metadata !987, metadata !587), !dbg !988
  %34 = load i32*, i32** %gpuWall, align 8, !dbg !989
  %arraydecay = getelementptr inbounds [2 x i32*], [2 x i32*]* %gpuResult, i32 0, i32 0, !dbg !990
  %35 = load i32, i32* @rows, align 4, !dbg !991
  %36 = load i32, i32* @cols, align 4, !dbg !992
  %37 = load i32, i32* @pyramid_height, align 4, !dbg !993
  %38 = load i32, i32* %blockCols, align 4, !dbg !994
  %39 = load i32, i32* %borderCols, align 4, !dbg !995
  %call22 = call i32 @_Z9calc_pathPiPS_iiiii(i32* %34, i32** %arraydecay, i32 %35, i32 %36, i32 %37, i32 %38, i32 %39), !dbg !996
  store i32 %call22, i32* %final_ret, align 4, !dbg !988
  %40 = load i32*, i32** @result, align 8, !dbg !997
  %41 = bitcast i32* %40 to i8*, !dbg !997
  %42 = load i32, i32* %final_ret, align 4, !dbg !998
  %idxprom = sext i32 %42 to i64, !dbg !999
  %arrayidx23 = getelementptr inbounds [2 x i32*], [2 x i32*]* %gpuResult, i64 0, i64 %idxprom, !dbg !999
  %43 = load i32*, i32** %arrayidx23, align 8, !dbg !999
  %44 = bitcast i32* %43 to i8*, !dbg !999
  %45 = load i32, i32* @cols, align 4, !dbg !1000
  %conv24 = sext i32 %45 to i64, !dbg !1000
  %mul25 = mul i64 4, %conv24, !dbg !1001
  %call26 = call i32 @cudaMemcpy(i8* %41, i8* %44, i64 %mul25, i32 2), !dbg !1002
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1003, metadata !587), !dbg !1005
  store i32 0, i32* %i, align 4, !dbg !1005
  br label %for.cond, !dbg !1006

for.cond:                                         ; preds = %for.inc, %entry
  %46 = load i32, i32* %i, align 4, !dbg !1007
  %47 = load i32, i32* @cols, align 4, !dbg !1010
  %cmp27 = icmp slt i32 %46, %47, !dbg !1011
  br i1 %cmp27, label %for.body, label %for.end, !dbg !1012

for.body:                                         ; preds = %for.cond
  %48 = load i32*, i32** @data, align 8, !dbg !1013
  %49 = load i32, i32* %i, align 4, !dbg !1014
  %idxprom28 = sext i32 %49 to i64, !dbg !1013
  %arrayidx29 = getelementptr inbounds i32, i32* %48, i64 %idxprom28, !dbg !1013
  %50 = load i32, i32* %arrayidx29, align 4, !dbg !1013
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %50), !dbg !1015
  br label %for.inc, !dbg !1015

for.inc:                                          ; preds = %for.body
  %51 = load i32, i32* %i, align 4, !dbg !1016
  %inc = add nsw i32 %51, 1, !dbg !1016
  store i32 %inc, i32* %i, align 4, !dbg !1016
  br label %for.cond, !dbg !1018, !llvm.loop !1019

for.end:                                          ; preds = %for.cond
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !1021
  call void @llvm.dbg.declare(metadata i32* %i32, metadata !1022, metadata !587), !dbg !1024
  store i32 0, i32* %i32, align 4, !dbg !1024
  br label %for.cond33, !dbg !1025

for.cond33:                                       ; preds = %for.inc39, %for.end
  %52 = load i32, i32* %i32, align 4, !dbg !1026
  %53 = load i32, i32* @cols, align 4, !dbg !1029
  %cmp34 = icmp slt i32 %52, %53, !dbg !1030
  br i1 %cmp34, label %for.body35, label %for.end41, !dbg !1031

for.body35:                                       ; preds = %for.cond33
  %54 = load i32*, i32** @result, align 8, !dbg !1032
  %55 = load i32, i32* %i32, align 4, !dbg !1033
  %idxprom36 = sext i32 %55 to i64, !dbg !1032
  %arrayidx37 = getelementptr inbounds i32, i32* %54, i64 %idxprom36, !dbg !1032
  %56 = load i32, i32* %arrayidx37, align 4, !dbg !1032
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %56), !dbg !1034
  br label %for.inc39, !dbg !1034

for.inc39:                                        ; preds = %for.body35
  %57 = load i32, i32* %i32, align 4, !dbg !1035
  %inc40 = add nsw i32 %57, 1, !dbg !1035
  store i32 %inc40, i32* %i32, align 4, !dbg !1035
  br label %for.cond33, !dbg !1037, !llvm.loop !1038

for.end41:                                        ; preds = %for.cond33
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !1040
  %58 = load i32*, i32** %gpuWall, align 8, !dbg !1041
  %59 = bitcast i32* %58 to i8*, !dbg !1041
  %call43 = call i32 @cudaFree(i8* %59), !dbg !1042
  %arrayidx44 = getelementptr inbounds [2 x i32*], [2 x i32*]* %gpuResult, i64 0, i64 0, !dbg !1043
  %60 = load i32*, i32** %arrayidx44, align 16, !dbg !1043
  %61 = bitcast i32* %60 to i8*, !dbg !1043
  %call45 = call i32 @cudaFree(i8* %61), !dbg !1044
  %arrayidx46 = getelementptr inbounds [2 x i32*], [2 x i32*]* %gpuResult, i64 0, i64 1, !dbg !1045
  %62 = load i32*, i32** %arrayidx46, align 8, !dbg !1045
  %63 = bitcast i32* %62 to i8*, !dbg !1045
  %call47 = call i32 @cudaFree(i8* %63), !dbg !1046
  %64 = load i32*, i32** @data, align 8, !dbg !1047
  %isnull = icmp eq i32* %64, null, !dbg !1048
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !1048

delete.notnull:                                   ; preds = %for.end41
  %65 = bitcast i32* %64 to i8*, !dbg !1049
  call void @_ZdaPv(i8* %65) #15, !dbg !1049
  br label %delete.end, !dbg !1049

delete.end:                                       ; preds = %delete.notnull, %for.end41
  %66 = load i32**, i32*** @wall, align 8, !dbg !1051
  %isnull48 = icmp eq i32** %66, null, !dbg !1052
  br i1 %isnull48, label %delete.end50, label %delete.notnull49, !dbg !1052

delete.notnull49:                                 ; preds = %delete.end
  %67 = bitcast i32** %66 to i8*, !dbg !1053
  call void @_ZdaPv(i8* %67) #15, !dbg !1053
  br label %delete.end50, !dbg !1053

delete.end50:                                     ; preds = %delete.notnull49, %delete.end
  %68 = load i32*, i32** @result, align 8, !dbg !1054
  %isnull51 = icmp eq i32* %68, null, !dbg !1055
  br i1 %isnull51, label %delete.end53, label %delete.notnull52, !dbg !1055

delete.notnull52:                                 ; preds = %delete.end50
  %69 = bitcast i32* %68 to i8*, !dbg !1056
  call void @_ZdaPv(i8* %69) #15, !dbg !1056
  br label %delete.end53, !dbg !1056

delete.end53:                                     ; preds = %delete.notnull52, %delete.end50
  ret void, !dbg !1057
}

declare i32 @cudaMalloc(i8**, i64) #3

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #3

declare i32 @cudaFree(i8*) #3

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #10

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind }
attributes #9 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind readonly }
attributes #12 = { noreturn nounwind }
attributes #13 = { builtin }
attributes #14 = { nounwind }
attributes #15 = { builtin nounwind }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!579, !580}
!llvm.ident = !{!581}

!0 = distinct !DIGlobalVariable(name: "rows", scope: !1, file: !2, line: 15, type: !17, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !12, globals: !15, imports: !24)
!2 = !DIFile(filename: "pathfinder.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!3 = !{!4}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !5, line: 807, size: 32, align: 32, elements: !6, identifier: "_ZTS14cudaMemcpyKind")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!8 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!11 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!12 = !{!13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!15 = !{!0, !16, !18, !20, !22, !23}
!16 = distinct !DIGlobalVariable(name: "cols", scope: !1, file: !2, line: 15, type: !17, isLocal: false, isDefinition: true)
!17 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!18 = distinct !DIGlobalVariable(name: "data", scope: !1, file: !2, line: 16, type: !19, isLocal: false, isDefinition: true)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64, align: 64)
!20 = distinct !DIGlobalVariable(name: "wall", scope: !1, file: !2, line: 17, type: !21, isLocal: false, isDefinition: true)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64, align: 64)
!22 = distinct !DIGlobalVariable(name: "result", scope: !1, file: !2, line: 18, type: !19, isLocal: false, isDefinition: true)
!23 = distinct !DIGlobalVariable(name: "pyramid_height", scope: !1, file: !2, line: 20, type: !17, isLocal: false, isDefinition: true)
!24 = !{!25, !32, !37, !39, !41, !43, !45, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !75, !77, !81, !83, !85, !87, !91, !95, !97, !99, !104, !108, !110, !112, !114, !116, !118, !120, !122, !124, !129, !133, !135, !137, !141, !143, !145, !147, !149, !151, !155, !157, !159, !164, !172, !176, !178, !180, !184, !186, !188, !192, !194, !196, !200, !202, !204, !206, !208, !210, !212, !214, !216, !218, !223, !225, !227, !231, !233, !235, !237, !239, !241, !243, !245, !249, !253, !255, !257, !262, !264, !266, !268, !270, !272, !274, !278, !284, !288, !292, !297, !299, !303, !307, !320, !324, !328, !332, !336, !341, !343, !347, !351, !355, !363, !367, !371, !375, !379, !384, !390, !394, !398, !400, !408, !412, !420, !422, !424, !428, !432, !436, !441, !445, !450, !451, !452, !453, !456, !457, !458, !459, !460, !461, !462, !465, !467, !469, !471, !473, !475, !477, !479, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !550, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577}
!25 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !28, line: 189)
!26 = !DINamespace(name: "std", scope: null, file: !27, line: 188)
!27 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!28 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !27, file: !27, line: 44, type: !29, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !31}
!31 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !33, line: 190)
!33 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !27, file: !27, line: 46, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DISubroutineType(types: !35)
!35 = !{!36, !36}
!36 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !38, line: 191)
!38 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !27, file: !27, line: 48, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !40, line: 192)
!40 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !27, file: !27, line: 50, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !42, line: 193)
!42 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !27, file: !27, line: 52, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !44, line: 194)
!44 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !27, file: !27, line: 56, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !46, line: 195)
!46 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !27, file: !27, line: 54, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DISubroutineType(types: !48)
!48 = !{!36, !36, !36}
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !50, line: 196)
!50 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !27, file: !27, line: 58, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !52, line: 197)
!52 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !27, file: !27, line: 60, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !54, line: 198)
!54 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !27, file: !27, line: 62, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !56, line: 199)
!56 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !27, file: !27, line: 64, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !58, line: 200)
!58 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !27, file: !27, line: 66, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !60, line: 201)
!60 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !27, file: !27, line: 68, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !62, line: 202)
!62 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !27, file: !27, line: 72, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !64, line: 203)
!64 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !27, file: !27, line: 70, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !66, line: 204)
!66 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !27, file: !27, line: 76, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !68, line: 205)
!68 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !27, file: !27, line: 74, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !70, line: 206)
!70 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !27, file: !27, line: 78, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !72, line: 207)
!72 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !27, file: !27, line: 80, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !74, line: 208)
!74 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !27, file: !27, line: 82, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !76, line: 209)
!76 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !27, file: !27, line: 84, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !78, line: 210)
!78 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !27, file: !27, line: 86, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!36, !36, !36, !36}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !82, line: 211)
!82 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !27, file: !27, line: 88, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !84, line: 212)
!84 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !27, file: !27, line: 90, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !86, line: 213)
!86 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !27, file: !27, line: 92, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !88, line: 214)
!88 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !27, file: !27, line: 94, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DISubroutineType(types: !90)
!90 = !{!17, !36}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !92, line: 215)
!92 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !27, file: !27, line: 96, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!36, !36, !19}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !96, line: 216)
!96 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !27, file: !27, line: 98, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !98, line: 217)
!98 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !27, file: !27, line: 100, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !100, line: 218)
!100 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !27, file: !27, line: 102, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !36}
!103 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !105, line: 219)
!105 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !27, file: !27, line: 106, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DISubroutineType(types: !107)
!107 = !{!103, !36, !36}
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !109, line: 220)
!109 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !27, file: !27, line: 105, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !111, line: 221)
!111 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !27, file: !27, line: 108, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !113, line: 222)
!113 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !27, file: !27, line: 112, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !115, line: 223)
!115 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !27, file: !27, line: 111, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !117, line: 224)
!117 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !27, file: !27, line: 114, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !119, line: 225)
!119 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !27, file: !27, line: 116, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !121, line: 226)
!121 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !27, file: !27, line: 118, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !123, line: 227)
!123 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !27, file: !27, line: 120, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !125, line: 228)
!125 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !27, file: !27, line: 121, type: !126, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DISubroutineType(types: !127)
!127 = !{!128, !128}
!128 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !130, line: 229)
!130 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !27, file: !27, line: 123, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!36, !36, !17}
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !134, line: 230)
!134 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !27, file: !27, line: 125, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !136, line: 231)
!136 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !27, file: !27, line: 126, type: !29, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !138, line: 232)
!138 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !27, file: !27, line: 128, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!31, !36}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !142, line: 233)
!142 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !27, file: !27, line: 138, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !144, line: 234)
!144 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !27, file: !27, line: 130, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !146, line: 235)
!146 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !27, file: !27, line: 132, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !148, line: 236)
!148 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !27, file: !27, line: 134, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !150, line: 237)
!150 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !27, file: !27, line: 136, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !152, line: 238)
!152 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !27, file: !27, line: 140, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!128, !36}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !156, line: 239)
!156 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !27, file: !27, line: 142, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !158, line: 240)
!158 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !27, file: !27, line: 143, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !160, line: 241)
!160 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !27, file: !27, line: 145, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!36, !36, !163}
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64, align: 64)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !165, line: 242)
!165 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !27, file: !27, line: 146, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!168, !169}
!168 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64, align: 64)
!170 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !171)
!171 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !173, line: 243)
!173 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !27, file: !27, line: 147, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{!36, !169}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !177, line: 244)
!177 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !27, file: !27, line: 149, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !179, line: 245)
!179 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !27, file: !27, line: 151, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !181, line: 246)
!181 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !27, file: !27, line: 153, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DISubroutineType(types: !183)
!183 = !{!36, !36, !168}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !185, line: 247)
!185 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !27, file: !27, line: 158, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !187, line: 248)
!187 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !27, file: !27, line: 160, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !189, line: 249)
!189 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !27, file: !27, line: 162, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!36, !36, !36, !19}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !193, line: 250)
!193 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !27, file: !27, line: 164, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !195, line: 251)
!195 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !27, file: !27, line: 166, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !197, line: 252)
!197 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !27, file: !27, line: 168, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DISubroutineType(types: !199)
!199 = !{!36, !36, !128}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !201, line: 253)
!201 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !27, file: !27, line: 170, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !203, line: 254)
!203 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !27, file: !27, line: 172, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !205, line: 255)
!205 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !27, file: !27, line: 174, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !207, line: 256)
!207 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !27, file: !27, line: 176, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !209, line: 257)
!209 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !27, file: !27, line: 178, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !211, line: 258)
!211 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !27, file: !27, line: 180, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !213, line: 259)
!213 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !27, file: !27, line: 182, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !215, line: 260)
!215 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !27, file: !27, line: 184, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !217, line: 261)
!217 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !27, file: !27, line: 186, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !219, line: 102)
!219 = !DISubprogram(name: "acos", scope: !220, file: !220, line: 54, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!221 = !DISubroutineType(types: !222)
!222 = !{!168, !168}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !224, line: 121)
!224 = !DISubprogram(name: "asin", scope: !220, file: !220, line: 56, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !226, line: 140)
!226 = !DISubprogram(name: "atan", scope: !220, file: !220, line: 58, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !228, line: 159)
!228 = !DISubprogram(name: "atan2", scope: !220, file: !220, line: 60, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DISubroutineType(types: !230)
!230 = !{!168, !168, !168}
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !232, line: 180)
!232 = !DISubprogram(name: "ceil", scope: !220, file: !220, line: 178, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !234, line: 199)
!234 = !DISubprogram(name: "cos", scope: !220, file: !220, line: 63, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !236, line: 218)
!236 = !DISubprogram(name: "cosh", scope: !220, file: !220, line: 72, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !238, line: 237)
!238 = !DISubprogram(name: "exp", scope: !220, file: !220, line: 100, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !240, line: 256)
!240 = !DISubprogram(name: "fabs", scope: !220, file: !220, line: 181, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !242, line: 275)
!242 = !DISubprogram(name: "floor", scope: !220, file: !220, line: 184, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !244, line: 294)
!244 = !DISubprogram(name: "fmod", scope: !220, file: !220, line: 187, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !246, line: 315)
!246 = !DISubprogram(name: "frexp", scope: !220, file: !220, line: 103, type: !247, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DISubroutineType(types: !248)
!248 = !{!168, !168, !19}
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !250, line: 334)
!250 = !DISubprogram(name: "ldexp", scope: !220, file: !220, line: 106, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{!168, !168, !17}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !254, line: 353)
!254 = !DISubprogram(name: "log", scope: !220, file: !220, line: 109, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !256, line: 372)
!256 = !DISubprogram(name: "log10", scope: !220, file: !220, line: 112, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !258, line: 391)
!258 = !DISubprogram(name: "modf", scope: !220, file: !220, line: 115, type: !259, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DISubroutineType(types: !260)
!260 = !{!168, !168, !261}
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64, align: 64)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !263, line: 403)
!263 = !DISubprogram(name: "pow", scope: !220, file: !220, line: 153, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !265, line: 440)
!265 = !DISubprogram(name: "sin", scope: !220, file: !220, line: 65, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !267, line: 459)
!267 = !DISubprogram(name: "sinh", scope: !220, file: !220, line: 74, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !269, line: 478)
!269 = !DISubprogram(name: "sqrt", scope: !220, file: !220, line: 156, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !271, line: 497)
!271 = !DISubprogram(name: "tan", scope: !220, file: !220, line: 67, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !273, line: 516)
!273 = !DISubprogram(name: "tanh", scope: !220, file: !220, line: 76, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !275, line: 118)
!275 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !276, line: 101, baseType: !277)
!276 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!277 = !DICompositeType(tag: DW_TAG_structure_type, file: !276, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !279, line: 119)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !276, line: 109, baseType: !280)
!280 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !276, line: 105, size: 128, align: 64, elements: !281, identifier: "_ZTS6ldiv_t")
!281 = !{!282, !283}
!282 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !280, file: !276, line: 107, baseType: !128, size: 64, align: 64)
!283 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !280, file: !276, line: 108, baseType: !128, size: 64, align: 64, offset: 64)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !285, line: 121)
!285 = !DISubprogram(name: "abort", scope: !276, file: !276, line: 515, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{null}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !289, line: 122)
!289 = !DISubprogram(name: "abs", scope: !276, file: !276, line: 774, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!17, !17}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !293, line: 123)
!293 = !DISubprogram(name: "atexit", scope: !276, file: !276, line: 519, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!17, !296}
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64, align: 64)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !298, line: 129)
!298 = !DISubprogram(name: "atof", scope: !276, file: !276, line: 144, type: !166, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !300, line: 130)
!300 = !DISubprogram(name: "atoi", scope: !276, file: !276, line: 147, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!17, !169}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !304, line: 131)
!304 = !DISubprogram(name: "atol", scope: !276, file: !276, line: 150, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!128, !169}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !308, line: 132)
!308 = !DISubprogram(name: "bsearch", scope: !276, file: !276, line: 754, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DISubroutineType(types: !310)
!310 = !{!14, !311, !311, !313, !313, !316}
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64, align: 64)
!312 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !314, line: 62, baseType: !315)
!314 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!315 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !276, line: 741, baseType: !317)
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 64, align: 64)
!318 = !DISubroutineType(types: !319)
!319 = !{!17, !311, !311}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !321, line: 133)
!321 = !DISubprogram(name: "calloc", scope: !276, file: !276, line: 468, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{!14, !313, !313}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !325, line: 134)
!325 = !DISubprogram(name: "div", scope: !276, file: !276, line: 788, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!275, !17, !17}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !329, line: 135)
!329 = !DISubprogram(name: "exit", scope: !276, file: !276, line: 543, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{null, !17}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !333, line: 136)
!333 = !DISubprogram(name: "free", scope: !276, file: !276, line: 483, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{null, !14}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !337, line: 137)
!337 = !DISubprogram(name: "getenv", scope: !276, file: !276, line: 564, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{!340, !169}
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64, align: 64)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !342, line: 138)
!342 = !DISubprogram(name: "labs", scope: !276, file: !276, line: 775, type: !126, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !344, line: 139)
!344 = !DISubprogram(name: "ldiv", scope: !276, file: !276, line: 790, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!279, !128, !128}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !348, line: 140)
!348 = !DISubprogram(name: "malloc", scope: !276, file: !276, line: 466, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!14, !313}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !352, line: 142)
!352 = !DISubprogram(name: "mblen", scope: !276, file: !276, line: 862, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{!17, !169, !313}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !356, line: 143)
!356 = !DISubprogram(name: "mbstowcs", scope: !276, file: !276, line: 873, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!313, !359, !362, !313}
!359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !360)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64, align: 64)
!361 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!362 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !169)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !364, line: 144)
!364 = !DISubprogram(name: "mbtowc", scope: !276, file: !276, line: 865, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!17, !359, !362, !313}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !368, line: 146)
!368 = !DISubprogram(name: "qsort", scope: !276, file: !276, line: 764, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{null, !14, !313, !313, !316}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !372, line: 152)
!372 = !DISubprogram(name: "rand", scope: !276, file: !276, line: 374, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{!17}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !376, line: 153)
!376 = !DISubprogram(name: "realloc", scope: !276, file: !276, line: 480, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!14, !14, !313}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !380, line: 154)
!380 = !DISubprogram(name: "srand", scope: !276, file: !276, line: 376, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!381 = !DISubroutineType(types: !382)
!382 = !{null, !383}
!383 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !385, line: 155)
!385 = !DISubprogram(name: "strtod", scope: !276, file: !276, line: 164, type: !386, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!386 = !DISubroutineType(types: !387)
!387 = !{!168, !362, !388}
!388 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !389)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 64, align: 64)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !391, line: 156)
!391 = !DISubprogram(name: "strtol", scope: !276, file: !276, line: 183, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DISubroutineType(types: !393)
!393 = !{!128, !362, !388, !17}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !395, line: 157)
!395 = !DISubprogram(name: "strtoul", scope: !276, file: !276, line: 187, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!315, !362, !388, !17}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !399, line: 158)
!399 = !DISubprogram(name: "system", scope: !276, file: !276, line: 716, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !401, line: 160)
!401 = !DISubprogram(name: "wcstombs", scope: !276, file: !276, line: 876, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DISubroutineType(types: !403)
!403 = !{!313, !404, !405, !313}
!404 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !340)
!405 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !406)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64, align: 64)
!407 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !361)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !409, line: 161)
!409 = !DISubprogram(name: "wctomb", scope: !276, file: !276, line: 869, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!410 = !DISubroutineType(types: !411)
!411 = !{!17, !340, !361}
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !415, line: 214)
!413 = !DINamespace(name: "__gnu_cxx", scope: null, file: !414, line: 220)
!414 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !276, line: 121, baseType: !416)
!416 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !276, line: 117, size: 128, align: 64, elements: !417, identifier: "_ZTS7lldiv_t")
!417 = !{!418, !419}
!418 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !416, file: !276, line: 119, baseType: !31, size: 64, align: 64)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !416, file: !276, line: 120, baseType: !31, size: 64, align: 64, offset: 64)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !421, line: 220)
!421 = !DISubprogram(name: "_Exit", scope: !276, file: !276, line: 557, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !423, line: 224)
!423 = !DISubprogram(name: "llabs", scope: !276, file: !276, line: 779, type: !29, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !425, line: 230)
!425 = !DISubprogram(name: "lldiv", scope: !276, file: !276, line: 796, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!415, !31, !31}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !429, line: 241)
!429 = !DISubprogram(name: "atoll", scope: !276, file: !276, line: 157, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!31, !169}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !433, line: 242)
!433 = !DISubprogram(name: "strtoll", scope: !276, file: !276, line: 209, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!31, !362, !388, !17}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !437, line: 243)
!437 = !DISubprogram(name: "strtoull", scope: !276, file: !276, line: 214, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!440, !362, !388, !17}
!440 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !442, line: 245)
!442 = !DISubprogram(name: "strtof", scope: !276, file: !276, line: 172, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!36, !362, !388}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !446, line: 246)
!446 = !DISubprogram(name: "strtold", scope: !276, file: !276, line: 175, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!449, !362, !388}
!449 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !415, line: 254)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !421, line: 256)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !423, line: 258)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !454, line: 259)
!454 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !413, file: !455, line: 227, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !425, line: 260)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !429, line: 262)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !442, line: 263)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !433, line: 264)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !437, line: 265)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !446, line: 266)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !463, line: 397)
!463 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !464, file: !464, line: 1342, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !466, line: 398)
!466 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !464, file: !464, line: 1370, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !468, line: 399)
!468 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !464, file: !464, line: 1337, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !470, line: 400)
!470 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !464, file: !464, line: 1375, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !472, line: 401)
!472 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !464, file: !464, line: 1327, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !474, line: 402)
!474 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !464, file: !464, line: 1332, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !476, line: 403)
!476 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !464, file: !464, line: 1380, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !478, line: 404)
!478 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !464, file: !464, line: 1430, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !480, line: 405)
!480 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !481, file: !481, line: 667, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !483, line: 406)
!483 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !464, file: !464, line: 1189, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !485, line: 407)
!485 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !464, file: !464, line: 1243, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !487, line: 408)
!487 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !464, file: !464, line: 1312, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !489, line: 409)
!489 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !464, file: !464, line: 1490, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !491, line: 410)
!491 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !464, file: !464, line: 1480, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !493, line: 411)
!493 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !481, file: !481, line: 657, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !495, line: 412)
!495 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !464, file: !464, line: 1294, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !497, line: 413)
!497 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !464, file: !464, line: 1385, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !499, line: 414)
!499 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !481, file: !481, line: 607, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !501, line: 415)
!501 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !464, file: !464, line: 1616, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !503, line: 416)
!503 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !481, file: !481, line: 597, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !505, line: 417)
!505 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !464, file: !464, line: 1568, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !507, line: 418)
!507 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !481, file: !481, line: 622, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !509, line: 419)
!509 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !481, file: !481, line: 617, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !511, line: 420)
!511 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !464, file: !464, line: 1553, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !513, line: 421)
!513 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !464, file: !464, line: 1543, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !515, line: 422)
!515 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !464, file: !464, line: 1390, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !517, line: 423)
!517 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !464, file: !464, line: 1621, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !519, line: 424)
!519 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !464, file: !464, line: 1520, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !521, line: 425)
!521 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !464, file: !464, line: 1515, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !523, line: 426)
!523 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !464, file: !464, line: 1149, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !525, line: 427)
!525 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !464, file: !464, line: 1602, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !527, line: 428)
!527 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !464, file: !464, line: 1356, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !529, line: 429)
!529 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !464, file: !464, line: 1365, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !531, line: 430)
!531 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !464, file: !464, line: 1285, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !533, line: 431)
!533 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !464, file: !464, line: 1626, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !535, line: 432)
!535 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !464, file: !464, line: 1347, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !537, line: 433)
!537 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !464, file: !464, line: 1140, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !539, line: 434)
!539 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !464, file: !464, line: 1607, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !541, line: 435)
!541 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !464, file: !464, line: 1548, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !543, line: 436)
!543 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !464, file: !464, line: 1154, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !545, line: 437)
!545 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !464, file: !464, line: 1218, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !547, line: 438)
!547 = !DISubprogram(name: "nexttowardf", scope: !220, file: !220, line: 294, type: !548, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!36, !36, !449}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !547, line: 439)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !552, line: 440)
!552 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !464, file: !464, line: 1583, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !554, line: 441)
!554 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !464, file: !464, line: 1558, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !556, line: 442)
!556 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !464, file: !464, line: 1563, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !558, line: 443)
!558 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !464, file: !464, line: 1135, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !560, line: 444)
!560 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !464, file: !464, line: 1597, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !562, line: 445)
!562 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !464, file: !464, line: 1530, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !564, line: 446)
!564 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !464, file: !464, line: 1525, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !566, line: 447)
!566 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !464, file: !464, line: 1234, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !568, line: 448)
!568 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !464, file: !464, line: 1317, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !570, line: 449)
!570 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !481, file: !481, line: 907, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !572, line: 450)
!572 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !464, file: !464, line: 1276, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !574, line: 451)
!574 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !464, file: !464, line: 1322, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !576, line: 452)
!576 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !464, file: !464, line: 1592, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !578, line: 453)
!578 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !481, file: !481, line: 662, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !{i32 2, !"Dwarf Version", i32 4}
!580 = !{i32 2, !"Debug Info Version", i32 3}
!581 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!582 = distinct !DISubprogram(name: "init", linkageName: "_Z4initiPPc", scope: !2, file: !2, line: 26, type: !583, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !585)
!583 = !DISubroutineType(types: !584)
!584 = !{null, !17, !389}
!585 = !{}
!586 = !DILocalVariable(name: "argc", arg: 1, scope: !582, file: !2, line: 26, type: !17)
!587 = !DIExpression()
!588 = !DILocation(line: 26, column: 10, scope: !582)
!589 = !DILocalVariable(name: "argv", arg: 2, scope: !582, file: !2, line: 26, type: !389)
!590 = !DILocation(line: 26, column: 23, scope: !582)
!591 = !DILocation(line: 28, column: 5, scope: !592)
!592 = distinct !DILexicalBlock(scope: !582, file: !2, line: 28, column: 5)
!593 = !DILocation(line: 28, column: 9, scope: !592)
!594 = !DILocation(line: 28, column: 5, scope: !582)
!595 = !DILocation(line: 30, column: 15, scope: !596)
!596 = distinct !DILexicalBlock(scope: !592, file: !2, line: 28, column: 13)
!597 = !DILocation(line: 30, column: 10, scope: !596)
!598 = !DILocation(line: 30, column: 8, scope: !596)
!599 = !DILocation(line: 32, column: 15, scope: !596)
!600 = !DILocation(line: 32, column: 10, scope: !596)
!601 = !DILocation(line: 32, column: 8, scope: !596)
!602 = !DILocation(line: 34, column: 37, scope: !596)
!603 = !DILocation(line: 34, column: 32, scope: !596)
!604 = !DILocation(line: 34, column: 31, scope: !596)
!605 = !DILocation(line: 35, column: 2, scope: !596)
!606 = !DILocation(line: 36, column: 17, scope: !607)
!607 = distinct !DILexicalBlock(scope: !592, file: !2, line: 35, column: 7)
!608 = !DILocation(line: 37, column: 17, scope: !607)
!609 = !DILocation(line: 39, column: 17, scope: !582)
!610 = !DILocation(line: 39, column: 22, scope: !582)
!611 = !DILocation(line: 39, column: 21, scope: !582)
!612 = !DILocation(line: 39, column: 9, scope: !582)
!613 = !DILocation(line: 39, column: 7, scope: !582)
!614 = !DILocation(line: 41, column: 18, scope: !582)
!615 = !DILocation(line: 41, column: 9, scope: !582)
!616 = !DILocation(line: 41, column: 7, scope: !582)
!617 = !DILocalVariable(name: "n", scope: !618, file: !2, line: 43, type: !17)
!618 = distinct !DILexicalBlock(scope: !582, file: !2, line: 43, column: 2)
!619 = !DILocation(line: 43, column: 10, scope: !618)
!620 = !DILocation(line: 43, column: 6, scope: !618)
!621 = !DILocation(line: 43, column: 15, scope: !622)
!622 = !DILexicalBlockFile(scope: !623, file: !2, discriminator: 1)
!623 = distinct !DILexicalBlock(scope: !618, file: !2, line: 43, column: 2)
!624 = !DILocation(line: 43, column: 17, scope: !622)
!625 = !DILocation(line: 43, column: 16, scope: !622)
!626 = !DILocation(line: 43, column: 2, scope: !622)
!627 = !DILocation(line: 45, column: 11, scope: !623)
!628 = !DILocation(line: 45, column: 16, scope: !623)
!629 = !DILocation(line: 45, column: 21, scope: !623)
!630 = !DILocation(line: 45, column: 20, scope: !623)
!631 = !DILocation(line: 45, column: 15, scope: !623)
!632 = !DILocation(line: 45, column: 3, scope: !623)
!633 = !DILocation(line: 45, column: 8, scope: !623)
!634 = !DILocation(line: 45, column: 10, scope: !623)
!635 = !DILocation(line: 43, column: 24, scope: !636)
!636 = !DILexicalBlockFile(scope: !623, file: !2, discriminator: 2)
!637 = !DILocation(line: 43, column: 2, scope: !636)
!638 = distinct !{!638, !639}
!639 = !DILocation(line: 43, column: 2, scope: !582)
!640 = !DILocation(line: 47, column: 19, scope: !582)
!641 = !DILocation(line: 47, column: 11, scope: !582)
!642 = !DILocation(line: 47, column: 9, scope: !582)
!643 = !DILocalVariable(name: "seed", scope: !582, file: !2, line: 51, type: !17)
!644 = !DILocation(line: 51, column: 6, scope: !582)
!645 = !DILocation(line: 53, column: 8, scope: !582)
!646 = !DILocation(line: 53, column: 2, scope: !582)
!647 = !DILocalVariable(name: "i", scope: !648, file: !2, line: 57, type: !17)
!648 = distinct !DILexicalBlock(scope: !582, file: !2, line: 57, column: 2)
!649 = !DILocation(line: 57, column: 11, scope: !648)
!650 = !DILocation(line: 57, column: 7, scope: !648)
!651 = !DILocation(line: 57, column: 18, scope: !652)
!652 = !DILexicalBlockFile(scope: !653, file: !2, discriminator: 1)
!653 = distinct !DILexicalBlock(scope: !648, file: !2, line: 57, column: 2)
!654 = !DILocation(line: 57, column: 22, scope: !652)
!655 = !DILocation(line: 57, column: 20, scope: !652)
!656 = !DILocation(line: 57, column: 2, scope: !652)
!657 = !DILocalVariable(name: "j", scope: !658, file: !2, line: 61, type: !17)
!658 = distinct !DILexicalBlock(scope: !659, file: !2, line: 61, column: 9)
!659 = distinct !DILexicalBlock(scope: !653, file: !2, line: 59, column: 5)
!660 = !DILocation(line: 61, column: 18, scope: !658)
!661 = !DILocation(line: 61, column: 14, scope: !658)
!662 = !DILocation(line: 61, column: 25, scope: !663)
!663 = !DILexicalBlockFile(scope: !664, file: !2, discriminator: 1)
!664 = distinct !DILexicalBlock(scope: !658, file: !2, line: 61, column: 9)
!665 = !DILocation(line: 61, column: 29, scope: !663)
!666 = !DILocation(line: 61, column: 27, scope: !663)
!667 = !DILocation(line: 61, column: 9, scope: !663)
!668 = !DILocation(line: 65, column: 26, scope: !669)
!669 = distinct !DILexicalBlock(scope: !664, file: !2, line: 63, column: 9)
!670 = !DILocation(line: 65, column: 33, scope: !669)
!671 = !DILocation(line: 65, column: 13, scope: !669)
!672 = !DILocation(line: 65, column: 18, scope: !669)
!673 = !DILocation(line: 65, column: 21, scope: !669)
!674 = !DILocation(line: 65, column: 24, scope: !669)
!675 = !DILocation(line: 67, column: 9, scope: !669)
!676 = !DILocation(line: 61, column: 36, scope: !677)
!677 = !DILexicalBlockFile(scope: !664, file: !2, discriminator: 2)
!678 = !DILocation(line: 61, column: 9, scope: !677)
!679 = distinct !{!679, !680}
!680 = !DILocation(line: 61, column: 9, scope: !659)
!681 = !DILocation(line: 69, column: 5, scope: !659)
!682 = !DILocation(line: 57, column: 29, scope: !683)
!683 = !DILexicalBlockFile(scope: !653, file: !2, discriminator: 2)
!684 = !DILocation(line: 57, column: 2, scope: !683)
!685 = distinct !{!685, !686}
!686 = !DILocation(line: 57, column: 2, scope: !582)
!687 = !DILocalVariable(name: "i", scope: !688, file: !2, line: 73, type: !17)
!688 = distinct !DILexicalBlock(scope: !582, file: !2, line: 73, column: 5)
!689 = !DILocation(line: 73, column: 14, scope: !688)
!690 = !DILocation(line: 73, column: 10, scope: !688)
!691 = !DILocation(line: 73, column: 21, scope: !692)
!692 = !DILexicalBlockFile(scope: !693, file: !2, discriminator: 1)
!693 = distinct !DILexicalBlock(scope: !688, file: !2, line: 73, column: 5)
!694 = !DILocation(line: 73, column: 25, scope: !692)
!695 = !DILocation(line: 73, column: 23, scope: !692)
!696 = !DILocation(line: 73, column: 5, scope: !692)
!697 = !DILocalVariable(name: "j", scope: !698, file: !2, line: 77, type: !17)
!698 = distinct !DILexicalBlock(scope: !699, file: !2, line: 77, column: 9)
!699 = distinct !DILexicalBlock(scope: !693, file: !2, line: 75, column: 5)
!700 = !DILocation(line: 77, column: 18, scope: !698)
!701 = !DILocation(line: 77, column: 14, scope: !698)
!702 = !DILocation(line: 77, column: 25, scope: !703)
!703 = !DILexicalBlockFile(scope: !704, file: !2, discriminator: 1)
!704 = distinct !DILexicalBlock(scope: !698, file: !2, line: 77, column: 9)
!705 = !DILocation(line: 77, column: 29, scope: !703)
!706 = !DILocation(line: 77, column: 27, scope: !703)
!707 = !DILocation(line: 77, column: 9, scope: !703)
!708 = !DILocation(line: 81, column: 26, scope: !709)
!709 = distinct !DILexicalBlock(scope: !704, file: !2, line: 79, column: 9)
!710 = !DILocation(line: 81, column: 31, scope: !709)
!711 = !DILocation(line: 81, column: 34, scope: !709)
!712 = !DILocation(line: 81, column: 13, scope: !709)
!713 = !DILocation(line: 83, column: 9, scope: !709)
!714 = !DILocation(line: 77, column: 36, scope: !715)
!715 = !DILexicalBlockFile(scope: !704, file: !2, discriminator: 2)
!716 = !DILocation(line: 77, column: 9, scope: !715)
!717 = distinct !{!717, !718}
!718 = !DILocation(line: 77, column: 9, scope: !699)
!719 = !DILocation(line: 85, column: 9, scope: !699)
!720 = !DILocation(line: 87, column: 5, scope: !699)
!721 = !DILocation(line: 73, column: 32, scope: !722)
!722 = !DILexicalBlockFile(scope: !693, file: !2, discriminator: 2)
!723 = !DILocation(line: 73, column: 5, scope: !722)
!724 = distinct !{!724, !725}
!725 = !DILocation(line: 73, column: 5, scope: !582)
!726 = !DILocation(line: 90, column: 1, scope: !582)
!727 = distinct !DISubprogram(name: "fatal", linkageName: "_Z5fatalPc", scope: !2, file: !2, line: 93, type: !728, isLocal: false, isDefinition: true, scopeLine: 94, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !585)
!728 = !DISubroutineType(types: !729)
!729 = !{null, !340}
!730 = !DILocalVariable(name: "s", arg: 1, scope: !727, file: !2, line: 93, type: !340)
!731 = !DILocation(line: 93, column: 13, scope: !727)
!732 = !DILocation(line: 95, column: 10, scope: !727)
!733 = !DILocation(line: 95, column: 33, scope: !727)
!734 = !DILocation(line: 95, column: 2, scope: !727)
!735 = !DILocation(line: 97, column: 1, scope: !727)
!736 = distinct !DISubprogram(name: "dynproc_kernel", linkageName: "_Z14dynproc_kerneliPiS_S_iiii", scope: !2, file: !2, line: 103, type: !737, isLocal: false, isDefinition: true, scopeLine: 112, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !585)
!737 = !DISubroutineType(types: !738)
!738 = !{null, !17, !19, !19, !19, !17, !17, !17, !17}
!739 = !DILocalVariable(name: "iteration", arg: 1, scope: !736, file: !2, line: 104, type: !17)
!740 = !DILocation(line: 104, column: 21, scope: !736)
!741 = !DILocalVariable(name: "gpuWall", arg: 2, scope: !736, file: !2, line: 105, type: !19)
!742 = !DILocation(line: 105, column: 22, scope: !736)
!743 = !DILocalVariable(name: "gpuSrc", arg: 3, scope: !736, file: !2, line: 106, type: !19)
!744 = !DILocation(line: 106, column: 22, scope: !736)
!745 = !DILocalVariable(name: "gpuResults", arg: 4, scope: !736, file: !2, line: 107, type: !19)
!746 = !DILocation(line: 107, column: 22, scope: !736)
!747 = !DILocalVariable(name: "cols", arg: 5, scope: !736, file: !2, line: 108, type: !17)
!748 = !DILocation(line: 108, column: 21, scope: !736)
!749 = !DILocalVariable(name: "rows", arg: 6, scope: !736, file: !2, line: 109, type: !17)
!750 = !DILocation(line: 109, column: 21, scope: !736)
!751 = !DILocalVariable(name: "startStep", arg: 7, scope: !736, file: !2, line: 110, type: !17)
!752 = !DILocation(line: 110, column: 21, scope: !736)
!753 = !DILocalVariable(name: "border", arg: 8, scope: !736, file: !2, line: 111, type: !17)
!754 = !DILocation(line: 111, column: 21, scope: !736)
!755 = !DILocation(line: 112, column: 1, scope: !736)
!756 = !DILocation(line: 112, column: 1, scope: !757)
!757 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 1)
!758 = !DILocation(line: 112, column: 1, scope: !759)
!759 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 2)
!760 = !DILocation(line: 112, column: 1, scope: !761)
!761 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 3)
!762 = !DILocation(line: 112, column: 1, scope: !763)
!763 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 4)
!764 = !DILocation(line: 112, column: 1, scope: !765)
!765 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 5)
!766 = !DILocation(line: 112, column: 1, scope: !767)
!767 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 6)
!768 = !DILocation(line: 112, column: 1, scope: !769)
!769 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 7)
!770 = !DILocation(line: 112, column: 1, scope: !771)
!771 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 8)
!772 = !DILocation(line: 183, column: 1, scope: !736)
!773 = distinct !DISubprogram(name: "calc_path", linkageName: "_Z9calc_pathPiPS_iiiii", scope: !2, file: !2, line: 188, type: !774, isLocal: false, isDefinition: true, scopeLine: 190, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !585)
!774 = !DISubroutineType(types: !775)
!775 = !{!17, !19, !21, !17, !17, !17, !17, !17}
!776 = !DILocalVariable(name: "gpuWall", arg: 1, scope: !773, file: !2, line: 188, type: !19)
!777 = !DILocation(line: 188, column: 20, scope: !773)
!778 = !DILocalVariable(name: "gpuResult", arg: 2, scope: !773, file: !2, line: 188, type: !21)
!779 = !DILocation(line: 188, column: 34, scope: !773)
!780 = !DILocalVariable(name: "rows", arg: 3, scope: !773, file: !2, line: 188, type: !17)
!781 = !DILocation(line: 188, column: 52, scope: !773)
!782 = !DILocalVariable(name: "cols", arg: 4, scope: !773, file: !2, line: 188, type: !17)
!783 = !DILocation(line: 188, column: 62, scope: !773)
!784 = !DILocalVariable(name: "pyramid_height", arg: 5, scope: !773, file: !2, line: 189, type: !17)
!785 = !DILocation(line: 189, column: 7, scope: !773)
!786 = !DILocalVariable(name: "blockCols", arg: 6, scope: !773, file: !2, line: 189, type: !17)
!787 = !DILocation(line: 189, column: 27, scope: !773)
!788 = !DILocalVariable(name: "borderCols", arg: 7, scope: !773, file: !2, line: 189, type: !17)
!789 = !DILocation(line: 189, column: 42, scope: !773)
!790 = !DILocalVariable(name: "dimBlock", scope: !773, file: !2, line: 191, type: !791)
!791 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !792, line: 427, baseType: !793)
!792 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!793 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !792, line: 417, size: 96, align: 32, elements: !794, identifier: "_ZTS4dim3")
!794 = !{!795, !796, !797, !798, !802, !811}
!795 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !793, file: !792, line: 419, baseType: !383, size: 32, align: 32)
!796 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !793, file: !792, line: 419, baseType: !383, size: 32, align: 32, offset: 32)
!797 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !793, file: !792, line: 419, baseType: !383, size: 32, align: 32, offset: 64)
!798 = !DISubprogram(name: "dim3", scope: !793, file: !792, line: 421, type: !799, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!799 = !DISubroutineType(types: !800)
!800 = !{null, !801, !383, !383, !383}
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !793, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!802 = !DISubprogram(name: "dim3", scope: !793, file: !792, line: 422, type: !803, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!803 = !DISubroutineType(types: !804)
!804 = !{null, !801, !805}
!805 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !792, line: 383, baseType: !806)
!806 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !792, line: 190, size: 96, align: 32, elements: !807, identifier: "_ZTS5uint3")
!807 = !{!808, !809, !810}
!808 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !806, file: !792, line: 192, baseType: !383, size: 32, align: 32)
!809 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !806, file: !792, line: 192, baseType: !383, size: 32, align: 32, offset: 32)
!810 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !806, file: !792, line: 192, baseType: !383, size: 32, align: 32, offset: 64)
!811 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !793, file: !792, line: 423, type: !812, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!812 = !DISubroutineType(types: !813)
!813 = !{!805, !801}
!814 = !DILocation(line: 191, column: 14, scope: !773)
!815 = !DILocalVariable(name: "dimGrid", scope: !773, file: !2, line: 192, type: !791)
!816 = !DILocation(line: 192, column: 14, scope: !773)
!817 = !DILocation(line: 192, column: 22, scope: !773)
!818 = !DILocalVariable(name: "src", scope: !773, file: !2, line: 194, type: !17)
!819 = !DILocation(line: 194, column: 13, scope: !773)
!820 = !DILocalVariable(name: "dst", scope: !773, file: !2, line: 194, type: !17)
!821 = !DILocation(line: 194, column: 22, scope: !773)
!822 = !DILocalVariable(name: "t", scope: !823, file: !2, line: 195, type: !17)
!823 = distinct !DILexicalBlock(scope: !773, file: !2, line: 195, column: 2)
!824 = !DILocation(line: 195, column: 11, scope: !823)
!825 = !DILocation(line: 195, column: 7, scope: !823)
!826 = !DILocation(line: 195, column: 18, scope: !827)
!827 = !DILexicalBlockFile(scope: !828, file: !2, discriminator: 1)
!828 = distinct !DILexicalBlock(scope: !823, file: !2, line: 195, column: 2)
!829 = !DILocation(line: 195, column: 22, scope: !827)
!830 = !DILocation(line: 195, column: 26, scope: !827)
!831 = !DILocation(line: 195, column: 20, scope: !827)
!832 = !DILocation(line: 195, column: 2, scope: !827)
!833 = !DILocalVariable(name: "temp", scope: !834, file: !2, line: 196, type: !17)
!834 = distinct !DILexicalBlock(scope: !828, file: !2, line: 195, column: 49)
!835 = !DILocation(line: 196, column: 17, scope: !834)
!836 = !DILocation(line: 196, column: 24, scope: !834)
!837 = !DILocation(line: 197, column: 19, scope: !834)
!838 = !DILocation(line: 197, column: 17, scope: !834)
!839 = !DILocation(line: 198, column: 19, scope: !834)
!840 = !DILocation(line: 198, column: 17, scope: !834)
!841 = !DILocation(line: 199, column: 30, scope: !834)
!842 = !DILocation(line: 199, column: 39, scope: !834)
!843 = !DILocation(line: 199, column: 27, scope: !834)
!844 = !DILocation(line: 199, column: 13, scope: !834)
!845 = !DILocation(line: 200, column: 17, scope: !834)
!846 = !DILocation(line: 200, column: 17, scope: !847)
!847 = !DILexicalBlockFile(scope: !834, file: !2, discriminator: 1)
!848 = !DILocation(line: 200, column: 17, scope: !849)
!849 = !DILexicalBlockFile(scope: !834, file: !2, discriminator: 2)
!850 = !DILocation(line: 200, column: 17, scope: !851)
!851 = !DILexicalBlockFile(scope: !834, file: !2, discriminator: 3)
!852 = !DILocation(line: 201, column: 17, scope: !834)
!853 = !DILocation(line: 201, column: 26, scope: !834)
!854 = !DILocation(line: 201, column: 36, scope: !834)
!855 = !DILocation(line: 201, column: 42, scope: !834)
!856 = !DILocation(line: 201, column: 52, scope: !834)
!857 = !DILocation(line: 202, column: 17, scope: !834)
!858 = !DILocation(line: 202, column: 22, scope: !834)
!859 = !DILocation(line: 202, column: 28, scope: !834)
!860 = !DILocation(line: 202, column: 31, scope: !834)
!861 = !DILocation(line: 199, column: 13, scope: !847)
!862 = !DILocation(line: 203, column: 2, scope: !834)
!863 = !DILocation(line: 195, column: 33, scope: !864)
!864 = !DILexicalBlockFile(scope: !828, file: !2, discriminator: 2)
!865 = !DILocation(line: 195, column: 31, scope: !864)
!866 = !DILocation(line: 195, column: 2, scope: !864)
!867 = distinct !{!867, !868}
!868 = !DILocation(line: 195, column: 2, scope: !773)
!869 = !DILocation(line: 204, column: 16, scope: !773)
!870 = !DILocation(line: 204, column: 9, scope: !773)
!871 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !793, file: !792, line: 421, type: !799, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !798, variables: !585)
!872 = !DILocalVariable(name: "this", arg: 1, scope: !871, type: !873, flags: DIFlagArtificial | DIFlagObjectPointer)
!873 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !793, size: 64, align: 64)
!874 = !DILocation(line: 0, scope: !871)
!875 = !DILocalVariable(name: "vx", arg: 2, scope: !871, file: !792, line: 421, type: !383)
!876 = !DILocation(line: 421, column: 43, scope: !871)
!877 = !DILocalVariable(name: "vy", arg: 3, scope: !871, file: !792, line: 421, type: !383)
!878 = !DILocation(line: 421, column: 64, scope: !871)
!879 = !DILocalVariable(name: "vz", arg: 4, scope: !871, file: !792, line: 421, type: !383)
!880 = !DILocation(line: 421, column: 85, scope: !871)
!881 = !DILocation(line: 421, column: 95, scope: !871)
!882 = !DILocation(line: 421, column: 97, scope: !871)
!883 = !DILocation(line: 421, column: 102, scope: !871)
!884 = !DILocation(line: 421, column: 104, scope: !871)
!885 = !DILocation(line: 421, column: 109, scope: !871)
!886 = !DILocation(line: 421, column: 111, scope: !871)
!887 = !DILocation(line: 421, column: 116, scope: !871)
!888 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 207, type: !889, isLocal: false, isDefinition: true, scopeLine: 208, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !585)
!889 = !DISubroutineType(types: !890)
!890 = !{!17, !17, !389}
!891 = !DILocalVariable(name: "argc", arg: 1, scope: !888, file: !2, line: 207, type: !17)
!892 = !DILocation(line: 207, column: 14, scope: !888)
!893 = !DILocalVariable(name: "argv", arg: 2, scope: !888, file: !2, line: 207, type: !389)
!894 = !DILocation(line: 207, column: 27, scope: !888)
!895 = !DILocalVariable(name: "num_devices", scope: !888, file: !2, line: 209, type: !17)
!896 = !DILocation(line: 209, column: 9, scope: !888)
!897 = !DILocation(line: 210, column: 5, scope: !888)
!898 = !DILocation(line: 211, column: 9, scope: !899)
!899 = distinct !DILexicalBlock(scope: !888, file: !2, line: 211, column: 9)
!900 = !DILocation(line: 211, column: 21, scope: !899)
!901 = !DILocation(line: 211, column: 9, scope: !888)
!902 = !DILocation(line: 211, column: 26, scope: !903)
!903 = !DILexicalBlockFile(scope: !899, file: !2, discriminator: 1)
!904 = !DILocation(line: 213, column: 9, scope: !888)
!905 = !DILocation(line: 213, column: 14, scope: !888)
!906 = !DILocation(line: 213, column: 5, scope: !888)
!907 = !DILocation(line: 215, column: 5, scope: !888)
!908 = distinct !DISubprogram(name: "run", linkageName: "_Z3runiPPc", scope: !2, file: !2, line: 218, type: !583, isLocal: false, isDefinition: true, scopeLine: 219, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !585)
!909 = !DILocalVariable(name: "argc", arg: 1, scope: !908, file: !2, line: 218, type: !17)
!910 = !DILocation(line: 218, column: 14, scope: !908)
!911 = !DILocalVariable(name: "argv", arg: 2, scope: !908, file: !2, line: 218, type: !389)
!912 = !DILocation(line: 218, column: 27, scope: !908)
!913 = !DILocation(line: 220, column: 10, scope: !908)
!914 = !DILocation(line: 220, column: 16, scope: !908)
!915 = !DILocation(line: 220, column: 5, scope: !908)
!916 = !DILocalVariable(name: "borderCols", scope: !908, file: !2, line: 223, type: !17)
!917 = !DILocation(line: 223, column: 9, scope: !908)
!918 = !DILocation(line: 223, column: 23, scope: !908)
!919 = !DILocation(line: 223, column: 38, scope: !908)
!920 = !DILocalVariable(name: "smallBlockCol", scope: !908, file: !2, line: 224, type: !17)
!921 = !DILocation(line: 224, column: 9, scope: !908)
!922 = !DILocation(line: 224, column: 37, scope: !908)
!923 = !DILocation(line: 224, column: 52, scope: !908)
!924 = !DILocation(line: 224, column: 57, scope: !908)
!925 = !DILocation(line: 224, column: 35, scope: !908)
!926 = !DILocalVariable(name: "blockCols", scope: !908, file: !2, line: 225, type: !17)
!927 = !DILocation(line: 225, column: 9, scope: !908)
!928 = !DILocation(line: 225, column: 21, scope: !908)
!929 = !DILocation(line: 225, column: 26, scope: !908)
!930 = !DILocation(line: 225, column: 25, scope: !908)
!931 = !DILocation(line: 225, column: 42, scope: !908)
!932 = !DILocation(line: 225, column: 47, scope: !908)
!933 = !DILocation(line: 225, column: 46, scope: !908)
!934 = !DILocation(line: 225, column: 60, scope: !908)
!935 = !DILocation(line: 225, column: 41, scope: !908)
!936 = !DILocation(line: 225, column: 39, scope: !908)
!937 = !DILocation(line: 228, column: 2, scope: !908)
!938 = !DILocation(line: 228, column: 18, scope: !908)
!939 = !DILocation(line: 228, column: 24, scope: !908)
!940 = !DILocation(line: 228, column: 48, scope: !908)
!941 = !DILocation(line: 228, column: 59, scope: !908)
!942 = !DILocation(line: 227, column: 5, scope: !908)
!943 = !DILocalVariable(name: "gpuWall", scope: !908, file: !2, line: 230, type: !19)
!944 = !DILocation(line: 230, column: 10, scope: !908)
!945 = !DILocalVariable(name: "gpuResult", scope: !908, file: !2, line: 230, type: !946)
!946 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 128, align: 64, elements: !947)
!947 = !{!948}
!948 = !DISubrange(count: 2)
!949 = !DILocation(line: 230, column: 20, scope: !908)
!950 = !DILocalVariable(name: "size", scope: !908, file: !2, line: 231, type: !17)
!951 = !DILocation(line: 231, column: 9, scope: !908)
!952 = !DILocation(line: 231, column: 16, scope: !908)
!953 = !DILocation(line: 231, column: 21, scope: !908)
!954 = !DILocation(line: 231, column: 20, scope: !908)
!955 = !DILocation(line: 233, column: 25, scope: !908)
!956 = !DILocation(line: 233, column: 16, scope: !908)
!957 = !DILocation(line: 233, column: 51, scope: !908)
!958 = !DILocation(line: 233, column: 50, scope: !908)
!959 = !DILocation(line: 233, column: 5, scope: !908)
!960 = !DILocation(line: 234, column: 25, scope: !908)
!961 = !DILocation(line: 234, column: 16, scope: !908)
!962 = !DILocation(line: 234, column: 51, scope: !908)
!963 = !DILocation(line: 234, column: 50, scope: !908)
!964 = !DILocation(line: 234, column: 5, scope: !908)
!965 = !DILocation(line: 235, column: 16, scope: !908)
!966 = !DILocation(line: 235, column: 30, scope: !908)
!967 = !DILocation(line: 235, column: 48, scope: !908)
!968 = !DILocation(line: 235, column: 47, scope: !908)
!969 = !DILocation(line: 235, column: 5, scope: !908)
!970 = !DILocation(line: 236, column: 16, scope: !908)
!971 = !DILocation(line: 236, column: 47, scope: !908)
!972 = !DILocation(line: 236, column: 52, scope: !908)
!973 = !DILocation(line: 236, column: 51, scope: !908)
!974 = !DILocation(line: 236, column: 46, scope: !908)
!975 = !DILocation(line: 236, column: 45, scope: !908)
!976 = !DILocation(line: 236, column: 5, scope: !908)
!977 = !DILocation(line: 237, column: 16, scope: !908)
!978 = !DILocation(line: 237, column: 25, scope: !908)
!979 = !DILocation(line: 237, column: 30, scope: !908)
!980 = !DILocation(line: 237, column: 29, scope: !908)
!981 = !DILocation(line: 237, column: 49, scope: !908)
!982 = !DILocation(line: 237, column: 54, scope: !908)
!983 = !DILocation(line: 237, column: 53, scope: !908)
!984 = !DILocation(line: 237, column: 48, scope: !908)
!985 = !DILocation(line: 237, column: 47, scope: !908)
!986 = !DILocation(line: 237, column: 5, scope: !908)
!987 = !DILocalVariable(name: "final_ret", scope: !908, file: !2, line: 240, type: !17)
!988 = !DILocation(line: 240, column: 9, scope: !908)
!989 = !DILocation(line: 240, column: 31, scope: !908)
!990 = !DILocation(line: 240, column: 40, scope: !908)
!991 = !DILocation(line: 240, column: 51, scope: !908)
!992 = !DILocation(line: 240, column: 57, scope: !908)
!993 = !DILocation(line: 241, column: 3, scope: !908)
!994 = !DILocation(line: 241, column: 19, scope: !908)
!995 = !DILocation(line: 241, column: 30, scope: !908)
!996 = !DILocation(line: 240, column: 21, scope: !908)
!997 = !DILocation(line: 243, column: 16, scope: !908)
!998 = !DILocation(line: 243, column: 34, scope: !908)
!999 = !DILocation(line: 243, column: 24, scope: !908)
!1000 = !DILocation(line: 243, column: 58, scope: !908)
!1001 = !DILocation(line: 243, column: 57, scope: !908)
!1002 = !DILocation(line: 243, column: 5, scope: !908)
!1003 = !DILocalVariable(name: "i", scope: !1004, file: !2, line: 248, type: !17)
!1004 = distinct !DILexicalBlock(scope: !908, file: !2, line: 248, column: 5)
!1005 = !DILocation(line: 248, column: 14, scope: !1004)
!1006 = !DILocation(line: 248, column: 10, scope: !1004)
!1007 = !DILocation(line: 248, column: 21, scope: !1008)
!1008 = !DILexicalBlockFile(scope: !1009, file: !2, discriminator: 1)
!1009 = distinct !DILexicalBlock(scope: !1004, file: !2, line: 248, column: 5)
!1010 = !DILocation(line: 248, column: 25, scope: !1008)
!1011 = !DILocation(line: 248, column: 23, scope: !1008)
!1012 = !DILocation(line: 248, column: 5, scope: !1008)
!1013 = !DILocation(line: 250, column: 26, scope: !1009)
!1014 = !DILocation(line: 250, column: 31, scope: !1009)
!1015 = !DILocation(line: 250, column: 13, scope: !1009)
!1016 = !DILocation(line: 248, column: 32, scope: !1017)
!1017 = !DILexicalBlockFile(scope: !1009, file: !2, discriminator: 2)
!1018 = !DILocation(line: 248, column: 5, scope: !1017)
!1019 = distinct !{!1019, !1020}
!1020 = !DILocation(line: 248, column: 5, scope: !908)
!1021 = !DILocation(line: 252, column: 5, scope: !908)
!1022 = !DILocalVariable(name: "i", scope: !1023, file: !2, line: 254, type: !17)
!1023 = distinct !DILexicalBlock(scope: !908, file: !2, line: 254, column: 5)
!1024 = !DILocation(line: 254, column: 14, scope: !1023)
!1025 = !DILocation(line: 254, column: 10, scope: !1023)
!1026 = !DILocation(line: 254, column: 21, scope: !1027)
!1027 = !DILexicalBlockFile(scope: !1028, file: !2, discriminator: 1)
!1028 = distinct !DILexicalBlock(scope: !1023, file: !2, line: 254, column: 5)
!1029 = !DILocation(line: 254, column: 25, scope: !1027)
!1030 = !DILocation(line: 254, column: 23, scope: !1027)
!1031 = !DILocation(line: 254, column: 5, scope: !1027)
!1032 = !DILocation(line: 256, column: 26, scope: !1028)
!1033 = !DILocation(line: 256, column: 33, scope: !1028)
!1034 = !DILocation(line: 256, column: 13, scope: !1028)
!1035 = !DILocation(line: 254, column: 32, scope: !1036)
!1036 = !DILexicalBlockFile(scope: !1028, file: !2, discriminator: 2)
!1037 = !DILocation(line: 254, column: 5, scope: !1036)
!1038 = distinct !{!1038, !1039}
!1039 = !DILocation(line: 254, column: 5, scope: !908)
!1040 = !DILocation(line: 258, column: 5, scope: !908)
!1041 = !DILocation(line: 263, column: 14, scope: !908)
!1042 = !DILocation(line: 263, column: 5, scope: !908)
!1043 = !DILocation(line: 264, column: 14, scope: !908)
!1044 = !DILocation(line: 264, column: 5, scope: !908)
!1045 = !DILocation(line: 265, column: 14, scope: !908)
!1046 = !DILocation(line: 265, column: 5, scope: !908)
!1047 = !DILocation(line: 267, column: 15, scope: !908)
!1048 = !DILocation(line: 267, column: 5, scope: !908)
!1049 = !DILocation(line: 267, column: 5, scope: !1050)
!1050 = !DILexicalBlockFile(scope: !908, file: !2, discriminator: 1)
!1051 = !DILocation(line: 268, column: 15, scope: !908)
!1052 = !DILocation(line: 268, column: 5, scope: !908)
!1053 = !DILocation(line: 268, column: 5, scope: !1050)
!1054 = !DILocation(line: 269, column: 15, scope: !908)
!1055 = !DILocation(line: 269, column: 5, scope: !908)
!1056 = !DILocation(line: 269, column: 5, scope: !1050)
!1057 = !DILocation(line: 271, column: 1, scope: !908)
