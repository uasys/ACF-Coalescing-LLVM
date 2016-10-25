; ModuleID = 'lud_kernel.cu'
source_filename = "lud_kernel.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }

@_ZZ12lud_diagonalPfiiE6shadow = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !0
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ13lud_perimeterPfiiE3dia = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !11
@_ZZ13lud_perimeterPfiiE8peri_row = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !16
@_ZZ13lud_perimeterPfiiE8peri_col = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !17
@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@_ZZ12lud_internalPfiiE8peri_row = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !18
@_ZZ12lud_internalPfiiE8peri_col = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !20

; Function Attrs: convergent nounwind
define void @_Z12lud_diagonalPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 !dbg !1 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %array_offset = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !588, metadata !589), !dbg !590
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %matrix_dim.addr, metadata !591, metadata !589), !dbg !592
  store i32 %offset, i32* %offset.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %offset.addr, metadata !593, metadata !589), !dbg !594
  call void @llvm.dbg.declare(metadata i32* %i, metadata !595, metadata !589), !dbg !596
  call void @llvm.dbg.declare(metadata i32* %j, metadata !597, metadata !589), !dbg !598
  call void @llvm.dbg.declare(metadata i32* %array_offset, metadata !599, metadata !589), !dbg !600
  %0 = load i32, i32* %offset.addr, align 4, !dbg !601
  %1 = load i32, i32* %matrix_dim.addr, align 4, !dbg !602
  %mul = mul nsw i32 %0, %1, !dbg !603
  %2 = load i32, i32* %offset.addr, align 4, !dbg !604
  %add = add nsw i32 %mul, %2, !dbg !605
  store i32 %add, i32* %array_offset, align 4, !dbg !600
  store i32 0, i32* %i, align 4, !dbg !606
  br label %for.cond, !dbg !608

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !609
  %cmp = icmp slt i32 %3, 16, !dbg !612
  br i1 %cmp, label %for.body, label %for.end, !dbg !613

for.body:                                         ; preds = %for.cond
  %4 = load float*, float** %m.addr, align 8, !dbg !614
  %5 = load i32, i32* %array_offset, align 4, !dbg !616
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !617, !range !654
  %add1 = add i32 %5, %6, !dbg !655
  %idxprom = zext i32 %add1 to i64, !dbg !614
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !614
  %7 = load float, float* %arrayidx, align 4, !dbg !614
  %8 = load i32, i32* %i, align 4, !dbg !656
  %idxprom2 = sext i32 %8 to i64, !dbg !657
  %arrayidx3 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom2, !dbg !657
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !658, !range !654
  %idxprom5 = zext i32 %9 to i64, !dbg !657
  %arrayidx6 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx3, i64 0, i64 %idxprom5, !dbg !657
  store float %7, float* %arrayidx6, align 4, !dbg !661
  %10 = load i32, i32* %matrix_dim.addr, align 4, !dbg !662
  %11 = load i32, i32* %array_offset, align 4, !dbg !663
  %add7 = add nsw i32 %11, %10, !dbg !663
  store i32 %add7, i32* %array_offset, align 4, !dbg !663
  br label %for.inc, !dbg !664

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !665
  %inc = add nsw i32 %12, 1, !dbg !665
  store i32 %inc, i32* %i, align 4, !dbg !665
  br label %for.cond, !dbg !667, !llvm.loop !668

for.end:                                          ; preds = %for.cond
  call void @llvm.nvvm.barrier0(), !dbg !670
  store i32 0, i32* %i, align 4, !dbg !671
  br label %for.cond8, !dbg !673

for.cond8:                                        ; preds = %for.inc72, %for.end
  %13 = load i32, i32* %i, align 4, !dbg !674
  %cmp9 = icmp slt i32 %13, 15, !dbg !677
  br i1 %cmp9, label %for.body10, label %for.end74, !dbg !678

for.body10:                                       ; preds = %for.cond8
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !679, !range !654
  %15 = load i32, i32* %i, align 4, !dbg !683
  %cmp12 = icmp ugt i32 %14, %15, !dbg !684
  br i1 %cmp12, label %if.then, label %if.end, !dbg !685

if.then:                                          ; preds = %for.body10
  store i32 0, i32* %j, align 4, !dbg !686
  br label %for.cond13, !dbg !689

for.cond13:                                       ; preds = %for.inc31, %if.then
  %16 = load i32, i32* %j, align 4, !dbg !690
  %17 = load i32, i32* %i, align 4, !dbg !693
  %cmp14 = icmp slt i32 %16, %17, !dbg !694
  br i1 %cmp14, label %for.body15, label %for.end33, !dbg !695

for.body15:                                       ; preds = %for.cond13
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !696, !range !654
  %idxprom17 = zext i32 %18 to i64, !dbg !698
  %arrayidx18 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom17, !dbg !698
  %19 = load i32, i32* %j, align 4, !dbg !699
  %idxprom19 = sext i32 %19 to i64, !dbg !698
  %arrayidx20 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx18, i64 0, i64 %idxprom19, !dbg !698
  %20 = load float, float* %arrayidx20, align 4, !dbg !698
  %21 = load i32, i32* %j, align 4, !dbg !700
  %idxprom21 = sext i32 %21 to i64, !dbg !701
  %arrayidx22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom21, !dbg !701
  %22 = load i32, i32* %i, align 4, !dbg !702
  %idxprom23 = sext i32 %22 to i64, !dbg !701
  %arrayidx24 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx22, i64 0, i64 %idxprom23, !dbg !701
  %23 = load float, float* %arrayidx24, align 4, !dbg !701
  %mul25 = fmul float %20, %23, !dbg !703
  %24 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !704, !range !654
  %idxprom27 = zext i32 %24 to i64, !dbg !706
  %arrayidx28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom27, !dbg !706
  %25 = load i32, i32* %i, align 4, !dbg !707
  %idxprom29 = sext i32 %25 to i64, !dbg !706
  %arrayidx30 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx28, i64 0, i64 %idxprom29, !dbg !706
  %26 = load float, float* %arrayidx30, align 4, !dbg !708
  %sub = fsub float %26, %mul25, !dbg !708
  store float %sub, float* %arrayidx30, align 4, !dbg !708
  br label %for.inc31, !dbg !706

for.inc31:                                        ; preds = %for.body15
  %27 = load i32, i32* %j, align 4, !dbg !709
  %inc32 = add nsw i32 %27, 1, !dbg !709
  store i32 %inc32, i32* %j, align 4, !dbg !709
  br label %for.cond13, !dbg !711, !llvm.loop !712

for.end33:                                        ; preds = %for.cond13
  %28 = load i32, i32* %i, align 4, !dbg !714
  %idxprom34 = sext i32 %28 to i64, !dbg !715
  %arrayidx35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom34, !dbg !715
  %29 = load i32, i32* %i, align 4, !dbg !716
  %idxprom36 = sext i32 %29 to i64, !dbg !715
  %arrayidx37 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx35, i64 0, i64 %idxprom36, !dbg !715
  %30 = load float, float* %arrayidx37, align 4, !dbg !715
  %31 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !717, !range !654
  %idxprom39 = zext i32 %31 to i64, !dbg !719
  %arrayidx40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom39, !dbg !719
  %32 = load i32, i32* %i, align 4, !dbg !720
  %idxprom41 = sext i32 %32 to i64, !dbg !719
  %arrayidx42 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx40, i64 0, i64 %idxprom41, !dbg !719
  %33 = load float, float* %arrayidx42, align 4, !dbg !721
  %div = fdiv float %33, %30, !dbg !721
  store float %div, float* %arrayidx42, align 4, !dbg !721
  br label %if.end, !dbg !722

if.end:                                           ; preds = %for.end33, %for.body10
  call void @llvm.nvvm.barrier0(), !dbg !723
  %34 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !724, !range !654
  %35 = load i32, i32* %i, align 4, !dbg !727
  %cmp44 = icmp ugt i32 %34, %35, !dbg !728
  br i1 %cmp44, label %if.then45, label %if.end71, !dbg !729

if.then45:                                        ; preds = %if.end
  store i32 0, i32* %j, align 4, !dbg !730
  br label %for.cond46, !dbg !733

for.cond46:                                       ; preds = %for.inc68, %if.then45
  %36 = load i32, i32* %j, align 4, !dbg !734
  %37 = load i32, i32* %i, align 4, !dbg !737
  %add47 = add nsw i32 %37, 1, !dbg !738
  %cmp48 = icmp slt i32 %36, %add47, !dbg !739
  br i1 %cmp48, label %for.body49, label %for.end70, !dbg !740

for.body49:                                       ; preds = %for.cond46
  %38 = load i32, i32* %i, align 4, !dbg !741
  %add50 = add nsw i32 %38, 1, !dbg !742
  %idxprom51 = sext i32 %add50 to i64, !dbg !743
  %arrayidx52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom51, !dbg !743
  %39 = load i32, i32* %j, align 4, !dbg !744
  %idxprom53 = sext i32 %39 to i64, !dbg !743
  %arrayidx54 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx52, i64 0, i64 %idxprom53, !dbg !743
  %40 = load float, float* %arrayidx54, align 4, !dbg !743
  %41 = load i32, i32* %j, align 4, !dbg !745
  %idxprom55 = sext i32 %41 to i64, !dbg !746
  %arrayidx56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom55, !dbg !746
  %42 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !747, !range !654
  %idxprom58 = zext i32 %42 to i64, !dbg !746
  %arrayidx59 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx56, i64 0, i64 %idxprom58, !dbg !746
  %43 = load float, float* %arrayidx59, align 4, !dbg !746
  %mul60 = fmul float %40, %43, !dbg !749
  %44 = load i32, i32* %i, align 4, !dbg !750
  %add61 = add nsw i32 %44, 1, !dbg !751
  %idxprom62 = sext i32 %add61 to i64, !dbg !752
  %arrayidx63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom62, !dbg !752
  %45 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !753, !range !654
  %idxprom65 = zext i32 %45 to i64, !dbg !752
  %arrayidx66 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx63, i64 0, i64 %idxprom65, !dbg !752
  %46 = load float, float* %arrayidx66, align 4, !dbg !755
  %sub67 = fsub float %46, %mul60, !dbg !755
  store float %sub67, float* %arrayidx66, align 4, !dbg !755
  br label %for.inc68, !dbg !752

for.inc68:                                        ; preds = %for.body49
  %47 = load i32, i32* %j, align 4, !dbg !756
  %inc69 = add nsw i32 %47, 1, !dbg !756
  store i32 %inc69, i32* %j, align 4, !dbg !756
  br label %for.cond46, !dbg !758, !llvm.loop !759

for.end70:                                        ; preds = %for.cond46
  br label %if.end71, !dbg !761

if.end71:                                         ; preds = %for.end70, %if.end
  call void @llvm.nvvm.barrier0(), !dbg !762
  br label %for.inc72, !dbg !763

for.inc72:                                        ; preds = %if.end71
  %48 = load i32, i32* %i, align 4, !dbg !764
  %inc73 = add nsw i32 %48, 1, !dbg !764
  store i32 %inc73, i32* %i, align 4, !dbg !764
  br label %for.cond8, !dbg !766, !llvm.loop !767

for.end74:                                        ; preds = %for.cond8
  %49 = load i32, i32* %offset.addr, align 4, !dbg !769
  %add75 = add nsw i32 %49, 1, !dbg !770
  %50 = load i32, i32* %matrix_dim.addr, align 4, !dbg !771
  %mul76 = mul nsw i32 %add75, %50, !dbg !772
  %51 = load i32, i32* %offset.addr, align 4, !dbg !773
  %add77 = add nsw i32 %mul76, %51, !dbg !774
  store i32 %add77, i32* %array_offset, align 4, !dbg !775
  store i32 1, i32* %i, align 4, !dbg !776
  br label %for.cond78, !dbg !778

for.cond78:                                       ; preds = %for.inc91, %for.end74
  %52 = load i32, i32* %i, align 4, !dbg !779
  %cmp79 = icmp slt i32 %52, 16, !dbg !782
  br i1 %cmp79, label %for.body80, label %for.end93, !dbg !783

for.body80:                                       ; preds = %for.cond78
  %53 = load i32, i32* %i, align 4, !dbg !784
  %idxprom81 = sext i32 %53 to i64, !dbg !786
  %arrayidx82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom81, !dbg !786
  %54 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !787, !range !654
  %idxprom84 = zext i32 %54 to i64, !dbg !786
  %arrayidx85 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx82, i64 0, i64 %idxprom84, !dbg !786
  %55 = load float, float* %arrayidx85, align 4, !dbg !786
  %56 = load float*, float** %m.addr, align 8, !dbg !789
  %57 = load i32, i32* %array_offset, align 4, !dbg !790
  %58 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !791, !range !654
  %add87 = add i32 %57, %58, !dbg !794
  %idxprom88 = zext i32 %add87 to i64, !dbg !789
  %arrayidx89 = getelementptr inbounds float, float* %56, i64 %idxprom88, !dbg !789
  store float %55, float* %arrayidx89, align 4, !dbg !795
  %59 = load i32, i32* %matrix_dim.addr, align 4, !dbg !796
  %60 = load i32, i32* %array_offset, align 4, !dbg !797
  %add90 = add nsw i32 %60, %59, !dbg !797
  store i32 %add90, i32* %array_offset, align 4, !dbg !797
  br label %for.inc91, !dbg !798

for.inc91:                                        ; preds = %for.body80
  %61 = load i32, i32* %i, align 4, !dbg !799
  %inc92 = add nsw i32 %61, 1, !dbg !799
  store i32 %inc92, i32* %i, align 4, !dbg !799
  br label %for.cond78, !dbg !801, !llvm.loop !802

for.end93:                                        ; preds = %for.cond78
  ret void, !dbg !804
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: convergent nounwind
define void @_Z13lud_perimeterPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 !dbg !12 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %array_offset = alloca i32, align 4
  %idx = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !805, metadata !589), !dbg !806
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %matrix_dim.addr, metadata !807, metadata !589), !dbg !808
  store i32 %offset, i32* %offset.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %offset.addr, metadata !809, metadata !589), !dbg !810
  call void @llvm.dbg.declare(metadata i32* %i, metadata !811, metadata !589), !dbg !812
  call void @llvm.dbg.declare(metadata i32* %j, metadata !813, metadata !589), !dbg !814
  call void @llvm.dbg.declare(metadata i32* %array_offset, metadata !815, metadata !589), !dbg !816
  call void @llvm.dbg.declare(metadata i32* %idx, metadata !817, metadata !589), !dbg !818
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !819, !range !654
  %cmp = icmp ult i32 %0, 16, !dbg !822
  br i1 %cmp, label %if.then, label %if.else, !dbg !823

