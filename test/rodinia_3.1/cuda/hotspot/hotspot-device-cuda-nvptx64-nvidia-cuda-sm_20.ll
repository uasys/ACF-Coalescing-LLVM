; ModuleID = 'hotspot.cu'
source_filename = "hotspot.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !0
@_ZZ14calculate_tempiPfS_S_iiiiffffffE13power_on_cuda = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !11
@_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !15
@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent nounwind
define void @_Z14calculate_tempiPfS_S_iiiiffffff(i32 %iteration, float* %power, float* %temp_src, float* %temp_dst, i32 %grid_cols, i32 %grid_rows, i32 %border_cols, i32 %border_rows, float %Cap, float %Rx, float %Ry, float %Rz, float %step, float %time_elapsed) #0 !dbg !1 {
entry:
  %iteration.addr = alloca i32, align 4
  %power.addr = alloca float*, align 8
  %temp_src.addr = alloca float*, align 8
  %temp_dst.addr = alloca float*, align 8
  %grid_cols.addr = alloca i32, align 4
  %grid_rows.addr = alloca i32, align 4
  %border_cols.addr = alloca i32, align 4
  %border_rows.addr = alloca i32, align 4
  %Cap.addr = alloca float, align 4
  %Rx.addr = alloca float, align 4
  %Ry.addr = alloca float, align 4
  %Rz.addr = alloca float, align 4
  %step.addr = alloca float, align 4
  %time_elapsed.addr = alloca float, align 4
  %amb_temp = alloca float, align 4
  %step_div_Cap = alloca float, align 4
  %Rx_1 = alloca float, align 4
  %Ry_1 = alloca float, align 4
  %Rz_1 = alloca float, align 4
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %small_block_rows = alloca i32, align 4
  %small_block_cols = alloca i32, align 4
  %blkY = alloca i32, align 4
  %blkX = alloca i32, align 4
  %blkYmax = alloca i32, align 4
  %blkXmax = alloca i32, align 4
  %yidx = alloca i32, align 4
  %xidx = alloca i32, align 4
  %loadYidx = alloca i32, align 4
  %loadXidx = alloca i32, align 4
  %index = alloca i32, align 4
  %validYmin = alloca i32, align 4
  %validYmax = alloca i32, align 4
  %validXmin = alloca i32, align 4
  %validXmax = alloca i32, align 4
  %N = alloca i32, align 4
  %S = alloca i32, align 4
  %W = alloca i32, align 4
  %E = alloca i32, align 4
  %computed = alloca i8, align 1
  %i = alloca i32, align 4
  store i32 %iteration, i32* %iteration.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %iteration.addr, metadata !581, metadata !582), !dbg !583
  store float* %power, float** %power.addr, align 8
  call void @llvm.dbg.declare(metadata float** %power.addr, metadata !584, metadata !582), !dbg !585
  store float* %temp_src, float** %temp_src.addr, align 8
  call void @llvm.dbg.declare(metadata float** %temp_src.addr, metadata !586, metadata !582), !dbg !587
  store float* %temp_dst, float** %temp_dst.addr, align 8
  call void @llvm.dbg.declare(metadata float** %temp_dst.addr, metadata !588, metadata !582), !dbg !589
  store i32 %grid_cols, i32* %grid_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_cols.addr, metadata !590, metadata !582), !dbg !591
  store i32 %grid_rows, i32* %grid_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_rows.addr, metadata !592, metadata !582), !dbg !593
  store i32 %border_cols, i32* %border_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %border_cols.addr, metadata !594, metadata !582), !dbg !595
  store i32 %border_rows, i32* %border_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %border_rows.addr, metadata !596, metadata !582), !dbg !597
  store float %Cap, float* %Cap.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Cap.addr, metadata !598, metadata !582), !dbg !599
  store float %Rx, float* %Rx.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rx.addr, metadata !600, metadata !582), !dbg !601
  store float %Ry, float* %Ry.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Ry.addr, metadata !602, metadata !582), !dbg !603
  store float %Rz, float* %Rz.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rz.addr, metadata !604, metadata !582), !dbg !605
  store float %step, float* %step.addr, align 4
  call void @llvm.dbg.declare(metadata float* %step.addr, metadata !606, metadata !582), !dbg !607
  store float %time_elapsed, float* %time_elapsed.addr, align 4
  call void @llvm.dbg.declare(metadata float* %time_elapsed.addr, metadata !608, metadata !582), !dbg !609
  call void @llvm.dbg.declare(metadata float* %amb_temp, metadata !610, metadata !582), !dbg !611
  store float 8.000000e+01, float* %amb_temp, align 4, !dbg !611
  call void @llvm.dbg.declare(metadata float* %step_div_Cap, metadata !612, metadata !582), !dbg !613
  call void @llvm.dbg.declare(metadata float* %Rx_1, metadata !614, metadata !582), !dbg !615
  call void @llvm.dbg.declare(metadata float* %Ry_1, metadata !616, metadata !582), !dbg !617
  call void @llvm.dbg.declare(metadata float* %Rz_1, metadata !618, metadata !582), !dbg !619
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !620, metadata !582), !dbg !621
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !622, !range !659
  store i32 %0, i32* %bx, align 4, !dbg !621
  call void @llvm.dbg.declare(metadata i32* %by, metadata !660, metadata !582), !dbg !661
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !662, !range !659
  store i32 %1, i32* %by, align 4, !dbg !661
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !665, metadata !582), !dbg !666
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !667, !range !695
  store i32 %2, i32* %tx, align 4, !dbg !666
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !696, metadata !582), !dbg !697
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !698, !range !695
  store i32 %3, i32* %ty, align 4, !dbg !697
  %4 = load float, float* %step.addr, align 4, !dbg !701
  %5 = load float, float* %Cap.addr, align 4, !dbg !702
  %div = fdiv float %4, %5, !dbg !703
  store float %div, float* %step_div_Cap, align 4, !dbg !704
  %6 = load float, float* %Rx.addr, align 4, !dbg !705
  %div4 = fdiv float 1.000000e+00, %6, !dbg !706
  store float %div4, float* %Rx_1, align 4, !dbg !707
  %7 = load float, float* %Ry.addr, align 4, !dbg !708
  %div5 = fdiv float 1.000000e+00, %7, !dbg !709
  store float %div5, float* %Ry_1, align 4, !dbg !710
  %8 = load float, float* %Rz.addr, align 4, !dbg !711
  %div6 = fdiv float 1.000000e+00, %8, !dbg !712
  store float %div6, float* %Rz_1, align 4, !dbg !713
  call void @llvm.dbg.declare(metadata i32* %small_block_rows, metadata !714, metadata !582), !dbg !715
  %9 = load i32, i32* %iteration.addr, align 4, !dbg !716
  %mul = mul nsw i32 %9, 2, !dbg !717
  %sub = sub nsw i32 16, %mul, !dbg !718
  store i32 %sub, i32* %small_block_rows, align 4, !dbg !715
  call void @llvm.dbg.declare(metadata i32* %small_block_cols, metadata !719, metadata !582), !dbg !720
  %10 = load i32, i32* %iteration.addr, align 4, !dbg !721
  %mul7 = mul nsw i32 %10, 2, !dbg !722
  %sub8 = sub nsw i32 16, %mul7, !dbg !723
  store i32 %sub8, i32* %small_block_cols, align 4, !dbg !720
  call void @llvm.dbg.declare(metadata i32* %blkY, metadata !724, metadata !582), !dbg !725
  %11 = load i32, i32* %small_block_rows, align 4, !dbg !726
  %12 = load i32, i32* %by, align 4, !dbg !727
  %mul9 = mul nsw i32 %11, %12, !dbg !728
  %13 = load i32, i32* %border_rows.addr, align 4, !dbg !729
  %sub10 = sub nsw i32 %mul9, %13, !dbg !730
  store i32 %sub10, i32* %blkY, align 4, !dbg !725
  call void @llvm.dbg.declare(metadata i32* %blkX, metadata !731, metadata !582), !dbg !732
  %14 = load i32, i32* %small_block_cols, align 4, !dbg !733
  %15 = load i32, i32* %bx, align 4, !dbg !734
  %mul11 = mul nsw i32 %14, %15, !dbg !735
  %16 = load i32, i32* %border_cols.addr, align 4, !dbg !736
  %sub12 = sub nsw i32 %mul11, %16, !dbg !737
  store i32 %sub12, i32* %blkX, align 4, !dbg !732
  call void @llvm.dbg.declare(metadata i32* %blkYmax, metadata !738, metadata !582), !dbg !739
  %17 = load i32, i32* %blkY, align 4, !dbg !740
  %add = add nsw i32 %17, 16, !dbg !741
  %sub13 = sub nsw i32 %add, 1, !dbg !742
  store i32 %sub13, i32* %blkYmax, align 4, !dbg !739
  call void @llvm.dbg.declare(metadata i32* %blkXmax, metadata !743, metadata !582), !dbg !744
  %18 = load i32, i32* %blkX, align 4, !dbg !745
  %add14 = add nsw i32 %18, 16, !dbg !746
  %sub15 = sub nsw i32 %add14, 1, !dbg !747
  store i32 %sub15, i32* %blkXmax, align 4, !dbg !744
  call void @llvm.dbg.declare(metadata i32* %yidx, metadata !748, metadata !582), !dbg !749
  %19 = load i32, i32* %blkY, align 4, !dbg !750
  %20 = load i32, i32* %ty, align 4, !dbg !751
  %add16 = add nsw i32 %19, %20, !dbg !752
  store i32 %add16, i32* %yidx, align 4, !dbg !749
  call void @llvm.dbg.declare(metadata i32* %xidx, metadata !753, metadata !582), !dbg !754
  %21 = load i32, i32* %blkX, align 4, !dbg !755
  %22 = load i32, i32* %tx, align 4, !dbg !756
  %add17 = add nsw i32 %21, %22, !dbg !757
  store i32 %add17, i32* %xidx, align 4, !dbg !754
  call void @llvm.dbg.declare(metadata i32* %loadYidx, metadata !758, metadata !582), !dbg !759
  %23 = load i32, i32* %yidx, align 4, !dbg !760
  store i32 %23, i32* %loadYidx, align 4, !dbg !759
  call void @llvm.dbg.declare(metadata i32* %loadXidx, metadata !761, metadata !582), !dbg !762
  %24 = load i32, i32* %xidx, align 4, !dbg !763
  store i32 %24, i32* %loadXidx, align 4, !dbg !762
  call void @llvm.dbg.declare(metadata i32* %index, metadata !764, metadata !582), !dbg !765
  %25 = load i32, i32* %grid_cols.addr, align 4, !dbg !766
  %26 = load i32, i32* %loadYidx, align 4, !dbg !767
  %mul18 = mul nsw i32 %25, %26, !dbg !768
  %27 = load i32, i32* %loadXidx, align 4, !dbg !769
  %add19 = add nsw i32 %mul18, %27, !dbg !770
  store i32 %add19, i32* %index, align 4, !dbg !765
  %28 = load i32, i32* %loadYidx, align 4, !dbg !771
  %cmp = icmp sge i32 %28, 0, !dbg !771
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !771

