; ModuleID = 'pathfinder.cu'
source_filename = "pathfinder.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@_ZZ14dynproc_kerneliPiS_S_iiiiE4prev = internal addrspace(3) global [256 x i32] zeroinitializer, align 4, !dbg !0
@_ZZ14dynproc_kerneliPiS_S_iiiiE6result = internal addrspace(3) global [256 x i32] zeroinitializer, align 4, !dbg !10
@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent nounwind
define void @_Z14dynproc_kerneliPiS_S_iiii(i32 %iteration, i32* %gpuWall, i32* %gpuSrc, i32* %gpuResults, i32 %cols, i32 %rows, i32 %startStep, i32 %border) #0 !dbg !1 {
entry:
  %iteration.addr = alloca i32, align 4
  %gpuWall.addr = alloca i32*, align 8
  %gpuSrc.addr = alloca i32*, align 8
  %gpuResults.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %startStep.addr = alloca i32, align 4
  %border.addr = alloca i32, align 4
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %small_block_cols = alloca i32, align 4
  %blkX = alloca i32, align 4
  %blkXmax = alloca i32, align 4
  %xidx = alloca i32, align 4
  %validXmin = alloca i32, align 4
  %validXmax = alloca i32, align 4
  %W = alloca i32, align 4
  %E = alloca i32, align 4
  %isValid = alloca i8, align 1
  %computed = alloca i8, align 1
  %i = alloca i32, align 4
  %left = alloca i32, align 4
  %up = alloca i32, align 4
  %right = alloca i32, align 4
  %shortest = alloca i32, align 4
  %index = alloca i32, align 4
  store i32 %iteration, i32* %iteration.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %iteration.addr, metadata !580, metadata !581), !dbg !582
  store i32* %gpuWall, i32** %gpuWall.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gpuWall.addr, metadata !583, metadata !581), !dbg !584
  store i32* %gpuSrc, i32** %gpuSrc.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gpuSrc.addr, metadata !585, metadata !581), !dbg !586
  store i32* %gpuResults, i32** %gpuResults.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gpuResults.addr, metadata !587, metadata !581), !dbg !588
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !589, metadata !581), !dbg !590
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !591, metadata !581), !dbg !592
  store i32 %startStep, i32* %startStep.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %startStep.addr, metadata !593, metadata !581), !dbg !594
  store i32 %border, i32* %border.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %border.addr, metadata !595, metadata !581), !dbg !596
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !597, metadata !581), !dbg !598
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !599, !range !636
  store i32 %0, i32* %bx, align 4, !dbg !598
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !637, metadata !581), !dbg !638
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !639, !range !667
  store i32 %1, i32* %tx, align 4, !dbg !638
  call void @llvm.dbg.declare(metadata i32* %small_block_cols, metadata !668, metadata !581), !dbg !669
  %2 = load i32, i32* %iteration.addr, align 4, !dbg !670
  %mul = mul nsw i32 %2, 1, !dbg !671
  %mul2 = mul nsw i32 %mul, 2, !dbg !672
  %sub = sub nsw i32 256, %mul2, !dbg !673
  store i32 %sub, i32* %small_block_cols, align 4, !dbg !669
  call void @llvm.dbg.declare(metadata i32* %blkX, metadata !674, metadata !581), !dbg !675
  %3 = load i32, i32* %small_block_cols, align 4, !dbg !676
  %4 = load i32, i32* %bx, align 4, !dbg !677
  %mul3 = mul nsw i32 %3, %4, !dbg !678
  %5 = load i32, i32* %border.addr, align 4, !dbg !679
  %sub4 = sub nsw i32 %mul3, %5, !dbg !680
  store i32 %sub4, i32* %blkX, align 4, !dbg !675
  call void @llvm.dbg.declare(metadata i32* %blkXmax, metadata !681, metadata !581), !dbg !682
  %6 = load i32, i32* %blkX, align 4, !dbg !683
  %add = add nsw i32 %6, 256, !dbg !684
  %sub5 = sub nsw i32 %add, 1, !dbg !685
  store i32 %sub5, i32* %blkXmax, align 4, !dbg !682
  call void @llvm.dbg.declare(metadata i32* %xidx, metadata !686, metadata !581), !dbg !687
  %7 = load i32, i32* %blkX, align 4, !dbg !688
  %8 = load i32, i32* %tx, align 4, !dbg !689
  %add6 = add nsw i32 %7, %8, !dbg !690
  store i32 %add6, i32* %xidx, align 4, !dbg !687
  call void @llvm.dbg.declare(metadata i32* %validXmin, metadata !691, metadata !581), !dbg !692
  %9 = load i32, i32* %blkX, align 4, !dbg !693
  %cmp = icmp slt i32 %9, 0, !dbg !694
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !695

cond.true:                                        ; preds = %entry
  %10 = load i32, i32* %blkX, align 4, !dbg !696
  %sub7 = sub nsw i32 0, %10, !dbg !698
  br label %cond.end, !dbg !699

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !700

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub7, %cond.true ], [ 0, %cond.false ], !dbg !702
  store i32 %cond, i32* %validXmin, align 4, !dbg !704
  call void @llvm.dbg.declare(metadata i32* %validXmax, metadata !705, metadata !581), !dbg !706
  %11 = load i32, i32* %blkXmax, align 4, !dbg !707
  %12 = load i32, i32* %cols.addr, align 4, !dbg !708
  %sub8 = sub nsw i32 %12, 1, !dbg !709
  %cmp9 = icmp sgt i32 %11, %sub8, !dbg !710
  br i1 %cmp9, label %cond.true10, label %cond.false14, !dbg !711

cond.true10:                                      ; preds = %cond.end
  %13 = load i32, i32* %blkXmax, align 4, !dbg !712
  %14 = load i32, i32* %cols.addr, align 4, !dbg !713
  %sub11 = sub nsw i32 %13, %14, !dbg !714
  %add12 = add nsw i32 %sub11, 1, !dbg !715
  %sub13 = sub nsw i32 255, %add12, !dbg !716
  br label %cond.end15, !dbg !717

cond.false14:                                     ; preds = %cond.end
  br label %cond.end15, !dbg !718

cond.end15:                                       ; preds = %cond.false14, %cond.true10
  %cond16 = phi i32 [ %sub13, %cond.true10 ], [ 255, %cond.false14 ], !dbg !719
  store i32 %cond16, i32* %validXmax, align 4, !dbg !720
  call void @llvm.dbg.declare(metadata i32* %W, metadata !721, metadata !581), !dbg !722
  %15 = load i32, i32* %tx, align 4, !dbg !723
  %sub17 = sub nsw i32 %15, 1, !dbg !724
  store i32 %sub17, i32* %W, align 4, !dbg !722
  call void @llvm.dbg.declare(metadata i32* %E, metadata !725, metadata !581), !dbg !726
  %16 = load i32, i32* %tx, align 4, !dbg !727
  %add18 = add nsw i32 %16, 1, !dbg !728
  store i32 %add18, i32* %E, align 4, !dbg !726
  %17 = load i32, i32* %W, align 4, !dbg !729
  %18 = load i32, i32* %validXmin, align 4, !dbg !730
  %cmp19 = icmp slt i32 %17, %18, !dbg !731
  br i1 %cmp19, label %cond.true20, label %cond.false21, !dbg !732

cond.true20:                                      ; preds = %cond.end15
  %19 = load i32, i32* %validXmin, align 4, !dbg !733
  br label %cond.end22, !dbg !734

cond.false21:                                     ; preds = %cond.end15
  %20 = load i32, i32* %W, align 4, !dbg !735
  br label %cond.end22, !dbg !736

cond.end22:                                       ; preds = %cond.false21, %cond.true20
  %cond23 = phi i32 [ %19, %cond.true20 ], [ %20, %cond.false21 ], !dbg !737
  store i32 %cond23, i32* %W, align 4, !dbg !738
  %21 = load i32, i32* %E, align 4, !dbg !739
  %22 = load i32, i32* %validXmax, align 4, !dbg !740
  %cmp24 = icmp sgt i32 %21, %22, !dbg !741
  br i1 %cmp24, label %cond.true25, label %cond.false26, !dbg !742

