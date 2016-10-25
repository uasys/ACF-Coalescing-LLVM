; ModuleID = 'backprop_cuda.cu'
source_filename = "backprop_cuda.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE10input_node = internal addrspace(3) global [16 x float] zeroinitializer, align 4, !dbg !0
@_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !12
@"$str" = private addrspace(1) constant [11 x i8] c"__CUDA_FTZ\00"

; Function Attrs: convergent nounwind
define void @_Z22bpnn_layerforward_CUDAPfS_S_S_ii(float* %input_cuda, float* %output_hidden_cuda, float* %input_hidden_cuda, float* %hidden_partial_sum, i32 %in, i32 %hid) #0 !dbg !1 {
entry:
  %a.addr.i72 = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %a.addr.i72, metadata !584, metadata !586), !dbg !587
  %a.addr.i = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %a.addr.i, metadata !592, metadata !586), !dbg !594
  %b.addr.i = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %b.addr.i, metadata !597, metadata !586), !dbg !598
  %input_cuda.addr = alloca float*, align 8
  %output_hidden_cuda.addr = alloca float*, align 8
  %input_hidden_cuda.addr = alloca float*, align 8
  %hidden_partial_sum.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %hid.addr = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_in = alloca i32, align 4
  %i = alloca i32, align 4
  %power_two = alloca i32, align 4
  store float* %input_cuda, float** %input_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %input_cuda.addr, metadata !599, metadata !586), !dbg !600
  store float* %output_hidden_cuda, float** %output_hidden_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %output_hidden_cuda.addr, metadata !601, metadata !586), !dbg !602
  store float* %input_hidden_cuda, float** %input_hidden_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %input_hidden_cuda.addr, metadata !603, metadata !586), !dbg !604
  store float* %hidden_partial_sum, float** %hidden_partial_sum.addr, align 8
  call void @llvm.dbg.declare(metadata float** %hidden_partial_sum.addr, metadata !605, metadata !586), !dbg !606
  store i32 %in, i32* %in.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %in.addr, metadata !607, metadata !586), !dbg !608
  store i32 %hid, i32* %hid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %hid.addr, metadata !609, metadata !586), !dbg !610
  call void @llvm.dbg.declare(metadata i32* %by, metadata !611, metadata !586), !dbg !612
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !613, !range !650
  store i32 %0, i32* %by, align 4, !dbg !612
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !651, metadata !586), !dbg !652
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !653, !range !681
  store i32 %1, i32* %tx, align 4, !dbg !652
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !682, metadata !586), !dbg !683
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !684, !range !681
  store i32 %2, i32* %ty, align 4, !dbg !683
  call void @llvm.dbg.declare(metadata i32* %index, metadata !687, metadata !586), !dbg !688
  %3 = load i32, i32* %hid.addr, align 4, !dbg !689
  %add = add nsw i32 %3, 1, !dbg !690
  %mul = mul nsw i32 %add, 16, !dbg !691
  %4 = load i32, i32* %by, align 4, !dbg !692
  %mul3 = mul nsw i32 %mul, %4, !dbg !693
  %5 = load i32, i32* %hid.addr, align 4, !dbg !694
  %add4 = add nsw i32 %5, 1, !dbg !695
  %6 = load i32, i32* %ty, align 4, !dbg !696
  %mul5 = mul nsw i32 %add4, %6, !dbg !697
  %add6 = add nsw i32 %mul3, %mul5, !dbg !698
  %7 = load i32, i32* %tx, align 4, !dbg !699
  %add7 = add nsw i32 %add6, %7, !dbg !700
  %add8 = add nsw i32 %add7, 1, !dbg !701
  %8 = load i32, i32* %hid.addr, align 4, !dbg !702
  %add9 = add nsw i32 %8, 1, !dbg !703
  %add10 = add nsw i32 %add8, %add9, !dbg !704
  store i32 %add10, i32* %index, align 4, !dbg !688
  call void @llvm.dbg.declare(metadata i32* %index_in, metadata !705, metadata !586), !dbg !706
  %9 = load i32, i32* %by, align 4, !dbg !707
  %mul11 = mul nsw i32 16, %9, !dbg !708
  %10 = load i32, i32* %ty, align 4, !dbg !709
  %add12 = add nsw i32 %mul11, %10, !dbg !710
  %add13 = add nsw i32 %add12, 1, !dbg !711
  store i32 %add13, i32* %index_in, align 4, !dbg !706
  %11 = load i32, i32* %tx, align 4, !dbg !712
  %cmp = icmp eq i32 %11, 0, !dbg !714
  br i1 %cmp, label %if.then, label %if.end, !dbg !715

if.then:                                          ; preds = %entry
  %12 = load float*, float** %input_cuda.addr, align 8, !dbg !716
  %13 = load i32, i32* %index_in, align 4, !dbg !717
  %idxprom = sext i32 %13 to i64, !dbg !716
  %arrayidx = getelementptr inbounds float, float* %12, i64 %idxprom, !dbg !716
  %14 = load float, float* %arrayidx, align 4, !dbg !716
  %15 = load i32, i32* %ty, align 4, !dbg !718
  %idxprom14 = sext i32 %15 to i64, !dbg !719
  %arrayidx15 = getelementptr inbounds [16 x float], [16 x float]* addrspacecast ([16 x float] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE10input_node to [16 x float]*), i64 0, i64 %idxprom14, !dbg !719
  store float %14, float* %arrayidx15, align 4, !dbg !720
  br label %if.end, !dbg !719

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.nvvm.barrier0(), !dbg !721
  %16 = load float*, float** %input_hidden_cuda.addr, align 8, !dbg !722
  %17 = load i32, i32* %index, align 4, !dbg !723
  %idxprom16 = sext i32 %17 to i64, !dbg !722
  %arrayidx17 = getelementptr inbounds float, float* %16, i64 %idxprom16, !dbg !722
  %18 = load float, float* %arrayidx17, align 4, !dbg !722
  %19 = load i32, i32* %ty, align 4, !dbg !724
  %idxprom18 = sext i32 %19 to i64, !dbg !725
  %arrayidx19 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom18, !dbg !725
  %20 = load i32, i32* %tx, align 4, !dbg !726
  %idxprom20 = sext i32 %20 to i64, !dbg !725
  %arrayidx21 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx19, i64 0, i64 %idxprom20, !dbg !725
  store float %18, float* %arrayidx21, align 4, !dbg !727
  call void @llvm.nvvm.barrier0(), !dbg !728
  %21 = load i32, i32* %ty, align 4, !dbg !729
  %idxprom22 = sext i32 %21 to i64, !dbg !730
  %arrayidx23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom22, !dbg !730
  %22 = load i32, i32* %tx, align 4, !dbg !731
  %idxprom24 = sext i32 %22 to i64, !dbg !730
  %arrayidx25 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx23, i64 0, i64 %idxprom24, !dbg !730
  %23 = load float, float* %arrayidx25, align 4, !dbg !730
  %24 = load i32, i32* %ty, align 4, !dbg !732
  %idxprom26 = sext i32 %24 to i64, !dbg !733
  %arrayidx27 = getelementptr inbounds [16 x float], [16 x float]* addrspacecast ([16 x float] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE10input_node to [16 x float]*), i64 0, i64 %idxprom26, !dbg !733
  %25 = load float, float* %arrayidx27, align 4, !dbg !733
  %mul28 = fmul float %23, %25, !dbg !734
  %26 = load i32, i32* %ty, align 4, !dbg !735
  %idxprom29 = sext i32 %26 to i64, !dbg !736
  %arrayidx30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom29, !dbg !736
  %27 = load i32, i32* %tx, align 4, !dbg !737
  %idxprom31 = sext i32 %27 to i64, !dbg !736
  %arrayidx32 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx30, i64 0, i64 %idxprom31, !dbg !736
  store float %mul28, float* %arrayidx32, align 4, !dbg !738
  call void @llvm.nvvm.barrier0(), !dbg !739
  call void @llvm.dbg.declare(metadata i32* %i, metadata !740, metadata !586), !dbg !741
  store i32 1, i32* %i, align 4, !dbg !741
  br label %for.cond, !dbg !742