land.lhs.true:                                    ; preds = %entry
  %29 = load i32, i32* %loadYidx, align 4, !dbg !773
  %30 = load i32, i32* %grid_rows.addr, align 4, !dbg !773
  %sub20 = sub nsw i32 %30, 1, !dbg !773
  %cmp21 = icmp sle i32 %29, %sub20, !dbg !773
  br i1 %cmp21, label %land.lhs.true22, label %if.end, !dbg !775

land.lhs.true22:                                  ; preds = %land.lhs.true
  %31 = load i32, i32* %loadXidx, align 4, !dbg !776
  %cmp23 = icmp sge i32 %31, 0, !dbg !776
  br i1 %cmp23, label %land.lhs.true24, label %if.end, !dbg !776

land.lhs.true24:                                  ; preds = %land.lhs.true22
  %32 = load i32, i32* %loadXidx, align 4, !dbg !778
  %33 = load i32, i32* %grid_cols.addr, align 4, !dbg !778
  %sub25 = sub nsw i32 %33, 1, !dbg !778
  %cmp26 = icmp sle i32 %32, %sub25, !dbg !778
  br i1 %cmp26, label %if.then, label %if.end, !dbg !780

if.then:                                          ; preds = %land.lhs.true24
  %34 = load float*, float** %temp_src.addr, align 8, !dbg !781
  %35 = load i32, i32* %index, align 4, !dbg !783
  %idxprom = sext i32 %35 to i64, !dbg !781
  %arrayidx = getelementptr inbounds float, float* %34, i64 %idxprom, !dbg !781
  %36 = load float, float* %arrayidx, align 4, !dbg !781
  %37 = load i32, i32* %ty, align 4, !dbg !784
  %idxprom27 = sext i32 %37 to i64, !dbg !785
  %arrayidx28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom27, !dbg !785
  %38 = load i32, i32* %tx, align 4, !dbg !786
  %idxprom29 = sext i32 %38 to i64, !dbg !785
  %arrayidx30 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx28, i64 0, i64 %idxprom29, !dbg !785
  store float %36, float* %arrayidx30, align 4, !dbg !787
  %39 = load float*, float** %power.addr, align 8, !dbg !788
  %40 = load i32, i32* %index, align 4, !dbg !789
  %idxprom31 = sext i32 %40 to i64, !dbg !788
  %arrayidx32 = getelementptr inbounds float, float* %39, i64 %idxprom31, !dbg !788
  %41 = load float, float* %arrayidx32, align 4, !dbg !788
  %42 = load i32, i32* %ty, align 4, !dbg !790
  %idxprom33 = sext i32 %42 to i64, !dbg !791
  %arrayidx34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE13power_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom33, !dbg !791
  %43 = load i32, i32* %tx, align 4, !dbg !792
  %idxprom35 = sext i32 %43 to i64, !dbg !791
  %arrayidx36 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx34, i64 0, i64 %idxprom35, !dbg !791
  store float %41, float* %arrayidx36, align 4, !dbg !793
  br label %if.end, !dbg !794

if.end:                                           ; preds = %if.then, %land.lhs.true24, %land.lhs.true22, %land.lhs.true, %entry
  call void @llvm.nvvm.barrier0(), !dbg !795
  call void @llvm.dbg.declare(metadata i32* %validYmin, metadata !796, metadata !582), !dbg !797
  %44 = load i32, i32* %blkY, align 4, !dbg !798
  %cmp37 = icmp slt i32 %44, 0, !dbg !799
  br i1 %cmp37, label %cond.true, label %cond.false, !dbg !800

cond.true:                                        ; preds = %if.end
  %45 = load i32, i32* %blkY, align 4, !dbg !801
  %sub38 = sub nsw i32 0, %45, !dbg !803
  br label %cond.end, !dbg !804

cond.false:                                       ; preds = %if.end
  br label %cond.end, !dbg !805

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub38, %cond.true ], [ 0, %cond.false ], !dbg !807
  store i32 %cond, i32* %validYmin, align 4, !dbg !809
  call void @llvm.dbg.declare(metadata i32* %validYmax, metadata !810, metadata !582), !dbg !811
  %46 = load i32, i32* %blkYmax, align 4, !dbg !812
  %47 = load i32, i32* %grid_rows.addr, align 4, !dbg !813
  %sub39 = sub nsw i32 %47, 1, !dbg !814
  %cmp40 = icmp sgt i32 %46, %sub39, !dbg !815
  br i1 %cmp40, label %cond.true41, label %cond.false45, !dbg !816

cond.true41:                                      ; preds = %cond.end
  %48 = load i32, i32* %blkYmax, align 4, !dbg !817
  %49 = load i32, i32* %grid_rows.addr, align 4, !dbg !818
  %sub42 = sub nsw i32 %48, %49, !dbg !819
  %add43 = add nsw i32 %sub42, 1, !dbg !820
  %sub44 = sub nsw i32 15, %add43, !dbg !821
  br label %cond.end46, !dbg !822

cond.false45:                                     ; preds = %cond.end
  br label %cond.end46, !dbg !823

cond.end46:                                       ; preds = %cond.false45, %cond.true41
  %cond47 = phi i32 [ %sub44, %cond.true41 ], [ 15, %cond.false45 ], !dbg !824
  store i32 %cond47, i32* %validYmax, align 4, !dbg !825
  call void @llvm.dbg.declare(metadata i32* %validXmin, metadata !826, metadata !582), !dbg !827
  %50 = load i32, i32* %blkX, align 4, !dbg !828
  %cmp48 = icmp slt i32 %50, 0, !dbg !829
  br i1 %cmp48, label %cond.true49, label %cond.false51, !dbg !830

cond.true49:                                      ; preds = %cond.end46
  %51 = load i32, i32* %blkX, align 4, !dbg !831
  %sub50 = sub nsw i32 0, %51, !dbg !832
  br label %cond.end52, !dbg !833

cond.false51:                                     ; preds = %cond.end46
  br label %cond.end52, !dbg !834

cond.end52:                                       ; preds = %cond.false51, %cond.true49
  %cond53 = phi i32 [ %sub50, %cond.true49 ], [ 0, %cond.false51 ], !dbg !835
  store i32 %cond53, i32* %validXmin, align 4, !dbg !836
  call void @llvm.dbg.declare(metadata i32* %validXmax, metadata !837, metadata !582), !dbg !838
  %52 = load i32, i32* %blkXmax, align 4, !dbg !839
  %53 = load i32, i32* %grid_cols.addr, align 4, !dbg !840
  %sub54 = sub nsw i32 %53, 1, !dbg !841
  %cmp55 = icmp sgt i32 %52, %sub54, !dbg !842
  br i1 %cmp55, label %cond.true56, label %cond.false60, !dbg !843

cond.true56:                                      ; preds = %cond.end52
  %54 = load i32, i32* %blkXmax, align 4, !dbg !844
  %55 = load i32, i32* %grid_cols.addr, align 4, !dbg !845
  %sub57 = sub nsw i32 %54, %55, !dbg !846
  %add58 = add nsw i32 %sub57, 1, !dbg !847
  %sub59 = sub nsw i32 15, %add58, !dbg !848
  br label %cond.end61, !dbg !849

cond.false60:                                     ; preds = %cond.end52
  br label %cond.end61, !dbg !850

cond.end61:                                       ; preds = %cond.false60, %cond.true56
  %cond62 = phi i32 [ %sub59, %cond.true56 ], [ 15, %cond.false60 ], !dbg !851
  store i32 %cond62, i32* %validXmax, align 4, !dbg !852
  call void @llvm.dbg.declare(metadata i32* %N, metadata !853, metadata !582), !dbg !854
  %56 = load i32, i32* %ty, align 4, !dbg !855
  %sub63 = sub nsw i32 %56, 1, !dbg !856
  store i32 %sub63, i32* %N, align 4, !dbg !854
  call void @llvm.dbg.declare(metadata i32* %S, metadata !857, metadata !582), !dbg !858
  %57 = load i32, i32* %ty, align 4, !dbg !859
  %add64 = add nsw i32 %57, 1, !dbg !860
  store i32 %add64, i32* %S, align 4, !dbg !858
  call void @llvm.dbg.declare(metadata i32* %W, metadata !861, metadata !582), !dbg !862
  %58 = load i32, i32* %tx, align 4, !dbg !863
  %sub65 = sub nsw i32 %58, 1, !dbg !864
  store i32 %sub65, i32* %W, align 4, !dbg !862
  call void @llvm.dbg.declare(metadata i32* %E, metadata !865, metadata !582), !dbg !866
  %59 = load i32, i32* %tx, align 4, !dbg !867
  %add66 = add nsw i32 %59, 1, !dbg !868
  store i32 %add66, i32* %E, align 4, !dbg !866
  %60 = load i32, i32* %N, align 4, !dbg !869
  %61 = load i32, i32* %validYmin, align 4, !dbg !870
  %cmp67 = icmp slt i32 %60, %61, !dbg !871
  br i1 %cmp67, label %cond.true68, label %cond.false69, !dbg !872

cond.true68:                                      ; preds = %cond.end61
  %62 = load i32, i32* %validYmin, align 4, !dbg !873
  br label %cond.end70, !dbg !874

cond.false69:                                     ; preds = %cond.end61
  %63 = load i32, i32* %N, align 4, !dbg !875
  br label %cond.end70, !dbg !876

cond.end70:                                       ; preds = %cond.false69, %cond.true68
  %cond71 = phi i32 [ %62, %cond.true68 ], [ %63, %cond.false69 ], !dbg !877
  store i32 %cond71, i32* %N, align 4, !dbg !878
  %64 = load i32, i32* %S, align 4, !dbg !879
  %65 = load i32, i32* %validYmax, align 4, !dbg !880
  %cmp72 = icmp sgt i32 %64, %65, !dbg !881
  br i1 %cmp72, label %cond.true73, label %cond.false74, !dbg !882

cond.true73:                                      ; preds = %cond.end70
  %66 = load i32, i32* %validYmax, align 4, !dbg !883
  br label %cond.end75, !dbg !884

cond.false74:                                     ; preds = %cond.end70
  %67 = load i32, i32* %S, align 4, !dbg !885
  br label %cond.end75, !dbg !886

cond.end75:                                       ; preds = %cond.false74, %cond.true73
  %cond76 = phi i32 [ %66, %cond.true73 ], [ %67, %cond.false74 ], !dbg !887
  store i32 %cond76, i32* %S, align 4, !dbg !888
  %68 = load i32, i32* %W, align 4, !dbg !889
  %69 = load i32, i32* %validXmin, align 4, !dbg !890
  %cmp77 = icmp slt i32 %68, %69, !dbg !891
  br i1 %cmp77, label %cond.true78, label %cond.false79, !dbg !892

cond.true78:                                      ; preds = %cond.end75
  %70 = load i32, i32* %validXmin, align 4, !dbg !893
  br label %cond.end80, !dbg !894