cond.true25:                                      ; preds = %cond.end22
  %23 = load i32, i32* %validXmax, align 4, !dbg !743
  br label %cond.end27, !dbg !744

cond.false26:                                     ; preds = %cond.end22
  %24 = load i32, i32* %E, align 4, !dbg !745
  br label %cond.end27, !dbg !746

cond.end27:                                       ; preds = %cond.false26, %cond.true25
  %cond28 = phi i32 [ %23, %cond.true25 ], [ %24, %cond.false26 ], !dbg !747
  store i32 %cond28, i32* %E, align 4, !dbg !748
  call void @llvm.dbg.declare(metadata i8* %isValid, metadata !749, metadata !581), !dbg !750
  %25 = load i32, i32* %tx, align 4, !dbg !751
  %26 = load i32, i32* %validXmin, align 4, !dbg !751
  %cmp29 = icmp sge i32 %25, %26, !dbg !751
  br i1 %cmp29, label %land.rhs, label %land.end, !dbg !751

land.rhs:                                         ; preds = %cond.end27
  %27 = load i32, i32* %tx, align 4, !dbg !752
  %28 = load i32, i32* %validXmax, align 4, !dbg !752
  %cmp30 = icmp sle i32 %27, %28, !dbg !752
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.end27
  %29 = phi i1 [ false, %cond.end27 ], [ %cmp30, %land.rhs ]
  %frombool = zext i1 %29 to i8, !dbg !753
  store i8 %frombool, i8* %isValid, align 1, !dbg !753
  %30 = load i32, i32* %xidx, align 4, !dbg !754
  %cmp31 = icmp sge i32 %30, 0, !dbg !754
  br i1 %cmp31, label %land.lhs.true, label %if.end, !dbg !754

land.lhs.true:                                    ; preds = %land.end
  %31 = load i32, i32* %xidx, align 4, !dbg !756
  %32 = load i32, i32* %cols.addr, align 4, !dbg !756
  %sub32 = sub nsw i32 %32, 1, !dbg !756
  %cmp33 = icmp sle i32 %31, %sub32, !dbg !756
  br i1 %cmp33, label %if.then, label %if.end, !dbg !756

if.then:                                          ; preds = %land.lhs.true
  %33 = load i32*, i32** %gpuSrc.addr, align 8, !dbg !758
  %34 = load i32, i32* %xidx, align 4, !dbg !760
  %idxprom = sext i32 %34 to i64, !dbg !758
  %arrayidx = getelementptr inbounds i32, i32* %33, i64 %idxprom, !dbg !758
  %35 = load i32, i32* %arrayidx, align 4, !dbg !758
  %36 = load i32, i32* %tx, align 4, !dbg !761
  %idxprom34 = sext i32 %36 to i64, !dbg !762
  %arrayidx35 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom34, !dbg !762
  store i32 %35, i32* %arrayidx35, align 4, !dbg !763
  br label %if.end, !dbg !764

if.end:                                           ; preds = %if.then, %land.lhs.true, %land.end
  call void @llvm.nvvm.barrier0(), !dbg !765
  call void @llvm.dbg.declare(metadata i8* %computed, metadata !766, metadata !581), !dbg !767
  call void @llvm.dbg.declare(metadata i32* %i, metadata !768, metadata !581), !dbg !770
  store i32 0, i32* %i, align 4, !dbg !770
  br label %for.cond, !dbg !771

for.cond:                                         ; preds = %for.inc, %if.end
  %37 = load i32, i32* %i, align 4, !dbg !772
  %38 = load i32, i32* %iteration.addr, align 4, !dbg !775
  %cmp36 = icmp slt i32 %37, %38, !dbg !776
  br i1 %cmp36, label %for.body, label %for.end, !dbg !777

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %computed, align 1, !dbg !778
  %39 = load i32, i32* %tx, align 4, !dbg !780
  %40 = load i32, i32* %i, align 4, !dbg !780
  %add37 = add nsw i32 %40, 1, !dbg !780
  %cmp38 = icmp sge i32 %39, %add37, !dbg !780
  br i1 %cmp38, label %land.lhs.true39, label %if.end69, !dbg !780

land.lhs.true39:                                  ; preds = %for.body
  %41 = load i32, i32* %tx, align 4, !dbg !782
  %42 = load i32, i32* %i, align 4, !dbg !782
  %sub40 = sub nsw i32 256, %42, !dbg !782
  %sub41 = sub nsw i32 %sub40, 2, !dbg !782
  %cmp42 = icmp sle i32 %41, %sub41, !dbg !782
  br i1 %cmp42, label %land.lhs.true43, label %if.end69, !dbg !784

land.lhs.true43:                                  ; preds = %land.lhs.true39
  %43 = load i8, i8* %isValid, align 1, !dbg !785
  %tobool = trunc i8 %43 to i1, !dbg !785
  br i1 %tobool, label %if.then44, label %if.end69, !dbg !786

if.then44:                                        ; preds = %land.lhs.true43
  store i8 1, i8* %computed, align 1, !dbg !788
  call void @llvm.dbg.declare(metadata i32* %left, metadata !790, metadata !581), !dbg !791
  %44 = load i32, i32* %W, align 4, !dbg !792
  %idxprom45 = sext i32 %44 to i64, !dbg !793
  %arrayidx46 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom45, !dbg !793
  %45 = load i32, i32* %arrayidx46, align 4, !dbg !793
  store i32 %45, i32* %left, align 4, !dbg !791
  call void @llvm.dbg.declare(metadata i32* %up, metadata !794, metadata !581), !dbg !795
  %46 = load i32, i32* %tx, align 4, !dbg !796
  %idxprom47 = sext i32 %46 to i64, !dbg !797
  %arrayidx48 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom47, !dbg !797
  %47 = load i32, i32* %arrayidx48, align 4, !dbg !797
  store i32 %47, i32* %up, align 4, !dbg !795
  call void @llvm.dbg.declare(metadata i32* %right, metadata !798, metadata !581), !dbg !799
  %48 = load i32, i32* %E, align 4, !dbg !800
  %idxprom49 = sext i32 %48 to i64, !dbg !801
  %arrayidx50 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom49, !dbg !801
  %49 = load i32, i32* %arrayidx50, align 4, !dbg !801
  store i32 %49, i32* %right, align 4, !dbg !799
  call void @llvm.dbg.declare(metadata i32* %shortest, metadata !802, metadata !581), !dbg !803
  %50 = load i32, i32* %left, align 4, !dbg !804
  %51 = load i32, i32* %up, align 4, !dbg !804
  %cmp51 = icmp sle i32 %50, %51, !dbg !804
  br i1 %cmp51, label %cond.true52, label %cond.false53, !dbg !804

cond.true52:                                      ; preds = %if.then44
  %52 = load i32, i32* %left, align 4, !dbg !805
  br label %cond.end54, !dbg !805

cond.false53:                                     ; preds = %if.then44
  %53 = load i32, i32* %up, align 4, !dbg !807
  br label %cond.end54, !dbg !807

cond.end54:                                       ; preds = %cond.false53, %cond.true52
  %cond55 = phi i32 [ %52, %cond.true52 ], [ %53, %cond.false53 ], !dbg !809
  store i32 %cond55, i32* %shortest, align 4, !dbg !811
  %54 = load i32, i32* %shortest, align 4, !dbg !812
  %55 = load i32, i32* %right, align 4, !dbg !812
  %cmp56 = icmp sle i32 %54, %55, !dbg !812
  br i1 %cmp56, label %cond.true57, label %cond.false58, !dbg !812

cond.true57:                                      ; preds = %cond.end54
  %56 = load i32, i32* %shortest, align 4, !dbg !813
  br label %cond.end59, !dbg !813

cond.false58:                                     ; preds = %cond.end54
  %57 = load i32, i32* %right, align 4, !dbg !814
  br label %cond.end59, !dbg !814