if.then:                                          ; preds = %entry
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !824, !range !654
  store i32 %1, i32* %idx, align 4, !dbg !827
  %2 = load i32, i32* %offset.addr, align 4, !dbg !828
  %3 = load i32, i32* %matrix_dim.addr, align 4, !dbg !829
  %mul = mul nsw i32 %2, %3, !dbg !830
  %4 = load i32, i32* %offset.addr, align 4, !dbg !831
  %add = add nsw i32 %mul, %4, !dbg !832
  store i32 %add, i32* %array_offset, align 4, !dbg !833
  store i32 0, i32* %i, align 4, !dbg !834
  br label %for.cond, !dbg !836

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !837
  %cmp2 = icmp slt i32 %5, 8, !dbg !840
  br i1 %cmp2, label %for.body, label %for.end, !dbg !841

for.body:                                         ; preds = %for.cond
  %6 = load float*, float** %m.addr, align 8, !dbg !842
  %7 = load i32, i32* %array_offset, align 4, !dbg !844
  %8 = load i32, i32* %idx, align 4, !dbg !845
  %add3 = add nsw i32 %7, %8, !dbg !846
  %idxprom = sext i32 %add3 to i64, !dbg !842
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom, !dbg !842
  %9 = load float, float* %arrayidx, align 4, !dbg !842
  %10 = load i32, i32* %i, align 4, !dbg !847
  %idxprom4 = sext i32 %10 to i64, !dbg !848
  %arrayidx5 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom4, !dbg !848
  %11 = load i32, i32* %idx, align 4, !dbg !849
  %idxprom6 = sext i32 %11 to i64, !dbg !848
  %arrayidx7 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx5, i64 0, i64 %idxprom6, !dbg !848
  store float %9, float* %arrayidx7, align 4, !dbg !850
  %12 = load i32, i32* %matrix_dim.addr, align 4, !dbg !851
  %13 = load i32, i32* %array_offset, align 4, !dbg !852
  %add8 = add nsw i32 %13, %12, !dbg !852
  store i32 %add8, i32* %array_offset, align 4, !dbg !852
  br label %for.inc, !dbg !853

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !854
  %inc = add nsw i32 %14, 1, !dbg !854
  store i32 %inc, i32* %i, align 4, !dbg !854
  br label %for.cond, !dbg !856, !llvm.loop !857

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* %offset.addr, align 4, !dbg !859
  %16 = load i32, i32* %matrix_dim.addr, align 4, !dbg !860
  %mul9 = mul nsw i32 %15, %16, !dbg !861
  %17 = load i32, i32* %offset.addr, align 4, !dbg !862
  %add10 = add nsw i32 %mul9, %17, !dbg !863
  store i32 %add10, i32* %array_offset, align 4, !dbg !864
  store i32 0, i32* %i, align 4, !dbg !865
  br label %for.cond11, !dbg !867

for.cond11:                                       ; preds = %for.inc26, %for.end
  %18 = load i32, i32* %i, align 4, !dbg !868
  %cmp12 = icmp slt i32 %18, 16, !dbg !871
  br i1 %cmp12, label %for.body13, label %for.end28, !dbg !872

for.body13:                                       ; preds = %for.cond11
  %19 = load float*, float** %m.addr, align 8, !dbg !873
  %20 = load i32, i32* %array_offset, align 4, !dbg !875
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !876, !range !904
  %add15 = add i32 %21, 1, !dbg !905
  %mul16 = mul i32 %add15, 16, !dbg !906
  %add17 = add i32 %20, %mul16, !dbg !907
  %22 = load i32, i32* %idx, align 4, !dbg !908
  %add18 = add i32 %add17, %22, !dbg !909
  %idxprom19 = zext i32 %add18 to i64, !dbg !873
  %arrayidx20 = getelementptr inbounds float, float* %19, i64 %idxprom19, !dbg !873
  %23 = load float, float* %arrayidx20, align 4, !dbg !873
  %24 = load i32, i32* %i, align 4, !dbg !910
  %idxprom21 = sext i32 %24 to i64, !dbg !911
  %arrayidx22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom21, !dbg !911
  %25 = load i32, i32* %idx, align 4, !dbg !912
  %idxprom23 = sext i32 %25 to i64, !dbg !911
  %arrayidx24 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx22, i64 0, i64 %idxprom23, !dbg !911
  store float %23, float* %arrayidx24, align 4, !dbg !913
  %26 = load i32, i32* %matrix_dim.addr, align 4, !dbg !914
  %27 = load i32, i32* %array_offset, align 4, !dbg !915
  %add25 = add nsw i32 %27, %26, !dbg !915
  store i32 %add25, i32* %array_offset, align 4, !dbg !915
  br label %for.inc26, !dbg !916

for.inc26:                                        ; preds = %for.body13
  %28 = load i32, i32* %i, align 4, !dbg !917
  %inc27 = add nsw i32 %28, 1, !dbg !917
  store i32 %inc27, i32* %i, align 4, !dbg !917
  br label %for.cond11, !dbg !919, !llvm.loop !920

for.end28:                                        ; preds = %for.cond11
  br label %if.end, !dbg !922

if.else:                                          ; preds = %entry
  %29 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !923, !range !654
  %sub = sub i32 %29, 16, !dbg !926
  store i32 %sub, i32* %idx, align 4, !dbg !927
  %30 = load i32, i32* %offset.addr, align 4, !dbg !928
  %add30 = add nsw i32 %30, 8, !dbg !929
  %31 = load i32, i32* %matrix_dim.addr, align 4, !dbg !930
  %mul31 = mul nsw i32 %add30, %31, !dbg !931
  %32 = load i32, i32* %offset.addr, align 4, !dbg !932
  %add32 = add nsw i32 %mul31, %32, !dbg !933
  store i32 %add32, i32* %array_offset, align 4, !dbg !934
  store i32 8, i32* %i, align 4, !dbg !935
  br label %for.cond33, !dbg !937

for.cond33:                                       ; preds = %for.inc44, %if.else
  %33 = load i32, i32* %i, align 4, !dbg !938
  %cmp34 = icmp slt i32 %33, 16, !dbg !941
  br i1 %cmp34, label %for.body35, label %for.end46, !dbg !942

for.body35:                                       ; preds = %for.cond33
  %34 = load float*, float** %m.addr, align 8, !dbg !943
  %35 = load i32, i32* %array_offset, align 4, !dbg !945
  %36 = load i32, i32* %idx, align 4, !dbg !946
  %add36 = add nsw i32 %35, %36, !dbg !947
  %idxprom37 = sext i32 %add36 to i64, !dbg !943
  %arrayidx38 = getelementptr inbounds float, float* %34, i64 %idxprom37, !dbg !943
  %37 = load float, float* %arrayidx38, align 4, !dbg !943
  %38 = load i32, i32* %i, align 4, !dbg !948
  %idxprom39 = sext i32 %38 to i64, !dbg !949
  %arrayidx40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom39, !dbg !949
  %39 = load i32, i32* %idx, align 4, !dbg !950
  %idxprom41 = sext i32 %39 to i64, !dbg !949
  %arrayidx42 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx40, i64 0, i64 %idxprom41, !dbg !949
  store float %37, float* %arrayidx42, align 4, !dbg !951
  %40 = load i32, i32* %matrix_dim.addr, align 4, !dbg !952
  %41 = load i32, i32* %array_offset, align 4, !dbg !953
  %add43 = add nsw i32 %41, %40, !dbg !953
  store i32 %add43, i32* %array_offset, align 4, !dbg !953
  br label %for.inc44, !dbg !954

for.inc44:                                        ; preds = %for.body35
  %42 = load i32, i32* %i, align 4, !dbg !955
  %inc45 = add nsw i32 %42, 1, !dbg !955
  store i32 %inc45, i32* %i, align 4, !dbg !955
  br label %for.cond33, !dbg !957, !llvm.loop !958

for.end46:                                        ; preds = %for.cond33
  %43 = load i32, i32* %offset.addr, align 4, !dbg !960
  %44 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !961, !range !904
  %add48 = add i32 %44, 1, !dbg !963
  %mul49 = mul i32 %add48, 16, !dbg !964
  %add50 = add i32 %43, %mul49, !dbg !965
  %45 = load i32, i32* %matrix_dim.addr, align 4, !dbg !966
  %mul51 = mul i32 %add50, %45, !dbg !967
  %46 = load i32, i32* %offset.addr, align 4, !dbg !968
  %add52 = add i32 %mul51, %46, !dbg !969
  store i32 %add52, i32* %array_offset, align 4, !dbg !970
  store i32 0, i32* %i, align 4, !dbg !971
  br label %for.cond53, !dbg !973

for.cond53:                                       ; preds = %for.inc64, %for.end46
  %47 = load i32, i32* %i, align 4, !dbg !974
  %cmp54 = icmp slt i32 %47, 16, !dbg !977
  br i1 %cmp54, label %for.body55, label %for.end66, !dbg !978

for.body55:                                       ; preds = %for.cond53
  %48 = load float*, float** %m.addr, align 8, !dbg !979
  %49 = load i32, i32* %array_offset, align 4, !dbg !981
  %50 = load i32, i32* %idx, align 4, !dbg !982
  %add56 = add nsw i32 %49, %50, !dbg !983
  %idxprom57 = sext i32 %add56 to i64, !dbg !979
  %arrayidx58 = getelementptr inbounds float, float* %48, i64 %idxprom57, !dbg !979
  %51 = load float, float* %arrayidx58, align 4, !dbg !979
  %52 = load i32, i32* %i, align 4, !dbg !984
  %idxprom59 = sext i32 %52 to i64, !dbg !985
  %arrayidx60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom59, !dbg !985
  %53 = load i32, i32* %idx, align 4, !dbg !986
  %idxprom61 = sext i32 %53 to i64, !dbg !985
  %arrayidx62 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx60, i64 0, i64 %idxprom61, !dbg !985
  store float %51, float* %arrayidx62, align 4, !dbg !987
  %54 = load i32, i32* %matrix_dim.addr, align 4, !dbg !988
  %55 = load i32, i32* %array_offset, align 4, !dbg !989
  %add63 = add nsw i32 %55, %54, !dbg !989
  store i32 %add63, i32* %array_offset, align 4, !dbg !989
  br label %for.inc64, !dbg !990

for.inc64:                                        ; preds = %for.body55
  %56 = load i32, i32* %i, align 4, !dbg !991
  %inc65 = add nsw i32 %56, 1, !dbg !991
  store i32 %inc65, i32* %i, align 4, !dbg !991
  br label %for.cond53, !dbg !993, !llvm.loop !994

for.end66:                                        ; preds = %for.cond53
  br label %if.end

if.end:                                           ; preds = %for.end66, %for.end28
  call void @llvm.nvvm.barrier0(), !dbg !996
  %57 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !997, !range !654
  %cmp68 = icmp ult i32 %57, 16, !dbg !1000
  br i1 %cmp68, label %if.then69, label %if.else97, !dbg !1001

if.then69:                                        ; preds = %if.end
  %58 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1002, !range !654
  store i32 %58, i32* %idx, align 4, !dbg !1005
  store i32 1, i32* %i, align 4, !dbg !1006
  br label %for.cond71, !dbg !1008

for.cond71:                                       ; preds = %for.inc94, %if.then69
  %59 = load i32, i32* %i, align 4, !dbg !1009
  %cmp72 = icmp slt i32 %59, 16, !dbg !1012
  br i1 %cmp72, label %for.body73, label %for.end96, !dbg !1013

for.body73:                                       ; preds = %for.cond71
  store i32 0, i32* %j, align 4, !dbg !1014
  br label %for.cond74, !dbg !1017

for.cond74:                                       ; preds = %for.inc91, %for.body73
  %60 = load i32, i32* %j, align 4, !dbg !1018
  %61 = load i32, i32* %i, align 4, !dbg !1021
  %cmp75 = icmp slt i32 %60, %61, !dbg !1022
  br i1 %cmp75, label %for.body76, label %for.end93, !dbg !1023

for.body76:                                       ; preds = %for.cond74
  %62 = load i32, i32* %i, align 4, !dbg !1024
  %idxprom77 = sext i32 %62 to i64, !dbg !1025
  %arrayidx78 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom77, !dbg !1025
  %63 = load i32, i32* %j, align 4, !dbg !1026
  %idxprom79 = sext i32 %63 to i64, !dbg !1025
  %arrayidx80 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx78, i64 0, i64 %idxprom79, !dbg !1025
  %64 = load float, float* %arrayidx80, align 4, !dbg !1025
  %65 = load i32, i32* %j, align 4, !dbg !1027
  %idxprom81 = sext i32 %65 to i64, !dbg !1028
  %arrayidx82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom81, !dbg !1028
  %66 = load i32, i32* %idx, align 4, !dbg !1029
  %idxprom83 = sext i32 %66 to i64, !dbg !1028
  %arrayidx84 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx82, i64 0, i64 %idxprom83, !dbg !1028
  %67 = load float, float* %arrayidx84, align 4, !dbg !1028
  %mul85 = fmul float %64, %67, !dbg !1030
  %68 = load i32, i32* %i, align 4, !dbg !1031
  %idxprom86 = sext i32 %68 to i64, !dbg !1032
  %arrayidx87 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom86, !dbg !1032
  %69 = load i32, i32* %idx, align 4, !dbg !1033
  %idxprom88 = sext i32 %69 to i64, !dbg !1032
  %arrayidx89 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx87, i64 0, i64 %idxprom88, !dbg !1032
  %70 = load float, float* %arrayidx89, align 4, !dbg !1034
  %sub90 = fsub float %70, %mul85, !dbg !1034
  store float %sub90, float* %arrayidx89, align 4, !dbg !1034
  br label %for.inc91, !dbg !1032

for.inc91:                                        ; preds = %for.body76
  %71 = load i32, i32* %j, align 4, !dbg !1035
  %inc92 = add nsw i32 %71, 1, !dbg !1035
  store i32 %inc92, i32* %j, align 4, !dbg !1035
  br label %for.cond74, !dbg !1037, !llvm.loop !1038

for.end93:                                        ; preds = %for.cond74
  br label %for.inc94, !dbg !1040

for.inc94:                                        ; preds = %for.end93
  %72 = load i32, i32* %i, align 4, !dbg !1041
  %inc95 = add nsw i32 %72, 1, !dbg !1041
  store i32 %inc95, i32* %i, align 4, !dbg !1041
  br label %for.cond71, !dbg !1043, !llvm.loop !1044

for.end96:                                        ; preds = %for.cond71
  br label %if.end134, !dbg !1046

if.else97:                                        ; preds = %if.end
  %73 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1047, !range !654
  %sub99 = sub i32 %73, 16, !dbg !1050
  store i32 %sub99, i32* %idx, align 4, !dbg !1051
  store i32 0, i32* %i, align 4, !dbg !1052
  br label %for.cond100, !dbg !1054

for.cond100:                                      ; preds = %for.inc131, %if.else97
  %74 = load i32, i32* %i, align 4, !dbg !1055
  %cmp101 = icmp slt i32 %74, 16, !dbg !1058
  br i1 %cmp101, label %for.body102, label %for.end133, !dbg !1059

for.body102:                                      ; preds = %for.cond100
  store i32 0, i32* %j, align 4, !dbg !1060
  br label %for.cond103, !dbg !1063