cond.false79:                                     ; preds = %cond.end75
  %71 = load i32, i32* %W, align 4, !dbg !895
  br label %cond.end80, !dbg !896

cond.end80:                                       ; preds = %cond.false79, %cond.true78
  %cond81 = phi i32 [ %70, %cond.true78 ], [ %71, %cond.false79 ], !dbg !897
  store i32 %cond81, i32* %W, align 4, !dbg !898
  %72 = load i32, i32* %E, align 4, !dbg !899
  %73 = load i32, i32* %validXmax, align 4, !dbg !900
  %cmp82 = icmp sgt i32 %72, %73, !dbg !901
  br i1 %cmp82, label %cond.true83, label %cond.false84, !dbg !902

cond.true83:                                      ; preds = %cond.end80
  %74 = load i32, i32* %validXmax, align 4, !dbg !903
  br label %cond.end85, !dbg !904

cond.false84:                                     ; preds = %cond.end80
  %75 = load i32, i32* %E, align 4, !dbg !905
  br label %cond.end85, !dbg !906

cond.end85:                                       ; preds = %cond.false84, %cond.true83
  %cond86 = phi i32 [ %74, %cond.true83 ], [ %75, %cond.false84 ], !dbg !907
  store i32 %cond86, i32* %E, align 4, !dbg !908
  call void @llvm.dbg.declare(metadata i8* %computed, metadata !909, metadata !582), !dbg !910
  call void @llvm.dbg.declare(metadata i32* %i, metadata !911, metadata !582), !dbg !913
  store i32 0, i32* %i, align 4, !dbg !913
  br label %for.cond, !dbg !914

for.cond:                                         ; preds = %for.inc, %cond.end85
  %76 = load i32, i32* %i, align 4, !dbg !915
  %77 = load i32, i32* %iteration.addr, align 4, !dbg !918
  %cmp87 = icmp slt i32 %76, %77, !dbg !919
  br i1 %cmp87, label %for.body, label %for.end, !dbg !920

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %computed, align 1, !dbg !921
  %78 = load i32, i32* %tx, align 4, !dbg !923
  %79 = load i32, i32* %i, align 4, !dbg !923
  %add88 = add nsw i32 %79, 1, !dbg !923
  %cmp89 = icmp sge i32 %78, %add88, !dbg !923
  br i1 %cmp89, label %land.lhs.true90, label %if.end175, !dbg !923

land.lhs.true90:                                  ; preds = %for.body
  %80 = load i32, i32* %tx, align 4, !dbg !925
  %81 = load i32, i32* %i, align 4, !dbg !925
  %sub91 = sub nsw i32 16, %81, !dbg !925
  %sub92 = sub nsw i32 %sub91, 2, !dbg !925
  %cmp93 = icmp sle i32 %80, %sub92, !dbg !925
  br i1 %cmp93, label %land.lhs.true94, label %if.end175, !dbg !927

land.lhs.true94:                                  ; preds = %land.lhs.true90
  %82 = load i32, i32* %ty, align 4, !dbg !928
  %83 = load i32, i32* %i, align 4, !dbg !928
  %add95 = add nsw i32 %83, 1, !dbg !928
  %cmp96 = icmp sge i32 %82, %add95, !dbg !928
  br i1 %cmp96, label %land.lhs.true97, label %if.end175, !dbg !928

land.lhs.true97:                                  ; preds = %land.lhs.true94
  %84 = load i32, i32* %ty, align 4, !dbg !929
  %85 = load i32, i32* %i, align 4, !dbg !929
  %sub98 = sub nsw i32 16, %85, !dbg !929
  %sub99 = sub nsw i32 %sub98, 2, !dbg !929
  %cmp100 = icmp sle i32 %84, %sub99, !dbg !929
  br i1 %cmp100, label %land.lhs.true101, label %if.end175, !dbg !930

land.lhs.true101:                                 ; preds = %land.lhs.true97
  %86 = load i32, i32* %tx, align 4, !dbg !931
  %87 = load i32, i32* %validXmin, align 4, !dbg !931
  %cmp102 = icmp sge i32 %86, %87, !dbg !931
  br i1 %cmp102, label %land.lhs.true103, label %if.end175, !dbg !931

land.lhs.true103:                                 ; preds = %land.lhs.true101
  %88 = load i32, i32* %tx, align 4, !dbg !932
  %89 = load i32, i32* %validXmax, align 4, !dbg !932
  %cmp104 = icmp sle i32 %88, %89, !dbg !932
  br i1 %cmp104, label %land.lhs.true105, label %if.end175, !dbg !933

land.lhs.true105:                                 ; preds = %land.lhs.true103
  %90 = load i32, i32* %ty, align 4, !dbg !934
  %91 = load i32, i32* %validYmin, align 4, !dbg !934
  %cmp106 = icmp sge i32 %90, %91, !dbg !934
  br i1 %cmp106, label %land.lhs.true107, label %if.end175, !dbg !934

land.lhs.true107:                                 ; preds = %land.lhs.true105
  %92 = load i32, i32* %ty, align 4, !dbg !935
  %93 = load i32, i32* %validYmax, align 4, !dbg !935
  %cmp108 = icmp sle i32 %92, %93, !dbg !935
  br i1 %cmp108, label %if.then109, label %if.end175, !dbg !936

if.then109:                                       ; preds = %land.lhs.true107
  store i8 1, i8* %computed, align 1, !dbg !938
  %94 = load i32, i32* %ty, align 4, !dbg !940
  %idxprom110 = sext i32 %94 to i64, !dbg !941
  %arrayidx111 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom110, !dbg !941
  %95 = load i32, i32* %tx, align 4, !dbg !942
  %idxprom112 = sext i32 %95 to i64, !dbg !941
  %arrayidx113 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx111, i64 0, i64 %idxprom112, !dbg !941
  %96 = load float, float* %arrayidx113, align 4, !dbg !941
  %conv = fpext float %96 to double, !dbg !941
  %97 = load float, float* %step_div_Cap, align 4, !dbg !943
  %conv114 = fpext float %97 to double, !dbg !943
  %98 = load i32, i32* %ty, align 4, !dbg !944
  %idxprom115 = sext i32 %98 to i64, !dbg !945
  %arrayidx116 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE13power_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom115, !dbg !945
  %99 = load i32, i32* %tx, align 4, !dbg !946
  %idxprom117 = sext i32 %99 to i64, !dbg !945
  %arrayidx118 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx116, i64 0, i64 %idxprom117, !dbg !945
  %100 = load float, float* %arrayidx118, align 4, !dbg !945
  %conv119 = fpext float %100 to double, !dbg !945
  %101 = load i32, i32* %S, align 4, !dbg !947
  %idxprom120 = sext i32 %101 to i64, !dbg !948
  %arrayidx121 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom120, !dbg !948
  %102 = load i32, i32* %tx, align 4, !dbg !949
  %idxprom122 = sext i32 %102 to i64, !dbg !948
  %arrayidx123 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx121, i64 0, i64 %idxprom122, !dbg !948
  %103 = load float, float* %arrayidx123, align 4, !dbg !948
  %104 = load i32, i32* %N, align 4, !dbg !950
  %idxprom124 = sext i32 %104 to i64, !dbg !951
  %arrayidx125 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom124, !dbg !951
  %105 = load i32, i32* %tx, align 4, !dbg !952
  %idxprom126 = sext i32 %105 to i64, !dbg !951
  %arrayidx127 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx125, i64 0, i64 %idxprom126, !dbg !951
  %106 = load float, float* %arrayidx127, align 4, !dbg !951
  %add128 = fadd float %103, %106, !dbg !953
  %conv129 = fpext float %add128 to double, !dbg !948
  %107 = load i32, i32* %ty, align 4, !dbg !954
  %idxprom130 = sext i32 %107 to i64, !dbg !955
  %arrayidx131 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom130, !dbg !955
  %108 = load i32, i32* %tx, align 4, !dbg !956
  %idxprom132 = sext i32 %108 to i64, !dbg !955
  %arrayidx133 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx131, i64 0, i64 %idxprom132, !dbg !955
  %109 = load float, float* %arrayidx133, align 4, !dbg !955
  %conv134 = fpext float %109 to double, !dbg !955
  %mul135 = fmul double 2.000000e+00, %conv134, !dbg !957
  %sub136 = fsub double %conv129, %mul135, !dbg !958
  %110 = load float, float* %Ry_1, align 4, !dbg !959
  %conv137 = fpext float %110 to double, !dbg !959
  %mul138 = fmul double %sub136, %conv137, !dbg !960
  %add139 = fadd double %conv119, %mul138, !dbg !961
  %111 = load i32, i32* %ty, align 4, !dbg !962
  %idxprom140 = sext i32 %111 to i64, !dbg !963
  %arrayidx141 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom140, !dbg !963
  %112 = load i32, i32* %E, align 4, !dbg !964
  %idxprom142 = sext i32 %112 to i64, !dbg !963
  %arrayidx143 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx141, i64 0, i64 %idxprom142, !dbg !963
  %113 = load float, float* %arrayidx143, align 4, !dbg !963
  %114 = load i32, i32* %ty, align 4, !dbg !965
  %idxprom144 = sext i32 %114 to i64, !dbg !966
  %arrayidx145 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom144, !dbg !966
  %115 = load i32, i32* %W, align 4, !dbg !967
  %idxprom146 = sext i32 %115 to i64, !dbg !966
  %arrayidx147 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx145, i64 0, i64 %idxprom146, !dbg !966
  %116 = load float, float* %arrayidx147, align 4, !dbg !966
  %add148 = fadd float %113, %116, !dbg !968
  %conv149 = fpext float %add148 to double, !dbg !963
  %117 = load i32, i32* %ty, align 4, !dbg !969
  %idxprom150 = sext i32 %117 to i64, !dbg !970
  %arrayidx151 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom150, !dbg !970
  %118 = load i32, i32* %tx, align 4, !dbg !971
  %idxprom152 = sext i32 %118 to i64, !dbg !970
  %arrayidx153 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx151, i64 0, i64 %idxprom152, !dbg !970
  %119 = load float, float* %arrayidx153, align 4, !dbg !970
  %conv154 = fpext float %119 to double, !dbg !970
  %mul155 = fmul double 2.000000e+00, %conv154, !dbg !972
  %sub156 = fsub double %conv149, %mul155, !dbg !973
  %120 = load float, float* %Rx_1, align 4, !dbg !974
  %conv157 = fpext float %120 to double, !dbg !974
  %mul158 = fmul double %sub156, %conv157, !dbg !975
  %add159 = fadd double %add139, %mul158, !dbg !976
  %121 = load float, float* %amb_temp, align 4, !dbg !977
  %122 = load i32, i32* %ty, align 4, !dbg !978
  %idxprom160 = sext i32 %122 to i64, !dbg !979
  %arrayidx161 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom160, !dbg !979
  %123 = load i32, i32* %tx, align 4, !dbg !980
  %idxprom162 = sext i32 %123 to i64, !dbg !979
  %arrayidx163 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx161, i64 0, i64 %idxprom162, !dbg !979
  %124 = load float, float* %arrayidx163, align 4, !dbg !979
  %sub164 = fsub float %121, %124, !dbg !981
  %125 = load float, float* %Rz_1, align 4, !dbg !982
  %mul165 = fmul float %sub164, %125, !dbg !983
  %conv166 = fpext float %mul165 to double, !dbg !984
  %add167 = fadd double %add159, %conv166, !dbg !985
  %mul168 = fmul double %conv114, %add167, !dbg !986
  %add169 = fadd double %conv, %mul168, !dbg !987
  %conv170 = fptrunc double %add169 to float, !dbg !941
  %126 = load i32, i32* %ty, align 4, !dbg !988
  %idxprom171 = sext i32 %126 to i64, !dbg !989
  %arrayidx172 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t to [16 x [16 x float]]*), i64 0, i64 %idxprom171, !dbg !989
  %127 = load i32, i32* %tx, align 4, !dbg !990
  %idxprom173 = sext i32 %127 to i64, !dbg !989
  %arrayidx174 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx172, i64 0, i64 %idxprom173, !dbg !989
  store float %conv170, float* %arrayidx174, align 4, !dbg !991
  br label %if.end175, !dbg !992