for.cond:                                         ; preds = %for.inc, %if.end
  %28 = load i32, i32* %i, align 4, !dbg !743
  %conv = sitofp i32 %28 to float, !dbg !743
  store float 1.600000e+01, float* %a.addr.i72, align 4, !dbg !744
  %29 = load float, float* %a.addr.i72, align 4, !dbg !745
  %30 = call float @llvm.nvvm.lg2.approx.f(float %29) #3, !dbg !746
  %cmp34 = fcmp ole float %conv, %30, !dbg !747
  br i1 %cmp34, label %for.body, label %for.end, !dbg !748

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %power_two, metadata !749, metadata !586), !dbg !750
  %31 = load i32, i32* %i, align 4, !dbg !751
  %conv35 = sitofp i32 %31 to float, !dbg !751
  store float 2.000000e+00, float* %a.addr.i, align 4, !dbg !752
  store float %conv35, float* %b.addr.i, align 4, !dbg !752
  %32 = load float, float* %a.addr.i, align 4, !dbg !753
  %33 = load float, float* %b.addr.i, align 4, !dbg !754
  %34 = call float @llvm.nvvm.lg2.approx.f(float %32) #3, !dbg !755
  %35 = fmul float %33, %34, !dbg !755
  %36 = call float @llvm.nvvm.ex2.approx.f(float %35) #3, !dbg !755
  %conv37 = fptosi float %36 to i32, !dbg !752
  store i32 %conv37, i32* %power_two, align 4, !dbg !750
  %37 = load i32, i32* %ty, align 4, !dbg !756
  %38 = load i32, i32* %power_two, align 4, !dbg !758
  %rem = srem i32 %37, %38, !dbg !759
  %cmp38 = icmp eq i32 %rem, 0, !dbg !760
  br i1 %cmp38, label %if.then39, label %if.end54, !dbg !761

if.then39:                                        ; preds = %for.body
  %39 = load i32, i32* %ty, align 4, !dbg !762
  %idxprom40 = sext i32 %39 to i64, !dbg !763
  %arrayidx41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom40, !dbg !763
  %40 = load i32, i32* %tx, align 4, !dbg !764
  %idxprom42 = sext i32 %40 to i64, !dbg !763
  %arrayidx43 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx41, i64 0, i64 %idxprom42, !dbg !763
  %41 = load float, float* %arrayidx43, align 4, !dbg !763
  %42 = load i32, i32* %ty, align 4, !dbg !765
  %43 = load i32, i32* %power_two, align 4, !dbg !766
  %div = sdiv i32 %43, 2, !dbg !767
  %add44 = add nsw i32 %42, %div, !dbg !768
  %idxprom45 = sext i32 %add44 to i64, !dbg !769
  %arrayidx46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom45, !dbg !769
  %44 = load i32, i32* %tx, align 4, !dbg !770
  %idxprom47 = sext i32 %44 to i64, !dbg !769
  %arrayidx48 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx46, i64 0, i64 %idxprom47, !dbg !769
  %45 = load float, float* %arrayidx48, align 4, !dbg !769
  %add49 = fadd float %41, %45, !dbg !771
  %46 = load i32, i32* %ty, align 4, !dbg !772
  %idxprom50 = sext i32 %46 to i64, !dbg !773
  %arrayidx51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom50, !dbg !773
  %47 = load i32, i32* %tx, align 4, !dbg !774
  %idxprom52 = sext i32 %47 to i64, !dbg !773
  %arrayidx53 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx51, i64 0, i64 %idxprom52, !dbg !773
  store float %add49, float* %arrayidx53, align 4, !dbg !775
  br label %if.end54, !dbg !773

if.end54:                                         ; preds = %if.then39, %for.body
  call void @llvm.nvvm.barrier0(), !dbg !776
  br label %for.inc, !dbg !777

for.inc:                                          ; preds = %if.end54
  %48 = load i32, i32* %i, align 4, !dbg !778
  %inc = add nsw i32 %48, 1, !dbg !778
  store i32 %inc, i32* %i, align 4, !dbg !778
  br label %for.cond, !dbg !780, !llvm.loop !781

for.end:                                          ; preds = %for.cond
  %49 = load i32, i32* %ty, align 4, !dbg !783
  %idxprom55 = sext i32 %49 to i64, !dbg !784
  %arrayidx56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom55, !dbg !784
  %50 = load i32, i32* %tx, align 4, !dbg !785
  %idxprom57 = sext i32 %50 to i64, !dbg !784
  %arrayidx58 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx56, i64 0, i64 %idxprom57, !dbg !784
  %51 = load float, float* %arrayidx58, align 4, !dbg !784
  %52 = load float*, float** %input_hidden_cuda.addr, align 8, !dbg !786
  %53 = load i32, i32* %index, align 4, !dbg !787
  %idxprom59 = sext i32 %53 to i64, !dbg !786
  %arrayidx60 = getelementptr inbounds float, float* %52, i64 %idxprom59, !dbg !786
  store float %51, float* %arrayidx60, align 4, !dbg !788
  call void @llvm.nvvm.barrier0(), !dbg !789
  %54 = load i32, i32* %tx, align 4, !dbg !790
  %cmp61 = icmp eq i32 %54, 0, !dbg !792
  br i1 %cmp61, label %if.then62, label %if.end71, !dbg !793

if.then62:                                        ; preds = %for.end
  %55 = load i32, i32* %tx, align 4, !dbg !794
  %idxprom63 = sext i32 %55 to i64, !dbg !796
  %arrayidx64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom63, !dbg !796
  %56 = load i32, i32* %ty, align 4, !dbg !797
  %idxprom65 = sext i32 %56 to i64, !dbg !796
  %arrayidx66 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx64, i64 0, i64 %idxprom65, !dbg !796
  %57 = load float, float* %arrayidx66, align 4, !dbg !796
  %58 = load float*, float** %hidden_partial_sum.addr, align 8, !dbg !798
  %59 = load i32, i32* %by, align 4, !dbg !799
  %60 = load i32, i32* %hid.addr, align 4, !dbg !800
  %mul67 = mul nsw i32 %59, %60, !dbg !801
  %61 = load i32, i32* %ty, align 4, !dbg !802
  %add68 = add nsw i32 %mul67, %61, !dbg !803
  %idxprom69 = sext i32 %add68 to i64, !dbg !798
  %arrayidx70 = getelementptr inbounds float, float* %58, i64 %idxprom69, !dbg !798
  store float %57, float* %arrayidx70, align 4, !dbg !804
  br label %if.end71, !dbg !805