for.cond103:                                      ; preds = %for.inc120, %for.body102
  %75 = load i32, i32* %j, align 4, !dbg !1064
  %76 = load i32, i32* %i, align 4, !dbg !1067
  %cmp104 = icmp slt i32 %75, %76, !dbg !1068
  br i1 %cmp104, label %for.body105, label %for.end122, !dbg !1069

for.body105:                                      ; preds = %for.cond103
  %77 = load i32, i32* %idx, align 4, !dbg !1070
  %idxprom106 = sext i32 %77 to i64, !dbg !1071
  %arrayidx107 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom106, !dbg !1071
  %78 = load i32, i32* %j, align 4, !dbg !1072
  %idxprom108 = sext i32 %78 to i64, !dbg !1071
  %arrayidx109 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx107, i64 0, i64 %idxprom108, !dbg !1071
  %79 = load float, float* %arrayidx109, align 4, !dbg !1071
  %80 = load i32, i32* %j, align 4, !dbg !1073
  %idxprom110 = sext i32 %80 to i64, !dbg !1074
  %arrayidx111 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom110, !dbg !1074
  %81 = load i32, i32* %i, align 4, !dbg !1075
  %idxprom112 = sext i32 %81 to i64, !dbg !1074
  %arrayidx113 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx111, i64 0, i64 %idxprom112, !dbg !1074
  %82 = load float, float* %arrayidx113, align 4, !dbg !1074
  %mul114 = fmul float %79, %82, !dbg !1076
  %83 = load i32, i32* %idx, align 4, !dbg !1077
  %idxprom115 = sext i32 %83 to i64, !dbg !1078
  %arrayidx116 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom115, !dbg !1078
  %84 = load i32, i32* %i, align 4, !dbg !1079
  %idxprom117 = sext i32 %84 to i64, !dbg !1078
  %arrayidx118 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx116, i64 0, i64 %idxprom117, !dbg !1078
  %85 = load float, float* %arrayidx118, align 4, !dbg !1080
  %sub119 = fsub float %85, %mul114, !dbg !1080
  store float %sub119, float* %arrayidx118, align 4, !dbg !1080
  br label %for.inc120, !dbg !1078

for.inc120:                                       ; preds = %for.body105
  %86 = load i32, i32* %j, align 4, !dbg !1081
  %inc121 = add nsw i32 %86, 1, !dbg !1081
  store i32 %inc121, i32* %j, align 4, !dbg !1081
  br label %for.cond103, !dbg !1083, !llvm.loop !1084

for.end122:                                       ; preds = %for.cond103
  %87 = load i32, i32* %i, align 4, !dbg !1086
  %idxprom123 = sext i32 %87 to i64, !dbg !1087
  %arrayidx124 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom123, !dbg !1087
  %88 = load i32, i32* %i, align 4, !dbg !1088
  %idxprom125 = sext i32 %88 to i64, !dbg !1087
  %arrayidx126 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx124, i64 0, i64 %idxprom125, !dbg !1087
  %89 = load float, float* %arrayidx126, align 4, !dbg !1087
  %90 = load i32, i32* %idx, align 4, !dbg !1089
  %idxprom127 = sext i32 %90 to i64, !dbg !1090
  %arrayidx128 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom127, !dbg !1090
  %91 = load i32, i32* %i, align 4, !dbg !1091
  %idxprom129 = sext i32 %91 to i64, !dbg !1090
  %arrayidx130 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx128, i64 0, i64 %idxprom129, !dbg !1090
  %92 = load float, float* %arrayidx130, align 4, !dbg !1092
  %div = fdiv float %92, %89, !dbg !1092
  store float %div, float* %arrayidx130, align 4, !dbg !1092
  br label %for.inc131, !dbg !1093

for.inc131:                                       ; preds = %for.end122
  %93 = load i32, i32* %i, align 4, !dbg !1094
  %inc132 = add nsw i32 %93, 1, !dbg !1094
  store i32 %inc132, i32* %i, align 4, !dbg !1094
  br label %for.cond100, !dbg !1096, !llvm.loop !1097

for.end133:                                       ; preds = %for.cond100
  br label %if.end134

if.end134:                                        ; preds = %for.end133, %for.end96
  call void @llvm.nvvm.barrier0(), !dbg !1099
  %94 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1100, !range !654
  %cmp136 = icmp ult i32 %94, 16, !dbg !1103
  br i1 %cmp136, label %if.then137, label %if.else160, !dbg !1104

if.then137:                                       ; preds = %if.end134
  %95 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1105, !range !654
  store i32 %95, i32* %idx, align 4, !dbg !1108
  %96 = load i32, i32* %offset.addr, align 4, !dbg !1109
  %add139 = add nsw i32 %96, 1, !dbg !1110
  %97 = load i32, i32* %matrix_dim.addr, align 4, !dbg !1111
  %mul140 = mul nsw i32 %add139, %97, !dbg !1112
  %98 = load i32, i32* %offset.addr, align 4, !dbg !1113
  %add141 = add nsw i32 %mul140, %98, !dbg !1114
  store i32 %add141, i32* %array_offset, align 4, !dbg !1115
  store i32 1, i32* %i, align 4, !dbg !1116
  br label %for.cond142, !dbg !1118

for.cond142:                                      ; preds = %for.inc157, %if.then137
  %99 = load i32, i32* %i, align 4, !dbg !1119
  %cmp143 = icmp slt i32 %99, 16, !dbg !1122
  br i1 %cmp143, label %for.body144, label %for.end159, !dbg !1123

for.body144:                                      ; preds = %for.cond142
  %100 = load i32, i32* %i, align 4, !dbg !1124
  %idxprom145 = sext i32 %100 to i64, !dbg !1126
  %arrayidx146 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom145, !dbg !1126
  %101 = load i32, i32* %idx, align 4, !dbg !1127
  %idxprom147 = sext i32 %101 to i64, !dbg !1126
  %arrayidx148 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx146, i64 0, i64 %idxprom147, !dbg !1126
  %102 = load float, float* %arrayidx148, align 4, !dbg !1126
  %103 = load float*, float** %m.addr, align 8, !dbg !1128
  %104 = load i32, i32* %array_offset, align 4, !dbg !1129
  %105 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !1130, !range !904
  %add150 = add i32 %105, 1, !dbg !1132
  %mul151 = mul i32 %add150, 16, !dbg !1133
  %add152 = add i32 %104, %mul151, !dbg !1134
  %106 = load i32, i32* %idx, align 4, !dbg !1135
  %add153 = add i32 %add152, %106, !dbg !1136
  %idxprom154 = zext i32 %add153 to i64, !dbg !1128
  %arrayidx155 = getelementptr inbounds float, float* %103, i64 %idxprom154, !dbg !1128
  store float %102, float* %arrayidx155, align 4, !dbg !1137
  %107 = load i32, i32* %matrix_dim.addr, align 4, !dbg !1138
  %108 = load i32, i32* %array_offset, align 4, !dbg !1139
  %add156 = add nsw i32 %108, %107, !dbg !1139
  store i32 %add156, i32* %array_offset, align 4, !dbg !1139
  br label %for.inc157, !dbg !1140

for.inc157:                                       ; preds = %for.body144
  %109 = load i32, i32* %i, align 4, !dbg !1141
  %inc158 = add nsw i32 %109, 1, !dbg !1141
  store i32 %inc158, i32* %i, align 4, !dbg !1141
  br label %for.cond142, !dbg !1143, !llvm.loop !1144

for.end159:                                       ; preds = %for.cond142
  br label %if.end183, !dbg !1146

if.else160:                                       ; preds = %if.end134
  %110 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1147, !range !654
  %sub162 = sub i32 %110, 16, !dbg !1150
  store i32 %sub162, i32* %idx, align 4, !dbg !1151
  %111 = load i32, i32* %offset.addr, align 4, !dbg !1152
  %112 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !1153, !range !904
  %add164 = add i32 %112, 1, !dbg !1155
  %mul165 = mul i32 %add164, 16, !dbg !1156
  %add166 = add i32 %111, %mul165, !dbg !1157
  %113 = load i32, i32* %matrix_dim.addr, align 4, !dbg !1158
  %mul167 = mul i32 %add166, %113, !dbg !1159
  %114 = load i32, i32* %offset.addr, align 4, !dbg !1160
  %add168 = add i32 %mul167, %114, !dbg !1161
  store i32 %add168, i32* %array_offset, align 4, !dbg !1162
  store i32 0, i32* %i, align 4, !dbg !1163
  br label %for.cond169, !dbg !1165

for.cond169:                                      ; preds = %for.inc180, %if.else160
  %115 = load i32, i32* %i, align 4, !dbg !1166
  %cmp170 = icmp slt i32 %115, 16, !dbg !1169
  br i1 %cmp170, label %for.body171, label %for.end182, !dbg !1170

for.body171:                                      ; preds = %for.cond169
  %116 = load i32, i32* %i, align 4, !dbg !1171
  %idxprom172 = sext i32 %116 to i64, !dbg !1173
  %arrayidx173 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom172, !dbg !1173
  %117 = load i32, i32* %idx, align 4, !dbg !1174
  %idxprom174 = sext i32 %117 to i64, !dbg !1173
  %arrayidx175 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx173, i64 0, i64 %idxprom174, !dbg !1173
  %118 = load float, float* %arrayidx175, align 4, !dbg !1173
  %119 = load float*, float** %m.addr, align 8, !dbg !1175
  %120 = load i32, i32* %array_offset, align 4, !dbg !1176
  %121 = load i32, i32* %idx, align 4, !dbg !1177
  %add176 = add nsw i32 %120, %121, !dbg !1178
  %idxprom177 = sext i32 %add176 to i64, !dbg !1175
  %arrayidx178 = getelementptr inbounds float, float* %119, i64 %idxprom177, !dbg !1175
  store float %118, float* %arrayidx178, align 4, !dbg !1179
  %122 = load i32, i32* %matrix_dim.addr, align 4, !dbg !1180
  %123 = load i32, i32* %array_offset, align 4, !dbg !1181
  %add179 = add nsw i32 %123, %122, !dbg !1181
  store i32 %add179, i32* %array_offset, align 4, !dbg !1181
  br label %for.inc180, !dbg !1182

for.inc180:                                       ; preds = %for.body171
  %124 = load i32, i32* %i, align 4, !dbg !1183
  %inc181 = add nsw i32 %124, 1, !dbg !1183
  store i32 %inc181, i32* %i, align 4, !dbg !1183
  br label %for.cond169, !dbg !1185, !llvm.loop !1186

for.end182:                                       ; preds = %for.cond169
  br label %if.end183

if.end183:                                        ; preds = %for.end182, %for.end159
  ret void, !dbg !1188
}

; Function Attrs: convergent nounwind
define void @_Z12lud_internalPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 !dbg !19 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca float, align 4
  %global_row_id = alloca i32, align 4
  %global_col_id = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !1189, metadata !589), !dbg !1190
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %matrix_dim.addr, metadata !1191, metadata !589), !dbg !1192
  store i32 %offset, i32* %offset.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %offset.addr, metadata !1193, metadata !589), !dbg !1194
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1195, metadata !589), !dbg !1196
  call void @llvm.dbg.declare(metadata float* %sum, metadata !1197, metadata !589), !dbg !1198
  call void @llvm.dbg.declare(metadata i32* %global_row_id, metadata !1199, metadata !589), !dbg !1200
  %0 = load i32, i32* %offset.addr, align 4, !dbg !1201
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !1202, !range !904
  %add = add i32 %1, 1, !dbg !1205
  %mul = mul i32 %add, 16, !dbg !1206
  %add1 = add i32 %0, %mul, !dbg !1207
  store i32 %add1, i32* %global_row_id, align 4, !dbg !1200
  call void @llvm.dbg.declare(metadata i32* %global_col_id, metadata !1208, metadata !589), !dbg !1209
  %2 = load i32, i32* %offset.addr, align 4, !dbg !1210
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !1211, !range !904
  %add3 = add i32 %3, 1, !dbg !1213
  %mul4 = mul i32 %add3, 16, !dbg !1214
  %add5 = add i32 %2, %mul4, !dbg !1215
  store i32 %add5, i32* %global_col_id, align 4, !dbg !1209
  %4 = load float*, float** %m.addr, align 8, !dbg !1216
  %5 = load i32, i32* %offset.addr, align 4, !dbg !1217
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !1218, !range !654
  %add7 = add i32 %5, %6, !dbg !1221
  %7 = load i32, i32* %matrix_dim.addr, align 4, !dbg !1222
  %mul8 = mul i32 %add7, %7, !dbg !1223
  %8 = load i32, i32* %global_col_id, align 4, !dbg !1224
  %add9 = add i32 %mul8, %8, !dbg !1225
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1226, !range !654
  %add11 = add i32 %add9, %9, !dbg !1229
  %idxprom = zext i32 %add11 to i64, !dbg !1216
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !1216
  %10 = load float, float* %arrayidx, align 4, !dbg !1216
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !1230, !range !654
  %idxprom13 = zext i32 %11 to i64, !dbg !1233
  %arrayidx14 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom13, !dbg !1233
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1234, !range !654
  %idxprom16 = zext i32 %12 to i64, !dbg !1233
  %arrayidx17 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx14, i64 0, i64 %idxprom16, !dbg !1233
  store float %10, float* %arrayidx17, align 4, !dbg !1237
  %13 = load float*, float** %m.addr, align 8, !dbg !1238
  %14 = load i32, i32* %global_row_id, align 4, !dbg !1239
  %15 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !1240, !range !654
  %add19 = add i32 %14, %15, !dbg !1242
  %16 = load i32, i32* %matrix_dim.addr, align 4, !dbg !1243
  %mul20 = mul i32 %add19, %16, !dbg !1244
  %17 = load i32, i32* %offset.addr, align 4, !dbg !1245
  %add21 = add i32 %mul20, %17, !dbg !1246
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1247, !range !654
  %add23 = add i32 %add21, %18, !dbg !1249
  %idxprom24 = zext i32 %add23 to i64, !dbg !1238
  %arrayidx25 = getelementptr inbounds float, float* %13, i64 %idxprom24, !dbg !1238
  %19 = load float, float* %arrayidx25, align 4, !dbg !1238
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !1250, !range !654
  %idxprom27 = zext i32 %20 to i64, !dbg !1252
  %arrayidx28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom27, !dbg !1252
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1253, !range !654
  %idxprom30 = zext i32 %21 to i64, !dbg !1252
  %arrayidx31 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx28, i64 0, i64 %idxprom30, !dbg !1252
  store float %19, float* %arrayidx31, align 4, !dbg !1255
  call void @llvm.nvvm.barrier0(), !dbg !1256
  store float 0.000000e+00, float* %sum, align 4, !dbg !1257
  store i32 0, i32* %i, align 4, !dbg !1258
  br label %for.cond, !dbg !1260

for.cond:                                         ; preds = %for.inc, %entry
  %22 = load i32, i32* %i, align 4, !dbg !1261
  %cmp = icmp slt i32 %22, 16, !dbg !1264
  br i1 %cmp, label %for.body, label %for.end, !dbg !1265