if.end175:                                        ; preds = %if.then109, %land.lhs.true107, %land.lhs.true105, %land.lhs.true103, %land.lhs.true101, %land.lhs.true97, %land.lhs.true94, %land.lhs.true90, %for.body
  call void @llvm.nvvm.barrier0(), !dbg !993
  %128 = load i32, i32* %i, align 4, !dbg !994
  %129 = load i32, i32* %iteration.addr, align 4, !dbg !996
  %sub176 = sub nsw i32 %129, 1, !dbg !997
  %cmp177 = icmp eq i32 %128, %sub176, !dbg !998
  br i1 %cmp177, label %if.then178, label %if.end179, !dbg !999

if.then178:                                       ; preds = %if.end175
  br label %for.end, !dbg !1000

if.end179:                                        ; preds = %if.end175
  %130 = load i8, i8* %computed, align 1, !dbg !1001
  %tobool = trunc i8 %130 to i1, !dbg !1001
  br i1 %tobool, label %if.then180, label %if.end189, !dbg !1003

if.then180:                                       ; preds = %if.end179
  %131 = load i32, i32* %ty, align 4, !dbg !1004
  %idxprom181 = sext i32 %131 to i64, !dbg !1005
  %arrayidx182 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t to [16 x [16 x float]]*), i64 0, i64 %idxprom181, !dbg !1005
  %132 = load i32, i32* %tx, align 4, !dbg !1006
  %idxprom183 = sext i32 %132 to i64, !dbg !1005
  %arrayidx184 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx182, i64 0, i64 %idxprom183, !dbg !1005
  %133 = load float, float* %arrayidx184, align 4, !dbg !1005
  %134 = load i32, i32* %ty, align 4, !dbg !1007
  %idxprom185 = sext i32 %134 to i64, !dbg !1008
  %arrayidx186 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom185, !dbg !1008
  %135 = load i32, i32* %tx, align 4, !dbg !1009
  %idxprom187 = sext i32 %135 to i64, !dbg !1008
  %arrayidx188 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx186, i64 0, i64 %idxprom187, !dbg !1008
  store float %133, float* %arrayidx188, align 4, !dbg !1010
  br label %if.end189, !dbg !1008

if.end189:                                        ; preds = %if.then180, %if.end179
  call void @llvm.nvvm.barrier0(), !dbg !1011
  br label %for.inc, !dbg !1012

for.inc:                                          ; preds = %if.end189
  %136 = load i32, i32* %i, align 4, !dbg !1013
  %inc = add nsw i32 %136, 1, !dbg !1013
  store i32 %inc, i32* %i, align 4, !dbg !1013
  br label %for.cond, !dbg !1015, !llvm.loop !1016

for.end:                                          ; preds = %if.then178, %for.cond
  %137 = load i8, i8* %computed, align 1, !dbg !1018
  %tobool190 = trunc i8 %137 to i1, !dbg !1018
  br i1 %tobool190, label %if.then191, label %if.end198, !dbg !1020

if.then191:                                       ; preds = %for.end
  %138 = load i32, i32* %ty, align 4, !dbg !1021
  %idxprom192 = sext i32 %138 to i64, !dbg !1023
  %arrayidx193 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t to [16 x [16 x float]]*), i64 0, i64 %idxprom192, !dbg !1023
  %139 = load i32, i32* %tx, align 4, !dbg !1024
  %idxprom194 = sext i32 %139 to i64, !dbg !1023
  %arrayidx195 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx193, i64 0, i64 %idxprom194, !dbg !1023
  %140 = load float, float* %arrayidx195, align 4, !dbg !1023
  %141 = load float*, float** %temp_dst.addr, align 8, !dbg !1025
  %142 = load i32, i32* %index, align 4, !dbg !1026
  %idxprom196 = sext i32 %142 to i64, !dbg !1025
  %arrayidx197 = getelementptr inbounds float, float* %141, i64 %idxprom196, !dbg !1025
  store float %140, float* %arrayidx197, align 4, !dbg !1027
  br label %if.end198, !dbg !1028

if.end198:                                        ; preds = %if.then191, %for.end
  ret void, !dbg !1029
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!8}
!nvvm.annotations = !{!571, !572, !573, !572, !574, !574, !574, !574, !575, !575, !574}
!llvm.module.flags = !{!576, !577, !578}
!llvm.ident = !{!579}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!580}