if.end71:                                         ; preds = %if.then62, %for.end
  ret void, !dbg !806
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: convergent nounwind
define void @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_(float* %delta, i32 %hid, float* %ly, i32 %in, float* %w, float* %oldw) #0 !dbg !807 {
entry:
  %delta.addr = alloca float*, align 8
  %hid.addr = alloca i32, align 4
  %ly.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %w.addr = alloca float*, align 8
  %oldw.addr = alloca float*, align 8
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_y = alloca i32, align 4
  %index_x = alloca i32, align 4
  store float* %delta, float** %delta.addr, align 8
  call void @llvm.dbg.declare(metadata float** %delta.addr, metadata !810, metadata !586), !dbg !811
  store i32 %hid, i32* %hid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %hid.addr, metadata !812, metadata !586), !dbg !813
  store float* %ly, float** %ly.addr, align 8
  call void @llvm.dbg.declare(metadata float** %ly.addr, metadata !814, metadata !586), !dbg !815
  store i32 %in, i32* %in.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %in.addr, metadata !816, metadata !586), !dbg !817
  store float* %w, float** %w.addr, align 8
  call void @llvm.dbg.declare(metadata float** %w.addr, metadata !818, metadata !586), !dbg !819
  store float* %oldw, float** %oldw.addr, align 8
  call void @llvm.dbg.declare(metadata float** %oldw.addr, metadata !820, metadata !586), !dbg !821
  call void @llvm.dbg.declare(metadata i32* %by, metadata !822, metadata !586), !dbg !823
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !824, !range !650
  store i32 %0, i32* %by, align 4, !dbg !823
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !826, metadata !586), !dbg !827
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !828, !range !681
  store i32 %1, i32* %tx, align 4, !dbg !827
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !830, metadata !586), !dbg !831
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !832, !range !681
  store i32 %2, i32* %ty, align 4, !dbg !831
  call void @llvm.dbg.declare(metadata i32* %index, metadata !834, metadata !586), !dbg !835
  %3 = load i32, i32* %hid.addr, align 4, !dbg !836
  %add = add nsw i32 %3, 1, !dbg !837
  %mul = mul nsw i32 %add, 16, !dbg !838
  %4 = load i32, i32* %by, align 4, !dbg !839
  %mul3 = mul nsw i32 %mul, %4, !dbg !840
  %5 = load i32, i32* %hid.addr, align 4, !dbg !841
  %add4 = add nsw i32 %5, 1, !dbg !842
  %6 = load i32, i32* %ty, align 4, !dbg !843
  %mul5 = mul nsw i32 %add4, %6, !dbg !844
  %add6 = add nsw i32 %mul3, %mul5, !dbg !845
  %7 = load i32, i32* %tx, align 4, !dbg !846
  %add7 = add nsw i32 %add6, %7, !dbg !847
  %add8 = add nsw i32 %add7, 1, !dbg !848
  %8 = load i32, i32* %hid.addr, align 4, !dbg !849
  %add9 = add nsw i32 %8, 1, !dbg !850
  %add10 = add nsw i32 %add8, %add9, !dbg !851
  store i32 %add10, i32* %index, align 4, !dbg !835
  call void @llvm.dbg.declare(metadata i32* %index_y, metadata !852, metadata !586), !dbg !853
  %9 = load i32, i32* %by, align 4, !dbg !854
  %mul11 = mul nsw i32 16, %9, !dbg !855
  %10 = load i32, i32* %ty, align 4, !dbg !856
  %add12 = add nsw i32 %mul11, %10, !dbg !857
  %add13 = add nsw i32 %add12, 1, !dbg !858
  store i32 %add13, i32* %index_y, align 4, !dbg !853
  call void @llvm.dbg.declare(metadata i32* %index_x, metadata !859, metadata !586), !dbg !860
  %11 = load i32, i32* %tx, align 4, !dbg !861
  %add14 = add nsw i32 %11, 1, !dbg !862
  store i32 %add14, i32* %index_x, align 4, !dbg !860
  %12 = load float*, float** %delta.addr, align 8, !dbg !863
  %13 = load i32, i32* %index_x, align 4, !dbg !864
  %idxprom = sext i32 %13 to i64, !dbg !863
  %arrayidx = getelementptr inbounds float, float* %12, i64 %idxprom, !dbg !863
  %14 = load float, float* %arrayidx, align 4, !dbg !863
  %conv = fpext float %14 to double, !dbg !863
  %mul15 = fmul double 3.000000e-01, %conv, !dbg !865
  %15 = load float*, float** %ly.addr, align 8, !dbg !866
  %16 = load i32, i32* %index_y, align 4, !dbg !867
  %idxprom16 = sext i32 %16 to i64, !dbg !866
  %arrayidx17 = getelementptr inbounds float, float* %15, i64 %idxprom16, !dbg !866
  %17 = load float, float* %arrayidx17, align 4, !dbg !866
  %conv18 = fpext float %17 to double, !dbg !866
  %mul19 = fmul double %mul15, %conv18, !dbg !868
  %18 = load float*, float** %oldw.addr, align 8, !dbg !869
  %19 = load i32, i32* %index, align 4, !dbg !870
  %idxprom20 = sext i32 %19 to i64, !dbg !869
  %arrayidx21 = getelementptr inbounds float, float* %18, i64 %idxprom20, !dbg !869
  %20 = load float, float* %arrayidx21, align 4, !dbg !869
  %conv22 = fpext float %20 to double, !dbg !869
  %mul23 = fmul double 3.000000e-01, %conv22, !dbg !871
  %add24 = fadd double %mul19, %mul23, !dbg !872
  %21 = load float*, float** %w.addr, align 8, !dbg !873
  %22 = load i32, i32* %index, align 4, !dbg !874
  %idxprom25 = sext i32 %22 to i64, !dbg !873
  %arrayidx26 = getelementptr inbounds float, float* %21, i64 %idxprom25, !dbg !873
  %23 = load float, float* %arrayidx26, align 4, !dbg !875
  %conv27 = fpext float %23 to double, !dbg !875
  %add28 = fadd double %conv27, %add24, !dbg !875
  %conv29 = fptrunc double %add28 to float, !dbg !875
  store float %conv29, float* %arrayidx26, align 4, !dbg !875
  %24 = load float*, float** %delta.addr, align 8, !dbg !876
  %25 = load i32, i32* %index_x, align 4, !dbg !877
  %idxprom30 = sext i32 %25 to i64, !dbg !876
  %arrayidx31 = getelementptr inbounds float, float* %24, i64 %idxprom30, !dbg !876
  %26 = load float, float* %arrayidx31, align 4, !dbg !876
  %conv32 = fpext float %26 to double, !dbg !876
  %mul33 = fmul double 3.000000e-01, %conv32, !dbg !878
  %27 = load float*, float** %ly.addr, align 8, !dbg !879
  %28 = load i32, i32* %index_y, align 4, !dbg !880
  %idxprom34 = sext i32 %28 to i64, !dbg !879
  %arrayidx35 = getelementptr inbounds float, float* %27, i64 %idxprom34, !dbg !879
  %29 = load float, float* %arrayidx35, align 4, !dbg !879
  %conv36 = fpext float %29 to double, !dbg !879
  %mul37 = fmul double %mul33, %conv36, !dbg !881
  %30 = load float*, float** %oldw.addr, align 8, !dbg !882
  %31 = load i32, i32* %index, align 4, !dbg !883
  %idxprom38 = sext i32 %31 to i64, !dbg !882
  %arrayidx39 = getelementptr inbounds float, float* %30, i64 %idxprom38, !dbg !882
  %32 = load float, float* %arrayidx39, align 4, !dbg !882
  %conv40 = fpext float %32 to double, !dbg !882
  %mul41 = fmul double 3.000000e-01, %conv40, !dbg !884
  %add42 = fadd double %mul37, %mul41, !dbg !885
  %conv43 = fptrunc double %add42 to float, !dbg !886
  %33 = load float*, float** %oldw.addr, align 8, !dbg !887
  %34 = load i32, i32* %index, align 4, !dbg !888
  %idxprom44 = sext i32 %34 to i64, !dbg !887
  %arrayidx45 = getelementptr inbounds float, float* %33, i64 %idxprom44, !dbg !887
  store float %conv43, float* %arrayidx45, align 4, !dbg !889
  call void @llvm.nvvm.barrier0(), !dbg !890
  %35 = load i32, i32* %ty, align 4, !dbg !891
  %cmp = icmp eq i32 %35, 0, !dbg !893
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !894