cond.end59:                                       ; preds = %cond.false58, %cond.true57
  %cond60 = phi i32 [ %56, %cond.true57 ], [ %57, %cond.false58 ], !dbg !815
  store i32 %cond60, i32* %shortest, align 4, !dbg !816
  call void @llvm.dbg.declare(metadata i32* %index, metadata !817, metadata !581), !dbg !818
  %58 = load i32, i32* %cols.addr, align 4, !dbg !819
  %59 = load i32, i32* %startStep.addr, align 4, !dbg !820
  %60 = load i32, i32* %i, align 4, !dbg !821
  %add61 = add nsw i32 %59, %60, !dbg !822
  %mul62 = mul nsw i32 %58, %add61, !dbg !823
  %61 = load i32, i32* %xidx, align 4, !dbg !824
  %add63 = add nsw i32 %mul62, %61, !dbg !825
  store i32 %add63, i32* %index, align 4, !dbg !818
  %62 = load i32, i32* %shortest, align 4, !dbg !826
  %63 = load i32*, i32** %gpuWall.addr, align 8, !dbg !827
  %64 = load i32, i32* %index, align 4, !dbg !828
  %idxprom64 = sext i32 %64 to i64, !dbg !827
  %arrayidx65 = getelementptr inbounds i32, i32* %63, i64 %idxprom64, !dbg !827
  %65 = load i32, i32* %arrayidx65, align 4, !dbg !827
  %add66 = add nsw i32 %62, %65, !dbg !829
  %66 = load i32, i32* %tx, align 4, !dbg !830
  %idxprom67 = sext i32 %66 to i64, !dbg !831
  %arrayidx68 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE6result to [256 x i32]*), i64 0, i64 %idxprom67, !dbg !831
  store i32 %add66, i32* %arrayidx68, align 4, !dbg !832
  br label %if.end69, !dbg !833

if.end69:                                         ; preds = %cond.end59, %land.lhs.true43, %land.lhs.true39, %for.body
  call void @llvm.nvvm.barrier0(), !dbg !834
  %67 = load i32, i32* %i, align 4, !dbg !835
  %68 = load i32, i32* %iteration.addr, align 4, !dbg !837
  %sub70 = sub nsw i32 %68, 1, !dbg !838
  %cmp71 = icmp eq i32 %67, %sub70, !dbg !839
  br i1 %cmp71, label %if.then72, label %if.end73, !dbg !840

if.then72:                                        ; preds = %if.end69
  br label %for.end, !dbg !841

if.end73:                                         ; preds = %if.end69
  %69 = load i8, i8* %computed, align 1, !dbg !842
  %tobool74 = trunc i8 %69 to i1, !dbg !842
  br i1 %tobool74, label %if.then75, label %if.end80, !dbg !844

if.then75:                                        ; preds = %if.end73
  %70 = load i32, i32* %tx, align 4, !dbg !845
  %idxprom76 = sext i32 %70 to i64, !dbg !846
  %arrayidx77 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE6result to [256 x i32]*), i64 0, i64 %idxprom76, !dbg !846
  %71 = load i32, i32* %arrayidx77, align 4, !dbg !846
  %72 = load i32, i32* %tx, align 4, !dbg !847
  %idxprom78 = sext i32 %72 to i64, !dbg !848
  %arrayidx79 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom78, !dbg !848
  store i32 %71, i32* %arrayidx79, align 4, !dbg !849
  br label %if.end80, !dbg !848

if.end80:                                         ; preds = %if.then75, %if.end73
  call void @llvm.nvvm.barrier0(), !dbg !850
  br label %for.inc, !dbg !851

for.inc:                                          ; preds = %if.end80
  %73 = load i32, i32* %i, align 4, !dbg !852
  %inc = add nsw i32 %73, 1, !dbg !852
  store i32 %inc, i32* %i, align 4, !dbg !852
  br label %for.cond, !dbg !854, !llvm.loop !855

for.end:                                          ; preds = %if.then72, %for.cond
  %74 = load i8, i8* %computed, align 1, !dbg !857
  %tobool81 = trunc i8 %74 to i1, !dbg !857
  br i1 %tobool81, label %if.then82, label %if.end87, !dbg !859

if.then82:                                        ; preds = %for.end
  %75 = load i32, i32* %tx, align 4, !dbg !860
  %idxprom83 = sext i32 %75 to i64, !dbg !862
  %arrayidx84 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE6result to [256 x i32]*), i64 0, i64 %idxprom83, !dbg !862
  %76 = load i32, i32* %arrayidx84, align 4, !dbg !862
  %77 = load i32*, i32** %gpuResults.addr, align 8, !dbg !863
  %78 = load i32, i32* %xidx, align 4, !dbg !864
  %idxprom85 = sext i32 %78 to i64, !dbg !863
  %arrayidx86 = getelementptr inbounds i32, i32* %77, i64 %idxprom85, !dbg !863
  store i32 %76, i32* %arrayidx86, align 4, !dbg !865
  br label %if.end87, !dbg !866

if.end87:                                         ; preds = %if.then82, %for.end
  ret void, !dbg !867
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!7}
!nvvm.annotations = !{!570, !571, !572, !571, !573, !573, !573, !573, !574, !574, !573}
!llvm.module.flags = !{!575, !576, !577}
!llvm.ident = !{!578}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!579}