!0 = distinct !DIGlobalVariable(name: "temp_on_cuda", scope: !1, file: !2, line: 119, type: !12, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "calculate_temp", linkageName: "_Z14calculate_tempiPfS_S_iiiiffffff", scope: !2, file: !2, line: 104, type: !3, isLocal: false, isDefinition: true, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !9)
!2 = !DIFile(filename: "hotspot.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !6, !6, !6, !5, !5, !5, !5, !7, !7, !7, !7, !7, !7}
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!8 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, imports: !16)
!9 = !{}
!10 = !{!0, !11, !15}
!11 = distinct !DIGlobalVariable(name: "power_on_cuda", scope: !1, file: !2, line: 120, type: !12, isLocal: true, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8192, align: 32, elements: !13)
!13 = !{!14, !14}
!14 = !DISubrange(count: 16)
!15 = distinct !DIGlobalVariable(name: "temp_t", scope: !1, file: !2, line: 121, type: !12, isLocal: true, isDefinition: true)
!16 = !{!17, !24, !28, !30, !32, !34, !36, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !72, !74, !76, !78, !82, !87, !89, !91, !96, !100, !102, !104, !106, !108, !110, !112, !114, !116, !121, !125, !127, !129, !133, !135, !137, !139, !141, !143, !147, !149, !151, !155, !163, !167, !169, !171, !175, !177, !179, !183, !185, !187, !191, !193, !195, !197, !199, !201, !203, !205, !207, !209, !214, !216, !218, !222, !224, !226, !228, !230, !232, !234, !236, !240, !244, !246, !248, !253, !255, !257, !259, !261, !263, !265, !269, !275, !279, !283, !288, !290, !294, !298, !312, !316, !320, !324, !328, !333, !335, !339, !343, !347, !355, !359, !363, !367, !371, !376, !382, !386, !390, !392, !400, !404, !412, !414, !416, !420, !424, !428, !433, !437, !442, !443, !444, !445, !448, !449, !450, !451, !452, !453, !454, !457, !459, !461, !463, !465, !467, !469, !471, !474, !476, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !542, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569}
!17 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !20, line: 189)
!18 = !DINamespace(name: "std", scope: null, file: !19, line: 188)
!19 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!20 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !19, file: !19, line: 44, type: !21, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!21 = !DISubroutineType(types: !22)
!22 = !{!23, !23}
!23 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !25, line: 190)
!25 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !19, file: !19, line: 46, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DISubroutineType(types: !27)
!27 = !{!7, !7}
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
!39 = !{!7, !7, !7}
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
!71 = !{!7, !7, !7, !7}
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !73, line: 211)
!73 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !19, file: !19, line: 88, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !75, line: 212)
!75 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !19, file: !19, line: 90, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !77, line: 213)
!77 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !19, file: !19, line: 92, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !79, line: 214)
!79 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !19, file: !19, line: 94, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DISubroutineType(types: !81)
!81 = !{!5, !7}
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !83, line: 215)
!83 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !19, file: !19, line: 96, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !88, line: 216)
!88 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !19, file: !19, line: 98, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !90, line: 217)
!90 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !19, file: !19, line: 100, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !92, line: 218)
!92 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !19, file: !19, line: 102, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !7}
!95 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !97, line: 219)
!97 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !19, file: !19, line: 106, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!95, !7, !7}
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !101, line: 220)
!101 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !19, file: !19, line: 105, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !103, line: 221)
!103 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !19, file: !19, line: 108, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !105, line: 222)
!105 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !19, file: !19, line: 112, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !107, line: 223)
!107 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !19, file: !19, line: 111, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !109, line: 224)
!109 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !19, file: !19, line: 114, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !111, line: 225)
!111 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !19, file: !19, line: 116, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !113, line: 226)
!113 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !19, file: !19, line: 118, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !115, line: 227)
!115 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !19, file: !19, line: 120, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !117, line: 228)
!117 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !19, file: !19, line: 121, type: !118, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!120, !120}
!120 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !122, line: 229)
!122 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !19, file: !19, line: 123, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{!7, !7, !5}
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !126, line: 230)
!126 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !19, file: !19, line: 125, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !128, line: 231)
!128 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !19, file: !19, line: 126, type: !21, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !130, line: 232)
!130 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !19, file: !19, line: 128, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!23, !7}
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !134, line: 233)
!134 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !19, file: !19, line: 138, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !136, line: 234)
!136 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !19, file: !19, line: 130, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !138, line: 235)
!138 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !19, file: !19, line: 132, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !140, line: 236)
!140 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !19, file: !19, line: 134, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !142, line: 237)
!142 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !19, file: !19, line: 136, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !144, line: 238)
!144 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !19, file: !19, line: 140, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DISubroutineType(types: !146)
!146 = !{!120, !7}
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !148, line: 239)
!148 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !19, file: !19, line: 142, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !150, line: 240)
!150 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !19, file: !19, line: 143, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !152, line: 241)
!152 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !19, file: !19, line: 145, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!7, !7, !6}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !156, line: 242)
!156 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !19, file: !19, line: 146, type: !157, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!159, !160}
!159 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64, align: 64)
!161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !162)
!162 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !164, line: 243)
!164 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !19, file: !19, line: 147, type: !165, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DISubroutineType(types: !166)
!166 = !{!7, !160}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !168, line: 244)
!168 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !19, file: !19, line: 149, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !170, line: 245)
!170 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !19, file: !19, line: 151, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !172, line: 246)
!172 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !19, file: !19, line: 153, type: !173, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{!7, !7, !159}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !176, line: 247)
!176 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !19, file: !19, line: 158, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !178, line: 248)
!178 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !19, file: !19, line: 160, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !180, line: 249)
!180 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !19, file: !19, line: 162, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!7, !7, !7, !86}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !184, line: 250)
!184 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !19, file: !19, line: 164, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !186, line: 251)
!186 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !19, file: !19, line: 166, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !188, line: 252)
!188 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !19, file: !19, line: 168, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!7, !7, !120}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !192, line: 253)
!192 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !19, file: !19, line: 170, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !194, line: 254)
!194 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !19, file: !19, line: 172, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !196, line: 255)
!196 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !19, file: !19, line: 174, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !198, line: 256)
!198 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !19, file: !19, line: 176, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !200, line: 257)
!200 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !19, file: !19, line: 178, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !202, line: 258)
!202 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !19, file: !19, line: 180, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !204, line: 259)
!204 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !19, file: !19, line: 182, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !206, line: 260)
!206 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !19, file: !19, line: 184, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !208, line: 261)
!208 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !19, file: !19, line: 186, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !210, line: 102)
!210 = !DISubprogram(name: "acos", scope: !211, file: !211, line: 54, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!212 = !DISubroutineType(types: !213)
!213 = !{!159, !159}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !215, line: 121)
!215 = !DISubprogram(name: "asin", scope: !211, file: !211, line: 56, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !217, line: 140)
!217 = !DISubprogram(name: "atan", scope: !211, file: !211, line: 58, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !219, line: 159)
!219 = !DISubprogram(name: "atan2", scope: !211, file: !211, line: 60, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DISubroutineType(types: !221)
!221 = !{!159, !159, !159}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !223, line: 180)
!223 = !DISubprogram(name: "ceil", scope: !211, file: !211, line: 178, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !225, line: 199)
!225 = !DISubprogram(name: "cos", scope: !211, file: !211, line: 63, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !227, line: 218)
!227 = !DISubprogram(name: "cosh", scope: !211, file: !211, line: 72, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !229, line: 237)
!229 = !DISubprogram(name: "exp", scope: !211, file: !211, line: 100, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !231, line: 256)
!231 = !DISubprogram(name: "fabs", scope: !211, file: !211, line: 181, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !233, line: 275)
!233 = !DISubprogram(name: "floor", scope: !211, file: !211, line: 184, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !235, line: 294)
!235 = !DISubprogram(name: "fmod", scope: !211, file: !211, line: 187, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !237, line: 315)
!237 = !DISubprogram(name: "frexp", scope: !211, file: !211, line: 103, type: !238, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DISubroutineType(types: !239)
!239 = !{!159, !159, !86}
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !241, line: 334)
!241 = !DISubprogram(name: "ldexp", scope: !211, file: !211, line: 106, type: !242, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DISubroutineType(types: !243)
!243 = !{!159, !159, !5}
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !245, line: 353)
!245 = !DISubprogram(name: "log", scope: !211, file: !211, line: 109, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !247, line: 372)
!247 = !DISubprogram(name: "log10", scope: !211, file: !211, line: 112, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !249, line: 391)
!249 = !DISubprogram(name: "modf", scope: !211, file: !211, line: 115, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{!159, !159, !252}
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64, align: 64)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !254, line: 403)
!254 = !DISubprogram(name: "pow", scope: !211, file: !211, line: 153, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !256, line: 440)
!256 = !DISubprogram(name: "sin", scope: !211, file: !211, line: 65, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !258, line: 459)
!258 = !DISubprogram(name: "sinh", scope: !211, file: !211, line: 74, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !260, line: 478)
!260 = !DISubprogram(name: "sqrt", scope: !211, file: !211, line: 156, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !262, line: 497)
!262 = !DISubprogram(name: "tan", scope: !211, file: !211, line: 67, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !264, line: 516)
!264 = !DISubprogram(name: "tanh", scope: !211, file: !211, line: 76, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !266, line: 118)
!266 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !267, line: 101, baseType: !268)
!267 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!268 = !DICompositeType(tag: DW_TAG_structure_type, file: !267, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !270, line: 119)
!270 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !267, line: 109, baseType: !271)
!271 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !267, line: 105, size: 128, align: 64, elements: !272, identifier: "_ZTS6ldiv_t")
!272 = !{!273, !274}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !271, file: !267, line: 107, baseType: !120, size: 64, align: 64)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !271, file: !267, line: 108, baseType: !120, size: 64, align: 64, offset: 64)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !276, line: 121)
!276 = !DISubprogram(name: "abort", scope: !267, file: !267, line: 515, type: !277, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!277 = !DISubroutineType(types: !278)
!278 = !{null}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !280, line: 122)
!280 = !DISubprogram(name: "abs", scope: !267, file: !267, line: 774, type: !281, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DISubroutineType(types: !282)
!282 = !{!5, !5}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !284, line: 123)
!284 = !DISubprogram(name: "atexit", scope: !267, file: !267, line: 519, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DISubroutineType(types: !286)
!286 = !{!5, !287}
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64, align: 64)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !289, line: 129)
!289 = !DISubprogram(name: "atof", scope: !267, file: !267, line: 144, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !291, line: 130)
!291 = !DISubprogram(name: "atoi", scope: !267, file: !267, line: 147, type: !292, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DISubroutineType(types: !293)
!293 = !{!5, !160}
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !295, line: 131)
!295 = !DISubprogram(name: "atol", scope: !267, file: !267, line: 150, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DISubroutineType(types: !297)
!297 = !{!120, !160}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !299, line: 132)
!299 = !DISubprogram(name: "bsearch", scope: !267, file: !267, line: 754, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!302, !303, !303, !305, !305, !308}
!302 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !304, size: 64, align: 64)
!304 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!305 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !306, line: 62, baseType: !307)
!306 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!307 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !267, line: 741, baseType: !309)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64, align: 64)
!310 = !DISubroutineType(types: !311)
!311 = !{!5, !303, !303}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !313, line: 133)
!313 = !DISubprogram(name: "calloc", scope: !267, file: !267, line: 468, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DISubroutineType(types: !315)
!315 = !{!302, !305, !305}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !317, line: 134)
!317 = !DISubprogram(name: "div", scope: !267, file: !267, line: 788, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{!266, !5, !5}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !321, line: 135)
!321 = !DISubprogram(name: "exit", scope: !267, file: !267, line: 543, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !5}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !325, line: 136)
!325 = !DISubprogram(name: "free", scope: !267, file: !267, line: 483, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{null, !302}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !329, line: 137)
!329 = !DISubprogram(name: "getenv", scope: !267, file: !267, line: 564, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!332, !160}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64, align: 64)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !334, line: 138)
!334 = !DISubprogram(name: "labs", scope: !267, file: !267, line: 775, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !336, line: 139)
!336 = !DISubprogram(name: "ldiv", scope: !267, file: !267, line: 790, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DISubroutineType(types: !338)
!338 = !{!270, !120, !120}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !340, line: 140)
!340 = !DISubprogram(name: "malloc", scope: !267, file: !267, line: 466, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!302, !305}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !344, line: 142)
!344 = !DISubprogram(name: "mblen", scope: !267, file: !267, line: 862, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!5, !160, !305}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !348, line: 143)
!348 = !DISubprogram(name: "mbstowcs", scope: !267, file: !267, line: 873, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!305, !351, !354, !305}
!351 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !352)
!352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !353, size: 64, align: 64)
!353 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!354 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !160)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !356, line: 144)
!356 = !DISubprogram(name: "mbtowc", scope: !267, file: !267, line: 865, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!5, !351, !354, !305}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !360, line: 146)
!360 = !DISubprogram(name: "qsort", scope: !267, file: !267, line: 764, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{null, !302, !305, !305, !308}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !364, line: 152)
!364 = !DISubprogram(name: "rand", scope: !267, file: !267, line: 374, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!5}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !368, line: 153)
!368 = !DISubprogram(name: "realloc", scope: !267, file: !267, line: 480, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!302, !302, !305}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !372, line: 154)
!372 = !DISubprogram(name: "srand", scope: !267, file: !267, line: 376, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !375}
!375 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !377, line: 155)
!377 = !DISubprogram(name: "strtod", scope: !267, file: !267, line: 164, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DISubroutineType(types: !379)
!379 = !{!159, !354, !380}
!380 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !381)
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64, align: 64)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !383, line: 156)
!383 = !DISubprogram(name: "strtol", scope: !267, file: !267, line: 183, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!120, !354, !380, !5}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !387, line: 157)
!387 = !DISubprogram(name: "strtoul", scope: !267, file: !267, line: 187, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!307, !354, !380, !5}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !391, line: 158)
!391 = !DISubprogram(name: "system", scope: !267, file: !267, line: 716, type: !292, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !393, line: 160)
!393 = !DISubprogram(name: "wcstombs", scope: !267, file: !267, line: 876, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DISubroutineType(types: !395)
!395 = !{!305, !396, !397, !305}
!396 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !332)
!397 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !398)
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !399, size: 64, align: 64)
!399 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !353)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !401, line: 161)
!401 = !DISubprogram(name: "wctomb", scope: !267, file: !267, line: 869, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DISubroutineType(types: !403)
!403 = !{!5, !332, !353}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !407, line: 214)
!405 = !DINamespace(name: "__gnu_cxx", scope: null, file: !406, line: 220)
!406 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !267, line: 121, baseType: !408)
!408 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !267, line: 117, size: 128, align: 64, elements: !409, identifier: "_ZTS7lldiv_t")
!409 = !{!410, !411}
!410 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !408, file: !267, line: 119, baseType: !23, size: 64, align: 64)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !408, file: !267, line: 120, baseType: !23, size: 64, align: 64, offset: 64)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !413, line: 220)
!413 = !DISubprogram(name: "_Exit", scope: !267, file: !267, line: 557, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !415, line: 224)
!415 = !DISubprogram(name: "llabs", scope: !267, file: !267, line: 779, type: !21, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !417, line: 230)
!417 = !DISubprogram(name: "lldiv", scope: !267, file: !267, line: 796, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DISubroutineType(types: !419)
!419 = !{!407, !23, !23}
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !421, line: 241)
!421 = !DISubprogram(name: "atoll", scope: !267, file: !267, line: 157, type: !422, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!422 = !DISubroutineType(types: !423)
!423 = !{!23, !160}
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !425, line: 242)
!425 = !DISubprogram(name: "strtoll", scope: !267, file: !267, line: 209, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!23, !354, !380, !5}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !429, line: 243)
!429 = !DISubprogram(name: "strtoull", scope: !267, file: !267, line: 214, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!432, !354, !380, !5}
!432 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !434, line: 245)
!434 = !DISubprogram(name: "strtof", scope: !267, file: !267, line: 172, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!7, !354, !380}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !438, line: 246)
!438 = !DISubprogram(name: "strtold", scope: !267, file: !267, line: 175, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{!441, !354, !380}
!441 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !407, line: 254)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !413, line: 256)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !415, line: 258)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !446, line: 259)
!446 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !405, file: !447, line: 227, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !417, line: 260)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !421, line: 262)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !434, line: 263)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !425, line: 264)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !429, line: 265)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !438, line: 266)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !455, line: 397)
!455 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !456, file: !456, line: 1342, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
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
!473 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
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
!505 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !456, file: !456, line: 1543, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !507, line: 422)
!507 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !456, file: !456, line: 1390, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !509, line: 423)
!509 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !456, file: !456, line: 1621, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !511, line: 424)
!511 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !456, file: !456, line: 1520, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !513, line: 425)
!513 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !456, file: !456, line: 1515, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !515, line: 426)
!515 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !456, file: !456, line: 1149, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !517, line: 427)
!517 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !456, file: !456, line: 1602, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
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
!529 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !456, file: !456, line: 1140, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !531, line: 434)
!531 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !456, file: !456, line: 1607, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !533, line: 435)
!533 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !456, file: !456, line: 1548, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !535, line: 436)
!535 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !456, file: !456, line: 1154, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !537, line: 437)
!537 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !456, file: !456, line: 1218, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !539, line: 438)
!539 = !DISubprogram(name: "nexttowardf", scope: !211, file: !211, line: 294, type: !540, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DISubroutineType(types: !541)
!541 = !{!7, !7, !441}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !539, line: 439)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !544, line: 440)
!544 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !456, file: !456, line: 1583, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !546, line: 441)
!546 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !456, file: !456, line: 1558, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !548, line: 442)
!548 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !456, file: !456, line: 1563, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !550, line: 443)
!550 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !456, file: !456, line: 1135, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !552, line: 444)
!552 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !456, file: !456, line: 1597, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !554, line: 445)
!554 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !456, file: !456, line: 1530, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !556, line: 446)
!556 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !456, file: !456, line: 1525, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
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
!571 = !{void (i32, float*, float*, float*, i32, i32, i32, i32, float, float, float, float, float, float)* @_Z14calculate_tempiPfS_S_iiiiffffff, !"kernel", i32 1}
!572 = !{null, !"align", i32 8}
!573 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!574 = !{null, !"align", i32 16}
!575 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!576 = !{i32 2, !"Dwarf Version", i32 4}
!577 = !{i32 2, !"Debug Info Version", i32 3}
!578 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!579 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!580 = !{i32 1, i32 2}
!581 = !DILocalVariable(name: "iteration", arg: 1, scope: !1, file: !2, line: 104, type: !5)
!582 = !DIExpression()
!583 = !DILocation(line: 104, column: 36, scope: !1)
!584 = !DILocalVariable(name: "power", arg: 2, scope: !1, file: !2, line: 105, type: !6)
!585 = !DILocation(line: 105, column: 39, scope: !1)
!586 = !DILocalVariable(name: "temp_src", arg: 3, scope: !1, file: !2, line: 106, type: !6)
!587 = !DILocation(line: 106, column: 39, scope: !1)
!588 = !DILocalVariable(name: "temp_dst", arg: 4, scope: !1, file: !2, line: 107, type: !6)
!589 = !DILocation(line: 107, column: 39, scope: !1)
!590 = !DILocalVariable(name: "grid_cols", arg: 5, scope: !1, file: !2, line: 108, type: !5)
!591 = !DILocation(line: 108, column: 36, scope: !1)
!592 = !DILocalVariable(name: "grid_rows", arg: 6, scope: !1, file: !2, line: 109, type: !5)
!593 = !DILocation(line: 109, column: 36, scope: !1)
!594 = !DILocalVariable(name: "border_cols", arg: 7, scope: !1, file: !2, line: 110, type: !5)
!595 = !DILocation(line: 110, column: 15, scope: !1)
!596 = !DILocalVariable(name: "border_rows", arg: 8, scope: !1, file: !2, line: 111, type: !5)
!597 = !DILocation(line: 111, column: 15, scope: !1)
!598 = !DILocalVariable(name: "Cap", arg: 9, scope: !1, file: !2, line: 112, type: !7)
!599 = !DILocation(line: 112, column: 38, scope: !1)
!600 = !DILocalVariable(name: "Rx", arg: 10, scope: !1, file: !2, line: 113, type: !7)
!601 = !DILocation(line: 113, column: 38, scope: !1)
!602 = !DILocalVariable(name: "Ry", arg: 11, scope: !1, file: !2, line: 114, type: !7)
!603 = !DILocation(line: 114, column: 38, scope: !1)
!604 = !DILocalVariable(name: "Rz", arg: 12, scope: !1, file: !2, line: 115, type: !7)
!605 = !DILocation(line: 115, column: 38, scope: !1)
!606 = !DILocalVariable(name: "step", arg: 13, scope: !1, file: !2, line: 116, type: !7)
!607 = !DILocation(line: 116, column: 38, scope: !1)
!608 = !DILocalVariable(name: "time_elapsed", arg: 14, scope: !1, file: !2, line: 117, type: !7)
!609 = !DILocation(line: 117, column: 38, scope: !1)
!610 = !DILocalVariable(name: "amb_temp", scope: !1, file: !2, line: 123, type: !7)
!611 = !DILocation(line: 123, column: 8, scope: !1)
!612 = !DILocalVariable(name: "step_div_Cap", scope: !1, file: !2, line: 124, type: !7)
!613 = !DILocation(line: 124, column: 15, scope: !1)
!614 = !DILocalVariable(name: "Rx_1", scope: !1, file: !2, line: 125, type: !7)
!615 = !DILocation(line: 125, column: 15, scope: !1)
!616 = !DILocalVariable(name: "Ry_1", scope: !1, file: !2, line: 125, type: !7)
!617 = !DILocation(line: 125, column: 20, scope: !1)
!618 = !DILocalVariable(name: "Rz_1", scope: !1, file: !2, line: 125, type: !7)
!619 = !DILocation(line: 125, column: 25, scope: !1)
!620 = !DILocalVariable(name: "bx", scope: !1, file: !2, line: 127, type: !5)
!621 = !DILocation(line: 127, column: 6, scope: !1)
!622 = !DILocation(line: 78, column: 3, scope: !623, inlinedAt: !658)
!623 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !625, file: !624, line: 78, type: !628, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !627, variables: !9)
!624 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!625 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !624, line: 77, size: 8, align: 8, elements: !626, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!626 = !{!627, !630, !631, !632, !643, !647, !651, !654}
!627 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !625, file: !624, line: 78, type: !628, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DISubroutineType(types: !629)
!629 = !{!375}
!630 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !625, file: !624, line: 79, type: !628, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!631 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !625, file: !624, line: 80, type: !628, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!632 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !625, file: !624, line: 83, type: !633, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DISubroutineType(types: !634)
!634 = !{!635, !641}
!635 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !636, line: 190, size: 96, align: 32, elements: !637, identifier: "_ZTS5uint3")
!636 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!637 = !{!638, !639, !640}
!638 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !635, file: !636, line: 192, baseType: !375, size: 32, align: 32)
!639 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !635, file: !636, line: 192, baseType: !375, size: 32, align: 32, offset: 32)
!640 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !635, file: !636, line: 192, baseType: !375, size: 32, align: 32, offset: 64)
!641 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !642, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!642 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !625)
!643 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !625, file: !624, line: 85, type: !644, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!644 = !DISubroutineType(types: !645)
!645 = !{null, !646}
!646 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !625, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!647 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !625, file: !624, line: 85, type: !648, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!648 = !DISubroutineType(types: !649)
!649 = !{null, !646, !650}
!650 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !642, size: 64, align: 64)
!651 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !625, file: !624, line: 85, type: !652, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!652 = !DISubroutineType(types: !653)
!653 = !{null, !641, !650}
!654 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !625, file: !624, line: 85, type: !655, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!655 = !DISubroutineType(types: !656)
!656 = !{!657, !641}
!657 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !625, size: 64, align: 64)
!658 = distinct !DILocation(line: 127, column: 11, scope: !1)
!659 = !{i32 0, i32 65535}
!660 = !DILocalVariable(name: "by", scope: !1, file: !2, line: 128, type: !5)
!661 = !DILocation(line: 128, column: 13, scope: !1)
!662 = !DILocation(line: 79, column: 3, scope: !663, inlinedAt: !664)
!663 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !625, file: !624, line: 79, type: !628, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !630, variables: !9)
!664 = distinct !DILocation(line: 128, column: 18, scope: !1)
!665 = !DILocalVariable(name: "tx", scope: !1, file: !2, line: 130, type: !5)
!666 = !DILocation(line: 130, column: 6, scope: !1)
!667 = !DILocation(line: 67, column: 3, scope: !668, inlinedAt: !694)
!668 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !669, file: !624, line: 67, type: !628, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !671, variables: !9)
!669 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !624, line: 66, size: 8, align: 8, elements: !670, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!670 = !{!671, !672, !673, !674, !679, !683, !687, !690}
!671 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !669, file: !624, line: 67, type: !628, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!672 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !669, file: !624, line: 68, type: !628, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!673 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !669, file: !624, line: 69, type: !628, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!674 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !669, file: !624, line: 72, type: !675, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!675 = !DISubroutineType(types: !676)
!676 = !{!635, !677}
!677 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !678, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!678 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !669)
!679 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !669, file: !624, line: 74, type: !680, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!680 = !DISubroutineType(types: !681)
!681 = !{null, !682}
!682 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !669, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!683 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !669, file: !624, line: 74, type: !684, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!684 = !DISubroutineType(types: !685)
!685 = !{null, !682, !686}
!686 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !678, size: 64, align: 64)
!687 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !669, file: !624, line: 74, type: !688, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!688 = !DISubroutineType(types: !689)
!689 = !{null, !677, !686}
!690 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !669, file: !624, line: 74, type: !691, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!691 = !DISubroutineType(types: !692)
!692 = !{!693, !677}
!693 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !669, size: 64, align: 64)
!694 = distinct !DILocation(line: 130, column: 9, scope: !1)
!695 = !{i32 0, i32 1024}
!696 = !DILocalVariable(name: "ty", scope: !1, file: !2, line: 131, type: !5)
!697 = !DILocation(line: 131, column: 6, scope: !1)
!698 = !DILocation(line: 68, column: 3, scope: !699, inlinedAt: !700)
!699 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !669, file: !624, line: 68, type: !628, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !672, variables: !9)
!700 = distinct !DILocation(line: 131, column: 9, scope: !1)
!701 = !DILocation(line: 133, column: 15, scope: !1)
!702 = !DILocation(line: 133, column: 20, scope: !1)
!703 = !DILocation(line: 133, column: 19, scope: !1)
!704 = !DILocation(line: 133, column: 14, scope: !1)
!705 = !DILocation(line: 135, column: 9, scope: !1)
!706 = !DILocation(line: 135, column: 8, scope: !1)
!707 = !DILocation(line: 135, column: 6, scope: !1)
!708 = !DILocation(line: 136, column: 9, scope: !1)
!709 = !DILocation(line: 136, column: 8, scope: !1)
!710 = !DILocation(line: 136, column: 6, scope: !1)
!711 = !DILocation(line: 137, column: 9, scope: !1)
!712 = !DILocation(line: 137, column: 8, scope: !1)
!713 = !DILocation(line: 137, column: 6, scope: !1)
!714 = !DILocalVariable(name: "small_block_rows", scope: !1, file: !2, line: 145, type: !5)
!715 = !DILocation(line: 145, column: 6, scope: !1)
!716 = !DILocation(line: 145, column: 36, scope: !1)
!717 = !DILocation(line: 145, column: 45, scope: !1)
!718 = !DILocation(line: 145, column: 35, scope: !1)
!719 = !DILocalVariable(name: "small_block_cols", scope: !1, file: !2, line: 146, type: !5)
!720 = !DILocation(line: 146, column: 6, scope: !1)
!721 = !DILocation(line: 146, column: 36, scope: !1)
!722 = !DILocation(line: 146, column: 45, scope: !1)
!723 = !DILocation(line: 146, column: 35, scope: !1)
!724 = !DILocalVariable(name: "blkY", scope: !1, file: !2, line: 150, type: !5)
!725 = !DILocation(line: 150, column: 13, scope: !1)
!726 = !DILocation(line: 150, column: 20, scope: !1)
!727 = !DILocation(line: 150, column: 37, scope: !1)
!728 = !DILocation(line: 150, column: 36, scope: !1)
!729 = !DILocation(line: 150, column: 40, scope: !1)
!730 = !DILocation(line: 150, column: 39, scope: !1)
!731 = !DILocalVariable(name: "blkX", scope: !1, file: !2, line: 151, type: !5)
!732 = !DILocation(line: 151, column: 13, scope: !1)
!733 = !DILocation(line: 151, column: 20, scope: !1)
!734 = !DILocation(line: 151, column: 37, scope: !1)
!735 = !DILocation(line: 151, column: 36, scope: !1)
!736 = !DILocation(line: 151, column: 40, scope: !1)
!737 = !DILocation(line: 151, column: 39, scope: !1)
!738 = !DILocalVariable(name: "blkYmax", scope: !1, file: !2, line: 152, type: !5)
!739 = !DILocation(line: 152, column: 13, scope: !1)
!740 = !DILocation(line: 152, column: 23, scope: !1)
!741 = !DILocation(line: 152, column: 27, scope: !1)
!742 = !DILocation(line: 152, column: 38, scope: !1)
!743 = !DILocalVariable(name: "blkXmax", scope: !1, file: !2, line: 153, type: !5)
!744 = !DILocation(line: 153, column: 13, scope: !1)
!745 = !DILocation(line: 153, column: 23, scope: !1)
!746 = !DILocation(line: 153, column: 27, scope: !1)
!747 = !DILocation(line: 153, column: 38, scope: !1)
!748 = !DILocalVariable(name: "yidx", scope: !1, file: !2, line: 156, type: !5)
!749 = !DILocation(line: 156, column: 6, scope: !1)
!750 = !DILocation(line: 156, column: 13, scope: !1)
!751 = !DILocation(line: 156, column: 18, scope: !1)
!752 = !DILocation(line: 156, column: 17, scope: !1)
!753 = !DILocalVariable(name: "xidx", scope: !1, file: !2, line: 157, type: !5)
!754 = !DILocation(line: 157, column: 6, scope: !1)
!755 = !DILocation(line: 157, column: 13, scope: !1)
!756 = !DILocation(line: 157, column: 18, scope: !1)
!757 = !DILocation(line: 157, column: 17, scope: !1)
!758 = !DILocalVariable(name: "loadYidx", scope: !1, file: !2, line: 160, type: !5)
!759 = !DILocation(line: 160, column: 6, scope: !1)
!760 = !DILocation(line: 160, column: 15, scope: !1)
!761 = !DILocalVariable(name: "loadXidx", scope: !1, file: !2, line: 160, type: !5)
!762 = !DILocation(line: 160, column: 21, scope: !1)
!763 = !DILocation(line: 160, column: 30, scope: !1)
!764 = !DILocalVariable(name: "index", scope: !1, file: !2, line: 161, type: !5)
!765 = !DILocation(line: 161, column: 13, scope: !1)
!766 = !DILocation(line: 161, column: 21, scope: !1)
!767 = !DILocation(line: 161, column: 31, scope: !1)
!768 = !DILocation(line: 161, column: 30, scope: !1)
!769 = !DILocation(line: 161, column: 40, scope: !1)
!770 = !DILocation(line: 161, column: 39, scope: !1)
!771 = !DILocation(line: 163, column: 5, scope: !772)
!772 = distinct !DILexicalBlock(scope: !1, file: !2, line: 163, column: 5)
!773 = !DILocation(line: 163, column: 5, scope: !774)
!774 = !DILexicalBlockFile(scope: !772, file: !2, discriminator: 1)
!775 = !DILocation(line: 163, column: 40, scope: !774)
!776 = !DILocation(line: 163, column: 43, scope: !777)
!777 = !DILexicalBlockFile(scope: !772, file: !2, discriminator: 2)
!778 = !DILocation(line: 163, column: 43, scope: !779)
!779 = !DILexicalBlockFile(scope: !772, file: !2, discriminator: 3)
!780 = !DILocation(line: 163, column: 5, scope: !779)
!781 = !DILocation(line: 164, column: 36, scope: !782)
!782 = distinct !DILexicalBlock(scope: !772, file: !2, line: 163, column: 78)
!783 = !DILocation(line: 164, column: 45, scope: !782)
!784 = !DILocation(line: 164, column: 26, scope: !782)
!785 = !DILocation(line: 164, column: 13, scope: !782)
!786 = !DILocation(line: 164, column: 30, scope: !782)
!787 = !DILocation(line: 164, column: 34, scope: !782)
!788 = !DILocation(line: 165, column: 37, scope: !782)
!789 = !DILocation(line: 165, column: 43, scope: !782)
!790 = !DILocation(line: 165, column: 27, scope: !782)
!791 = !DILocation(line: 165, column: 13, scope: !782)
!792 = !DILocation(line: 165, column: 31, scope: !782)
!793 = !DILocation(line: 165, column: 35, scope: !782)
!794 = !DILocation(line: 166, column: 2, scope: !782)
!795 = !DILocation(line: 167, column: 2, scope: !1)
!796 = !DILocalVariable(name: "validYmin", scope: !1, file: !2, line: 172, type: !5)
!797 = !DILocation(line: 172, column: 13, scope: !1)
!798 = !DILocation(line: 172, column: 26, scope: !1)
!799 = !DILocation(line: 172, column: 31, scope: !1)
!800 = !DILocation(line: 172, column: 25, scope: !1)
!801 = !DILocation(line: 172, column: 39, scope: !802)
!802 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 1)
!803 = !DILocation(line: 172, column: 38, scope: !802)
!804 = !DILocation(line: 172, column: 25, scope: !802)
!805 = !DILocation(line: 172, column: 25, scope: !806)
!806 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 2)
!807 = !DILocation(line: 172, column: 25, scope: !808)
!808 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 3)
!809 = !DILocation(line: 172, column: 13, scope: !808)
!810 = !DILocalVariable(name: "validYmax", scope: !1, file: !2, line: 173, type: !5)
!811 = !DILocation(line: 173, column: 13, scope: !1)
!812 = !DILocation(line: 173, column: 26, scope: !1)
!813 = !DILocation(line: 173, column: 36, scope: !1)
!814 = !DILocation(line: 173, column: 45, scope: !1)
!815 = !DILocation(line: 173, column: 34, scope: !1)
!816 = !DILocation(line: 173, column: 25, scope: !1)
!817 = !DILocation(line: 173, column: 65, scope: !802)
!818 = !DILocation(line: 173, column: 73, scope: !802)
!819 = !DILocation(line: 173, column: 72, scope: !802)
!820 = !DILocation(line: 173, column: 82, scope: !802)
!821 = !DILocation(line: 173, column: 63, scope: !802)
!822 = !DILocation(line: 173, column: 25, scope: !802)
!823 = !DILocation(line: 173, column: 25, scope: !806)
!824 = !DILocation(line: 173, column: 25, scope: !808)
!825 = !DILocation(line: 173, column: 13, scope: !808)
!826 = !DILocalVariable(name: "validXmin", scope: !1, file: !2, line: 174, type: !5)
!827 = !DILocation(line: 174, column: 13, scope: !1)
!828 = !DILocation(line: 174, column: 26, scope: !1)
!829 = !DILocation(line: 174, column: 31, scope: !1)
!830 = !DILocation(line: 174, column: 25, scope: !1)
!831 = !DILocation(line: 174, column: 39, scope: !802)
!832 = !DILocation(line: 174, column: 38, scope: !802)
!833 = !DILocation(line: 174, column: 25, scope: !802)
!834 = !DILocation(line: 174, column: 25, scope: !806)
!835 = !DILocation(line: 174, column: 25, scope: !808)
!836 = !DILocation(line: 174, column: 13, scope: !808)
!837 = !DILocalVariable(name: "validXmax", scope: !1, file: !2, line: 175, type: !5)
!838 = !DILocation(line: 175, column: 13, scope: !1)
!839 = !DILocation(line: 175, column: 26, scope: !1)
!840 = !DILocation(line: 175, column: 36, scope: !1)
!841 = !DILocation(line: 175, column: 45, scope: !1)
!842 = !DILocation(line: 175, column: 34, scope: !1)
!843 = !DILocation(line: 175, column: 25, scope: !1)
!844 = !DILocation(line: 175, column: 65, scope: !802)
!845 = !DILocation(line: 175, column: 73, scope: !802)
!846 = !DILocation(line: 175, column: 72, scope: !802)
!847 = !DILocation(line: 175, column: 82, scope: !802)
!848 = !DILocation(line: 175, column: 63, scope: !802)
!849 = !DILocation(line: 175, column: 25, scope: !802)
!850 = !DILocation(line: 175, column: 25, scope: !806)
!851 = !DILocation(line: 175, column: 25, scope: !808)
!852 = !DILocation(line: 175, column: 13, scope: !808)
!853 = !DILocalVariable(name: "N", scope: !1, file: !2, line: 177, type: !5)
!854 = !DILocation(line: 177, column: 13, scope: !1)
!855 = !DILocation(line: 177, column: 17, scope: !1)
!856 = !DILocation(line: 177, column: 19, scope: !1)
!857 = !DILocalVariable(name: "S", scope: !1, file: !2, line: 178, type: !5)
!858 = !DILocation(line: 178, column: 13, scope: !1)
!859 = !DILocation(line: 178, column: 17, scope: !1)
!860 = !DILocation(line: 178, column: 19, scope: !1)
!861 = !DILocalVariable(name: "W", scope: !1, file: !2, line: 179, type: !5)
!862 = !DILocation(line: 179, column: 13, scope: !1)
!863 = !DILocation(line: 179, column: 17, scope: !1)
!864 = !DILocation(line: 179, column: 19, scope: !1)
!865 = !DILocalVariable(name: "E", scope: !1, file: !2, line: 180, type: !5)
!866 = !DILocation(line: 180, column: 13, scope: !1)
!867 = !DILocation(line: 180, column: 17, scope: !1)
!868 = !DILocation(line: 180, column: 19, scope: !1)
!869 = !DILocation(line: 182, column: 14, scope: !1)
!870 = !DILocation(line: 182, column: 18, scope: !1)
!871 = !DILocation(line: 182, column: 16, scope: !1)
!872 = !DILocation(line: 182, column: 13, scope: !1)
!873 = !DILocation(line: 182, column: 31, scope: !802)
!874 = !DILocation(line: 182, column: 13, scope: !802)
!875 = !DILocation(line: 182, column: 43, scope: !806)
!876 = !DILocation(line: 182, column: 13, scope: !806)
!877 = !DILocation(line: 182, column: 13, scope: !808)
!878 = !DILocation(line: 182, column: 11, scope: !808)
!879 = !DILocation(line: 183, column: 14, scope: !1)
!880 = !DILocation(line: 183, column: 18, scope: !1)
!881 = !DILocation(line: 183, column: 16, scope: !1)
!882 = !DILocation(line: 183, column: 13, scope: !1)
!883 = !DILocation(line: 183, column: 31, scope: !802)
!884 = !DILocation(line: 183, column: 13, scope: !802)
!885 = !DILocation(line: 183, column: 43, scope: !806)
!886 = !DILocation(line: 183, column: 13, scope: !806)
!887 = !DILocation(line: 183, column: 13, scope: !808)
!888 = !DILocation(line: 183, column: 11, scope: !808)
!889 = !DILocation(line: 184, column: 14, scope: !1)
!890 = !DILocation(line: 184, column: 18, scope: !1)
!891 = !DILocation(line: 184, column: 16, scope: !1)
!892 = !DILocation(line: 184, column: 13, scope: !1)
!893 = !DILocation(line: 184, column: 31, scope: !802)
!894 = !DILocation(line: 184, column: 13, scope: !802)
!895 = !DILocation(line: 184, column: 43, scope: !806)
!896 = !DILocation(line: 184, column: 13, scope: !806)
!897 = !DILocation(line: 184, column: 13, scope: !808)
!898 = !DILocation(line: 184, column: 11, scope: !808)
!899 = !DILocation(line: 185, column: 14, scope: !1)
!900 = !DILocation(line: 185, column: 18, scope: !1)
!901 = !DILocation(line: 185, column: 16, scope: !1)
!902 = !DILocation(line: 185, column: 13, scope: !1)
!903 = !DILocation(line: 185, column: 31, scope: !802)
!904 = !DILocation(line: 185, column: 13, scope: !802)
!905 = !DILocation(line: 185, column: 43, scope: !806)
!906 = !DILocation(line: 185, column: 13, scope: !806)
!907 = !DILocation(line: 185, column: 13, scope: !808)
!908 = !DILocation(line: 185, column: 11, scope: !808)
!909 = !DILocalVariable(name: "computed", scope: !1, file: !2, line: 187, type: !95)
!910 = !DILocation(line: 187, column: 14, scope: !1)
!911 = !DILocalVariable(name: "i", scope: !912, file: !2, line: 188, type: !5)
!912 = distinct !DILexicalBlock(scope: !1, file: !2, line: 188, column: 9)
!913 = !DILocation(line: 188, column: 18, scope: !912)
!914 = !DILocation(line: 188, column: 14, scope: !912)
!915 = !DILocation(line: 188, column: 23, scope: !916)
!916 = !DILexicalBlockFile(scope: !917, file: !2, discriminator: 1)
!917 = distinct !DILexicalBlock(scope: !912, file: !2, line: 188, column: 9)
!918 = !DILocation(line: 188, column: 25, scope: !916)
!919 = !DILocation(line: 188, column: 24, scope: !916)
!920 = !DILocation(line: 188, column: 9, scope: !916)
!921 = !DILocation(line: 189, column: 22, scope: !922)
!922 = distinct !DILexicalBlock(scope: !917, file: !2, line: 188, column: 41)
!923 = !DILocation(line: 190, column: 17, scope: !924)
!924 = distinct !DILexicalBlock(scope: !922, file: !2, line: 190, column: 17)
!925 = !DILocation(line: 190, column: 17, scope: !926)
!926 = !DILexicalBlockFile(scope: !924, file: !2, discriminator: 1)
!927 = !DILocation(line: 190, column: 51, scope: !926)
!928 = !DILocation(line: 191, column: 19, scope: !924)
!929 = !DILocation(line: 191, column: 19, scope: !926)
!930 = !DILocation(line: 191, column: 53, scope: !926)
!931 = !DILocation(line: 192, column: 19, scope: !924)
!932 = !DILocation(line: 192, column: 19, scope: !926)
!933 = !DILocation(line: 192, column: 54, scope: !926)
!934 = !DILocation(line: 193, column: 19, scope: !924)
!935 = !DILocation(line: 193, column: 19, scope: !926)
!936 = !DILocation(line: 190, column: 17, scope: !937)
!937 = !DILexicalBlockFile(scope: !922, file: !2, discriminator: 2)
!938 = !DILocation(line: 194, column: 28, scope: !939)
!939 = distinct !DILexicalBlock(scope: !924, file: !2, line: 193, column: 56)
!940 = !DILocation(line: 195, column: 51, scope: !939)
!941 = !DILocation(line: 195, column: 38, scope: !939)
!942 = !DILocation(line: 195, column: 55, scope: !939)
!943 = !DILocation(line: 195, column: 61, scope: !939)
!944 = !DILocation(line: 195, column: 91, scope: !939)
!945 = !DILocation(line: 195, column: 77, scope: !939)
!946 = !DILocation(line: 195, column: 95, scope: !939)
!947 = !DILocation(line: 196, column: 33, scope: !939)
!948 = !DILocation(line: 196, column: 20, scope: !939)
!949 = !DILocation(line: 196, column: 36, scope: !939)
!950 = !DILocation(line: 196, column: 55, scope: !939)
!951 = !DILocation(line: 196, column: 42, scope: !939)
!952 = !DILocation(line: 196, column: 58, scope: !939)
!953 = !DILocation(line: 196, column: 40, scope: !939)
!954 = !DILocation(line: 196, column: 81, scope: !939)
!955 = !DILocation(line: 196, column: 68, scope: !939)
!956 = !DILocation(line: 196, column: 85, scope: !939)
!957 = !DILocation(line: 196, column: 67, scope: !939)
!958 = !DILocation(line: 196, column: 62, scope: !939)
!959 = !DILocation(line: 196, column: 92, scope: !939)
!960 = !DILocation(line: 196, column: 90, scope: !939)
!961 = !DILocation(line: 195, column: 99, scope: !939)
!962 = !DILocation(line: 197, column: 30, scope: !939)
!963 = !DILocation(line: 197, column: 17, scope: !939)
!964 = !DILocation(line: 197, column: 34, scope: !939)
!965 = !DILocation(line: 197, column: 52, scope: !939)
!966 = !DILocation(line: 197, column: 39, scope: !939)
!967 = !DILocation(line: 197, column: 56, scope: !939)
!968 = !DILocation(line: 197, column: 37, scope: !939)
!969 = !DILocation(line: 197, column: 78, scope: !939)
!970 = !DILocation(line: 197, column: 65, scope: !939)
!971 = !DILocation(line: 197, column: 82, scope: !939)
!972 = !DILocation(line: 197, column: 64, scope: !939)
!973 = !DILocation(line: 197, column: 59, scope: !939)
!974 = !DILocation(line: 197, column: 89, scope: !939)
!975 = !DILocation(line: 197, column: 87, scope: !939)
!976 = !DILocation(line: 196, column: 97, scope: !939)
!977 = !DILocation(line: 198, column: 17, scope: !939)
!978 = !DILocation(line: 198, column: 41, scope: !939)
!979 = !DILocation(line: 198, column: 28, scope: !939)
!980 = !DILocation(line: 198, column: 45, scope: !939)
!981 = !DILocation(line: 198, column: 26, scope: !939)
!982 = !DILocation(line: 198, column: 52, scope: !939)
!983 = !DILocation(line: 198, column: 50, scope: !939)
!984 = !DILocation(line: 198, column: 16, scope: !939)
!985 = !DILocation(line: 197, column: 94, scope: !939)
!986 = !DILocation(line: 195, column: 74, scope: !939)
!987 = !DILocation(line: 195, column: 59, scope: !939)
!988 = !DILocation(line: 195, column: 26, scope: !939)
!989 = !DILocation(line: 195, column: 19, scope: !939)
!990 = !DILocation(line: 195, column: 30, scope: !939)
!991 = !DILocation(line: 195, column: 34, scope: !939)
!992 = !DILocation(line: 200, column: 13, scope: !939)
!993 = !DILocation(line: 201, column: 13, scope: !922)
!994 = !DILocation(line: 202, column: 16, scope: !995)
!995 = distinct !DILexicalBlock(scope: !922, file: !2, line: 202, column: 16)
!996 = !DILocation(line: 202, column: 19, scope: !995)
!997 = !DILocation(line: 202, column: 28, scope: !995)
!998 = !DILocation(line: 202, column: 17, scope: !995)
!999 = !DILocation(line: 202, column: 16, scope: !922)
!1000 = !DILocation(line: 203, column: 17, scope: !995)
!1001 = !DILocation(line: 204, column: 16, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !922, file: !2, line: 204, column: 16)
!1003 = !DILocation(line: 204, column: 16, scope: !922)
!1004 = !DILocation(line: 205, column: 46, scope: !1002)
!1005 = !DILocation(line: 205, column: 39, scope: !1002)
!1006 = !DILocation(line: 205, column: 50, scope: !1002)
!1007 = !DILocation(line: 205, column: 30, scope: !1002)
!1008 = !DILocation(line: 205, column: 17, scope: !1002)
!1009 = !DILocation(line: 205, column: 34, scope: !1002)
!1010 = !DILocation(line: 205, column: 37, scope: !1002)
!1011 = !DILocation(line: 206, column: 13, scope: !922)
!1012 = !DILocation(line: 207, column: 11, scope: !922)
!1013 = !DILocation(line: 188, column: 38, scope: !1014)
!1014 = !DILexicalBlockFile(scope: !917, file: !2, discriminator: 2)
!1015 = !DILocation(line: 188, column: 9, scope: !1014)
!1016 = distinct !{!1016, !1017}
!1017 = !DILocation(line: 188, column: 9, scope: !1)
!1018 = !DILocation(line: 212, column: 11, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1, file: !2, line: 212, column: 11)
!1020 = !DILocation(line: 212, column: 11, scope: !1)
!1021 = !DILocation(line: 213, column: 35, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1019, file: !2, line: 212, column: 20)
!1023 = !DILocation(line: 213, column: 28, scope: !1022)
!1024 = !DILocation(line: 213, column: 39, scope: !1022)
!1025 = !DILocation(line: 213, column: 11, scope: !1022)
!1026 = !DILocation(line: 213, column: 20, scope: !1022)
!1027 = !DILocation(line: 213, column: 26, scope: !1022)
!1028 = !DILocation(line: 214, column: 7, scope: !1022)
!1029 = !DILocation(line: 215, column: 1, scope: !1)