land.lhs.true:                                    ; preds = %entry
  %36 = load i32, i32* %by, align 4, !dbg !895
  %cmp46 = icmp eq i32 %36, 0, !dbg !897
  br i1 %cmp46, label %if.then, label %if.end, !dbg !898

if.then:                                          ; preds = %land.lhs.true
  %37 = load float*, float** %delta.addr, align 8, !dbg !899
  %38 = load i32, i32* %index_x, align 4, !dbg !901
  %idxprom47 = sext i32 %38 to i64, !dbg !899
  %arrayidx48 = getelementptr inbounds float, float* %37, i64 %idxprom47, !dbg !899
  %39 = load float, float* %arrayidx48, align 4, !dbg !899
  %conv49 = fpext float %39 to double, !dbg !899
  %mul50 = fmul double 3.000000e-01, %conv49, !dbg !902
  %40 = load float*, float** %oldw.addr, align 8, !dbg !903
  %41 = load i32, i32* %index_x, align 4, !dbg !904
  %idxprom51 = sext i32 %41 to i64, !dbg !903
  %arrayidx52 = getelementptr inbounds float, float* %40, i64 %idxprom51, !dbg !903
  %42 = load float, float* %arrayidx52, align 4, !dbg !903
  %conv53 = fpext float %42 to double, !dbg !903
  %mul54 = fmul double 3.000000e-01, %conv53, !dbg !905
  %add55 = fadd double %mul50, %mul54, !dbg !906
  %43 = load float*, float** %w.addr, align 8, !dbg !907
  %44 = load i32, i32* %index_x, align 4, !dbg !908
  %idxprom56 = sext i32 %44 to i64, !dbg !907
  %arrayidx57 = getelementptr inbounds float, float* %43, i64 %idxprom56, !dbg !907
  %45 = load float, float* %arrayidx57, align 4, !dbg !909
  %conv58 = fpext float %45 to double, !dbg !909
  %add59 = fadd double %conv58, %add55, !dbg !909
  %conv60 = fptrunc double %add59 to float, !dbg !909
  store float %conv60, float* %arrayidx57, align 4, !dbg !909
  %46 = load float*, float** %delta.addr, align 8, !dbg !910
  %47 = load i32, i32* %index_x, align 4, !dbg !911
  %idxprom61 = sext i32 %47 to i64, !dbg !910
  %arrayidx62 = getelementptr inbounds float, float* %46, i64 %idxprom61, !dbg !910
  %48 = load float, float* %arrayidx62, align 4, !dbg !910
  %conv63 = fpext float %48 to double, !dbg !910
  %mul64 = fmul double 3.000000e-01, %conv63, !dbg !912
  %49 = load float*, float** %oldw.addr, align 8, !dbg !913
  %50 = load i32, i32* %index_x, align 4, !dbg !914
  %idxprom65 = sext i32 %50 to i64, !dbg !913
  %arrayidx66 = getelementptr inbounds float, float* %49, i64 %idxprom65, !dbg !913
  %51 = load float, float* %arrayidx66, align 4, !dbg !913
  %conv67 = fpext float %51 to double, !dbg !913
  %mul68 = fmul double 3.000000e-01, %conv67, !dbg !915
  %add69 = fadd double %mul64, %mul68, !dbg !916
  %conv70 = fptrunc double %add69 to float, !dbg !917
  %52 = load float*, float** %oldw.addr, align 8, !dbg !918
  %53 = load i32, i32* %index_x, align 4, !dbg !919
  %idxprom71 = sext i32 %53 to i64, !dbg !918
  %arrayidx72 = getelementptr inbounds float, float* %52, i64 %idxprom71, !dbg !918
  store float %conv70, float* %arrayidx72, align 4, !dbg !920
  br label %if.end, !dbg !921

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void, !dbg !922
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