!0 = distinct !DIGlobalVariable(name: "prev", scope: !1, file: !2, line: 114, type: !11, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "dynproc_kernel", linkageName: "_Z14dynproc_kerneliPiS_S_iiii", scope: !2, file: !2, line: 103, type: !3, isLocal: false, isDefinition: true, scopeLine: 112, flags: DIFlagPrototyped, isOptimized: false, unit: !7, variables: !8)
!2 = !DIFile(filename: "pathfinder.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !6, !6, !6, !5, !5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!7 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, globals: !9, imports: !14)
!8 = !{}
!9 = !{!0, !10}
!10 = distinct !DIGlobalVariable(name: "result", scope: !1, file: !2, line: 115, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 8192, align: 32, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 256)
!14 = !{!15, !22, !27, !29, !31, !33, !35, !39, !41, !43, !45, !47, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !71, !73, !75, !77, !81, !85, !87, !89, !94, !98, !100, !102, !104, !106, !108, !110, !112, !114, !119, !123, !125, !127, !131, !133, !135, !137, !139, !141, !145, !147, !149, !154, !162, !166, !168, !170, !174, !176, !178, !182, !184, !186, !190, !192, !194, !196, !198, !200, !202, !204, !206, !208, !213, !215, !217, !221, !223, !225, !227, !229, !231, !233, !235, !239, !243, !245, !247, !252, !254, !256, !258, !260, !262, !264, !268, !274, !278, !282, !287, !289, !293, !297, !311, !315, !319, !323, !327, !332, !334, !338, !342, !346, !354, !358, !362, !366, !370, !375, !381, !385, !389, !391, !399, !403, !411, !413, !415, !419, !423, !427, !432, !436, !441, !442, !443, !444, !447, !448, !449, !450, !451, !452, !453, !456, !458, !460, !462, !464, !466, !468, !470, !473, !475, !477, !479, !481, !483, !485, !487, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !541, !542, !544, !546, !548, !550, !552, !554, !556, !558, !560, !562, !564, !566, !568}
!15 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !18, line: 189)
!16 = !DINamespace(name: "std", scope: null, file: !17, line: 188)
!17 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!18 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !17, file: !17, line: 44, type: !19, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !21}
!21 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !23, line: 190)
!23 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !17, file: !17, line: 46, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !26}
!26 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !28, line: 191)
!28 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !17, file: !17, line: 48, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !30, line: 192)
!30 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !17, file: !17, line: 50, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !32, line: 193)
!32 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !17, file: !17, line: 52, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !34, line: 194)
!34 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !17, file: !17, line: 56, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !36, line: 195)
!36 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !17, file: !17, line: 54, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!37 = !DISubroutineType(types: !38)
!38 = !{!26, !26, !26}
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !40, line: 196)
!40 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !17, file: !17, line: 58, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !42, line: 197)
!42 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !17, file: !17, line: 60, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !44, line: 198)
!44 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !17, file: !17, line: 62, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !46, line: 199)
!46 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !17, file: !17, line: 64, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !48, line: 200)
!48 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !17, file: !17, line: 66, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !50, line: 201)
!50 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !17, file: !17, line: 68, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !52, line: 202)
!52 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !17, file: !17, line: 72, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !54, line: 203)
!54 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !17, file: !17, line: 70, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !56, line: 204)
!56 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !17, file: !17, line: 76, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !58, line: 205)
!58 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !17, file: !17, line: 74, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !60, line: 206)
!60 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !17, file: !17, line: 78, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !62, line: 207)
!62 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !17, file: !17, line: 80, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !64, line: 208)
!64 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !17, file: !17, line: 82, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !66, line: 209)
!66 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !17, file: !17, line: 84, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !68, line: 210)
!68 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !17, file: !17, line: 86, type: !69, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DISubroutineType(types: !70)
!70 = !{!26, !26, !26, !26}
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !72, line: 211)
!72 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !17, file: !17, line: 88, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !74, line: 212)
!74 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !17, file: !17, line: 90, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !76, line: 213)
!76 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !17, file: !17, line: 92, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !78, line: 214)
!78 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !17, file: !17, line: 94, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!5, !26}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !82, line: 215)
!82 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !17, file: !17, line: 96, type: !83, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DISubroutineType(types: !84)
!84 = !{!26, !26, !6}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !86, line: 216)
!86 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !17, file: !17, line: 98, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !88, line: 217)
!88 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !17, file: !17, line: 100, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !90, line: 218)
!90 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !17, file: !17, line: 102, type: !91, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !26}
!93 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !95, line: 219)
!95 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !17, file: !17, line: 106, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DISubroutineType(types: !97)
!97 = !{!93, !26, !26}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !99, line: 220)
!99 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !17, file: !17, line: 105, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !101, line: 221)
!101 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !17, file: !17, line: 108, type: !91, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !103, line: 222)
!103 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !17, file: !17, line: 112, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !105, line: 223)
!105 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !17, file: !17, line: 111, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !107, line: 224)
!107 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !17, file: !17, line: 114, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !109, line: 225)
!109 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !17, file: !17, line: 116, type: !91, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !111, line: 226)
!111 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !17, file: !17, line: 118, type: !91, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !113, line: 227)
!113 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !17, file: !17, line: 120, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !115, line: 228)
!115 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !17, file: !17, line: 121, type: !116, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DISubroutineType(types: !117)
!117 = !{!118, !118}
!118 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !120, line: 229)
!120 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !17, file: !17, line: 123, type: !121, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DISubroutineType(types: !122)
!122 = !{!26, !26, !5}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !124, line: 230)
!124 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !17, file: !17, line: 125, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !126, line: 231)
!126 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !17, file: !17, line: 126, type: !19, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !128, line: 232)
!128 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !17, file: !17, line: 128, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DISubroutineType(types: !130)
!130 = !{!21, !26}
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !132, line: 233)
!132 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !17, file: !17, line: 138, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !134, line: 234)
!134 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !17, file: !17, line: 130, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !136, line: 235)
!136 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !17, file: !17, line: 132, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !138, line: 236)
!138 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !17, file: !17, line: 134, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !140, line: 237)
!140 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !17, file: !17, line: 136, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !142, line: 238)
!142 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !17, file: !17, line: 140, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DISubroutineType(types: !144)
!144 = !{!118, !26}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !146, line: 239)
!146 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !17, file: !17, line: 142, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !148, line: 240)
!148 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !17, file: !17, line: 143, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !150, line: 241)
!150 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !17, file: !17, line: 145, type: !151, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{!26, !26, !153}
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !155, line: 242)
!155 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !17, file: !17, line: 146, type: !156, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DISubroutineType(types: !157)
!157 = !{!158, !159}
!158 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64, align: 64)
!160 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !161)
!161 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !163, line: 243)
!163 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !17, file: !17, line: 147, type: !164, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DISubroutineType(types: !165)
!165 = !{!26, !159}
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !167, line: 244)
!167 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !17, file: !17, line: 149, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !169, line: 245)
!169 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !17, file: !17, line: 151, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !171, line: 246)
!171 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !17, file: !17, line: 153, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{!26, !26, !158}
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !175, line: 247)
!175 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !17, file: !17, line: 158, type: !121, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !177, line: 248)
!177 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !17, file: !17, line: 160, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !179, line: 249)
!179 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !17, file: !17, line: 162, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!26, !26, !26, !6}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !183, line: 250)
!183 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !17, file: !17, line: 164, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !185, line: 251)
!185 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !17, file: !17, line: 166, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !187, line: 252)
!187 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !17, file: !17, line: 168, type: !188, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DISubroutineType(types: !189)
!189 = !{!26, !26, !118}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !191, line: 253)
!191 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !17, file: !17, line: 170, type: !121, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !193, line: 254)
!193 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !17, file: !17, line: 172, type: !91, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !195, line: 255)
!195 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !17, file: !17, line: 174, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !197, line: 256)
!197 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !17, file: !17, line: 176, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !199, line: 257)
!199 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !17, file: !17, line: 178, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !201, line: 258)
!201 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !17, file: !17, line: 180, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !203, line: 259)
!203 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !17, file: !17, line: 182, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !205, line: 260)
!205 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !17, file: !17, line: 184, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !207, line: 261)
!207 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !17, file: !17, line: 186, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !209, line: 102)
!209 = !DISubprogram(name: "acos", scope: !210, file: !210, line: 54, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!211 = !DISubroutineType(types: !212)
!212 = !{!158, !158}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !214, line: 121)
!214 = !DISubprogram(name: "asin", scope: !210, file: !210, line: 56, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !216, line: 140)
!216 = !DISubprogram(name: "atan", scope: !210, file: !210, line: 58, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !218, line: 159)
!218 = !DISubprogram(name: "atan2", scope: !210, file: !210, line: 60, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DISubroutineType(types: !220)
!220 = !{!158, !158, !158}
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !222, line: 180)
!222 = !DISubprogram(name: "ceil", scope: !210, file: !210, line: 178, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !224, line: 199)
!224 = !DISubprogram(name: "cos", scope: !210, file: !210, line: 63, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !226, line: 218)
!226 = !DISubprogram(name: "cosh", scope: !210, file: !210, line: 72, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !228, line: 237)
!228 = !DISubprogram(name: "exp", scope: !210, file: !210, line: 100, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !230, line: 256)
!230 = !DISubprogram(name: "fabs", scope: !210, file: !210, line: 181, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !232, line: 275)
!232 = !DISubprogram(name: "floor", scope: !210, file: !210, line: 184, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !234, line: 294)
!234 = !DISubprogram(name: "fmod", scope: !210, file: !210, line: 187, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !236, line: 315)
!236 = !DISubprogram(name: "frexp", scope: !210, file: !210, line: 103, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DISubroutineType(types: !238)
!238 = !{!158, !158, !6}
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !240, line: 334)
!240 = !DISubprogram(name: "ldexp", scope: !210, file: !210, line: 106, type: !241, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!158, !158, !5}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !244, line: 353)
!244 = !DISubprogram(name: "log", scope: !210, file: !210, line: 109, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !246, line: 372)
!246 = !DISubprogram(name: "log10", scope: !210, file: !210, line: 112, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !248, line: 391)
!248 = !DISubprogram(name: "modf", scope: !210, file: !210, line: 115, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DISubroutineType(types: !250)
!250 = !{!158, !158, !251}
!251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64, align: 64)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !253, line: 403)
!253 = !DISubprogram(name: "pow", scope: !210, file: !210, line: 153, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !255, line: 440)
!255 = !DISubprogram(name: "sin", scope: !210, file: !210, line: 65, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !257, line: 459)
!257 = !DISubprogram(name: "sinh", scope: !210, file: !210, line: 74, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !259, line: 478)
!259 = !DISubprogram(name: "sqrt", scope: !210, file: !210, line: 156, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !261, line: 497)
!261 = !DISubprogram(name: "tan", scope: !210, file: !210, line: 67, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !263, line: 516)
!263 = !DISubprogram(name: "tanh", scope: !210, file: !210, line: 76, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !265, line: 118)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !266, line: 101, baseType: !267)
!266 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!267 = !DICompositeType(tag: DW_TAG_structure_type, file: !266, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !269, line: 119)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !266, line: 109, baseType: !270)
!270 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !266, line: 105, size: 128, align: 64, elements: !271, identifier: "_ZTS6ldiv_t")
!271 = !{!272, !273}
!272 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !270, file: !266, line: 107, baseType: !118, size: 64, align: 64)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !270, file: !266, line: 108, baseType: !118, size: 64, align: 64, offset: 64)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !275, line: 121)
!275 = !DISubprogram(name: "abort", scope: !266, file: !266, line: 515, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{null}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !279, line: 122)
!279 = !DISubprogram(name: "abs", scope: !266, file: !266, line: 774, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!5, !5}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !283, line: 123)
!283 = !DISubprogram(name: "atexit", scope: !266, file: !266, line: 519, type: !284, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DISubroutineType(types: !285)
!285 = !{!5, !286}
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64, align: 64)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !288, line: 129)
!288 = !DISubprogram(name: "atof", scope: !266, file: !266, line: 144, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !290, line: 130)
!290 = !DISubprogram(name: "atoi", scope: !266, file: !266, line: 147, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DISubroutineType(types: !292)
!292 = !{!5, !159}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !294, line: 131)
!294 = !DISubprogram(name: "atol", scope: !266, file: !266, line: 150, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DISubroutineType(types: !296)
!296 = !{!118, !159}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !298, line: 132)
!298 = !DISubprogram(name: "bsearch", scope: !266, file: !266, line: 754, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DISubroutineType(types: !300)
!300 = !{!301, !302, !302, !304, !304, !307}
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!302 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !303, size: 64, align: 64)
!303 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !305, line: 62, baseType: !306)
!305 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!306 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!307 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !266, line: 741, baseType: !308)
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64, align: 64)
!309 = !DISubroutineType(types: !310)
!310 = !{!5, !302, !302}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !312, line: 133)
!312 = !DISubprogram(name: "calloc", scope: !266, file: !266, line: 468, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DISubroutineType(types: !314)
!314 = !{!301, !304, !304}
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !316, line: 134)
!316 = !DISubprogram(name: "div", scope: !266, file: !266, line: 788, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!265, !5, !5}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !320, line: 135)
!320 = !DISubprogram(name: "exit", scope: !266, file: !266, line: 543, type: !321, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!321 = !DISubroutineType(types: !322)
!322 = !{null, !5}
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !324, line: 136)
!324 = !DISubprogram(name: "free", scope: !266, file: !266, line: 483, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DISubroutineType(types: !326)
!326 = !{null, !301}
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !328, line: 137)
!328 = !DISubprogram(name: "getenv", scope: !266, file: !266, line: 564, type: !329, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DISubroutineType(types: !330)
!330 = !{!331, !159}
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64, align: 64)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !333, line: 138)
!333 = !DISubprogram(name: "labs", scope: !266, file: !266, line: 775, type: !116, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !335, line: 139)
!335 = !DISubprogram(name: "ldiv", scope: !266, file: !266, line: 790, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!269, !118, !118}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !339, line: 140)
!339 = !DISubprogram(name: "malloc", scope: !266, file: !266, line: 466, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DISubroutineType(types: !341)
!341 = !{!301, !304}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !343, line: 142)
!343 = !DISubprogram(name: "mblen", scope: !266, file: !266, line: 862, type: !344, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DISubroutineType(types: !345)
!345 = !{!5, !159, !304}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !347, line: 143)
!347 = !DISubprogram(name: "mbstowcs", scope: !266, file: !266, line: 873, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!304, !350, !353, !304}
!350 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !351)
!351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !352, size: 64, align: 64)
!352 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!353 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !159)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !355, line: 144)
!355 = !DISubprogram(name: "mbtowc", scope: !266, file: !266, line: 865, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!5, !350, !353, !304}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !359, line: 146)
!359 = !DISubprogram(name: "qsort", scope: !266, file: !266, line: 764, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{null, !301, !304, !304, !307}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !363, line: 152)
!363 = !DISubprogram(name: "rand", scope: !266, file: !266, line: 374, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!5}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !367, line: 153)
!367 = !DISubprogram(name: "realloc", scope: !266, file: !266, line: 480, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DISubroutineType(types: !369)
!369 = !{!301, !301, !304}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !371, line: 154)
!371 = !DISubprogram(name: "srand", scope: !266, file: !266, line: 376, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!372 = !DISubroutineType(types: !373)
!373 = !{null, !374}
!374 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !376, line: 155)
!376 = !DISubprogram(name: "strtod", scope: !266, file: !266, line: 164, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!158, !353, !379}
!379 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !380)
!380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !331, size: 64, align: 64)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !382, line: 156)
!382 = !DISubprogram(name: "strtol", scope: !266, file: !266, line: 183, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{!118, !353, !379, !5}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !386, line: 157)
!386 = !DISubprogram(name: "strtoul", scope: !266, file: !266, line: 187, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!387 = !DISubroutineType(types: !388)
!388 = !{!306, !353, !379, !5}
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !390, line: 158)
!390 = !DISubprogram(name: "system", scope: !266, file: !266, line: 716, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !392, line: 160)
!392 = !DISubprogram(name: "wcstombs", scope: !266, file: !266, line: 876, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DISubroutineType(types: !394)
!394 = !{!304, !395, !396, !304}
!395 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !331)
!396 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !397)
!397 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !398, size: 64, align: 64)
!398 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !352)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !400, line: 161)
!400 = !DISubprogram(name: "wctomb", scope: !266, file: !266, line: 869, type: !401, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!401 = !DISubroutineType(types: !402)
!402 = !{!5, !331, !352}
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !406, line: 214)
!404 = !DINamespace(name: "__gnu_cxx", scope: null, file: !405, line: 220)
!405 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !266, line: 121, baseType: !407)
!407 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !266, line: 117, size: 128, align: 64, elements: !408, identifier: "_ZTS7lldiv_t")
!408 = !{!409, !410}
!409 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !407, file: !266, line: 119, baseType: !21, size: 64, align: 64)
!410 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !407, file: !266, line: 120, baseType: !21, size: 64, align: 64, offset: 64)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !412, line: 220)
!412 = !DISubprogram(name: "_Exit", scope: !266, file: !266, line: 557, type: !321, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !414, line: 224)
!414 = !DISubprogram(name: "llabs", scope: !266, file: !266, line: 779, type: !19, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !416, line: 230)
!416 = !DISubprogram(name: "lldiv", scope: !266, file: !266, line: 796, type: !417, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!417 = !DISubroutineType(types: !418)
!418 = !{!406, !21, !21}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !420, line: 241)
!420 = !DISubprogram(name: "atoll", scope: !266, file: !266, line: 157, type: !421, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!421 = !DISubroutineType(types: !422)
!422 = !{!21, !159}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !424, line: 242)
!424 = !DISubprogram(name: "strtoll", scope: !266, file: !266, line: 209, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!425 = !DISubroutineType(types: !426)
!426 = !{!21, !353, !379, !5}
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !428, line: 243)
!428 = !DISubprogram(name: "strtoull", scope: !266, file: !266, line: 214, type: !429, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!429 = !DISubroutineType(types: !430)
!430 = !{!431, !353, !379, !5}
!431 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !433, line: 245)
!433 = !DISubprogram(name: "strtof", scope: !266, file: !266, line: 172, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!26, !353, !379}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !404, entity: !437, line: 246)
!437 = !DISubprogram(name: "strtold", scope: !266, file: !266, line: 175, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!440, !353, !379}
!440 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !406, line: 254)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !412, line: 256)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !414, line: 258)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !445, line: 259)
!445 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !404, file: !446, line: 227, type: !417, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!446 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !416, line: 260)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !420, line: 262)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !433, line: 263)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !424, line: 264)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !428, line: 265)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !437, line: 266)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !454, line: 397)
!454 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !455, file: !455, line: 1342, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !457, line: 398)
!457 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !455, file: !455, line: 1370, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !459, line: 399)
!459 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !455, file: !455, line: 1337, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !461, line: 400)
!461 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !455, file: !455, line: 1375, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !463, line: 401)
!463 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !455, file: !455, line: 1327, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !465, line: 402)
!465 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !455, file: !455, line: 1332, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !467, line: 403)
!467 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !455, file: !455, line: 1380, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !469, line: 404)
!469 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !455, file: !455, line: 1430, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !471, line: 405)
!471 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !472, file: !472, line: 667, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !474, line: 406)
!474 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !455, file: !455, line: 1189, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !476, line: 407)
!476 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !455, file: !455, line: 1243, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !478, line: 408)
!478 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !455, file: !455, line: 1312, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !480, line: 409)
!480 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !455, file: !455, line: 1490, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !482, line: 410)
!482 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !455, file: !455, line: 1480, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !484, line: 411)
!484 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !472, file: !472, line: 657, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !486, line: 412)
!486 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !455, file: !455, line: 1294, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !488, line: 413)
!488 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !455, file: !455, line: 1385, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !490, line: 414)
!490 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !472, file: !472, line: 607, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !492, line: 415)
!492 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !455, file: !455, line: 1616, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !494, line: 416)
!494 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !472, file: !472, line: 597, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !496, line: 417)
!496 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !455, file: !455, line: 1568, type: !69, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !498, line: 418)
!498 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !472, file: !472, line: 622, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !500, line: 419)
!500 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !472, file: !472, line: 617, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !502, line: 420)
!502 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !455, file: !455, line: 1553, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !504, line: 421)
!504 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !455, file: !455, line: 1543, type: !83, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !506, line: 422)
!506 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !455, file: !455, line: 1390, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !508, line: 423)
!508 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !455, file: !455, line: 1621, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !510, line: 424)
!510 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !455, file: !455, line: 1520, type: !121, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !512, line: 425)
!512 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !455, file: !455, line: 1515, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !514, line: 426)
!514 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !455, file: !455, line: 1149, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !516, line: 427)
!516 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !455, file: !455, line: 1602, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !518, line: 428)
!518 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !455, file: !455, line: 1356, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !520, line: 429)
!520 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !455, file: !455, line: 1365, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !522, line: 430)
!522 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !455, file: !455, line: 1285, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !524, line: 431)
!524 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !455, file: !455, line: 1626, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !526, line: 432)
!526 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !455, file: !455, line: 1347, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !528, line: 433)
!528 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !455, file: !455, line: 1140, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !530, line: 434)
!530 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !455, file: !455, line: 1607, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !532, line: 435)
!532 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !455, file: !455, line: 1548, type: !151, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !534, line: 436)
!534 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !455, file: !455, line: 1154, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !536, line: 437)
!536 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !455, file: !455, line: 1218, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !538, line: 438)
!538 = !DISubprogram(name: "nexttowardf", scope: !210, file: !210, line: 294, type: !539, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DISubroutineType(types: !540)
!540 = !{!26, !26, !440}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !538, line: 439)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !543, line: 440)
!543 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !455, file: !455, line: 1583, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !545, line: 441)
!545 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !455, file: !455, line: 1558, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !547, line: 442)
!547 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !455, file: !455, line: 1563, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !549, line: 443)
!549 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !455, file: !455, line: 1135, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !551, line: 444)
!551 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !455, file: !455, line: 1597, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !553, line: 445)
!553 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !455, file: !455, line: 1530, type: !188, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !555, line: 446)
!555 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !455, file: !455, line: 1525, type: !121, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !557, line: 447)
!557 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !455, file: !455, line: 1234, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !559, line: 448)
!559 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !455, file: !455, line: 1317, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !561, line: 449)
!561 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !472, file: !472, line: 907, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !563, line: 450)
!563 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !455, file: !455, line: 1276, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !565, line: 451)
!565 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !455, file: !455, line: 1322, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !567, line: 452)
!567 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !455, file: !455, line: 1592, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !569, line: 453)
!569 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !472, file: !472, line: 662, type: !24, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !{void (i32, i32*, i32*, i32*, i32, i32, i32, i32)* @_Z14dynproc_kerneliPiS_S_iiii, !"kernel", i32 1}
!571 = !{null, !"align", i32 8}
!572 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!573 = !{null, !"align", i32 16}
!574 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!575 = !{i32 2, !"Dwarf Version", i32 4}
!576 = !{i32 2, !"Debug Info Version", i32 3}
!577 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!578 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!579 = !{i32 1, i32 2}
!580 = !DILocalVariable(name: "iteration", arg: 1, scope: !1, file: !2, line: 104, type: !5)
!581 = !DIExpression()
!582 = !DILocation(line: 104, column: 21, scope: !1)
!583 = !DILocalVariable(name: "gpuWall", arg: 2, scope: !1, file: !2, line: 105, type: !6)
!584 = !DILocation(line: 105, column: 22, scope: !1)
!585 = !DILocalVariable(name: "gpuSrc", arg: 3, scope: !1, file: !2, line: 106, type: !6)
!586 = !DILocation(line: 106, column: 22, scope: !1)
!587 = !DILocalVariable(name: "gpuResults", arg: 4, scope: !1, file: !2, line: 107, type: !6)
!588 = !DILocation(line: 107, column: 22, scope: !1)
!589 = !DILocalVariable(name: "cols", arg: 5, scope: !1, file: !2, line: 108, type: !5)
!590 = !DILocation(line: 108, column: 21, scope: !1)
!591 = !DILocalVariable(name: "rows", arg: 6, scope: !1, file: !2, line: 109, type: !5)
!592 = !DILocation(line: 109, column: 21, scope: !1)
!593 = !DILocalVariable(name: "startStep", arg: 7, scope: !1, file: !2, line: 110, type: !5)
!594 = !DILocation(line: 110, column: 21, scope: !1)
!595 = !DILocalVariable(name: "border", arg: 8, scope: !1, file: !2, line: 111, type: !5)
!596 = !DILocation(line: 111, column: 21, scope: !1)
!597 = !DILocalVariable(name: "bx", scope: !1, file: !2, line: 117, type: !5)
!598 = !DILocation(line: 117, column: 6, scope: !1)
!599 = !DILocation(line: 78, column: 3, scope: !600, inlinedAt: !635)
!600 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !602, file: !601, line: 78, type: !605, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !7, declaration: !604, variables: !8)
!601 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!602 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !601, line: 77, size: 8, align: 8, elements: !603, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!603 = !{!604, !607, !608, !609, !620, !624, !628, !631}
!604 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !602, file: !601, line: 78, type: !605, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DISubroutineType(types: !606)
!606 = !{!374}
!607 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !602, file: !601, line: 79, type: !605, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !602, file: !601, line: 80, type: !605, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !602, file: !601, line: 83, type: !610, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DISubroutineType(types: !611)
!611 = !{!612, !618}
!612 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !613, line: 190, size: 96, align: 32, elements: !614, identifier: "_ZTS5uint3")
!613 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/pathfinder")
!614 = !{!615, !616, !617}
!615 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !612, file: !613, line: 192, baseType: !374, size: 32, align: 32)
!616 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !612, file: !613, line: 192, baseType: !374, size: 32, align: 32, offset: 32)
!617 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !612, file: !613, line: 192, baseType: !374, size: 32, align: 32, offset: 64)
!618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !619, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!619 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !602)
!620 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !602, file: !601, line: 85, type: !621, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!621 = !DISubroutineType(types: !622)
!622 = !{null, !623}
!623 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !602, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!624 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !602, file: !601, line: 85, type: !625, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!625 = !DISubroutineType(types: !626)
!626 = !{null, !623, !627}
!627 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !619, size: 64, align: 64)
!628 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !602, file: !601, line: 85, type: !629, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!629 = !DISubroutineType(types: !630)
!630 = !{null, !618, !627}
!631 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !602, file: !601, line: 85, type: !632, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!632 = !DISubroutineType(types: !633)
!633 = !{!634, !618}
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !602, size: 64, align: 64)
!635 = distinct !DILocation(line: 117, column: 11, scope: !1)
!636 = !{i32 0, i32 65535}
!637 = !DILocalVariable(name: "tx", scope: !1, file: !2, line: 118, type: !5)
!638 = !DILocation(line: 118, column: 6, scope: !1)
!639 = !DILocation(line: 67, column: 3, scope: !640, inlinedAt: !666)
!640 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !641, file: !601, line: 67, type: !605, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !7, declaration: !643, variables: !8)
!641 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !601, line: 66, size: 8, align: 8, elements: !642, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!642 = !{!643, !644, !645, !646, !651, !655, !659, !662}
!643 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !641, file: !601, line: 67, type: !605, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!644 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !641, file: !601, line: 68, type: !605, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !641, file: !601, line: 69, type: !605, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!646 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !641, file: !601, line: 72, type: !647, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DISubroutineType(types: !648)
!648 = !{!612, !649}
!649 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !650, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!650 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !641)
!651 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !641, file: !601, line: 74, type: !652, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!652 = !DISubroutineType(types: !653)
!653 = !{null, !654}
!654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !641, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!655 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !641, file: !601, line: 74, type: !656, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!656 = !DISubroutineType(types: !657)
!657 = !{null, !654, !658}
!658 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !650, size: 64, align: 64)
!659 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !641, file: !601, line: 74, type: !660, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!660 = !DISubroutineType(types: !661)
!661 = !{null, !649, !658}
!662 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !641, file: !601, line: 74, type: !663, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!663 = !DISubroutineType(types: !664)
!664 = !{!665, !649}
!665 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !641, size: 64, align: 64)
!666 = distinct !DILocation(line: 118, column: 9, scope: !1)
!667 = !{i32 0, i32 1024}
!668 = !DILocalVariable(name: "small_block_cols", scope: !1, file: !2, line: 126, type: !5)
!669 = !DILocation(line: 126, column: 6, scope: !1)
!670 = !DILocation(line: 126, column: 36, scope: !1)
!671 = !DILocation(line: 126, column: 45, scope: !1)
!672 = !DILocation(line: 126, column: 50, scope: !1)
!673 = !DILocation(line: 126, column: 35, scope: !1)
!674 = !DILocalVariable(name: "blkX", scope: !1, file: !2, line: 130, type: !5)
!675 = !DILocation(line: 130, column: 13, scope: !1)
!676 = !DILocation(line: 130, column: 20, scope: !1)
!677 = !DILocation(line: 130, column: 37, scope: !1)
!678 = !DILocation(line: 130, column: 36, scope: !1)
!679 = !DILocation(line: 130, column: 40, scope: !1)
!680 = !DILocation(line: 130, column: 39, scope: !1)
!681 = !DILocalVariable(name: "blkXmax", scope: !1, file: !2, line: 131, type: !5)
!682 = !DILocation(line: 131, column: 13, scope: !1)
!683 = !DILocation(line: 131, column: 23, scope: !1)
!684 = !DILocation(line: 131, column: 27, scope: !1)
!685 = !DILocation(line: 131, column: 38, scope: !1)
!686 = !DILocalVariable(name: "xidx", scope: !1, file: !2, line: 134, type: !5)
!687 = !DILocation(line: 134, column: 6, scope: !1)
!688 = !DILocation(line: 134, column: 13, scope: !1)
!689 = !DILocation(line: 134, column: 18, scope: !1)
!690 = !DILocation(line: 134, column: 17, scope: !1)
!691 = !DILocalVariable(name: "validXmin", scope: !1, file: !2, line: 139, type: !5)
!692 = !DILocation(line: 139, column: 13, scope: !1)
!693 = !DILocation(line: 139, column: 26, scope: !1)
!694 = !DILocation(line: 139, column: 31, scope: !1)
!695 = !DILocation(line: 139, column: 25, scope: !1)
!696 = !DILocation(line: 139, column: 39, scope: !697)
!697 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 1)
!698 = !DILocation(line: 139, column: 38, scope: !697)
!699 = !DILocation(line: 139, column: 25, scope: !697)
!700 = !DILocation(line: 139, column: 25, scope: !701)
!701 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 2)
!702 = !DILocation(line: 139, column: 25, scope: !703)
!703 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 3)
!704 = !DILocation(line: 139, column: 13, scope: !703)
!705 = !DILocalVariable(name: "validXmax", scope: !1, file: !2, line: 140, type: !5)
!706 = !DILocation(line: 140, column: 13, scope: !1)
!707 = !DILocation(line: 140, column: 26, scope: !1)
!708 = !DILocation(line: 140, column: 36, scope: !1)
!709 = !DILocation(line: 140, column: 40, scope: !1)
!710 = !DILocation(line: 140, column: 34, scope: !1)
!711 = !DILocation(line: 140, column: 25, scope: !1)
!712 = !DILocation(line: 140, column: 60, scope: !697)
!713 = !DILocation(line: 140, column: 68, scope: !697)
!714 = !DILocation(line: 140, column: 67, scope: !697)
!715 = !DILocation(line: 140, column: 72, scope: !697)
!716 = !DILocation(line: 140, column: 58, scope: !697)
!717 = !DILocation(line: 140, column: 25, scope: !697)
!718 = !DILocation(line: 140, column: 25, scope: !701)
!719 = !DILocation(line: 140, column: 25, scope: !703)
!720 = !DILocation(line: 140, column: 13, scope: !703)
!721 = !DILocalVariable(name: "W", scope: !1, file: !2, line: 142, type: !5)
!722 = !DILocation(line: 142, column: 13, scope: !1)
!723 = !DILocation(line: 142, column: 17, scope: !1)
!724 = !DILocation(line: 142, column: 19, scope: !1)
!725 = !DILocalVariable(name: "E", scope: !1, file: !2, line: 143, type: !5)
!726 = !DILocation(line: 143, column: 13, scope: !1)
!727 = !DILocation(line: 143, column: 17, scope: !1)
!728 = !DILocation(line: 143, column: 19, scope: !1)
!729 = !DILocation(line: 145, column: 14, scope: !1)
!730 = !DILocation(line: 145, column: 18, scope: !1)
!731 = !DILocation(line: 145, column: 16, scope: !1)
!732 = !DILocation(line: 145, column: 13, scope: !1)
!733 = !DILocation(line: 145, column: 31, scope: !697)
!734 = !DILocation(line: 145, column: 13, scope: !697)
!735 = !DILocation(line: 145, column: 43, scope: !701)
!736 = !DILocation(line: 145, column: 13, scope: !701)
!737 = !DILocation(line: 145, column: 13, scope: !703)
!738 = !DILocation(line: 145, column: 11, scope: !703)
!739 = !DILocation(line: 146, column: 14, scope: !1)
!740 = !DILocation(line: 146, column: 18, scope: !1)
!741 = !DILocation(line: 146, column: 16, scope: !1)
!742 = !DILocation(line: 146, column: 13, scope: !1)
!743 = !DILocation(line: 146, column: 31, scope: !697)
!744 = !DILocation(line: 146, column: 13, scope: !697)
!745 = !DILocation(line: 146, column: 43, scope: !701)
!746 = !DILocation(line: 146, column: 13, scope: !701)
!747 = !DILocation(line: 146, column: 13, scope: !703)
!748 = !DILocation(line: 146, column: 11, scope: !703)
!749 = !DILocalVariable(name: "isValid", scope: !1, file: !2, line: 148, type: !93)
!750 = !DILocation(line: 148, column: 14, scope: !1)
!751 = !DILocation(line: 148, column: 24, scope: !1)
!752 = !DILocation(line: 148, column: 24, scope: !697)
!753 = !DILocation(line: 148, column: 14, scope: !701)
!754 = !DILocation(line: 150, column: 5, scope: !755)
!755 = distinct !DILexicalBlock(scope: !1, file: !2, line: 150, column: 5)
!756 = !DILocation(line: 150, column: 5, scope: !757)
!757 = !DILexicalBlockFile(scope: !755, file: !2, discriminator: 1)
!758 = !DILocation(line: 151, column: 24, scope: !759)
!759 = distinct !DILexicalBlock(scope: !755, file: !2, line: 150, column: 31)
!760 = !DILocation(line: 151, column: 31, scope: !759)
!761 = !DILocation(line: 151, column: 18, scope: !759)
!762 = !DILocation(line: 151, column: 13, scope: !759)
!763 = !DILocation(line: 151, column: 22, scope: !759)
!764 = !DILocation(line: 152, column: 2, scope: !759)
!765 = !DILocation(line: 153, column: 2, scope: !1)
!766 = !DILocalVariable(name: "computed", scope: !1, file: !2, line: 154, type: !93)
!767 = !DILocation(line: 154, column: 14, scope: !1)
!768 = !DILocalVariable(name: "i", scope: !769, file: !2, line: 155, type: !5)
!769 = distinct !DILexicalBlock(scope: !1, file: !2, line: 155, column: 9)
!770 = !DILocation(line: 155, column: 18, scope: !769)
!771 = !DILocation(line: 155, column: 14, scope: !769)
!772 = !DILocation(line: 155, column: 23, scope: !773)
!773 = !DILexicalBlockFile(scope: !774, file: !2, discriminator: 1)
!774 = distinct !DILexicalBlock(scope: !769, file: !2, line: 155, column: 9)
!775 = !DILocation(line: 155, column: 25, scope: !773)
!776 = !DILocation(line: 155, column: 24, scope: !773)
!777 = !DILocation(line: 155, column: 9, scope: !773)
!778 = !DILocation(line: 156, column: 22, scope: !779)
!779 = distinct !DILexicalBlock(scope: !774, file: !2, line: 155, column: 41)
!780 = !DILocation(line: 157, column: 17, scope: !781)
!781 = distinct !DILexicalBlock(scope: !779, file: !2, line: 157, column: 17)
!782 = !DILocation(line: 157, column: 17, scope: !783)
!783 = !DILexicalBlockFile(scope: !781, file: !2, discriminator: 1)
!784 = !DILocation(line: 157, column: 51, scope: !783)
!785 = !DILocation(line: 158, column: 19, scope: !781)
!786 = !DILocation(line: 157, column: 17, scope: !787)
!787 = !DILexicalBlockFile(scope: !779, file: !2, discriminator: 2)
!788 = !DILocation(line: 159, column: 28, scope: !789)
!789 = distinct !DILexicalBlock(scope: !781, file: !2, line: 158, column: 27)
!790 = !DILocalVariable(name: "left", scope: !789, file: !2, line: 160, type: !5)
!791 = !DILocation(line: 160, column: 23, scope: !789)
!792 = !DILocation(line: 160, column: 35, scope: !789)
!793 = !DILocation(line: 160, column: 30, scope: !789)
!794 = !DILocalVariable(name: "up", scope: !789, file: !2, line: 161, type: !5)
!795 = !DILocation(line: 161, column: 23, scope: !789)
!796 = !DILocation(line: 161, column: 33, scope: !789)
!797 = !DILocation(line: 161, column: 28, scope: !789)
!798 = !DILocalVariable(name: "right", scope: !789, file: !2, line: 162, type: !5)
!799 = !DILocation(line: 162, column: 23, scope: !789)
!800 = !DILocation(line: 162, column: 36, scope: !789)
!801 = !DILocation(line: 162, column: 31, scope: !789)
!802 = !DILocalVariable(name: "shortest", scope: !789, file: !2, line: 163, type: !5)
!803 = !DILocation(line: 163, column: 23, scope: !789)
!804 = !DILocation(line: 163, column: 34, scope: !789)
!805 = !DILocation(line: 163, column: 34, scope: !806)
!806 = !DILexicalBlockFile(scope: !789, file: !2, discriminator: 1)
!807 = !DILocation(line: 163, column: 34, scope: !808)
!808 = !DILexicalBlockFile(scope: !789, file: !2, discriminator: 2)
!809 = !DILocation(line: 163, column: 34, scope: !810)
!810 = !DILexicalBlockFile(scope: !789, file: !2, discriminator: 3)
!811 = !DILocation(line: 163, column: 23, scope: !810)
!812 = !DILocation(line: 164, column: 30, scope: !789)
!813 = !DILocation(line: 164, column: 30, scope: !806)
!814 = !DILocation(line: 164, column: 30, scope: !808)
!815 = !DILocation(line: 164, column: 30, scope: !810)
!816 = !DILocation(line: 164, column: 28, scope: !810)
!817 = !DILocalVariable(name: "index", scope: !789, file: !2, line: 165, type: !5)
!818 = !DILocation(line: 165, column: 23, scope: !789)
!819 = !DILocation(line: 165, column: 31, scope: !789)
!820 = !DILocation(line: 165, column: 37, scope: !789)
!821 = !DILocation(line: 165, column: 47, scope: !789)
!822 = !DILocation(line: 165, column: 46, scope: !789)
!823 = !DILocation(line: 165, column: 35, scope: !789)
!824 = !DILocation(line: 165, column: 50, scope: !789)
!825 = !DILocation(line: 165, column: 49, scope: !789)
!826 = !DILocation(line: 166, column: 32, scope: !789)
!827 = !DILocation(line: 166, column: 43, scope: !789)
!828 = !DILocation(line: 166, column: 51, scope: !789)
!829 = !DILocation(line: 166, column: 41, scope: !789)
!830 = !DILocation(line: 166, column: 26, scope: !789)
!831 = !DILocation(line: 166, column: 19, scope: !789)
!832 = !DILocation(line: 166, column: 30, scope: !789)
!833 = !DILocation(line: 168, column: 13, scope: !789)
!834 = !DILocation(line: 169, column: 13, scope: !779)
!835 = !DILocation(line: 170, column: 16, scope: !836)
!836 = distinct !DILexicalBlock(scope: !779, file: !2, line: 170, column: 16)
!837 = !DILocation(line: 170, column: 19, scope: !836)
!838 = !DILocation(line: 170, column: 28, scope: !836)
!839 = !DILocation(line: 170, column: 17, scope: !836)
!840 = !DILocation(line: 170, column: 16, scope: !779)
!841 = !DILocation(line: 171, column: 17, scope: !836)
!842 = !DILocation(line: 172, column: 16, scope: !843)
!843 = distinct !DILexicalBlock(scope: !779, file: !2, line: 172, column: 16)
!844 = !DILocation(line: 172, column: 16, scope: !779)
!845 = !DILocation(line: 173, column: 34, scope: !843)
!846 = !DILocation(line: 173, column: 27, scope: !843)
!847 = !DILocation(line: 173, column: 22, scope: !843)
!848 = !DILocation(line: 173, column: 17, scope: !843)
!849 = !DILocation(line: 173, column: 25, scope: !843)
!850 = !DILocation(line: 174, column: 6, scope: !779)
!851 = !DILocation(line: 175, column: 7, scope: !779)
!852 = !DILocation(line: 155, column: 38, scope: !853)
!853 = !DILexicalBlockFile(scope: !774, file: !2, discriminator: 2)
!854 = !DILocation(line: 155, column: 9, scope: !853)
!855 = distinct !{!855, !856}
!856 = !DILocation(line: 155, column: 9, scope: !1)
!857 = !DILocation(line: 180, column: 11, scope: !858)
!858 = distinct !DILexicalBlock(scope: !1, file: !2, line: 180, column: 11)
!859 = !DILocation(line: 180, column: 11, scope: !1)
!860 = !DILocation(line: 181, column: 35, scope: !861)
!861 = distinct !DILexicalBlock(scope: !858, file: !2, line: 180, column: 20)
!862 = !DILocation(line: 181, column: 28, scope: !861)
!863 = !DILocation(line: 181, column: 11, scope: !861)
!864 = !DILocation(line: 181, column: 22, scope: !861)
!865 = !DILocation(line: 181, column: 27, scope: !861)
!866 = !DILocation(line: 182, column: 7, scope: !861)
!867 = !DILocation(line: 183, column: 1, scope: !1)