for.body:                                         ; preds = %for.cond
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !1266, !range !654
  %idxprom33 = zext i32 %23 to i64, !dbg !1268
  %arrayidx34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom33, !dbg !1268
  %24 = load i32, i32* %i, align 4, !dbg !1269
  %idxprom35 = sext i32 %24 to i64, !dbg !1268
  %arrayidx36 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx34, i64 0, i64 %idxprom35, !dbg !1268
  %25 = load float, float* %arrayidx36, align 4, !dbg !1268
  %26 = load i32, i32* %i, align 4, !dbg !1270
  %idxprom37 = sext i32 %26 to i64, !dbg !1271
  %arrayidx38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom37, !dbg !1271
  %27 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1272, !range !654
  %idxprom40 = zext i32 %27 to i64, !dbg !1271
  %arrayidx41 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx38, i64 0, i64 %idxprom40, !dbg !1271
  %28 = load float, float* %arrayidx41, align 4, !dbg !1271
  %mul42 = fmul float %25, %28, !dbg !1274
  %29 = load float, float* %sum, align 4, !dbg !1275
  %add43 = fadd float %29, %mul42, !dbg !1275
  store float %add43, float* %sum, align 4, !dbg !1275
  br label %for.inc, !dbg !1276

for.inc:                                          ; preds = %for.body
  %30 = load i32, i32* %i, align 4, !dbg !1277
  %inc = add nsw i32 %30, 1, !dbg !1277
  store i32 %inc, i32* %i, align 4, !dbg !1277
  br label %for.cond, !dbg !1279, !llvm.loop !1280

for.end:                                          ; preds = %for.cond
  %31 = load float, float* %sum, align 4, !dbg !1282
  %32 = load float*, float** %m.addr, align 8, !dbg !1283
  %33 = load i32, i32* %global_row_id, align 4, !dbg !1284
  %34 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !1285, !range !654
  %add45 = add i32 %33, %34, !dbg !1287
  %35 = load i32, i32* %matrix_dim.addr, align 4, !dbg !1288
  %mul46 = mul i32 %add45, %35, !dbg !1289
  %36 = load i32, i32* %global_col_id, align 4, !dbg !1290
  %add47 = add i32 %mul46, %36, !dbg !1291
  %37 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1292, !range !654
  %add49 = add i32 %add47, %37, !dbg !1294
  %idxprom50 = zext i32 %add49 to i64, !dbg !1283
  %arrayidx51 = getelementptr inbounds float, float* %32, i64 %idxprom50, !dbg !1283
  %38 = load float, float* %arrayidx51, align 4, !dbg !1295
  %sub = fsub float %38, %31, !dbg !1295
  store float %sub, float* %arrayidx51, align 4, !dbg !1295
  ret void, !dbg !1296
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!8}
!nvvm.annotations = !{!576, !577, !578, !579, !580, !579, !581, !581, !581, !581, !582, !582, !581}
!llvm.module.flags = !{!583, !584, !585}
!llvm.ident = !{!586}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!587}