declare i32 @__nvvm_reflect(i8*)

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.lg2.approx.ftz.f(float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.lg2.approx.f(float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.ex2.approx.f(float) #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!8}
!nvvm.annotations = !{!573, !574, !575, !576, !575, !577, !577, !577, !577, !578, !578, !577}
!llvm.module.flags = !{!579, !580, !581}
!llvm.ident = !{!582}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!583}

!0 = distinct !DIGlobalVariable(name: "input_node", scope: !1, file: !2, line: 28, type: !571, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "bpnn_layerforward_CUDA", linkageName: "_Z22bpnn_layerforward_CUDAPfS_S_S_ii", scope: !2, file: !2, line: 13, type: !3, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !10)
!2 = !DIFile(filename: "./backprop_cuda_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !5, !5, !5, !7, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!7 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!8 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !9, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, globals: !11, imports: !16)
!9 = !DIFile(filename: "backprop_cuda.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!10 = !{}
!11 = !{!0, !12}
!12 = distinct !DIGlobalVariable(name: "weight_matrix", scope: !1, file: !2, line: 29, type: !13, isLocal: true, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8192, align: 32, elements: !14)
!14 = !{!15, !15}
!15 = !DISubrange(count: 16)
!16 = !{!17, !24, !28, !30, !32, !34, !36, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !72, !74, !76, !78, !82, !87, !89, !91, !96, !100, !102, !104, !106, !108, !110, !112, !114, !116, !121, !125, !127, !129, !133, !135, !137, !139, !141, !143, !147, !149, !151, !155, !163, !167, !169, !171, !175, !177, !179, !183, !185, !187, !191, !193, !195, !197, !199, !201, !203, !205, !207, !209, !214, !216, !218, !222, !224, !226, !228, !230, !232, !234, !236, !240, !244, !246, !248, !253, !255, !257, !259, !261, !263, !265, !269, !275, !279, !283, !288, !290, !294, !298, !312, !316, !320, !324, !328, !333, !335, !339, !343, !347, !355, !359, !363, !367, !371, !376, !382, !386, !390, !392, !400, !404, !412, !414, !416, !420, !424, !428, !433, !437, !442, !443, !444, !445, !448, !449, !450, !451, !452, !453, !454, !457, !459, !461, !463, !465, !467, !469, !471, !474, !476, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !542, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569}
!17 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !20, line: 189)
!18 = !DINamespace(name: "std", scope: null, file: !19, line: 188)
!19 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!20 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !19, file: !19, line: 44, type: !21, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!21 = !DISubroutineType(types: !22)
!22 = !{!23, !23}
!23 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !25, line: 190)
!25 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !19, file: !19, line: 46, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DISubroutineType(types: !27)
!27 = !{!6, !6}
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
!39 = !{!6, !6, !6}
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
!71 = !{!6, !6, !6, !6}
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !73, line: 211)
!73 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !19, file: !19, line: 88, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !75, line: 212)
!75 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !19, file: !19, line: 90, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !77, line: 213)
!77 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !19, file: !19, line: 92, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !79, line: 214)
!79 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !19, file: !19, line: 94, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !6}
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !83, line: 215)
!83 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !19, file: !19, line: 96, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DISubroutineType(types: !85)
!85 = !{!6, !6, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !88, line: 216)
!88 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !19, file: !19, line: 98, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !90, line: 217)
!90 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !19, file: !19, line: 100, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !92, line: 218)
!92 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !19, file: !19, line: 102, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !6}
!95 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !97, line: 219)
!97 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !19, file: !19, line: 106, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!95, !6, !6}
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
!124 = !{!6, !6, !7}
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !126, line: 230)
!126 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !19, file: !19, line: 125, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !128, line: 231)
!128 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !19, file: !19, line: 126, type: !21, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !130, line: 232)
!130 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !19, file: !19, line: 128, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!23, !6}
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
!146 = !{!120, !6}
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !148, line: 239)
!148 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !19, file: !19, line: 142, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !150, line: 240)
!150 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !19, file: !19, line: 143, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !152, line: 241)
!152 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !19, file: !19, line: 145, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!6, !6, !5}
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
!166 = !{!6, !160}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !168, line: 244)
!168 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !19, file: !19, line: 149, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !170, line: 245)
!170 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !19, file: !19, line: 151, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !172, line: 246)
!172 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !19, file: !19, line: 153, type: !173, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{!6, !6, !159}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !176, line: 247)
!176 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !19, file: !19, line: 158, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !178, line: 248)
!178 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !19, file: !19, line: 160, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !180, line: 249)
!180 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !19, file: !19, line: 162, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!6, !6, !6, !86}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !184, line: 250)
!184 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !19, file: !19, line: 164, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !186, line: 251)
!186 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !19, file: !19, line: 166, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !188, line: 252)
!188 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !19, file: !19, line: 168, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!6, !6, !120}
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
!211 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
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
!243 = !{!159, !159, !7}
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
!267 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
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
!282 = !{!7, !7}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !284, line: 123)
!284 = !DISubprogram(name: "atexit", scope: !267, file: !267, line: 519, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DISubroutineType(types: !286)
!286 = !{!7, !287}
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64, align: 64)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !289, line: 129)
!289 = !DISubprogram(name: "atof", scope: !267, file: !267, line: 144, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !291, line: 130)
!291 = !DISubprogram(name: "atoi", scope: !267, file: !267, line: 147, type: !292, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DISubroutineType(types: !293)
!293 = !{!7, !160}
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
!306 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!307 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !267, line: 741, baseType: !309)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64, align: 64)
!310 = !DISubroutineType(types: !311)
!311 = !{!7, !303, !303}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !313, line: 133)
!313 = !DISubprogram(name: "calloc", scope: !267, file: !267, line: 468, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DISubroutineType(types: !315)
!315 = !{!302, !305, !305}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !317, line: 134)
!317 = !DISubprogram(name: "div", scope: !267, file: !267, line: 788, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{!266, !7, !7}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !321, line: 135)
!321 = !DISubprogram(name: "exit", scope: !267, file: !267, line: 543, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !7}
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
!346 = !{!7, !160, !305}
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
!358 = !{!7, !351, !354, !305}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !360, line: 146)
!360 = !DISubprogram(name: "qsort", scope: !267, file: !267, line: 764, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{null, !302, !305, !305, !308}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !364, line: 152)
!364 = !DISubprogram(name: "rand", scope: !267, file: !267, line: 374, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!7}
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
!385 = !{!120, !354, !380, !7}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !387, line: 157)
!387 = !DISubprogram(name: "strtoul", scope: !267, file: !267, line: 187, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!307, !354, !380, !7}
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
!403 = !{!7, !332, !353}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !407, line: 214)
!405 = !DINamespace(name: "__gnu_cxx", scope: null, file: !406, line: 220)
!406 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
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
!427 = !{!23, !354, !380, !7}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !429, line: 243)
!429 = !DISubprogram(name: "strtoull", scope: !267, file: !267, line: 214, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!432, !354, !380, !7}
!432 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !434, line: 245)
!434 = !DISubprogram(name: "strtof", scope: !267, file: !267, line: 172, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!6, !354, !380}
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
!447 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !417, line: 260)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !421, line: 262)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !434, line: 263)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !425, line: 264)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !429, line: 265)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !438, line: 266)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !455, line: 397)
!455 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !456, file: !456, line: 1342, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
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
!473 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
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
!541 = !{!6, !6, !441}
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
!571 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, align: 32, elements: !572)
!572 = !{!15}
!573 = !{void (float*, float*, float*, float*, i32, i32)* @_Z22bpnn_layerforward_CUDAPfS_S_S_ii, !"kernel", i32 1}
!574 = !{void (float*, i32, float*, i32, float*, float*)* @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_, !"kernel", i32 1}
!575 = !{null, !"align", i32 8}
!576 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!577 = !{null, !"align", i32 16}
!578 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!579 = !{i32 2, !"Dwarf Version", i32 4}
!580 = !{i32 2, !"Debug Info Version", i32 3}
!581 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!582 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!583 = !{i32 1, i32 2}
!584 = !DILocalVariable(name: "a", arg: 1, scope: !585, file: !473, line: 1421, type: !6)
!585 = distinct !DISubprogram(name: "__log2f", linkageName: "_ZL7__log2ff", scope: !473, file: !473, line: 1421, type: !26, isLocal: true, isDefinition: true, scopeLine: 1422, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !10)
!586 = !DIExpression()
!587 = !DILocation(line: 1421, column: 54, scope: !585, inlinedAt: !588)
!588 = distinct !DILocation(line: 45, column: 27, scope: !589)
!589 = !DILexicalBlockFile(scope: !590, file: !2, discriminator: 1)
!590 = distinct !DILexicalBlock(scope: !591, file: !2, line: 45, column: 4)
!591 = distinct !DILexicalBlock(scope: !1, file: !2, line: 45, column: 4)
!592 = !DILocalVariable(name: "a", arg: 1, scope: !593, file: !473, line: 1462, type: !6)
!593 = distinct !DISubprogram(name: "__powf", linkageName: "_ZL6__powfff", scope: !473, file: !473, line: 1462, type: !38, isLocal: true, isDefinition: true, scopeLine: 1463, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !10)
!594 = !DILocation(line: 1462, column: 53, scope: !593, inlinedAt: !595)
!595 = distinct !DILocation(line: 47, column: 21, scope: !596)
!596 = distinct !DILexicalBlock(scope: !590, file: !2, line: 45, column: 49)
!597 = !DILocalVariable(name: "b", arg: 2, scope: !593, file: !473, line: 1462, type: !6)
!598 = !DILocation(line: 1462, column: 62, scope: !593, inlinedAt: !595)
!599 = !DILocalVariable(name: "input_cuda", arg: 1, scope: !1, file: !2, line: 13, type: !5)
!600 = !DILocation(line: 13, column: 31, scope: !1)
!601 = !DILocalVariable(name: "output_hidden_cuda", arg: 2, scope: !1, file: !2, line: 14, type: !5)
!602 = !DILocation(line: 14, column: 28, scope: !1)
!603 = !DILocalVariable(name: "input_hidden_cuda", arg: 3, scope: !1, file: !2, line: 15, type: !5)
!604 = !DILocation(line: 15, column: 16, scope: !1)
!605 = !DILocalVariable(name: "hidden_partial_sum", arg: 4, scope: !1, file: !2, line: 16, type: !5)
!606 = !DILocation(line: 16, column: 16, scope: !1)
!607 = !DILocalVariable(name: "in", arg: 5, scope: !1, file: !2, line: 17, type: !7)
!608 = !DILocation(line: 17, column: 13, scope: !1)
!609 = !DILocalVariable(name: "hid", arg: 6, scope: !1, file: !2, line: 18, type: !7)
!610 = !DILocation(line: 18, column: 13, scope: !1)
!611 = !DILocalVariable(name: "by", scope: !1, file: !2, line: 20, type: !7)
!612 = !DILocation(line: 20, column: 8, scope: !1)
!613 = !DILocation(line: 79, column: 3, scope: !614, inlinedAt: !649)
!614 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !616, file: !615, line: 79, type: !619, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !621, variables: !10)
!615 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!616 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !615, line: 77, size: 8, align: 8, elements: !617, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!617 = !{!618, !621, !622, !623, !634, !638, !642, !645}
!618 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !616, file: !615, line: 78, type: !619, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!619 = !DISubroutineType(types: !620)
!620 = !{!375}
!621 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !616, file: !615, line: 79, type: !619, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !616, file: !615, line: 80, type: !619, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!623 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !616, file: !615, line: 83, type: !624, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DISubroutineType(types: !625)
!625 = !{!626, !632}
!626 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !627, line: 190, size: 96, align: 32, elements: !628, identifier: "_ZTS5uint3")
!627 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!628 = !{!629, !630, !631}
!629 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !626, file: !627, line: 192, baseType: !375, size: 32, align: 32)
!630 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !626, file: !627, line: 192, baseType: !375, size: 32, align: 32, offset: 32)
!631 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !626, file: !627, line: 192, baseType: !375, size: 32, align: 32, offset: 64)
!632 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !633, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!633 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !616)
!634 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !616, file: !615, line: 85, type: !635, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!635 = !DISubroutineType(types: !636)
!636 = !{null, !637}
!637 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !616, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!638 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !616, file: !615, line: 85, type: !639, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!639 = !DISubroutineType(types: !640)
!640 = !{null, !637, !641}
!641 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !633, size: 64, align: 64)
!642 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !616, file: !615, line: 85, type: !643, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!643 = !DISubroutineType(types: !644)
!644 = !{null, !632, !641}
!645 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !616, file: !615, line: 85, type: !646, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!646 = !DISubroutineType(types: !647)
!647 = !{!648, !632}
!648 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !616, size: 64, align: 64)
!649 = distinct !DILocation(line: 20, column: 13, scope: !1)
!650 = !{i32 0, i32 65535}
!651 = !DILocalVariable(name: "tx", scope: !1, file: !2, line: 21, type: !7)
!652 = !DILocation(line: 21, column: 8, scope: !1)
!653 = !DILocation(line: 67, column: 3, scope: !654, inlinedAt: !680)
!654 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !655, file: !615, line: 67, type: !619, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !657, variables: !10)
!655 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !615, line: 66, size: 8, align: 8, elements: !656, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!656 = !{!657, !658, !659, !660, !665, !669, !673, !676}
!657 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !655, file: !615, line: 67, type: !619, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!658 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !655, file: !615, line: 68, type: !619, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!659 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !655, file: !615, line: 69, type: !619, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!660 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !655, file: !615, line: 72, type: !661, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!661 = !DISubroutineType(types: !662)
!662 = !{!626, !663}
!663 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !664, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!664 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !655)
!665 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !655, file: !615, line: 74, type: !666, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!666 = !DISubroutineType(types: !667)
!667 = !{null, !668}
!668 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !655, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!669 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !655, file: !615, line: 74, type: !670, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!670 = !DISubroutineType(types: !671)
!671 = !{null, !668, !672}
!672 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !664, size: 64, align: 64)
!673 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !655, file: !615, line: 74, type: !674, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!674 = !DISubroutineType(types: !675)
!675 = !{null, !663, !672}
!676 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !655, file: !615, line: 74, type: !677, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!677 = !DISubroutineType(types: !678)
!678 = !{!679, !663}
!679 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !655, size: 64, align: 64)
!680 = distinct !DILocation(line: 21, column: 13, scope: !1)
!681 = !{i32 0, i32 1024}
!682 = !DILocalVariable(name: "ty", scope: !1, file: !2, line: 22, type: !7)
!683 = !DILocation(line: 22, column: 8, scope: !1)
!684 = !DILocation(line: 68, column: 3, scope: !685, inlinedAt: !686)
!685 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !655, file: !615, line: 68, type: !619, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !658, variables: !10)
!686 = distinct !DILocation(line: 22, column: 13, scope: !1)
!687 = !DILocalVariable(name: "index", scope: !1, file: !2, line: 24, type: !7)
!688 = !DILocation(line: 24, column: 8, scope: !1)
!689 = !DILocation(line: 24, column: 19, scope: !1)
!690 = !DILocation(line: 24, column: 23, scope: !1)
!691 = !DILocation(line: 24, column: 29, scope: !1)
!692 = !DILocation(line: 24, column: 40, scope: !1)
!693 = !DILocation(line: 24, column: 38, scope: !1)
!694 = !DILocation(line: 24, column: 47, scope: !1)
!695 = !DILocation(line: 24, column: 51, scope: !1)
!696 = !DILocation(line: 24, column: 59, scope: !1)
!697 = !DILocation(line: 24, column: 57, scope: !1)
!698 = !DILocation(line: 24, column: 43, scope: !1)
!699 = !DILocation(line: 24, column: 64, scope: !1)
!700 = !DILocation(line: 24, column: 62, scope: !1)
!701 = !DILocation(line: 24, column: 67, scope: !1)
!702 = !DILocation(line: 24, column: 75, scope: !1)
!703 = !DILocation(line: 24, column: 79, scope: !1)
!704 = !DILocation(line: 24, column: 71, scope: !1)
!705 = !DILocalVariable(name: "index_in", scope: !1, file: !2, line: 26, type: !7)
!706 = !DILocation(line: 26, column: 8, scope: !1)
!707 = !DILocation(line: 26, column: 28, scope: !1)
!708 = !DILocation(line: 26, column: 26, scope: !1)
!709 = !DILocation(line: 26, column: 33, scope: !1)
!710 = !DILocation(line: 26, column: 31, scope: !1)
!711 = !DILocation(line: 26, column: 36, scope: !1)
!712 = !DILocation(line: 32, column: 9, scope: !713)
!713 = distinct !DILexicalBlock(scope: !1, file: !2, line: 32, column: 9)
!714 = !DILocation(line: 32, column: 12, scope: !713)
!715 = !DILocation(line: 32, column: 9, scope: !1)
!716 = !DILocation(line: 33, column: 21, scope: !713)
!717 = !DILocation(line: 33, column: 32, scope: !713)
!718 = !DILocation(line: 33, column: 15, scope: !713)
!719 = !DILocation(line: 33, column: 4, scope: !713)
!720 = !DILocation(line: 33, column: 19, scope: !713)
!721 = !DILocation(line: 35, column: 4, scope: !1)
!722 = !DILocation(line: 37, column: 28, scope: !1)
!723 = !DILocation(line: 37, column: 46, scope: !1)
!724 = !DILocation(line: 37, column: 18, scope: !1)
!725 = !DILocation(line: 37, column: 4, scope: !1)
!726 = !DILocation(line: 37, column: 22, scope: !1)
!727 = !DILocation(line: 37, column: 26, scope: !1)
!728 = !DILocation(line: 39, column: 4, scope: !1)
!729 = !DILocation(line: 41, column: 42, scope: !1)
!730 = !DILocation(line: 41, column: 28, scope: !1)
!731 = !DILocation(line: 41, column: 46, scope: !1)
!732 = !DILocation(line: 41, column: 63, scope: !1)
!733 = !DILocation(line: 41, column: 52, scope: !1)
!734 = !DILocation(line: 41, column: 50, scope: !1)
!735 = !DILocation(line: 41, column: 18, scope: !1)
!736 = !DILocation(line: 41, column: 4, scope: !1)
!737 = !DILocation(line: 41, column: 22, scope: !1)
!738 = !DILocation(line: 41, column: 26, scope: !1)
!739 = !DILocation(line: 43, column: 4, scope: !1)
!740 = !DILocalVariable(name: "i", scope: !591, file: !2, line: 45, type: !7)
!741 = !DILocation(line: 45, column: 14, scope: !591)
!742 = !DILocation(line: 45, column: 10, scope: !591)
!743 = !DILocation(line: 45, column: 22, scope: !589)
!744 = !DILocation(line: 45, column: 27, scope: !589)
!745 = !DILocation(line: 1423, column: 26, scope: !585, inlinedAt: !588)
!746 = !DILocation(line: 1423, column: 10, scope: !585, inlinedAt: !588)
!747 = !DILocation(line: 45, column: 24, scope: !589)
!748 = !DILocation(line: 45, column: 4, scope: !589)
!749 = !DILocalVariable(name: "power_two", scope: !596, file: !2, line: 47, type: !7)
!750 = !DILocation(line: 47, column: 9, scope: !596)
!751 = !DILocation(line: 47, column: 31, scope: !596)
!752 = !DILocation(line: 47, column: 21, scope: !596)
!753 = !DILocation(line: 1464, column: 25, scope: !593, inlinedAt: !595)
!754 = !DILocation(line: 1464, column: 28, scope: !593, inlinedAt: !595)
!755 = !DILocation(line: 1464, column: 10, scope: !593, inlinedAt: !595)
!756 = !DILocation(line: 49, column: 9, scope: !757)
!757 = distinct !DILexicalBlock(scope: !596, file: !2, line: 49, column: 9)
!758 = !DILocation(line: 49, column: 14, scope: !757)
!759 = !DILocation(line: 49, column: 12, scope: !757)
!760 = !DILocation(line: 49, column: 24, scope: !757)
!761 = !DILocation(line: 49, column: 9, scope: !596)
!762 = !DILocation(line: 50, column: 43, scope: !757)
!763 = !DILocation(line: 50, column: 29, scope: !757)
!764 = !DILocation(line: 50, column: 47, scope: !757)
!765 = !DILocation(line: 50, column: 67, scope: !757)
!766 = !DILocation(line: 50, column: 72, scope: !757)
!767 = !DILocation(line: 50, column: 81, scope: !757)
!768 = !DILocation(line: 50, column: 70, scope: !757)
!769 = !DILocation(line: 50, column: 53, scope: !757)
!770 = !DILocation(line: 50, column: 85, scope: !757)
!771 = !DILocation(line: 50, column: 51, scope: !757)
!772 = !DILocation(line: 50, column: 19, scope: !757)
!773 = !DILocation(line: 50, column: 5, scope: !757)
!774 = !DILocation(line: 50, column: 23, scope: !757)
!775 = !DILocation(line: 50, column: 27, scope: !757)
!776 = !DILocation(line: 52, column: 5, scope: !596)
!777 = !DILocation(line: 54, column: 4, scope: !596)
!778 = !DILocation(line: 45, column: 46, scope: !779)
!779 = !DILexicalBlockFile(scope: !590, file: !2, discriminator: 2)
!780 = !DILocation(line: 45, column: 4, scope: !779)
!781 = distinct !{!781, !782}
!782 = !DILocation(line: 45, column: 4, scope: !1)
!783 = !DILocation(line: 58, column: 45, scope: !1)
!784 = !DILocation(line: 58, column: 31, scope: !1)
!785 = !DILocation(line: 58, column: 49, scope: !1)
!786 = !DILocation(line: 58, column: 4, scope: !1)
!787 = !DILocation(line: 58, column: 22, scope: !1)
!788 = !DILocation(line: 58, column: 29, scope: !1)
!789 = !DILocation(line: 72, column: 4, scope: !1)
!790 = !DILocation(line: 74, column: 9, scope: !791)
!791 = distinct !DILexicalBlock(scope: !1, file: !2, line: 74, column: 9)
!792 = !DILocation(line: 74, column: 12, scope: !791)
!793 = !DILocation(line: 74, column: 9, scope: !1)
!794 = !DILocation(line: 75, column: 55, scope: !795)
!795 = distinct !DILexicalBlock(scope: !791, file: !2, line: 74, column: 19)
!796 = !DILocation(line: 75, column: 41, scope: !795)
!797 = !DILocation(line: 75, column: 59, scope: !795)
!798 = !DILocation(line: 75, column: 5, scope: !795)
!799 = !DILocation(line: 75, column: 24, scope: !795)
!800 = !DILocation(line: 75, column: 29, scope: !795)
!801 = !DILocation(line: 75, column: 27, scope: !795)
!802 = !DILocation(line: 75, column: 35, scope: !795)
!803 = !DILocation(line: 75, column: 33, scope: !795)
!804 = !DILocation(line: 75, column: 39, scope: !795)
!805 = !DILocation(line: 76, column: 4, scope: !795)
!806 = !DILocation(line: 78, column: 1, scope: !1)
!807 = distinct !DISubprogram(name: "bpnn_adjust_weights_cuda", linkageName: "_Z24bpnn_adjust_weights_cudaPfiS_iS_S_", scope: !2, file: !2, line: 81, type: !808, isLocal: false, isDefinition: true, scopeLine: 87, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !10)
!808 = !DISubroutineType(types: !809)
!809 = !{null, !5, !7, !5, !7, !5, !5}
!810 = !DILocalVariable(name: "delta", arg: 1, scope: !807, file: !2, line: 81, type: !5)
!811 = !DILocation(line: 81, column: 50, scope: !807)
!812 = !DILocalVariable(name: "hid", arg: 2, scope: !807, file: !2, line: 82, type: !7)
!813 = !DILocation(line: 82, column: 16, scope: !807)
!814 = !DILocalVariable(name: "ly", arg: 3, scope: !807, file: !2, line: 83, type: !5)
!815 = !DILocation(line: 83, column: 20, scope: !807)
!816 = !DILocalVariable(name: "in", arg: 4, scope: !807, file: !2, line: 84, type: !7)
!817 = !DILocation(line: 84, column: 16, scope: !807)
!818 = !DILocalVariable(name: "w", arg: 5, scope: !807, file: !2, line: 85, type: !5)
!819 = !DILocation(line: 85, column: 20, scope: !807)
!820 = !DILocalVariable(name: "oldw", arg: 6, scope: !807, file: !2, line: 86, type: !5)
!821 = !DILocation(line: 86, column: 20, scope: !807)
!822 = !DILocalVariable(name: "by", scope: !807, file: !2, line: 90, type: !7)
!823 = !DILocation(line: 90, column: 8, scope: !807)
!824 = !DILocation(line: 79, column: 3, scope: !614, inlinedAt: !825)
!825 = distinct !DILocation(line: 90, column: 13, scope: !807)
!826 = !DILocalVariable(name: "tx", scope: !807, file: !2, line: 92, type: !7)
!827 = !DILocation(line: 92, column: 8, scope: !807)
!828 = !DILocation(line: 67, column: 3, scope: !654, inlinedAt: !829)
!829 = distinct !DILocation(line: 92, column: 13, scope: !807)
!830 = !DILocalVariable(name: "ty", scope: !807, file: !2, line: 93, type: !7)
!831 = !DILocation(line: 93, column: 8, scope: !807)
!832 = !DILocation(line: 68, column: 3, scope: !685, inlinedAt: !833)
!833 = distinct !DILocation(line: 93, column: 13, scope: !807)
!834 = !DILocalVariable(name: "index", scope: !807, file: !2, line: 95, type: !7)
!835 = !DILocation(line: 95, column: 8, scope: !807)
!836 = !DILocation(line: 95, column: 19, scope: !807)
!837 = !DILocation(line: 95, column: 23, scope: !807)
!838 = !DILocation(line: 95, column: 29, scope: !807)
!839 = !DILocation(line: 95, column: 40, scope: !807)
!840 = !DILocation(line: 95, column: 38, scope: !807)
!841 = !DILocation(line: 95, column: 47, scope: !807)
!842 = !DILocation(line: 95, column: 51, scope: !807)
!843 = !DILocation(line: 95, column: 59, scope: !807)
!844 = !DILocation(line: 95, column: 57, scope: !807)
!845 = !DILocation(line: 95, column: 43, scope: !807)
!846 = !DILocation(line: 95, column: 64, scope: !807)
!847 = !DILocation(line: 95, column: 62, scope: !807)
!848 = !DILocation(line: 95, column: 67, scope: !807)
!849 = !DILocation(line: 95, column: 75, scope: !807)
!850 = !DILocation(line: 95, column: 79, scope: !807)
!851 = !DILocation(line: 95, column: 71, scope: !807)
!852 = !DILocalVariable(name: "index_y", scope: !807, file: !2, line: 96, type: !7)
!853 = !DILocation(line: 96, column: 8, scope: !807)
!854 = !DILocation(line: 96, column: 27, scope: !807)
!855 = !DILocation(line: 96, column: 25, scope: !807)
!856 = !DILocation(line: 96, column: 32, scope: !807)
!857 = !DILocation(line: 96, column: 30, scope: !807)
!858 = !DILocation(line: 96, column: 35, scope: !807)
!859 = !DILocalVariable(name: "index_x", scope: !807, file: !2, line: 97, type: !7)
!860 = !DILocation(line: 97, column: 8, scope: !807)
!861 = !DILocation(line: 97, column: 18, scope: !807)
!862 = !DILocation(line: 97, column: 21, scope: !807)
!863 = !DILocation(line: 101, column: 24, scope: !807)
!864 = !DILocation(line: 101, column: 30, scope: !807)
!865 = !DILocation(line: 101, column: 22, scope: !807)
!866 = !DILocation(line: 101, column: 41, scope: !807)
!867 = !DILocation(line: 101, column: 44, scope: !807)
!868 = !DILocation(line: 101, column: 39, scope: !807)
!869 = !DILocation(line: 101, column: 68, scope: !807)
!870 = !DILocation(line: 101, column: 73, scope: !807)
!871 = !DILocation(line: 101, column: 66, scope: !807)
!872 = !DILocation(line: 101, column: 54, scope: !807)
!873 = !DILocation(line: 101, column: 4, scope: !807)
!874 = !DILocation(line: 101, column: 6, scope: !807)
!875 = !DILocation(line: 101, column: 13, scope: !807)
!876 = !DILocation(line: 102, column: 26, scope: !807)
!877 = !DILocation(line: 102, column: 32, scope: !807)
!878 = !DILocation(line: 102, column: 24, scope: !807)
!879 = !DILocation(line: 102, column: 43, scope: !807)
!880 = !DILocation(line: 102, column: 46, scope: !807)
!881 = !DILocation(line: 102, column: 41, scope: !807)
!882 = !DILocation(line: 102, column: 70, scope: !807)
!883 = !DILocation(line: 102, column: 75, scope: !807)
!884 = !DILocation(line: 102, column: 68, scope: !807)
!885 = !DILocation(line: 102, column: 56, scope: !807)
!886 = !DILocation(line: 102, column: 18, scope: !807)
!887 = !DILocation(line: 102, column: 4, scope: !807)
!888 = !DILocation(line: 102, column: 9, scope: !807)
!889 = !DILocation(line: 102, column: 16, scope: !807)
!890 = !DILocation(line: 105, column: 4, scope: !807)
!891 = !DILocation(line: 107, column: 8, scope: !892)
!892 = distinct !DILexicalBlock(scope: !807, file: !2, line: 107, column: 8)
!893 = !DILocation(line: 107, column: 11, scope: !892)
!894 = !DILocation(line: 107, column: 16, scope: !892)
!895 = !DILocation(line: 107, column: 19, scope: !896)
!896 = !DILexicalBlockFile(scope: !892, file: !2, discriminator: 1)
!897 = !DILocation(line: 107, column: 22, scope: !896)
!898 = !DILocation(line: 107, column: 8, scope: !896)
!899 = !DILocation(line: 108, column: 26, scope: !900)
!900 = distinct !DILexicalBlock(scope: !892, file: !2, line: 107, column: 26)
!901 = !DILocation(line: 108, column: 32, scope: !900)
!902 = !DILocation(line: 108, column: 24, scope: !900)
!903 = !DILocation(line: 108, column: 56, scope: !900)
!904 = !DILocation(line: 108, column: 61, scope: !900)
!905 = !DILocation(line: 108, column: 54, scope: !900)
!906 = !DILocation(line: 108, column: 42, scope: !900)
!907 = !DILocation(line: 108, column: 4, scope: !900)
!908 = !DILocation(line: 108, column: 6, scope: !900)
!909 = !DILocation(line: 108, column: 15, scope: !900)
!910 = !DILocation(line: 109, column: 28, scope: !900)
!911 = !DILocation(line: 109, column: 34, scope: !900)
!912 = !DILocation(line: 109, column: 26, scope: !900)
!913 = !DILocation(line: 109, column: 58, scope: !900)
!914 = !DILocation(line: 109, column: 63, scope: !900)
!915 = !DILocation(line: 109, column: 56, scope: !900)
!916 = !DILocation(line: 109, column: 44, scope: !900)
!917 = !DILocation(line: 109, column: 20, scope: !900)
!918 = !DILocation(line: 109, column: 4, scope: !900)
!919 = !DILocation(line: 109, column: 9, scope: !900)
!920 = !DILocation(line: 109, column: 18, scope: !900)
!921 = !DILocation(line: 110, column: 4, scope: !900)
!922 = !DILocation(line: 113, column: 1, scope: !807)