!0 = distinct !DIGlobalVariable(name: "shadow", scope: !1, file: !2, line: 19, type: !13, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "lud_diagonal", linkageName: "_Z12lud_diagonalPfii", scope: !2, file: !2, line: 16, type: !3, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !9)
!2 = !DIFile(filename: "lud_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !7, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!7 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!8 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, imports: !21)
!9 = !{}
!10 = !{!0, !11, !16, !17, !18, !20}
!11 = distinct !DIGlobalVariable(name: "dia", scope: !12, file: !2, line: 60, type: !13, isLocal: true, isDefinition: true)
!12 = distinct !DISubprogram(name: "lud_perimeter", linkageName: "_Z13lud_perimeterPfii", scope: !2, file: !2, line: 58, type: !3, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !9)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8192, align: 32, elements: !14)
!14 = !{!15, !15}
!15 = !DISubrange(count: 16)
!16 = distinct !DIGlobalVariable(name: "peri_row", scope: !12, file: !2, line: 61, type: !13, isLocal: true, isDefinition: true)
!17 = distinct !DIGlobalVariable(name: "peri_col", scope: !12, file: !2, line: 62, type: !13, isLocal: true, isDefinition: true)
!18 = distinct !DIGlobalVariable(name: "peri_row", scope: !19, file: !2, line: 170, type: !13, isLocal: true, isDefinition: true)
!19 = distinct !DISubprogram(name: "lud_internal", linkageName: "_Z12lud_internalPfii", scope: !2, file: !2, line: 168, type: !3, isLocal: false, isDefinition: true, scopeLine: 169, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !9)
!20 = distinct !DIGlobalVariable(name: "peri_col", scope: !19, file: !2, line: 171, type: !13, isLocal: true, isDefinition: true)
!21 = !{!22, !29, !33, !35, !37, !39, !41, !45, !47, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !77, !79, !81, !83, !87, !92, !94, !96, !101, !105, !107, !109, !111, !113, !115, !117, !119, !121, !126, !130, !132, !134, !138, !140, !142, !144, !146, !148, !152, !154, !156, !160, !168, !172, !174, !176, !180, !182, !184, !188, !190, !192, !196, !198, !200, !202, !204, !206, !208, !210, !212, !214, !219, !221, !223, !227, !229, !231, !233, !235, !237, !239, !241, !245, !249, !251, !253, !258, !260, !262, !264, !266, !268, !270, !274, !280, !284, !288, !293, !295, !299, !303, !317, !321, !325, !329, !333, !338, !340, !344, !348, !352, !360, !364, !368, !372, !376, !381, !387, !391, !395, !397, !405, !409, !417, !419, !421, !425, !429, !433, !438, !442, !447, !448, !449, !450, !453, !454, !455, !456, !457, !458, !459, !462, !464, !466, !468, !470, !472, !474, !476, !479, !481, !483, !485, !487, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !547, !548, !550, !552, !554, !556, !558, !560, !562, !564, !566, !568, !570, !572, !574}
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !25, line: 189)
!23 = !DINamespace(name: "std", scope: null, file: !24, line: 188)
!24 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!25 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !24, file: !24, line: 44, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !28}
!28 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !30, line: 190)
!30 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !24, file: !24, line: 46, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!31 = !DISubroutineType(types: !32)
!32 = !{!6, !6}
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !34, line: 191)
!34 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !24, file: !24, line: 48, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !36, line: 192)
!36 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !24, file: !24, line: 50, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !38, line: 193)
!38 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !24, file: !24, line: 52, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !40, line: 194)
!40 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !24, file: !24, line: 56, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !42, line: 195)
!42 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !24, file: !24, line: 54, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DISubroutineType(types: !44)
!44 = !{!6, !6, !6}
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !46, line: 196)
!46 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !24, file: !24, line: 58, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !48, line: 197)
!48 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !24, file: !24, line: 60, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !50, line: 198)
!50 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !24, file: !24, line: 62, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !52, line: 199)
!52 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !24, file: !24, line: 64, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !54, line: 200)
!54 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !24, file: !24, line: 66, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !56, line: 201)
!56 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !24, file: !24, line: 68, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !58, line: 202)
!58 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !24, file: !24, line: 72, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !60, line: 203)
!60 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !24, file: !24, line: 70, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !62, line: 204)
!62 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !24, file: !24, line: 76, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !64, line: 205)
!64 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !24, file: !24, line: 74, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !66, line: 206)
!66 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !24, file: !24, line: 78, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !68, line: 207)
!68 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !24, file: !24, line: 80, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !70, line: 208)
!70 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !24, file: !24, line: 82, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !72, line: 209)
!72 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !24, file: !24, line: 84, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !74, line: 210)
!74 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !24, file: !24, line: 86, type: !75, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DISubroutineType(types: !76)
!76 = !{!6, !6, !6, !6}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !78, line: 211)
!78 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !24, file: !24, line: 88, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !80, line: 212)
!80 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !24, file: !24, line: 90, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !82, line: 213)
!82 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !24, file: !24, line: 92, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !84, line: 214)
!84 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !24, file: !24, line: 94, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DISubroutineType(types: !86)
!86 = !{!7, !6}
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !88, line: 215)
!88 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !24, file: !24, line: 96, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DISubroutineType(types: !90)
!90 = !{!6, !6, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !93, line: 216)
!93 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !24, file: !24, line: 98, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !95, line: 217)
!95 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !24, file: !24, line: 100, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !97, line: 218)
!97 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !24, file: !24, line: 102, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!100, !6}
!100 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !102, line: 219)
!102 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !24, file: !24, line: 106, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DISubroutineType(types: !104)
!104 = !{!100, !6, !6}
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !106, line: 220)
!106 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !24, file: !24, line: 105, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !108, line: 221)
!108 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !24, file: !24, line: 108, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !110, line: 222)
!110 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !24, file: !24, line: 112, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !112, line: 223)
!112 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !24, file: !24, line: 111, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !114, line: 224)
!114 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !24, file: !24, line: 114, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !116, line: 225)
!116 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !24, file: !24, line: 116, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !118, line: 226)
!118 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !24, file: !24, line: 118, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !120, line: 227)
!120 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !24, file: !24, line: 120, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !122, line: 228)
!122 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !24, file: !24, line: 121, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{!125, !125}
!125 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !127, line: 229)
!127 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !24, file: !24, line: 123, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DISubroutineType(types: !129)
!129 = !{!6, !6, !7}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !131, line: 230)
!131 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !24, file: !24, line: 125, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !133, line: 231)
!133 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !24, file: !24, line: 126, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !135, line: 232)
!135 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !24, file: !24, line: 128, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DISubroutineType(types: !137)
!137 = !{!28, !6}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !139, line: 233)
!139 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !24, file: !24, line: 138, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !141, line: 234)
!141 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !24, file: !24, line: 130, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !143, line: 235)
!143 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !24, file: !24, line: 132, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !145, line: 236)
!145 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !24, file: !24, line: 134, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !147, line: 237)
!147 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !24, file: !24, line: 136, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !149, line: 238)
!149 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !24, file: !24, line: 140, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DISubroutineType(types: !151)
!151 = !{!125, !6}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !153, line: 239)
!153 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !24, file: !24, line: 142, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !155, line: 240)
!155 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !24, file: !24, line: 143, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !157, line: 241)
!157 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !24, file: !24, line: 145, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DISubroutineType(types: !159)
!159 = !{!6, !6, !5}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !161, line: 242)
!161 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !24, file: !24, line: 146, type: !162, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DISubroutineType(types: !163)
!163 = !{!164, !165}
!164 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64, align: 64)
!166 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !167)
!167 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !169, line: 243)
!169 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !24, file: !24, line: 147, type: !170, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DISubroutineType(types: !171)
!171 = !{!6, !165}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !173, line: 244)
!173 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !24, file: !24, line: 149, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !175, line: 245)
!175 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !24, file: !24, line: 151, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !177, line: 246)
!177 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !24, file: !24, line: 153, type: !178, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DISubroutineType(types: !179)
!179 = !{!6, !6, !164}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !181, line: 247)
!181 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !24, file: !24, line: 158, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !183, line: 248)
!183 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !24, file: !24, line: 160, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !185, line: 249)
!185 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !24, file: !24, line: 162, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DISubroutineType(types: !187)
!187 = !{!6, !6, !6, !91}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !189, line: 250)
!189 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !24, file: !24, line: 164, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !191, line: 251)
!191 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !24, file: !24, line: 166, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !193, line: 252)
!193 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !24, file: !24, line: 168, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DISubroutineType(types: !195)
!195 = !{!6, !6, !125}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !197, line: 253)
!197 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !24, file: !24, line: 170, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !199, line: 254)
!199 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !24, file: !24, line: 172, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !201, line: 255)
!201 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !24, file: !24, line: 174, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !203, line: 256)
!203 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !24, file: !24, line: 176, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !205, line: 257)
!205 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !24, file: !24, line: 178, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !207, line: 258)
!207 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !24, file: !24, line: 180, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !209, line: 259)
!209 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !24, file: !24, line: 182, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !211, line: 260)
!211 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !24, file: !24, line: 184, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !213, line: 261)
!213 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !24, file: !24, line: 186, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !215, line: 102)
!215 = !DISubprogram(name: "acos", scope: !216, file: !216, line: 54, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!217 = !DISubroutineType(types: !218)
!218 = !{!164, !164}
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !220, line: 121)
!220 = !DISubprogram(name: "asin", scope: !216, file: !216, line: 56, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !222, line: 140)
!222 = !DISubprogram(name: "atan", scope: !216, file: !216, line: 58, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !224, line: 159)
!224 = !DISubprogram(name: "atan2", scope: !216, file: !216, line: 60, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DISubroutineType(types: !226)
!226 = !{!164, !164, !164}
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !228, line: 180)
!228 = !DISubprogram(name: "ceil", scope: !216, file: !216, line: 178, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !230, line: 199)
!230 = !DISubprogram(name: "cos", scope: !216, file: !216, line: 63, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !232, line: 218)
!232 = !DISubprogram(name: "cosh", scope: !216, file: !216, line: 72, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !234, line: 237)
!234 = !DISubprogram(name: "exp", scope: !216, file: !216, line: 100, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !236, line: 256)
!236 = !DISubprogram(name: "fabs", scope: !216, file: !216, line: 181, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !238, line: 275)
!238 = !DISubprogram(name: "floor", scope: !216, file: !216, line: 184, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !240, line: 294)
!240 = !DISubprogram(name: "fmod", scope: !216, file: !216, line: 187, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !242, line: 315)
!242 = !DISubprogram(name: "frexp", scope: !216, file: !216, line: 103, type: !243, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DISubroutineType(types: !244)
!244 = !{!164, !164, !91}
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !246, line: 334)
!246 = !DISubprogram(name: "ldexp", scope: !216, file: !216, line: 106, type: !247, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DISubroutineType(types: !248)
!248 = !{!164, !164, !7}
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !250, line: 353)
!250 = !DISubprogram(name: "log", scope: !216, file: !216, line: 109, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !252, line: 372)
!252 = !DISubprogram(name: "log10", scope: !216, file: !216, line: 112, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !254, line: 391)
!254 = !DISubprogram(name: "modf", scope: !216, file: !216, line: 115, type: !255, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DISubroutineType(types: !256)
!256 = !{!164, !164, !257}
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64, align: 64)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !259, line: 403)
!259 = !DISubprogram(name: "pow", scope: !216, file: !216, line: 153, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !261, line: 440)
!261 = !DISubprogram(name: "sin", scope: !216, file: !216, line: 65, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !263, line: 459)
!263 = !DISubprogram(name: "sinh", scope: !216, file: !216, line: 74, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !265, line: 478)
!265 = !DISubprogram(name: "sqrt", scope: !216, file: !216, line: 156, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !267, line: 497)
!267 = !DISubprogram(name: "tan", scope: !216, file: !216, line: 67, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !269, line: 516)
!269 = !DISubprogram(name: "tanh", scope: !216, file: !216, line: 76, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !271, line: 118)
!271 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !272, line: 101, baseType: !273)
!272 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!273 = !DICompositeType(tag: DW_TAG_structure_type, file: !272, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !275, line: 119)
!275 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !272, line: 109, baseType: !276)
!276 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !272, line: 105, size: 128, align: 64, elements: !277, identifier: "_ZTS6ldiv_t")
!277 = !{!278, !279}
!278 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !276, file: !272, line: 107, baseType: !125, size: 64, align: 64)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !276, file: !272, line: 108, baseType: !125, size: 64, align: 64, offset: 64)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !281, line: 121)
!281 = !DISubprogram(name: "abort", scope: !272, file: !272, line: 515, type: !282, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!282 = !DISubroutineType(types: !283)
!283 = !{null}
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !285, line: 122)
!285 = !DISubprogram(name: "abs", scope: !272, file: !272, line: 774, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!7, !7}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !289, line: 123)
!289 = !DISubprogram(name: "atexit", scope: !272, file: !272, line: 519, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!7, !292}
!292 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !282, size: 64, align: 64)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !294, line: 129)
!294 = !DISubprogram(name: "atof", scope: !272, file: !272, line: 144, type: !162, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !296, line: 130)
!296 = !DISubprogram(name: "atoi", scope: !272, file: !272, line: 147, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!7, !165}
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !300, line: 131)
!300 = !DISubprogram(name: "atol", scope: !272, file: !272, line: 150, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!125, !165}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !304, line: 132)
!304 = !DISubprogram(name: "bsearch", scope: !272, file: !272, line: 754, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!307, !308, !308, !310, !310, !313}
!307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64, align: 64)
!309 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !311, line: 62, baseType: !312)
!311 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!312 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !272, line: 741, baseType: !314)
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64, align: 64)
!315 = !DISubroutineType(types: !316)
!316 = !{!7, !308, !308}
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !318, line: 133)
!318 = !DISubprogram(name: "calloc", scope: !272, file: !272, line: 468, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!319 = !DISubroutineType(types: !320)
!320 = !{!307, !310, !310}
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !322, line: 134)
!322 = !DISubprogram(name: "div", scope: !272, file: !272, line: 788, type: !323, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!323 = !DISubroutineType(types: !324)
!324 = !{!271, !7, !7}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !326, line: 135)
!326 = !DISubprogram(name: "exit", scope: !272, file: !272, line: 543, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{null, !7}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !330, line: 136)
!330 = !DISubprogram(name: "free", scope: !272, file: !272, line: 483, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{null, !307}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !334, line: 137)
!334 = !DISubprogram(name: "getenv", scope: !272, file: !272, line: 564, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!337, !165}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64, align: 64)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !339, line: 138)
!339 = !DISubprogram(name: "labs", scope: !272, file: !272, line: 775, type: !123, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !341, line: 139)
!341 = !DISubprogram(name: "ldiv", scope: !272, file: !272, line: 790, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{!275, !125, !125}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !345, line: 140)
!345 = !DISubprogram(name: "malloc", scope: !272, file: !272, line: 466, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!307, !310}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !349, line: 142)
!349 = !DISubprogram(name: "mblen", scope: !272, file: !272, line: 862, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DISubroutineType(types: !351)
!351 = !{!7, !165, !310}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !353, line: 143)
!353 = !DISubprogram(name: "mbstowcs", scope: !272, file: !272, line: 873, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DISubroutineType(types: !355)
!355 = !{!310, !356, !359, !310}
!356 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !357)
!357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !358, size: 64, align: 64)
!358 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !165)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !361, line: 144)
!361 = !DISubprogram(name: "mbtowc", scope: !272, file: !272, line: 865, type: !362, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!362 = !DISubroutineType(types: !363)
!363 = !{!7, !356, !359, !310}
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !365, line: 146)
!365 = !DISubprogram(name: "qsort", scope: !272, file: !272, line: 764, type: !366, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !307, !310, !310, !313}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !369, line: 152)
!369 = !DISubprogram(name: "rand", scope: !272, file: !272, line: 374, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!7}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !373, line: 153)
!373 = !DISubprogram(name: "realloc", scope: !272, file: !272, line: 480, type: !374, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!374 = !DISubroutineType(types: !375)
!375 = !{!307, !307, !310}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !377, line: 154)
!377 = !DISubprogram(name: "srand", scope: !272, file: !272, line: 376, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DISubroutineType(types: !379)
!379 = !{null, !380}
!380 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !382, line: 155)
!382 = !DISubprogram(name: "strtod", scope: !272, file: !272, line: 164, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{!164, !359, !385}
!385 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !386)
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !337, size: 64, align: 64)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !388, line: 156)
!388 = !DISubprogram(name: "strtol", scope: !272, file: !272, line: 183, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!389 = !DISubroutineType(types: !390)
!390 = !{!125, !359, !385, !7}
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !392, line: 157)
!392 = !DISubprogram(name: "strtoul", scope: !272, file: !272, line: 187, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DISubroutineType(types: !394)
!394 = !{!312, !359, !385, !7}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !396, line: 158)
!396 = !DISubprogram(name: "system", scope: !272, file: !272, line: 716, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !398, line: 160)
!398 = !DISubprogram(name: "wcstombs", scope: !272, file: !272, line: 876, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!310, !401, !402, !310}
!401 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !337)
!402 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !403)
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64, align: 64)
!404 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !358)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !406, line: 161)
!406 = !DISubprogram(name: "wctomb", scope: !272, file: !272, line: 869, type: !407, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!407 = !DISubroutineType(types: !408)
!408 = !{!7, !337, !358}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !412, line: 214)
!410 = !DINamespace(name: "__gnu_cxx", scope: null, file: !411, line: 220)
!411 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !272, line: 121, baseType: !413)
!413 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !272, line: 117, size: 128, align: 64, elements: !414, identifier: "_ZTS7lldiv_t")
!414 = !{!415, !416}
!415 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !413, file: !272, line: 119, baseType: !28, size: 64, align: 64)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !413, file: !272, line: 120, baseType: !28, size: 64, align: 64, offset: 64)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !418, line: 220)
!418 = !DISubprogram(name: "_Exit", scope: !272, file: !272, line: 557, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !420, line: 224)
!420 = !DISubprogram(name: "llabs", scope: !272, file: !272, line: 779, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !422, line: 230)
!422 = !DISubprogram(name: "lldiv", scope: !272, file: !272, line: 796, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!423 = !DISubroutineType(types: !424)
!424 = !{!412, !28, !28}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !426, line: 241)
!426 = !DISubprogram(name: "atoll", scope: !272, file: !272, line: 157, type: !427, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!427 = !DISubroutineType(types: !428)
!428 = !{!28, !165}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !430, line: 242)
!430 = !DISubprogram(name: "strtoll", scope: !272, file: !272, line: 209, type: !431, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!431 = !DISubroutineType(types: !432)
!432 = !{!28, !359, !385, !7}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !434, line: 243)
!434 = !DISubprogram(name: "strtoull", scope: !272, file: !272, line: 214, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!437, !359, !385, !7}
!437 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !439, line: 245)
!439 = !DISubprogram(name: "strtof", scope: !272, file: !272, line: 172, type: !440, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!440 = !DISubroutineType(types: !441)
!441 = !{!6, !359, !385}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !443, line: 246)
!443 = !DISubprogram(name: "strtold", scope: !272, file: !272, line: 175, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{!446, !359, !385}
!446 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !412, line: 254)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !418, line: 256)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !420, line: 258)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !451, line: 259)
!451 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !410, file: !452, line: 227, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !422, line: 260)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !426, line: 262)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !439, line: 263)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !430, line: 264)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !434, line: 265)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !443, line: 266)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !460, line: 397)
!460 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !461, file: !461, line: 1342, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !463, line: 398)
!463 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !461, file: !461, line: 1370, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !465, line: 399)
!465 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !461, file: !461, line: 1337, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !467, line: 400)
!467 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !461, file: !461, line: 1375, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !469, line: 401)
!469 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !461, file: !461, line: 1327, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !471, line: 402)
!471 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !461, file: !461, line: 1332, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !473, line: 403)
!473 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !461, file: !461, line: 1380, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !475, line: 404)
!475 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !461, file: !461, line: 1430, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !477, line: 405)
!477 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !478, file: !478, line: 667, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !480, line: 406)
!480 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !461, file: !461, line: 1189, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !482, line: 407)
!482 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !461, file: !461, line: 1243, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !484, line: 408)
!484 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !461, file: !461, line: 1312, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !486, line: 409)
!486 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !461, file: !461, line: 1490, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !488, line: 410)
!488 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !461, file: !461, line: 1480, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !490, line: 411)
!490 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !478, file: !478, line: 657, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !492, line: 412)
!492 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !461, file: !461, line: 1294, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !494, line: 413)
!494 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !461, file: !461, line: 1385, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !496, line: 414)
!496 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !478, file: !478, line: 607, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !498, line: 415)
!498 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !461, file: !461, line: 1616, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !500, line: 416)
!500 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !478, file: !478, line: 597, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !502, line: 417)
!502 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !461, file: !461, line: 1568, type: !75, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !504, line: 418)
!504 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !478, file: !478, line: 622, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !506, line: 419)
!506 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !478, file: !478, line: 617, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !508, line: 420)
!508 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !461, file: !461, line: 1553, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !510, line: 421)
!510 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !461, file: !461, line: 1543, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !512, line: 422)
!512 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !461, file: !461, line: 1390, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !514, line: 423)
!514 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !461, file: !461, line: 1621, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !516, line: 424)
!516 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !461, file: !461, line: 1520, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !518, line: 425)
!518 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !461, file: !461, line: 1515, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !520, line: 426)
!520 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !461, file: !461, line: 1149, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !522, line: 427)
!522 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !461, file: !461, line: 1602, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !524, line: 428)
!524 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !461, file: !461, line: 1356, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !526, line: 429)
!526 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !461, file: !461, line: 1365, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !528, line: 430)
!528 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !461, file: !461, line: 1285, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !530, line: 431)
!530 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !461, file: !461, line: 1626, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !532, line: 432)
!532 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !461, file: !461, line: 1347, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !534, line: 433)
!534 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !461, file: !461, line: 1140, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !536, line: 434)
!536 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !461, file: !461, line: 1607, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !538, line: 435)
!538 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !461, file: !461, line: 1548, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !540, line: 436)
!540 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !461, file: !461, line: 1154, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !542, line: 437)
!542 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !461, file: !461, line: 1218, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !544, line: 438)
!544 = !DISubprogram(name: "nexttowardf", scope: !216, file: !216, line: 294, type: !545, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DISubroutineType(types: !546)
!546 = !{!6, !6, !446}
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !544, line: 439)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !549, line: 440)
!549 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !461, file: !461, line: 1583, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !551, line: 441)
!551 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !461, file: !461, line: 1558, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !553, line: 442)
!553 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !461, file: !461, line: 1563, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !555, line: 443)
!555 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !461, file: !461, line: 1135, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !557, line: 444)
!557 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !461, file: !461, line: 1597, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !559, line: 445)
!559 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !461, file: !461, line: 1530, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !561, line: 446)
!561 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !461, file: !461, line: 1525, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !563, line: 447)
!563 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !461, file: !461, line: 1234, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !565, line: 448)
!565 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !461, file: !461, line: 1317, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !567, line: 449)
!567 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !478, file: !478, line: 907, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !569, line: 450)
!569 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !461, file: !461, line: 1276, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !571, line: 451)
!571 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !461, file: !461, line: 1322, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !573, line: 452)
!573 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !461, file: !461, line: 1592, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !575, line: 453)
!575 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !478, file: !478, line: 662, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !{void (float*, i32, i32)* @_Z12lud_diagonalPfii, !"kernel", i32 1}
!577 = !{void (float*, i32, i32)* @_Z13lud_perimeterPfii, !"kernel", i32 1}
!578 = !{void (float*, i32, i32)* @_Z12lud_internalPfii, !"kernel", i32 1}
!579 = !{null, !"align", i32 8}
!580 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!581 = !{null, !"align", i32 16}
!582 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!583 = !{i32 2, !"Dwarf Version", i32 4}
!584 = !{i32 2, !"Debug Info Version", i32 3}
!585 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!586 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!587 = !{i32 1, i32 2}
!588 = !DILocalVariable(name: "m", arg: 1, scope: !1, file: !2, line: 16, type: !5)
!589 = !DIExpression()
!590 = !DILocation(line: 16, column: 21, scope: !1)
!591 = !DILocalVariable(name: "matrix_dim", arg: 2, scope: !1, file: !2, line: 16, type: !7)
!592 = !DILocation(line: 16, column: 28, scope: !1)
!593 = !DILocalVariable(name: "offset", arg: 3, scope: !1, file: !2, line: 16, type: !7)
!594 = !DILocation(line: 16, column: 44, scope: !1)
!595 = !DILocalVariable(name: "i", scope: !1, file: !2, line: 18, type: !7)
!596 = !DILocation(line: 18, column: 7, scope: !1)
!597 = !DILocalVariable(name: "j", scope: !1, file: !2, line: 18, type: !7)
!598 = !DILocation(line: 18, column: 9, scope: !1)
!599 = !DILocalVariable(name: "array_offset", scope: !1, file: !2, line: 21, type: !7)
!600 = !DILocation(line: 21, column: 7, scope: !1)
!601 = !DILocation(line: 21, column: 22, scope: !1)
!602 = !DILocation(line: 21, column: 29, scope: !1)
!603 = !DILocation(line: 21, column: 28, scope: !1)
!604 = !DILocation(line: 21, column: 40, scope: !1)
!605 = !DILocation(line: 21, column: 39, scope: !1)
!606 = !DILocation(line: 22, column: 8, scope: !607)
!607 = distinct !DILexicalBlock(scope: !1, file: !2, line: 22, column: 3)
!608 = !DILocation(line: 22, column: 7, scope: !607)
!609 = !DILocation(line: 22, column: 12, scope: !610)
!610 = !DILexicalBlockFile(scope: !611, file: !2, discriminator: 1)
!611 = distinct !DILexicalBlock(scope: !607, file: !2, line: 22, column: 3)
!612 = !DILocation(line: 22, column: 14, scope: !610)
!613 = !DILocation(line: 22, column: 3, scope: !610)
!614 = !DILocation(line: 23, column: 28, scope: !615)
!615 = distinct !DILexicalBlock(scope: !611, file: !2, line: 22, column: 32)
!616 = !DILocation(line: 23, column: 30, scope: !615)
!617 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !653)
!618 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !620, file: !619, line: 67, type: !623, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !622, variables: !9)
!619 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!620 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !619, line: 66, size: 8, align: 8, elements: !621, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!621 = !{!622, !625, !626, !627, !638, !642, !646, !649}
!622 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !620, file: !619, line: 67, type: !623, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!623 = !DISubroutineType(types: !624)
!624 = !{!380}
!625 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !620, file: !619, line: 68, type: !623, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !620, file: !619, line: 69, type: !623, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!627 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !620, file: !619, line: 72, type: !628, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DISubroutineType(types: !629)
!629 = !{!630, !636}
!630 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !631, line: 190, size: 96, align: 32, elements: !632, identifier: "_ZTS5uint3")
!631 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!632 = !{!633, !634, !635}
!633 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !630, file: !631, line: 192, baseType: !380, size: 32, align: 32)
!634 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !630, file: !631, line: 192, baseType: !380, size: 32, align: 32, offset: 32)
!635 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !630, file: !631, line: 192, baseType: !380, size: 32, align: 32, offset: 64)
!636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !637, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!637 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !620)
!638 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !620, file: !619, line: 74, type: !639, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!639 = !DISubroutineType(types: !640)
!640 = !{null, !641}
!641 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !620, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!642 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !620, file: !619, line: 74, type: !643, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!643 = !DISubroutineType(types: !644)
!644 = !{null, !641, !645}
!645 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !637, size: 64, align: 64)
!646 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !620, file: !619, line: 74, type: !647, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!647 = !DISubroutineType(types: !648)
!648 = !{null, !636, !645}
!649 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !620, file: !619, line: 74, type: !650, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!650 = !DISubroutineType(types: !651)
!651 = !{!652, !636}
!652 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !620, size: 64, align: 64)
!653 = distinct !DILocation(line: 23, column: 43, scope: !615)
!654 = !{i32 0, i32 1024}
!655 = !DILocation(line: 23, column: 42, scope: !615)
!656 = !DILocation(line: 23, column: 12, scope: !615)
!657 = !DILocation(line: 23, column: 5, scope: !615)
!658 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !659)
!659 = distinct !DILocation(line: 23, column: 15, scope: !660)
!660 = !DILexicalBlockFile(scope: !615, file: !2, discriminator: 1)
!661 = !DILocation(line: 23, column: 27, scope: !615)
!662 = !DILocation(line: 24, column: 21, scope: !615)
!663 = !DILocation(line: 24, column: 18, scope: !615)
!664 = !DILocation(line: 25, column: 3, scope: !615)
!665 = !DILocation(line: 22, column: 29, scope: !666)
!666 = !DILexicalBlockFile(scope: !611, file: !2, discriminator: 2)
!667 = !DILocation(line: 22, column: 3, scope: !666)
!668 = distinct !{!668, !669}
!669 = !DILocation(line: 22, column: 3, scope: !1)
!670 = !DILocation(line: 26, column: 3, scope: !1)
!671 = !DILocation(line: 27, column: 8, scope: !672)
!672 = distinct !DILexicalBlock(scope: !1, file: !2, line: 27, column: 3)
!673 = !DILocation(line: 27, column: 7, scope: !672)
!674 = !DILocation(line: 27, column: 12, scope: !675)
!675 = !DILexicalBlockFile(scope: !676, file: !2, discriminator: 1)
!676 = distinct !DILexicalBlock(scope: !672, file: !2, line: 27, column: 3)
!677 = !DILocation(line: 27, column: 14, scope: !675)
!678 = !DILocation(line: 27, column: 3, scope: !675)
!679 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !680)
!680 = distinct !DILocation(line: 29, column: 9, scope: !681)
!681 = distinct !DILexicalBlock(scope: !682, file: !2, line: 29, column: 9)
!682 = distinct !DILexicalBlock(scope: !676, file: !2, line: 27, column: 35)
!683 = !DILocation(line: 29, column: 21, scope: !681)
!684 = !DILocation(line: 29, column: 20, scope: !681)
!685 = !DILocation(line: 29, column: 9, scope: !682)
!686 = !DILocation(line: 30, column: 12, scope: !687)
!687 = distinct !DILexicalBlock(scope: !688, file: !2, line: 30, column: 7)
!688 = distinct !DILexicalBlock(scope: !681, file: !2, line: 29, column: 23)
!689 = !DILocation(line: 30, column: 11, scope: !687)
!690 = !DILocation(line: 30, column: 16, scope: !691)
!691 = !DILexicalBlockFile(scope: !692, file: !2, discriminator: 1)
!692 = distinct !DILexicalBlock(scope: !687, file: !2, line: 30, column: 7)
!693 = !DILocation(line: 30, column: 20, scope: !691)
!694 = !DILocation(line: 30, column: 18, scope: !691)
!695 = !DILocation(line: 30, column: 7, scope: !691)
!696 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !697)
!697 = distinct !DILocation(line: 31, column: 42, scope: !692)
!698 = !DILocation(line: 31, column: 35, scope: !692)
!699 = !DILocation(line: 31, column: 55, scope: !692)
!700 = !DILocation(line: 31, column: 65, scope: !692)
!701 = !DILocation(line: 31, column: 58, scope: !692)
!702 = !DILocation(line: 31, column: 68, scope: !692)
!703 = !DILocation(line: 31, column: 57, scope: !692)
!704 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !705)
!705 = distinct !DILocation(line: 31, column: 16, scope: !691)
!706 = !DILocation(line: 31, column: 9, scope: !692)
!707 = !DILocation(line: 31, column: 29, scope: !692)
!708 = !DILocation(line: 31, column: 32, scope: !692)
!709 = !DILocation(line: 30, column: 24, scope: !710)
!710 = !DILexicalBlockFile(scope: !692, file: !2, discriminator: 2)
!711 = !DILocation(line: 30, column: 7, scope: !710)
!712 = distinct !{!712, !713}
!713 = !DILocation(line: 30, column: 7, scope: !688)
!714 = !DILocation(line: 32, column: 40, scope: !688)
!715 = !DILocation(line: 32, column: 33, scope: !688)
!716 = !DILocation(line: 32, column: 43, scope: !688)
!717 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !718)
!718 = distinct !DILocation(line: 32, column: 14, scope: !688)
!719 = !DILocation(line: 32, column: 7, scope: !688)
!720 = !DILocation(line: 32, column: 27, scope: !688)
!721 = !DILocation(line: 32, column: 30, scope: !688)
!722 = !DILocation(line: 33, column: 5, scope: !688)
!723 = !DILocation(line: 35, column: 5, scope: !682)
!724 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !725)
!725 = distinct !DILocation(line: 36, column: 9, scope: !726)
!726 = distinct !DILexicalBlock(scope: !682, file: !2, line: 36, column: 9)
!727 = !DILocation(line: 36, column: 21, scope: !726)
!728 = !DILocation(line: 36, column: 20, scope: !726)
!729 = !DILocation(line: 36, column: 9, scope: !682)
!730 = !DILocation(line: 38, column: 12, scope: !731)
!731 = distinct !DILexicalBlock(scope: !732, file: !2, line: 38, column: 7)
!732 = distinct !DILexicalBlock(scope: !726, file: !2, line: 36, column: 23)
!733 = !DILocation(line: 38, column: 11, scope: !731)
!734 = !DILocation(line: 38, column: 16, scope: !735)
!735 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 1)
!736 = distinct !DILexicalBlock(scope: !731, file: !2, line: 38, column: 7)
!737 = !DILocation(line: 38, column: 20, scope: !735)
!738 = !DILocation(line: 38, column: 21, scope: !735)
!739 = !DILocation(line: 38, column: 18, scope: !735)
!740 = !DILocation(line: 38, column: 7, scope: !735)
!741 = !DILocation(line: 39, column: 44, scope: !736)
!742 = !DILocation(line: 39, column: 45, scope: !736)
!743 = !DILocation(line: 39, column: 37, scope: !736)
!744 = !DILocation(line: 39, column: 49, scope: !736)
!745 = !DILocation(line: 39, column: 59, scope: !736)
!746 = !DILocation(line: 39, column: 52, scope: !736)
!747 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !748)
!748 = distinct !DILocation(line: 39, column: 62, scope: !736)
!749 = !DILocation(line: 39, column: 51, scope: !736)
!750 = !DILocation(line: 39, column: 16, scope: !736)
!751 = !DILocation(line: 39, column: 17, scope: !736)
!752 = !DILocation(line: 39, column: 9, scope: !736)
!753 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !754)
!754 = distinct !DILocation(line: 39, column: 21, scope: !735)
!755 = !DILocation(line: 39, column: 34, scope: !736)
!756 = !DILocation(line: 38, column: 26, scope: !757)
!757 = !DILexicalBlockFile(scope: !736, file: !2, discriminator: 2)
!758 = !DILocation(line: 38, column: 7, scope: !757)
!759 = distinct !{!759, !760}
!760 = !DILocation(line: 38, column: 7, scope: !732)
!761 = !DILocation(line: 40, column: 5, scope: !732)
!762 = !DILocation(line: 41, column: 5, scope: !682)
!763 = !DILocation(line: 42, column: 3, scope: !682)
!764 = !DILocation(line: 27, column: 31, scope: !765)
!765 = !DILexicalBlockFile(scope: !676, file: !2, discriminator: 2)
!766 = !DILocation(line: 27, column: 3, scope: !765)
!767 = distinct !{!767, !768}
!768 = !DILocation(line: 27, column: 3, scope: !1)
!769 = !DILocation(line: 50, column: 19, scope: !1)
!770 = !DILocation(line: 50, column: 25, scope: !1)
!771 = !DILocation(line: 50, column: 29, scope: !1)
!772 = !DILocation(line: 50, column: 28, scope: !1)
!773 = !DILocation(line: 50, column: 40, scope: !1)
!774 = !DILocation(line: 50, column: 39, scope: !1)
!775 = !DILocation(line: 50, column: 16, scope: !1)
!776 = !DILocation(line: 51, column: 8, scope: !777)
!777 = distinct !DILexicalBlock(scope: !1, file: !2, line: 51, column: 3)
!778 = !DILocation(line: 51, column: 7, scope: !777)
!779 = !DILocation(line: 51, column: 12, scope: !780)
!780 = !DILexicalBlockFile(scope: !781, file: !2, discriminator: 1)
!781 = distinct !DILexicalBlock(scope: !777, file: !2, line: 51, column: 3)
!782 = !DILocation(line: 51, column: 14, scope: !780)
!783 = !DILocation(line: 51, column: 3, scope: !780)
!784 = !DILocation(line: 52, column: 40, scope: !785)
!785 = distinct !DILexicalBlock(scope: !781, file: !2, line: 51, column: 32)
!786 = !DILocation(line: 52, column: 33, scope: !785)
!787 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !788)
!788 = distinct !DILocation(line: 52, column: 43, scope: !785)
!789 = !DILocation(line: 52, column: 5, scope: !785)
!790 = !DILocation(line: 52, column: 7, scope: !785)
!791 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !792)
!792 = distinct !DILocation(line: 52, column: 20, scope: !793)
!793 = !DILexicalBlockFile(scope: !785, file: !2, discriminator: 1)
!794 = !DILocation(line: 52, column: 19, scope: !785)
!795 = !DILocation(line: 52, column: 32, scope: !785)
!796 = !DILocation(line: 53, column: 21, scope: !785)
!797 = !DILocation(line: 53, column: 18, scope: !785)
!798 = !DILocation(line: 54, column: 3, scope: !785)
!799 = !DILocation(line: 51, column: 29, scope: !800)
!800 = !DILexicalBlockFile(scope: !781, file: !2, discriminator: 2)
!801 = !DILocation(line: 51, column: 3, scope: !800)
!802 = distinct !{!802, !803}
!803 = !DILocation(line: 51, column: 3, scope: !1)
!804 = !DILocation(line: 55, column: 1, scope: !1)
!805 = !DILocalVariable(name: "m", arg: 1, scope: !12, file: !2, line: 58, type: !5)
!806 = !DILocation(line: 58, column: 22, scope: !12)
!807 = !DILocalVariable(name: "matrix_dim", arg: 2, scope: !12, file: !2, line: 58, type: !7)
!808 = !DILocation(line: 58, column: 29, scope: !12)
!809 = !DILocalVariable(name: "offset", arg: 3, scope: !12, file: !2, line: 58, type: !7)
!810 = !DILocation(line: 58, column: 45, scope: !12)
!811 = !DILocalVariable(name: "i", scope: !12, file: !2, line: 64, type: !7)
!812 = !DILocation(line: 64, column: 7, scope: !12)
!813 = !DILocalVariable(name: "j", scope: !12, file: !2, line: 64, type: !7)
!814 = !DILocation(line: 64, column: 9, scope: !12)
!815 = !DILocalVariable(name: "array_offset", scope: !12, file: !2, line: 64, type: !7)
!816 = !DILocation(line: 64, column: 12, scope: !12)
!817 = !DILocalVariable(name: "idx", scope: !12, file: !2, line: 65, type: !7)
!818 = !DILocation(line: 65, column: 7, scope: !12)
!819 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !820)
!820 = distinct !DILocation(line: 67, column: 7, scope: !821)
!821 = distinct !DILexicalBlock(scope: !12, file: !2, line: 67, column: 7)
!822 = !DILocation(line: 67, column: 19, scope: !821)
!823 = !DILocation(line: 67, column: 7, scope: !12)
!824 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !825)
!825 = distinct !DILocation(line: 68, column: 11, scope: !826)
!826 = distinct !DILexicalBlock(scope: !821, file: !2, line: 67, column: 33)
!827 = !DILocation(line: 68, column: 9, scope: !826)
!828 = !DILocation(line: 70, column: 20, scope: !826)
!829 = !DILocation(line: 70, column: 27, scope: !826)
!830 = !DILocation(line: 70, column: 26, scope: !826)
!831 = !DILocation(line: 70, column: 38, scope: !826)
!832 = !DILocation(line: 70, column: 37, scope: !826)
!833 = !DILocation(line: 70, column: 18, scope: !826)
!834 = !DILocation(line: 71, column: 11, scope: !835)
!835 = distinct !DILexicalBlock(scope: !826, file: !2, line: 71, column: 5)
!836 = !DILocation(line: 71, column: 10, scope: !835)
!837 = !DILocation(line: 71, column: 15, scope: !838)
!838 = !DILexicalBlockFile(scope: !839, file: !2, discriminator: 1)
!839 = distinct !DILexicalBlock(scope: !835, file: !2, line: 71, column: 5)
!840 = !DILocation(line: 71, column: 17, scope: !838)
!841 = !DILocation(line: 71, column: 5, scope: !838)
!842 = !DILocation(line: 72, column: 19, scope: !843)
!843 = distinct !DILexicalBlock(scope: !839, file: !2, line: 71, column: 37)
!844 = !DILocation(line: 72, column: 21, scope: !843)
!845 = !DILocation(line: 72, column: 34, scope: !843)
!846 = !DILocation(line: 72, column: 33, scope: !843)
!847 = !DILocation(line: 72, column: 11, scope: !843)
!848 = !DILocation(line: 72, column: 7, scope: !843)
!849 = !DILocation(line: 72, column: 14, scope: !843)
!850 = !DILocation(line: 72, column: 18, scope: !843)
!851 = !DILocation(line: 73, column: 23, scope: !843)
!852 = !DILocation(line: 73, column: 20, scope: !843)
!853 = !DILocation(line: 74, column: 5, scope: !843)
!854 = !DILocation(line: 71, column: 34, scope: !855)
!855 = !DILexicalBlockFile(scope: !839, file: !2, discriminator: 2)
!856 = !DILocation(line: 71, column: 5, scope: !855)
!857 = distinct !{!857, !858}
!858 = !DILocation(line: 71, column: 5, scope: !826)
!859 = !DILocation(line: 76, column: 20, scope: !826)
!860 = !DILocation(line: 76, column: 27, scope: !826)
!861 = !DILocation(line: 76, column: 26, scope: !826)
!862 = !DILocation(line: 76, column: 38, scope: !826)
!863 = !DILocation(line: 76, column: 37, scope: !826)
!864 = !DILocation(line: 76, column: 18, scope: !826)
!865 = !DILocation(line: 77, column: 11, scope: !866)
!866 = distinct !DILexicalBlock(scope: !826, file: !2, line: 77, column: 5)
!867 = !DILocation(line: 77, column: 10, scope: !866)
!868 = !DILocation(line: 77, column: 15, scope: !869)
!869 = !DILexicalBlockFile(scope: !870, file: !2, discriminator: 1)
!870 = distinct !DILexicalBlock(scope: !866, file: !2, line: 77, column: 5)
!871 = !DILocation(line: 77, column: 17, scope: !869)
!872 = !DILocation(line: 77, column: 5, scope: !869)
!873 = !DILocation(line: 78, column: 24, scope: !874)
!874 = distinct !DILexicalBlock(scope: !870, file: !2, line: 77, column: 36)
!875 = !DILocation(line: 78, column: 26, scope: !874)
!876 = !DILocation(line: 78, column: 3, scope: !877, inlinedAt: !903)
!877 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !878, file: !619, line: 78, type: !623, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !880, variables: !9)
!878 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !619, line: 77, size: 8, align: 8, elements: !879, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!879 = !{!880, !881, !882, !883, !888, !892, !896, !899}
!880 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !878, file: !619, line: 78, type: !623, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!881 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !878, file: !619, line: 79, type: !623, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!882 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !878, file: !619, line: 80, type: !623, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !878, file: !619, line: 83, type: !884, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!884 = !DISubroutineType(types: !885)
!885 = !{!630, !886}
!886 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !887, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!887 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !878)
!888 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !878, file: !619, line: 85, type: !889, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!889 = !DISubroutineType(types: !890)
!890 = !{null, !891}
!891 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !878, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!892 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !878, file: !619, line: 85, type: !893, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!893 = !DISubroutineType(types: !894)
!894 = !{null, !891, !895}
!895 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !887, size: 64, align: 64)
!896 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !878, file: !619, line: 85, type: !897, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!897 = !DISubroutineType(types: !898)
!898 = !{null, !886, !895}
!899 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !878, file: !619, line: 85, type: !900, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!900 = !DISubroutineType(types: !901)
!901 = !{!902, !886}
!902 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !878, size: 64, align: 64)
!903 = distinct !DILocation(line: 78, column: 40, scope: !874)
!904 = !{i32 0, i32 65535}
!905 = !DILocation(line: 78, column: 50, scope: !874)
!906 = !DILocation(line: 78, column: 53, scope: !874)
!907 = !DILocation(line: 78, column: 38, scope: !874)
!908 = !DILocation(line: 78, column: 65, scope: !874)
!909 = !DILocation(line: 78, column: 64, scope: !874)
!910 = !DILocation(line: 78, column: 16, scope: !874)
!911 = !DILocation(line: 78, column: 7, scope: !874)
!912 = !DILocation(line: 78, column: 19, scope: !874)
!913 = !DILocation(line: 78, column: 23, scope: !874)
!914 = !DILocation(line: 79, column: 23, scope: !874)
!915 = !DILocation(line: 79, column: 20, scope: !874)
!916 = !DILocation(line: 80, column: 5, scope: !874)
!917 = !DILocation(line: 77, column: 32, scope: !918)
!918 = !DILexicalBlockFile(scope: !870, file: !2, discriminator: 2)
!919 = !DILocation(line: 77, column: 5, scope: !918)
!920 = distinct !{!920, !921}
!921 = !DILocation(line: 77, column: 5, scope: !826)
!922 = !DILocation(line: 82, column: 3, scope: !826)
!923 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !924)
!924 = distinct !DILocation(line: 83, column: 11, scope: !925)
!925 = distinct !DILexicalBlock(scope: !821, file: !2, line: 82, column: 10)
!926 = !DILocation(line: 83, column: 22, scope: !925)
!927 = !DILocation(line: 83, column: 9, scope: !925)
!928 = !DILocation(line: 85, column: 21, scope: !925)
!929 = !DILocation(line: 85, column: 27, scope: !925)
!930 = !DILocation(line: 85, column: 42, scope: !925)
!931 = !DILocation(line: 85, column: 41, scope: !925)
!932 = !DILocation(line: 85, column: 53, scope: !925)
!933 = !DILocation(line: 85, column: 52, scope: !925)
!934 = !DILocation(line: 85, column: 18, scope: !925)
!935 = !DILocation(line: 86, column: 11, scope: !936)
!936 = distinct !DILexicalBlock(scope: !925, file: !2, line: 86, column: 5)
!937 = !DILocation(line: 86, column: 10, scope: !936)
!938 = !DILocation(line: 86, column: 26, scope: !939)
!939 = !DILexicalBlockFile(scope: !940, file: !2, discriminator: 1)
!940 = distinct !DILexicalBlock(scope: !936, file: !2, line: 86, column: 5)
!941 = !DILocation(line: 86, column: 28, scope: !939)
!942 = !DILocation(line: 86, column: 5, scope: !939)
!943 = !DILocation(line: 87, column: 19, scope: !944)
!944 = distinct !DILexicalBlock(scope: !940, file: !2, line: 86, column: 46)
!945 = !DILocation(line: 87, column: 21, scope: !944)
!946 = !DILocation(line: 87, column: 34, scope: !944)
!947 = !DILocation(line: 87, column: 33, scope: !944)
!948 = !DILocation(line: 87, column: 11, scope: !944)
!949 = !DILocation(line: 87, column: 7, scope: !944)
!950 = !DILocation(line: 87, column: 14, scope: !944)
!951 = !DILocation(line: 87, column: 18, scope: !944)
!952 = !DILocation(line: 88, column: 23, scope: !944)
!953 = !DILocation(line: 88, column: 20, scope: !944)
!954 = !DILocation(line: 89, column: 5, scope: !944)
!955 = !DILocation(line: 86, column: 43, scope: !956)
!956 = !DILexicalBlockFile(scope: !940, file: !2, discriminator: 2)
!957 = !DILocation(line: 86, column: 5, scope: !956)
!958 = distinct !{!958, !959}
!959 = !DILocation(line: 86, column: 5, scope: !925)
!960 = !DILocation(line: 91, column: 21, scope: !925)
!961 = !DILocation(line: 78, column: 3, scope: !877, inlinedAt: !962)
!962 = distinct !DILocation(line: 91, column: 29, scope: !925)
!963 = !DILocation(line: 91, column: 39, scope: !925)
!964 = !DILocation(line: 91, column: 42, scope: !925)
!965 = !DILocation(line: 91, column: 27, scope: !925)
!966 = !DILocation(line: 91, column: 55, scope: !925)
!967 = !DILocation(line: 91, column: 54, scope: !925)
!968 = !DILocation(line: 91, column: 66, scope: !925)
!969 = !DILocation(line: 91, column: 65, scope: !925)
!970 = !DILocation(line: 91, column: 18, scope: !925)
!971 = !DILocation(line: 92, column: 11, scope: !972)
!972 = distinct !DILexicalBlock(scope: !925, file: !2, line: 92, column: 5)
!973 = !DILocation(line: 92, column: 10, scope: !972)
!974 = !DILocation(line: 92, column: 15, scope: !975)
!975 = !DILexicalBlockFile(scope: !976, file: !2, discriminator: 1)
!976 = distinct !DILexicalBlock(scope: !972, file: !2, line: 92, column: 5)
!977 = !DILocation(line: 92, column: 17, scope: !975)
!978 = !DILocation(line: 92, column: 5, scope: !975)
!979 = !DILocation(line: 93, column: 26, scope: !980)
!980 = distinct !DILexicalBlock(scope: !976, file: !2, line: 92, column: 36)
!981 = !DILocation(line: 93, column: 28, scope: !980)
!982 = !DILocation(line: 93, column: 41, scope: !980)
!983 = !DILocation(line: 93, column: 40, scope: !980)
!984 = !DILocation(line: 93, column: 16, scope: !980)
!985 = !DILocation(line: 93, column: 7, scope: !980)
!986 = !DILocation(line: 93, column: 19, scope: !980)
!987 = !DILocation(line: 93, column: 24, scope: !980)
!988 = !DILocation(line: 94, column: 23, scope: !980)
!989 = !DILocation(line: 94, column: 20, scope: !980)
!990 = !DILocation(line: 95, column: 5, scope: !980)
!991 = !DILocation(line: 92, column: 32, scope: !992)
!992 = !DILexicalBlockFile(scope: !976, file: !2, discriminator: 2)
!993 = !DILocation(line: 92, column: 5, scope: !992)
!994 = distinct !{!994, !995}
!995 = !DILocation(line: 92, column: 5, scope: !925)
!996 = !DILocation(line: 98, column: 3, scope: !12)
!997 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !998)
!998 = distinct !DILocation(line: 132, column: 7, scope: !999)
!999 = distinct !DILexicalBlock(scope: !12, file: !2, line: 132, column: 7)
!1000 = !DILocation(line: 132, column: 19, scope: !999)
!1001 = !DILocation(line: 132, column: 7, scope: !12)
!1002 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1003)
!1003 = distinct !DILocation(line: 133, column: 9, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !999, file: !2, line: 132, column: 33)
!1005 = !DILocation(line: 133, column: 8, scope: !1004)
!1006 = !DILocation(line: 134, column: 10, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1004, file: !2, line: 134, column: 5)
!1008 = !DILocation(line: 134, column: 9, scope: !1007)
!1009 = !DILocation(line: 134, column: 14, scope: !1010)
!1010 = !DILexicalBlockFile(scope: !1011, file: !2, discriminator: 1)
!1011 = distinct !DILexicalBlock(scope: !1007, file: !2, line: 134, column: 5)
!1012 = !DILocation(line: 134, column: 16, scope: !1010)
!1013 = !DILocation(line: 134, column: 5, scope: !1010)
!1014 = !DILocation(line: 135, column: 13, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1016, file: !2, line: 135, column: 7)
!1016 = distinct !DILexicalBlock(scope: !1011, file: !2, line: 134, column: 34)
!1017 = !DILocation(line: 135, column: 12, scope: !1015)
!1018 = !DILocation(line: 135, column: 17, scope: !1019)
!1019 = !DILexicalBlockFile(scope: !1020, file: !2, discriminator: 1)
!1020 = distinct !DILexicalBlock(scope: !1015, file: !2, line: 135, column: 7)
!1021 = !DILocation(line: 135, column: 21, scope: !1019)
!1022 = !DILocation(line: 135, column: 19, scope: !1019)
!1023 = !DILocation(line: 135, column: 7, scope: !1019)
!1024 = !DILocation(line: 136, column: 31, scope: !1020)
!1025 = !DILocation(line: 136, column: 27, scope: !1020)
!1026 = !DILocation(line: 136, column: 34, scope: !1020)
!1027 = !DILocation(line: 136, column: 46, scope: !1020)
!1028 = !DILocation(line: 136, column: 37, scope: !1020)
!1029 = !DILocation(line: 136, column: 49, scope: !1020)
!1030 = !DILocation(line: 136, column: 36, scope: !1020)
!1031 = !DILocation(line: 136, column: 18, scope: !1020)
!1032 = !DILocation(line: 136, column: 9, scope: !1020)
!1033 = !DILocation(line: 136, column: 21, scope: !1020)
!1034 = !DILocation(line: 136, column: 25, scope: !1020)
!1035 = !DILocation(line: 135, column: 25, scope: !1036)
!1036 = !DILexicalBlockFile(scope: !1020, file: !2, discriminator: 2)
!1037 = !DILocation(line: 135, column: 7, scope: !1036)
!1038 = distinct !{!1038, !1039}
!1039 = !DILocation(line: 135, column: 7, scope: !1016)
!1040 = !DILocation(line: 137, column: 5, scope: !1016)
!1041 = !DILocation(line: 134, column: 31, scope: !1042)
!1042 = !DILexicalBlockFile(scope: !1011, file: !2, discriminator: 2)
!1043 = !DILocation(line: 134, column: 5, scope: !1042)
!1044 = distinct !{!1044, !1045}
!1045 = !DILocation(line: 134, column: 5, scope: !1004)
!1046 = !DILocation(line: 138, column: 3, scope: !1004)
!1047 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1048)
!1048 = distinct !DILocation(line: 139, column: 9, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !999, file: !2, line: 138, column: 10)
!1050 = !DILocation(line: 139, column: 21, scope: !1049)
!1051 = !DILocation(line: 139, column: 8, scope: !1049)
!1052 = !DILocation(line: 140, column: 10, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1049, file: !2, line: 140, column: 5)
!1054 = !DILocation(line: 140, column: 9, scope: !1053)
!1055 = !DILocation(line: 140, column: 14, scope: !1056)
!1056 = !DILexicalBlockFile(scope: !1057, file: !2, discriminator: 1)
!1057 = distinct !DILexicalBlock(scope: !1053, file: !2, line: 140, column: 5)
!1058 = !DILocation(line: 140, column: 16, scope: !1056)
!1059 = !DILocation(line: 140, column: 5, scope: !1056)
!1060 = !DILocation(line: 141, column: 12, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1062, file: !2, line: 141, column: 7)
!1062 = distinct !DILexicalBlock(scope: !1057, file: !2, line: 140, column: 34)
!1063 = !DILocation(line: 141, column: 11, scope: !1061)
!1064 = !DILocation(line: 141, column: 16, scope: !1065)
!1065 = !DILexicalBlockFile(scope: !1066, file: !2, discriminator: 1)
!1066 = distinct !DILexicalBlock(scope: !1061, file: !2, line: 141, column: 7)
!1067 = !DILocation(line: 141, column: 20, scope: !1065)
!1068 = !DILocation(line: 141, column: 18, scope: !1065)
!1069 = !DILocation(line: 141, column: 7, scope: !1065)
!1070 = !DILocation(line: 142, column: 36, scope: !1066)
!1071 = !DILocation(line: 142, column: 27, scope: !1066)
!1072 = !DILocation(line: 142, column: 41, scope: !1066)
!1073 = !DILocation(line: 142, column: 48, scope: !1066)
!1074 = !DILocation(line: 142, column: 44, scope: !1066)
!1075 = !DILocation(line: 142, column: 51, scope: !1066)
!1076 = !DILocation(line: 142, column: 43, scope: !1066)
!1077 = !DILocation(line: 142, column: 18, scope: !1066)
!1078 = !DILocation(line: 142, column: 9, scope: !1066)
!1079 = !DILocation(line: 142, column: 23, scope: !1066)
!1080 = !DILocation(line: 142, column: 25, scope: !1066)
!1081 = !DILocation(line: 141, column: 24, scope: !1082)
!1082 = !DILexicalBlockFile(scope: !1066, file: !2, discriminator: 2)
!1083 = !DILocation(line: 141, column: 7, scope: !1082)
!1084 = distinct !{!1084, !1085}
!1085 = !DILocation(line: 141, column: 7, scope: !1062)
!1086 = !DILocation(line: 143, column: 31, scope: !1062)
!1087 = !DILocation(line: 143, column: 27, scope: !1062)
!1088 = !DILocation(line: 143, column: 34, scope: !1062)
!1089 = !DILocation(line: 143, column: 16, scope: !1062)
!1090 = !DILocation(line: 143, column: 7, scope: !1062)
!1091 = !DILocation(line: 143, column: 21, scope: !1062)
!1092 = !DILocation(line: 143, column: 24, scope: !1062)
!1093 = !DILocation(line: 144, column: 5, scope: !1062)
!1094 = !DILocation(line: 140, column: 31, scope: !1095)
!1095 = !DILexicalBlockFile(scope: !1057, file: !2, discriminator: 2)
!1096 = !DILocation(line: 140, column: 5, scope: !1095)
!1097 = distinct !{!1097, !1098}
!1098 = !DILocation(line: 140, column: 5, scope: !1049)
!1099 = !DILocation(line: 147, column: 3, scope: !12)
!1100 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1101)
!1101 = distinct !DILocation(line: 149, column: 7, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !12, file: !2, line: 149, column: 7)
!1103 = !DILocation(line: 149, column: 19, scope: !1102)
!1104 = !DILocation(line: 149, column: 7, scope: !12)
!1105 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1106)
!1106 = distinct !DILocation(line: 150, column: 9, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1102, file: !2, line: 149, column: 33)
!1108 = !DILocation(line: 150, column: 8, scope: !1107)
!1109 = !DILocation(line: 151, column: 21, scope: !1107)
!1110 = !DILocation(line: 151, column: 27, scope: !1107)
!1111 = !DILocation(line: 151, column: 31, scope: !1107)
!1112 = !DILocation(line: 151, column: 30, scope: !1107)
!1113 = !DILocation(line: 151, column: 42, scope: !1107)
!1114 = !DILocation(line: 151, column: 41, scope: !1107)
!1115 = !DILocation(line: 151, column: 18, scope: !1107)
!1116 = !DILocation(line: 152, column: 10, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1107, file: !2, line: 152, column: 5)
!1118 = !DILocation(line: 152, column: 9, scope: !1117)
!1119 = !DILocation(line: 152, column: 14, scope: !1120)
!1120 = !DILexicalBlockFile(scope: !1121, file: !2, discriminator: 1)
!1121 = distinct !DILexicalBlock(scope: !1117, file: !2, line: 152, column: 5)
!1122 = !DILocation(line: 152, column: 16, scope: !1120)
!1123 = !DILocation(line: 152, column: 5, scope: !1120)
!1124 = !DILocation(line: 153, column: 64, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1121, file: !2, line: 152, column: 34)
!1126 = !DILocation(line: 153, column: 55, scope: !1125)
!1127 = !DILocation(line: 153, column: 67, scope: !1125)
!1128 = !DILocation(line: 153, column: 7, scope: !1125)
!1129 = !DILocation(line: 153, column: 9, scope: !1125)
!1130 = !DILocation(line: 78, column: 3, scope: !877, inlinedAt: !1131)
!1131 = distinct !DILocation(line: 153, column: 23, scope: !1125)
!1132 = !DILocation(line: 153, column: 33, scope: !1125)
!1133 = !DILocation(line: 153, column: 36, scope: !1125)
!1134 = !DILocation(line: 153, column: 21, scope: !1125)
!1135 = !DILocation(line: 153, column: 48, scope: !1125)
!1136 = !DILocation(line: 153, column: 47, scope: !1125)
!1137 = !DILocation(line: 153, column: 53, scope: !1125)
!1138 = !DILocation(line: 154, column: 23, scope: !1125)
!1139 = !DILocation(line: 154, column: 20, scope: !1125)
!1140 = !DILocation(line: 155, column: 5, scope: !1125)
!1141 = !DILocation(line: 152, column: 31, scope: !1142)
!1142 = !DILexicalBlockFile(scope: !1121, file: !2, discriminator: 2)
!1143 = !DILocation(line: 152, column: 5, scope: !1142)
!1144 = distinct !{!1144, !1145}
!1145 = !DILocation(line: 152, column: 5, scope: !1107)
!1146 = !DILocation(line: 156, column: 3, scope: !1107)
!1147 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1148)
!1148 = distinct !DILocation(line: 157, column: 9, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1102, file: !2, line: 156, column: 10)
!1150 = !DILocation(line: 157, column: 21, scope: !1149)
!1151 = !DILocation(line: 157, column: 8, scope: !1149)
!1152 = !DILocation(line: 158, column: 21, scope: !1149)
!1153 = !DILocation(line: 78, column: 3, scope: !877, inlinedAt: !1154)
!1154 = distinct !DILocation(line: 158, column: 29, scope: !1149)
!1155 = !DILocation(line: 158, column: 39, scope: !1149)
!1156 = !DILocation(line: 158, column: 42, scope: !1149)
!1157 = !DILocation(line: 158, column: 27, scope: !1149)
!1158 = !DILocation(line: 158, column: 55, scope: !1149)
!1159 = !DILocation(line: 158, column: 54, scope: !1149)
!1160 = !DILocation(line: 158, column: 66, scope: !1149)
!1161 = !DILocation(line: 158, column: 65, scope: !1149)
!1162 = !DILocation(line: 158, column: 18, scope: !1149)
!1163 = !DILocation(line: 159, column: 10, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1149, file: !2, line: 159, column: 5)
!1165 = !DILocation(line: 159, column: 9, scope: !1164)
!1166 = !DILocation(line: 159, column: 14, scope: !1167)
!1167 = !DILexicalBlockFile(scope: !1168, file: !2, discriminator: 1)
!1168 = distinct !DILexicalBlock(scope: !1164, file: !2, line: 159, column: 5)
!1169 = !DILocation(line: 159, column: 16, scope: !1167)
!1170 = !DILocation(line: 159, column: 5, scope: !1167)
!1171 = !DILocation(line: 160, column: 39, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1168, file: !2, line: 159, column: 34)
!1173 = !DILocation(line: 160, column: 30, scope: !1172)
!1174 = !DILocation(line: 160, column: 42, scope: !1172)
!1175 = !DILocation(line: 160, column: 7, scope: !1172)
!1176 = !DILocation(line: 160, column: 9, scope: !1172)
!1177 = !DILocation(line: 160, column: 22, scope: !1172)
!1178 = !DILocation(line: 160, column: 21, scope: !1172)
!1179 = !DILocation(line: 160, column: 27, scope: !1172)
!1180 = !DILocation(line: 161, column: 23, scope: !1172)
!1181 = !DILocation(line: 161, column: 20, scope: !1172)
!1182 = !DILocation(line: 162, column: 5, scope: !1172)
!1183 = !DILocation(line: 159, column: 31, scope: !1184)
!1184 = !DILexicalBlockFile(scope: !1168, file: !2, discriminator: 2)
!1185 = !DILocation(line: 159, column: 5, scope: !1184)
!1186 = distinct !{!1186, !1187}
!1187 = !DILocation(line: 159, column: 5, scope: !1149)
!1188 = !DILocation(line: 165, column: 1, scope: !12)
!1189 = !DILocalVariable(name: "m", arg: 1, scope: !19, file: !2, line: 168, type: !5)
!1190 = !DILocation(line: 168, column: 21, scope: !19)
!1191 = !DILocalVariable(name: "matrix_dim", arg: 2, scope: !19, file: !2, line: 168, type: !7)
!1192 = !DILocation(line: 168, column: 28, scope: !19)
!1193 = !DILocalVariable(name: "offset", arg: 3, scope: !19, file: !2, line: 168, type: !7)
!1194 = !DILocation(line: 168, column: 44, scope: !19)
!1195 = !DILocalVariable(name: "i", scope: !19, file: !2, line: 173, type: !7)
!1196 = !DILocation(line: 173, column: 7, scope: !19)
!1197 = !DILocalVariable(name: "sum", scope: !19, file: !2, line: 174, type: !6)
!1198 = !DILocation(line: 174, column: 9, scope: !19)
!1199 = !DILocalVariable(name: "global_row_id", scope: !19, file: !2, line: 176, type: !7)
!1200 = !DILocation(line: 176, column: 7, scope: !19)
!1201 = !DILocation(line: 176, column: 23, scope: !19)
!1202 = !DILocation(line: 79, column: 3, scope: !1203, inlinedAt: !1204)
!1203 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !878, file: !619, line: 79, type: !623, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !881, variables: !9)
!1204 = distinct !DILocation(line: 176, column: 33, scope: !19)
!1205 = !DILocation(line: 176, column: 43, scope: !19)
!1206 = !DILocation(line: 176, column: 46, scope: !19)
!1207 = !DILocation(line: 176, column: 30, scope: !19)
!1208 = !DILocalVariable(name: "global_col_id", scope: !19, file: !2, line: 177, type: !7)
!1209 = !DILocation(line: 177, column: 7, scope: !19)
!1210 = !DILocation(line: 177, column: 23, scope: !19)
!1211 = !DILocation(line: 78, column: 3, scope: !877, inlinedAt: !1212)
!1212 = distinct !DILocation(line: 177, column: 33, scope: !19)
!1213 = !DILocation(line: 177, column: 43, scope: !19)
!1214 = !DILocation(line: 177, column: 46, scope: !19)
!1215 = !DILocation(line: 177, column: 30, scope: !19)
!1216 = !DILocation(line: 179, column: 40, scope: !19)
!1217 = !DILocation(line: 179, column: 43, scope: !19)
!1218 = !DILocation(line: 68, column: 3, scope: !1219, inlinedAt: !1220)
!1219 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !620, file: !619, line: 68, type: !623, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !625, variables: !9)
!1220 = distinct !DILocation(line: 179, column: 50, scope: !19)
!1221 = !DILocation(line: 179, column: 49, scope: !19)
!1222 = !DILocation(line: 179, column: 63, scope: !19)
!1223 = !DILocation(line: 179, column: 62, scope: !19)
!1224 = !DILocation(line: 179, column: 74, scope: !19)
!1225 = !DILocation(line: 179, column: 73, scope: !19)
!1226 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1227)
!1227 = distinct !DILocation(line: 179, column: 88, scope: !1228)
!1228 = !DILexicalBlockFile(scope: !19, file: !2, discriminator: 1)
!1229 = !DILocation(line: 179, column: 87, scope: !19)
!1230 = !DILocation(line: 68, column: 3, scope: !1219, inlinedAt: !1231)
!1231 = distinct !DILocation(line: 179, column: 12, scope: !1232)
!1232 = !DILexicalBlockFile(scope: !19, file: !2, discriminator: 2)
!1233 = !DILocation(line: 179, column: 3, scope: !19)
!1234 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1235)
!1235 = distinct !DILocation(line: 179, column: 25, scope: !1236)
!1236 = !DILexicalBlockFile(scope: !19, file: !2, discriminator: 3)
!1237 = !DILocation(line: 179, column: 38, scope: !19)
!1238 = !DILocation(line: 180, column: 40, scope: !19)
!1239 = !DILocation(line: 180, column: 43, scope: !19)
!1240 = !DILocation(line: 68, column: 3, scope: !1219, inlinedAt: !1241)
!1241 = distinct !DILocation(line: 180, column: 57, scope: !19)
!1242 = !DILocation(line: 180, column: 56, scope: !19)
!1243 = !DILocation(line: 180, column: 70, scope: !19)
!1244 = !DILocation(line: 180, column: 69, scope: !19)
!1245 = !DILocation(line: 180, column: 81, scope: !19)
!1246 = !DILocation(line: 180, column: 80, scope: !19)
!1247 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1248)
!1248 = distinct !DILocation(line: 180, column: 88, scope: !1228)
!1249 = !DILocation(line: 180, column: 87, scope: !19)
!1250 = !DILocation(line: 68, column: 3, scope: !1219, inlinedAt: !1251)
!1251 = distinct !DILocation(line: 180, column: 12, scope: !1232)
!1252 = !DILocation(line: 180, column: 3, scope: !19)
!1253 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1254)
!1254 = distinct !DILocation(line: 180, column: 25, scope: !1236)
!1255 = !DILocation(line: 180, column: 38, scope: !19)
!1256 = !DILocation(line: 182, column: 3, scope: !19)
!1257 = !DILocation(line: 184, column: 7, scope: !19)
!1258 = !DILocation(line: 185, column: 9, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !19, file: !2, line: 185, column: 3)
!1260 = !DILocation(line: 185, column: 8, scope: !1259)
!1261 = !DILocation(line: 185, column: 13, scope: !1262)
!1262 = !DILexicalBlockFile(scope: !1263, file: !2, discriminator: 1)
!1263 = distinct !DILexicalBlock(scope: !1259, file: !2, line: 185, column: 3)
!1264 = !DILocation(line: 185, column: 15, scope: !1262)
!1265 = !DILocation(line: 185, column: 3, scope: !1262)
!1266 = !DILocation(line: 68, column: 3, scope: !1219, inlinedAt: !1267)
!1267 = distinct !DILocation(line: 186, column: 21, scope: !1263)
!1268 = !DILocation(line: 186, column: 12, scope: !1263)
!1269 = !DILocation(line: 186, column: 34, scope: !1263)
!1270 = !DILocation(line: 186, column: 48, scope: !1263)
!1271 = !DILocation(line: 186, column: 39, scope: !1263)
!1272 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1273)
!1273 = distinct !DILocation(line: 186, column: 51, scope: !1262)
!1274 = !DILocation(line: 186, column: 37, scope: !1263)
!1275 = !DILocation(line: 186, column: 9, scope: !1263)
!1276 = !DILocation(line: 186, column: 5, scope: !1263)
!1277 = !DILocation(line: 185, column: 30, scope: !1278)
!1278 = !DILexicalBlockFile(scope: !1263, file: !2, discriminator: 2)
!1279 = !DILocation(line: 185, column: 3, scope: !1278)
!1280 = distinct !{!1280, !1281}
!1281 = !DILocation(line: 185, column: 3, scope: !19)
!1282 = !DILocation(line: 187, column: 74, scope: !19)
!1283 = !DILocation(line: 187, column: 3, scope: !19)
!1284 = !DILocation(line: 187, column: 6, scope: !19)
!1285 = !DILocation(line: 68, column: 3, scope: !1219, inlinedAt: !1286)
!1286 = distinct !DILocation(line: 187, column: 20, scope: !19)
!1287 = !DILocation(line: 187, column: 19, scope: !19)
!1288 = !DILocation(line: 187, column: 33, scope: !19)
!1289 = !DILocation(line: 187, column: 32, scope: !19)
!1290 = !DILocation(line: 187, column: 44, scope: !19)
!1291 = !DILocation(line: 187, column: 43, scope: !19)
!1292 = !DILocation(line: 67, column: 3, scope: !618, inlinedAt: !1293)
!1293 = distinct !DILocation(line: 187, column: 58, scope: !1228)
!1294 = !DILocation(line: 187, column: 57, scope: !19)
!1295 = !DILocation(line: 187, column: 71, scope: !19)
!1296 = !DILocation(line: 190, column: 1, scope: !19)
