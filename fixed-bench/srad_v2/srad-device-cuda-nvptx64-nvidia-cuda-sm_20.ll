; ModuleID = 'srad.cu'
source_filename = "srad.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_gridDim_t = type { i8 }

@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !0
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !12
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !16
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !17
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !18
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !19
@gridDim = extern_weak addrspace(1) global %struct.__cuda_builtin_gridDim_t, align 1
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !20
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !24
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !25
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE13c_cuda_result = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !26
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE4temp = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4, !dbg !27

; Function Attrs: convergent nounwind
define void @_Z11srad_cuda_1PfS_S_S_S_S_iif(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %q0sqr) #0 !dbg !1 {
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
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_n = alloca i32, align 4
  %index_s = alloca i32, align 4
  %index_w = alloca i32, align 4
  %index_e = alloca i32, align 4
  %n = alloca float, align 4
  %w = alloca float, align 4
  %e = alloca float, align 4
  %s = alloca float, align 4
  %jc = alloca float, align 4
  %g2 = alloca float, align 4
  %l = alloca float, align 4
  %num = alloca float, align 4
  %den = alloca float, align 4
  %qsqr = alloca float, align 4
  %c = alloca float, align 4
  store float* %E_C, float** %E_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %E_C.addr, metadata !594, metadata !595), !dbg !596
  store float* %W_C, float** %W_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %W_C.addr, metadata !597, metadata !595), !dbg !598
  store float* %N_C, float** %N_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %N_C.addr, metadata !599, metadata !595), !dbg !600
  store float* %S_C, float** %S_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %S_C.addr, metadata !601, metadata !595), !dbg !602
  store float* %J_cuda, float** %J_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %J_cuda.addr, metadata !603, metadata !595), !dbg !604
  store float* %C_cuda, float** %C_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_cuda.addr, metadata !605, metadata !595), !dbg !606
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !607, metadata !595), !dbg !608
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !609, metadata !595), !dbg !610
  store float %q0sqr, float* %q0sqr.addr, align 4
  call void @llvm.dbg.declare(metadata float* %q0sqr.addr, metadata !611, metadata !595), !dbg !612
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !613, metadata !595), !dbg !614
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !615, !range !652
  store i32 %0, i32* %bx, align 4, !dbg !614
  call void @llvm.dbg.declare(metadata i32* %by, metadata !653, metadata !595), !dbg !654
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !655, !range !652
  store i32 %1, i32* %by, align 4, !dbg !654
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !658, metadata !595), !dbg !659
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !660, !range !688
  store i32 %2, i32* %tx, align 4, !dbg !659
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !689, metadata !595), !dbg !690
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !691, !range !688
  store i32 %3, i32* %ty, align 4, !dbg !690
  call void @llvm.dbg.declare(metadata i32* %index, metadata !694, metadata !595), !dbg !695
  %4 = load i32, i32* %cols.addr, align 4, !dbg !696
  %mul = mul nsw i32 %4, 16, !dbg !697
  %5 = load i32, i32* %by, align 4, !dbg !698
  %mul4 = mul nsw i32 %mul, %5, !dbg !699
  %6 = load i32, i32* %bx, align 4, !dbg !700
  %mul5 = mul nsw i32 16, %6, !dbg !701
  %add = add nsw i32 %mul4, %mul5, !dbg !702
  %7 = load i32, i32* %cols.addr, align 4, !dbg !703
  %8 = load i32, i32* %ty, align 4, !dbg !704
  %mul6 = mul nsw i32 %7, %8, !dbg !705
  %add7 = add nsw i32 %add, %mul6, !dbg !706
  %9 = load i32, i32* %tx, align 4, !dbg !707
  %add8 = add nsw i32 %add7, %9, !dbg !708
  store i32 %add8, i32* %index, align 4, !dbg !695
  call void @llvm.dbg.declare(metadata i32* %index_n, metadata !709, metadata !595), !dbg !710
  %10 = load i32, i32* %cols.addr, align 4, !dbg !711
  %mul9 = mul nsw i32 %10, 16, !dbg !712
  %11 = load i32, i32* %by, align 4, !dbg !713
  %mul10 = mul nsw i32 %mul9, %11, !dbg !714
  %12 = load i32, i32* %bx, align 4, !dbg !715
  %mul11 = mul nsw i32 16, %12, !dbg !716
  %add12 = add nsw i32 %mul10, %mul11, !dbg !717
  %13 = load i32, i32* %tx, align 4, !dbg !718
  %add13 = add nsw i32 %add12, %13, !dbg !719
  %14 = load i32, i32* %cols.addr, align 4, !dbg !720
  %sub = sub nsw i32 %add13, %14, !dbg !721
  store i32 %sub, i32* %index_n, align 4, !dbg !710
  call void @llvm.dbg.declare(metadata i32* %index_s, metadata !722, metadata !595), !dbg !723
  %15 = load i32, i32* %cols.addr, align 4, !dbg !724
  %mul14 = mul nsw i32 %15, 16, !dbg !725
  %16 = load i32, i32* %by, align 4, !dbg !726
  %mul15 = mul nsw i32 %mul14, %16, !dbg !727
  %17 = load i32, i32* %bx, align 4, !dbg !728
  %mul16 = mul nsw i32 16, %17, !dbg !729
  %add17 = add nsw i32 %mul15, %mul16, !dbg !730
  %18 = load i32, i32* %cols.addr, align 4, !dbg !731
  %mul18 = mul nsw i32 %18, 16, !dbg !732
  %add19 = add nsw i32 %add17, %mul18, !dbg !733
  %19 = load i32, i32* %tx, align 4, !dbg !734
  %add20 = add nsw i32 %add19, %19, !dbg !735
  store i32 %add20, i32* %index_s, align 4, !dbg !723
  call void @llvm.dbg.declare(metadata i32* %index_w, metadata !736, metadata !595), !dbg !737
  %20 = load i32, i32* %cols.addr, align 4, !dbg !738
  %mul21 = mul nsw i32 %20, 16, !dbg !739
  %21 = load i32, i32* %by, align 4, !dbg !740
  %mul22 = mul nsw i32 %mul21, %21, !dbg !741
  %22 = load i32, i32* %bx, align 4, !dbg !742
  %mul23 = mul nsw i32 16, %22, !dbg !743
  %add24 = add nsw i32 %mul22, %mul23, !dbg !744
  %23 = load i32, i32* %cols.addr, align 4, !dbg !745
  %24 = load i32, i32* %ty, align 4, !dbg !746
  %mul25 = mul nsw i32 %23, %24, !dbg !747
  %add26 = add nsw i32 %add24, %mul25, !dbg !748
  %sub27 = sub nsw i32 %add26, 1, !dbg !749
  store i32 %sub27, i32* %index_w, align 4, !dbg !737
  call void @llvm.dbg.declare(metadata i32* %index_e, metadata !750, metadata !595), !dbg !751
  %25 = load i32, i32* %cols.addr, align 4, !dbg !752
  %mul28 = mul nsw i32 %25, 16, !dbg !753
  %26 = load i32, i32* %by, align 4, !dbg !754
  %mul29 = mul nsw i32 %mul28, %26, !dbg !755
  %27 = load i32, i32* %bx, align 4, !dbg !756
  %mul30 = mul nsw i32 16, %27, !dbg !757
  %add31 = add nsw i32 %mul29, %mul30, !dbg !758
  %28 = load i32, i32* %cols.addr, align 4, !dbg !759
  %29 = load i32, i32* %ty, align 4, !dbg !760
  %mul32 = mul nsw i32 %28, %29, !dbg !761
  %add33 = add nsw i32 %add31, %mul32, !dbg !762
  %add34 = add nsw i32 %add33, 16, !dbg !763
  store i32 %add34, i32* %index_e, align 4, !dbg !751
  call void @llvm.dbg.declare(metadata float* %n, metadata !764, metadata !595), !dbg !765
  call void @llvm.dbg.declare(metadata float* %w, metadata !766, metadata !595), !dbg !767
  call void @llvm.dbg.declare(metadata float* %e, metadata !768, metadata !595), !dbg !769
  call void @llvm.dbg.declare(metadata float* %s, metadata !770, metadata !595), !dbg !771
  call void @llvm.dbg.declare(metadata float* %jc, metadata !772, metadata !595), !dbg !773
  call void @llvm.dbg.declare(metadata float* %g2, metadata !774, metadata !595), !dbg !775
  call void @llvm.dbg.declare(metadata float* %l, metadata !776, metadata !595), !dbg !777
  call void @llvm.dbg.declare(metadata float* %num, metadata !778, metadata !595), !dbg !779
  call void @llvm.dbg.declare(metadata float* %den, metadata !780, metadata !595), !dbg !781
  call void @llvm.dbg.declare(metadata float* %qsqr, metadata !782, metadata !595), !dbg !783
  call void @llvm.dbg.declare(metadata float* %c, metadata !784, metadata !595), !dbg !785
  %30 = load float*, float** %J_cuda.addr, align 8, !dbg !786
  %31 = load i32, i32* %index_n, align 4, !dbg !787
  %idxprom = sext i32 %31 to i64, !dbg !786
  %arrayidx = getelementptr inbounds float, float* %30, i64 %idxprom, !dbg !786
  %32 = load float, float* %arrayidx, align 4, !dbg !786
  %33 = load i32, i32* %ty, align 4, !dbg !788
  %idxprom35 = sext i32 %33 to i64, !dbg !789
  %arrayidx36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom35, !dbg !789
  %34 = load i32, i32* %tx, align 4, !dbg !790
  %idxprom37 = sext i32 %34 to i64, !dbg !789
  %arrayidx38 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx36, i64 0, i64 %idxprom37, !dbg !789
  store float %32, float* %arrayidx38, align 4, !dbg !791
  %35 = load float*, float** %J_cuda.addr, align 8, !dbg !792
  %36 = load i32, i32* %index_s, align 4, !dbg !793
  %idxprom39 = sext i32 %36 to i64, !dbg !792
  %arrayidx40 = getelementptr inbounds float, float* %35, i64 %idxprom39, !dbg !792
  %37 = load float, float* %arrayidx40, align 4, !dbg !792
  %38 = load i32, i32* %ty, align 4, !dbg !794
  %idxprom41 = sext i32 %38 to i64, !dbg !795
  %arrayidx42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom41, !dbg !795
  %39 = load i32, i32* %tx, align 4, !dbg !796
  %idxprom43 = sext i32 %39 to i64, !dbg !795
  %arrayidx44 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx42, i64 0, i64 %idxprom43, !dbg !795
  store float %37, float* %arrayidx44, align 4, !dbg !797
  %40 = load i32, i32* %by, align 4, !dbg !798
  %cmp = icmp eq i32 %40, 0, !dbg !800
  br i1 %cmp, label %if.then, label %if.else, !dbg !801

if.then:                                          ; preds = %entry
  %41 = load float*, float** %J_cuda.addr, align 8, !dbg !802
  %42 = load i32, i32* %bx, align 4, !dbg !804
  %mul45 = mul nsw i32 16, %42, !dbg !805
  %43 = load i32, i32* %tx, align 4, !dbg !806
  %add46 = add nsw i32 %mul45, %43, !dbg !807
  %idxprom47 = sext i32 %add46 to i64, !dbg !802
  %arrayidx48 = getelementptr inbounds float, float* %41, i64 %idxprom47, !dbg !802
  %44 = load float, float* %arrayidx48, align 4, !dbg !802
  %45 = load i32, i32* %ty, align 4, !dbg !808
  %idxprom49 = sext i32 %45 to i64, !dbg !809
  %arrayidx50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom49, !dbg !809
  %46 = load i32, i32* %tx, align 4, !dbg !810
  %idxprom51 = sext i32 %46 to i64, !dbg !809
  %arrayidx52 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx50, i64 0, i64 %idxprom51, !dbg !809
  store float %44, float* %arrayidx52, align 4, !dbg !811
  br label %if.end72, !dbg !812

if.else:                                          ; preds = %entry
  %47 = load i32, i32* %by, align 4, !dbg !813
  %48 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.y() #3, !dbg !815, !range !859
  %sub54 = sub i32 %48, 1, !dbg !860
  %cmp55 = icmp eq i32 %47, %sub54, !dbg !861
  br i1 %cmp55, label %if.then56, label %if.end, !dbg !862

if.then56:                                        ; preds = %if.else
  %49 = load float*, float** %J_cuda.addr, align 8, !dbg !863
  %50 = load i32, i32* %cols.addr, align 4, !dbg !865
  %mul57 = mul nsw i32 %50, 16, !dbg !866
  %51 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.y() #3, !dbg !867, !range !859
  %sub59 = sub i32 %51, 1, !dbg !869
  %mul60 = mul i32 %mul57, %sub59, !dbg !870
  %52 = load i32, i32* %bx, align 4, !dbg !871
  %mul61 = mul nsw i32 16, %52, !dbg !872
  %add62 = add i32 %mul60, %mul61, !dbg !873
  %53 = load i32, i32* %cols.addr, align 4, !dbg !874
  %mul63 = mul nsw i32 %53, 15, !dbg !875
  %add64 = add i32 %add62, %mul63, !dbg !876
  %54 = load i32, i32* %tx, align 4, !dbg !877
  %add65 = add i32 %add64, %54, !dbg !878
  %idxprom66 = zext i32 %add65 to i64, !dbg !863
  %arrayidx67 = getelementptr inbounds float, float* %49, i64 %idxprom66, !dbg !863
  %55 = load float, float* %arrayidx67, align 4, !dbg !863
  %56 = load i32, i32* %ty, align 4, !dbg !879
  %idxprom68 = sext i32 %56 to i64, !dbg !880
  %arrayidx69 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom68, !dbg !880
  %57 = load i32, i32* %tx, align 4, !dbg !881
  %idxprom70 = sext i32 %57 to i64, !dbg !880
  %arrayidx71 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx69, i64 0, i64 %idxprom70, !dbg !880
  store float %55, float* %arrayidx71, align 4, !dbg !882
  br label %if.end, !dbg !883

if.end:                                           ; preds = %if.then56, %if.else
  br label %if.end72

if.end72:                                         ; preds = %if.end, %if.then
  call void @llvm.nvvm.barrier0(), !dbg !884
  %58 = load float*, float** %J_cuda.addr, align 8, !dbg !885
  %59 = load i32, i32* %index_w, align 4, !dbg !886
  %idxprom73 = sext i32 %59 to i64, !dbg !885
  %arrayidx74 = getelementptr inbounds float, float* %58, i64 %idxprom73, !dbg !885
  %60 = load float, float* %arrayidx74, align 4, !dbg !885
  %61 = load i32, i32* %ty, align 4, !dbg !887
  %idxprom75 = sext i32 %61 to i64, !dbg !888
  %arrayidx76 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom75, !dbg !888
  %62 = load i32, i32* %tx, align 4, !dbg !889
  %idxprom77 = sext i32 %62 to i64, !dbg !888
  %arrayidx78 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx76, i64 0, i64 %idxprom77, !dbg !888
  store float %60, float* %arrayidx78, align 4, !dbg !890
  %63 = load float*, float** %J_cuda.addr, align 8, !dbg !891
  %64 = load i32, i32* %index_e, align 4, !dbg !892
  %idxprom79 = sext i32 %64 to i64, !dbg !891
  %arrayidx80 = getelementptr inbounds float, float* %63, i64 %idxprom79, !dbg !891
  %65 = load float, float* %arrayidx80, align 4, !dbg !891
  %66 = load i32, i32* %ty, align 4, !dbg !893
  %idxprom81 = sext i32 %66 to i64, !dbg !894
  %arrayidx82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom81, !dbg !894
  %67 = load i32, i32* %tx, align 4, !dbg !895
  %idxprom83 = sext i32 %67 to i64, !dbg !894
  %arrayidx84 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx82, i64 0, i64 %idxprom83, !dbg !894
  store float %65, float* %arrayidx84, align 4, !dbg !896
  %68 = load i32, i32* %bx, align 4, !dbg !897
  %cmp85 = icmp eq i32 %68, 0, !dbg !899
  br i1 %cmp85, label %if.then86, label %if.else97, !dbg !900

if.then86:                                        ; preds = %if.end72
  %69 = load float*, float** %J_cuda.addr, align 8, !dbg !901
  %70 = load i32, i32* %cols.addr, align 4, !dbg !903
  %mul87 = mul nsw i32 %70, 16, !dbg !904
  %71 = load i32, i32* %by, align 4, !dbg !905
  %mul88 = mul nsw i32 %mul87, %71, !dbg !906
  %72 = load i32, i32* %cols.addr, align 4, !dbg !907
  %73 = load i32, i32* %ty, align 4, !dbg !908
  %mul89 = mul nsw i32 %72, %73, !dbg !909
  %add90 = add nsw i32 %mul88, %mul89, !dbg !910
  %idxprom91 = sext i32 %add90 to i64, !dbg !901
  %arrayidx92 = getelementptr inbounds float, float* %69, i64 %idxprom91, !dbg !901
  %74 = load float, float* %arrayidx92, align 4, !dbg !901
  %75 = load i32, i32* %ty, align 4, !dbg !911
  %idxprom93 = sext i32 %75 to i64, !dbg !912
  %arrayidx94 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom93, !dbg !912
  %76 = load i32, i32* %tx, align 4, !dbg !913
  %idxprom95 = sext i32 %76 to i64, !dbg !912
  %arrayidx96 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx94, i64 0, i64 %idxprom95, !dbg !912
  store float %74, float* %arrayidx96, align 4, !dbg !914
  br label %if.end119, !dbg !915

if.else97:                                        ; preds = %if.end72
  %77 = load i32, i32* %bx, align 4, !dbg !916
  %78 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3, !dbg !918, !range !859
  %sub99 = sub i32 %78, 1, !dbg !921
  %cmp100 = icmp eq i32 %77, %sub99, !dbg !922
  br i1 %cmp100, label %if.then101, label %if.end118, !dbg !923

if.then101:                                       ; preds = %if.else97
  %79 = load float*, float** %J_cuda.addr, align 8, !dbg !924
  %80 = load i32, i32* %cols.addr, align 4, !dbg !926
  %mul102 = mul nsw i32 %80, 16, !dbg !927
  %81 = load i32, i32* %by, align 4, !dbg !928
  %mul103 = mul nsw i32 %mul102, %81, !dbg !929
  %82 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3, !dbg !930, !range !859
  %sub105 = sub i32 %82, 1, !dbg !932
  %mul106 = mul i32 16, %sub105, !dbg !933
  %add107 = add i32 %mul103, %mul106, !dbg !934
  %83 = load i32, i32* %cols.addr, align 4, !dbg !935
  %84 = load i32, i32* %ty, align 4, !dbg !936
  %mul108 = mul nsw i32 %83, %84, !dbg !937
  %add109 = add i32 %add107, %mul108, !dbg !938
  %add110 = add i32 %add109, 16, !dbg !939
  %sub111 = sub i32 %add110, 1, !dbg !940
  %idxprom112 = zext i32 %sub111 to i64, !dbg !924
  %arrayidx113 = getelementptr inbounds float, float* %79, i64 %idxprom112, !dbg !924
  %85 = load float, float* %arrayidx113, align 4, !dbg !924
  %86 = load i32, i32* %ty, align 4, !dbg !941
  %idxprom114 = sext i32 %86 to i64, !dbg !942
  %arrayidx115 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom114, !dbg !942
  %87 = load i32, i32* %tx, align 4, !dbg !943
  %idxprom116 = sext i32 %87 to i64, !dbg !942
  %arrayidx117 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx115, i64 0, i64 %idxprom116, !dbg !942
  store float %85, float* %arrayidx117, align 4, !dbg !944
  br label %if.end118, !dbg !945

if.end118:                                        ; preds = %if.then101, %if.else97
  br label %if.end119

if.end119:                                        ; preds = %if.end118, %if.then86
  call void @llvm.nvvm.barrier0(), !dbg !946
  %88 = load float*, float** %J_cuda.addr, align 8, !dbg !947
  %89 = load i32, i32* %index, align 4, !dbg !948
  %idxprom120 = sext i32 %89 to i64, !dbg !947
  %arrayidx121 = getelementptr inbounds float, float* %88, i64 %idxprom120, !dbg !947
  %90 = load float, float* %arrayidx121, align 4, !dbg !947
  %91 = load i32, i32* %ty, align 4, !dbg !949
  %idxprom122 = sext i32 %91 to i64, !dbg !950
  %arrayidx123 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom122, !dbg !950
  %92 = load i32, i32* %tx, align 4, !dbg !951
  %idxprom124 = sext i32 %92 to i64, !dbg !950
  %arrayidx125 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx123, i64 0, i64 %idxprom124, !dbg !950
  store float %90, float* %arrayidx125, align 4, !dbg !952
  call void @llvm.nvvm.barrier0(), !dbg !953
  %93 = load i32, i32* %ty, align 4, !dbg !954
  %idxprom126 = sext i32 %93 to i64, !dbg !955
  %arrayidx127 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom126, !dbg !955
  %94 = load i32, i32* %tx, align 4, !dbg !956
  %idxprom128 = sext i32 %94 to i64, !dbg !955
  %arrayidx129 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx127, i64 0, i64 %idxprom128, !dbg !955
  %95 = load float, float* %arrayidx129, align 4, !dbg !955
  store float %95, float* %jc, align 4, !dbg !957
  %96 = load i32, i32* %ty, align 4, !dbg !958
  %cmp130 = icmp eq i32 %96, 0, !dbg !960
  br i1 %cmp130, label %land.lhs.true, label %if.else155, !dbg !961

land.lhs.true:                                    ; preds = %if.end119
  %97 = load i32, i32* %tx, align 4, !dbg !962
  %cmp131 = icmp eq i32 %97, 0, !dbg !964
  br i1 %cmp131, label %if.then132, label %if.else155, !dbg !965

if.then132:                                       ; preds = %land.lhs.true
  %98 = load i32, i32* %ty, align 4, !dbg !966
  %idxprom133 = sext i32 %98 to i64, !dbg !968
  %arrayidx134 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom133, !dbg !968
  %99 = load i32, i32* %tx, align 4, !dbg !969
  %idxprom135 = sext i32 %99 to i64, !dbg !968
  %arrayidx136 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx134, i64 0, i64 %idxprom135, !dbg !968
  %100 = load float, float* %arrayidx136, align 4, !dbg !968
  %101 = load float, float* %jc, align 4, !dbg !970
  %sub137 = fsub float %100, %101, !dbg !971
  store float %sub137, float* %n, align 4, !dbg !972
  %102 = load i32, i32* %ty, align 4, !dbg !973
  %add138 = add nsw i32 %102, 1, !dbg !974
  %idxprom139 = sext i32 %add138 to i64, !dbg !975
  %arrayidx140 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom139, !dbg !975
  %103 = load i32, i32* %tx, align 4, !dbg !976
  %idxprom141 = sext i32 %103 to i64, !dbg !975
  %arrayidx142 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx140, i64 0, i64 %idxprom141, !dbg !975
  %104 = load float, float* %arrayidx142, align 4, !dbg !975
  %105 = load float, float* %jc, align 4, !dbg !977
  %sub143 = fsub float %104, %105, !dbg !978
  store float %sub143, float* %s, align 4, !dbg !979
  %106 = load i32, i32* %ty, align 4, !dbg !980
  %idxprom144 = sext i32 %106 to i64, !dbg !981
  %arrayidx145 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom144, !dbg !981
  %107 = load i32, i32* %tx, align 4, !dbg !982
  %idxprom146 = sext i32 %107 to i64, !dbg !981
  %arrayidx147 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx145, i64 0, i64 %idxprom146, !dbg !981
  %108 = load float, float* %arrayidx147, align 4, !dbg !981
  %109 = load float, float* %jc, align 4, !dbg !983
  %sub148 = fsub float %108, %109, !dbg !984
  store float %sub148, float* %w, align 4, !dbg !985
  %110 = load i32, i32* %ty, align 4, !dbg !986
  %idxprom149 = sext i32 %110 to i64, !dbg !987
  %arrayidx150 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom149, !dbg !987
  %111 = load i32, i32* %tx, align 4, !dbg !988
  %add151 = add nsw i32 %111, 1, !dbg !989
  %idxprom152 = sext i32 %add151 to i64, !dbg !987
  %arrayidx153 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx150, i64 0, i64 %idxprom152, !dbg !987
  %112 = load float, float* %arrayidx153, align 4, !dbg !987
  %113 = load float, float* %jc, align 4, !dbg !990
  %sub154 = fsub float %112, %113, !dbg !991
  store float %sub154, float* %e, align 4, !dbg !992
  br label %if.end372, !dbg !993

if.else155:                                       ; preds = %land.lhs.true, %if.end119
  %114 = load i32, i32* %ty, align 4, !dbg !994
  %cmp156 = icmp eq i32 %114, 0, !dbg !996
  br i1 %cmp156, label %land.lhs.true157, label %if.else182, !dbg !997

land.lhs.true157:                                 ; preds = %if.else155
  %115 = load i32, i32* %tx, align 4, !dbg !998
  %cmp158 = icmp eq i32 %115, 15, !dbg !1000
  br i1 %cmp158, label %if.then159, label %if.else182, !dbg !1001

if.then159:                                       ; preds = %land.lhs.true157
  %116 = load i32, i32* %ty, align 4, !dbg !1002
  %idxprom160 = sext i32 %116 to i64, !dbg !1004
  %arrayidx161 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom160, !dbg !1004
  %117 = load i32, i32* %tx, align 4, !dbg !1005
  %idxprom162 = sext i32 %117 to i64, !dbg !1004
  %arrayidx163 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx161, i64 0, i64 %idxprom162, !dbg !1004
  %118 = load float, float* %arrayidx163, align 4, !dbg !1004
  %119 = load float, float* %jc, align 4, !dbg !1006
  %sub164 = fsub float %118, %119, !dbg !1007
  store float %sub164, float* %n, align 4, !dbg !1008
  %120 = load i32, i32* %ty, align 4, !dbg !1009
  %add165 = add nsw i32 %120, 1, !dbg !1010
  %idxprom166 = sext i32 %add165 to i64, !dbg !1011
  %arrayidx167 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom166, !dbg !1011
  %121 = load i32, i32* %tx, align 4, !dbg !1012
  %idxprom168 = sext i32 %121 to i64, !dbg !1011
  %arrayidx169 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx167, i64 0, i64 %idxprom168, !dbg !1011
  %122 = load float, float* %arrayidx169, align 4, !dbg !1011
  %123 = load float, float* %jc, align 4, !dbg !1013
  %sub170 = fsub float %122, %123, !dbg !1014
  store float %sub170, float* %s, align 4, !dbg !1015
  %124 = load i32, i32* %ty, align 4, !dbg !1016
  %idxprom171 = sext i32 %124 to i64, !dbg !1017
  %arrayidx172 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom171, !dbg !1017
  %125 = load i32, i32* %tx, align 4, !dbg !1018
  %sub173 = sub nsw i32 %125, 1, !dbg !1019
  %idxprom174 = sext i32 %sub173 to i64, !dbg !1017
  %arrayidx175 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx172, i64 0, i64 %idxprom174, !dbg !1017
  %126 = load float, float* %arrayidx175, align 4, !dbg !1017
  %127 = load float, float* %jc, align 4, !dbg !1020
  %sub176 = fsub float %126, %127, !dbg !1021
  store float %sub176, float* %w, align 4, !dbg !1022
  %128 = load i32, i32* %ty, align 4, !dbg !1023
  %idxprom177 = sext i32 %128 to i64, !dbg !1024
  %arrayidx178 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom177, !dbg !1024
  %129 = load i32, i32* %tx, align 4, !dbg !1025
  %idxprom179 = sext i32 %129 to i64, !dbg !1024
  %arrayidx180 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx178, i64 0, i64 %idxprom179, !dbg !1024
  %130 = load float, float* %arrayidx180, align 4, !dbg !1024
  %131 = load float, float* %jc, align 4, !dbg !1026
  %sub181 = fsub float %130, %131, !dbg !1027
  store float %sub181, float* %e, align 4, !dbg !1028
  br label %if.end371, !dbg !1029

if.else182:                                       ; preds = %land.lhs.true157, %if.else155
  %132 = load i32, i32* %ty, align 4, !dbg !1030
  %cmp183 = icmp eq i32 %132, 15, !dbg !1032
  br i1 %cmp183, label %land.lhs.true184, label %if.else209, !dbg !1033

land.lhs.true184:                                 ; preds = %if.else182
  %133 = load i32, i32* %tx, align 4, !dbg !1034
  %cmp185 = icmp eq i32 %133, 15, !dbg !1036
  br i1 %cmp185, label %if.then186, label %if.else209, !dbg !1037

if.then186:                                       ; preds = %land.lhs.true184
  %134 = load i32, i32* %ty, align 4, !dbg !1038
  %sub187 = sub nsw i32 %134, 1, !dbg !1040
  %idxprom188 = sext i32 %sub187 to i64, !dbg !1041
  %arrayidx189 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom188, !dbg !1041
  %135 = load i32, i32* %tx, align 4, !dbg !1042
  %idxprom190 = sext i32 %135 to i64, !dbg !1041
  %arrayidx191 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx189, i64 0, i64 %idxprom190, !dbg !1041
  %136 = load float, float* %arrayidx191, align 4, !dbg !1041
  %137 = load float, float* %jc, align 4, !dbg !1043
  %sub192 = fsub float %136, %137, !dbg !1044
  store float %sub192, float* %n, align 4, !dbg !1045
  %138 = load i32, i32* %ty, align 4, !dbg !1046
  %idxprom193 = sext i32 %138 to i64, !dbg !1047
  %arrayidx194 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom193, !dbg !1047
  %139 = load i32, i32* %tx, align 4, !dbg !1048
  %idxprom195 = sext i32 %139 to i64, !dbg !1047
  %arrayidx196 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx194, i64 0, i64 %idxprom195, !dbg !1047
  %140 = load float, float* %arrayidx196, align 4, !dbg !1047
  %141 = load float, float* %jc, align 4, !dbg !1049
  %sub197 = fsub float %140, %141, !dbg !1050
  store float %sub197, float* %s, align 4, !dbg !1051
  %142 = load i32, i32* %ty, align 4, !dbg !1052
  %idxprom198 = sext i32 %142 to i64, !dbg !1053
  %arrayidx199 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom198, !dbg !1053
  %143 = load i32, i32* %tx, align 4, !dbg !1054
  %sub200 = sub nsw i32 %143, 1, !dbg !1055
  %idxprom201 = sext i32 %sub200 to i64, !dbg !1053
  %arrayidx202 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx199, i64 0, i64 %idxprom201, !dbg !1053
  %144 = load float, float* %arrayidx202, align 4, !dbg !1053
  %145 = load float, float* %jc, align 4, !dbg !1056
  %sub203 = fsub float %144, %145, !dbg !1057
  store float %sub203, float* %w, align 4, !dbg !1058
  %146 = load i32, i32* %ty, align 4, !dbg !1059
  %idxprom204 = sext i32 %146 to i64, !dbg !1060
  %arrayidx205 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom204, !dbg !1060
  %147 = load i32, i32* %tx, align 4, !dbg !1061
  %idxprom206 = sext i32 %147 to i64, !dbg !1060
  %arrayidx207 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx205, i64 0, i64 %idxprom206, !dbg !1060
  %148 = load float, float* %arrayidx207, align 4, !dbg !1060
  %149 = load float, float* %jc, align 4, !dbg !1062
  %sub208 = fsub float %148, %149, !dbg !1063
  store float %sub208, float* %e, align 4, !dbg !1064
  br label %if.end370, !dbg !1065

if.else209:                                       ; preds = %land.lhs.true184, %if.else182
  %150 = load i32, i32* %ty, align 4, !dbg !1066
  %cmp210 = icmp eq i32 %150, 15, !dbg !1068
  br i1 %cmp210, label %land.lhs.true211, label %if.else236, !dbg !1069

land.lhs.true211:                                 ; preds = %if.else209
  %151 = load i32, i32* %tx, align 4, !dbg !1070
  %cmp212 = icmp eq i32 %151, 0, !dbg !1072
  br i1 %cmp212, label %if.then213, label %if.else236, !dbg !1073

if.then213:                                       ; preds = %land.lhs.true211
  %152 = load i32, i32* %ty, align 4, !dbg !1074
  %sub214 = sub nsw i32 %152, 1, !dbg !1076
  %idxprom215 = sext i32 %sub214 to i64, !dbg !1077
  %arrayidx216 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom215, !dbg !1077
  %153 = load i32, i32* %tx, align 4, !dbg !1078
  %idxprom217 = sext i32 %153 to i64, !dbg !1077
  %arrayidx218 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx216, i64 0, i64 %idxprom217, !dbg !1077
  %154 = load float, float* %arrayidx218, align 4, !dbg !1077
  %155 = load float, float* %jc, align 4, !dbg !1079
  %sub219 = fsub float %154, %155, !dbg !1080
  store float %sub219, float* %n, align 4, !dbg !1081
  %156 = load i32, i32* %ty, align 4, !dbg !1082
  %idxprom220 = sext i32 %156 to i64, !dbg !1083
  %arrayidx221 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom220, !dbg !1083
  %157 = load i32, i32* %tx, align 4, !dbg !1084
  %idxprom222 = sext i32 %157 to i64, !dbg !1083
  %arrayidx223 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx221, i64 0, i64 %idxprom222, !dbg !1083
  %158 = load float, float* %arrayidx223, align 4, !dbg !1083
  %159 = load float, float* %jc, align 4, !dbg !1085
  %sub224 = fsub float %158, %159, !dbg !1086
  store float %sub224, float* %s, align 4, !dbg !1087
  %160 = load i32, i32* %ty, align 4, !dbg !1088
  %idxprom225 = sext i32 %160 to i64, !dbg !1089
  %arrayidx226 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom225, !dbg !1089
  %161 = load i32, i32* %tx, align 4, !dbg !1090
  %idxprom227 = sext i32 %161 to i64, !dbg !1089
  %arrayidx228 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx226, i64 0, i64 %idxprom227, !dbg !1089
  %162 = load float, float* %arrayidx228, align 4, !dbg !1089
  %163 = load float, float* %jc, align 4, !dbg !1091
  %sub229 = fsub float %162, %163, !dbg !1092
  store float %sub229, float* %w, align 4, !dbg !1093
  %164 = load i32, i32* %ty, align 4, !dbg !1094
  %idxprom230 = sext i32 %164 to i64, !dbg !1095
  %arrayidx231 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom230, !dbg !1095
  %165 = load i32, i32* %tx, align 4, !dbg !1096
  %add232 = add nsw i32 %165, 1, !dbg !1097
  %idxprom233 = sext i32 %add232 to i64, !dbg !1095
  %arrayidx234 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx231, i64 0, i64 %idxprom233, !dbg !1095
  %166 = load float, float* %arrayidx234, align 4, !dbg !1095
  %167 = load float, float* %jc, align 4, !dbg !1098
  %sub235 = fsub float %166, %167, !dbg !1099
  store float %sub235, float* %e, align 4, !dbg !1100
  br label %if.end369, !dbg !1101

if.else236:                                       ; preds = %land.lhs.true211, %if.else209
  %168 = load i32, i32* %ty, align 4, !dbg !1102
  %cmp237 = icmp eq i32 %168, 0, !dbg !1104
  br i1 %cmp237, label %if.then238, label %if.else262, !dbg !1105

if.then238:                                       ; preds = %if.else236
  %169 = load i32, i32* %ty, align 4, !dbg !1106
  %idxprom239 = sext i32 %169 to i64, !dbg !1108
  %arrayidx240 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom239, !dbg !1108
  %170 = load i32, i32* %tx, align 4, !dbg !1109
  %idxprom241 = sext i32 %170 to i64, !dbg !1108
  %arrayidx242 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx240, i64 0, i64 %idxprom241, !dbg !1108
  %171 = load float, float* %arrayidx242, align 4, !dbg !1108
  %172 = load float, float* %jc, align 4, !dbg !1110
  %sub243 = fsub float %171, %172, !dbg !1111
  store float %sub243, float* %n, align 4, !dbg !1112
  %173 = load i32, i32* %ty, align 4, !dbg !1113
  %add244 = add nsw i32 %173, 1, !dbg !1114
  %idxprom245 = sext i32 %add244 to i64, !dbg !1115
  %arrayidx246 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom245, !dbg !1115
  %174 = load i32, i32* %tx, align 4, !dbg !1116
  %idxprom247 = sext i32 %174 to i64, !dbg !1115
  %arrayidx248 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx246, i64 0, i64 %idxprom247, !dbg !1115
  %175 = load float, float* %arrayidx248, align 4, !dbg !1115
  %176 = load float, float* %jc, align 4, !dbg !1117
  %sub249 = fsub float %175, %176, !dbg !1118
  store float %sub249, float* %s, align 4, !dbg !1119
  %177 = load i32, i32* %ty, align 4, !dbg !1120
  %idxprom250 = sext i32 %177 to i64, !dbg !1121
  %arrayidx251 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom250, !dbg !1121
  %178 = load i32, i32* %tx, align 4, !dbg !1122
  %sub252 = sub nsw i32 %178, 1, !dbg !1123
  %idxprom253 = sext i32 %sub252 to i64, !dbg !1121
  %arrayidx254 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx251, i64 0, i64 %idxprom253, !dbg !1121
  %179 = load float, float* %arrayidx254, align 4, !dbg !1121
  %180 = load float, float* %jc, align 4, !dbg !1124
  %sub255 = fsub float %179, %180, !dbg !1125
  store float %sub255, float* %w, align 4, !dbg !1126
  %181 = load i32, i32* %ty, align 4, !dbg !1127
  %idxprom256 = sext i32 %181 to i64, !dbg !1128
  %arrayidx257 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom256, !dbg !1128
  %182 = load i32, i32* %tx, align 4, !dbg !1129
  %add258 = add nsw i32 %182, 1, !dbg !1130
  %idxprom259 = sext i32 %add258 to i64, !dbg !1128
  %arrayidx260 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx257, i64 0, i64 %idxprom259, !dbg !1128
  %183 = load float, float* %arrayidx260, align 4, !dbg !1128
  %184 = load float, float* %jc, align 4, !dbg !1131
  %sub261 = fsub float %183, %184, !dbg !1132
  store float %sub261, float* %e, align 4, !dbg !1133
  br label %if.end368, !dbg !1134

if.else262:                                       ; preds = %if.else236
  %185 = load i32, i32* %tx, align 4, !dbg !1135
  %cmp263 = icmp eq i32 %185, 15, !dbg !1137
  br i1 %cmp263, label %if.then264, label %if.else288, !dbg !1138

if.then264:                                       ; preds = %if.else262
  %186 = load i32, i32* %ty, align 4, !dbg !1139
  %sub265 = sub nsw i32 %186, 1, !dbg !1141
  %idxprom266 = sext i32 %sub265 to i64, !dbg !1142
  %arrayidx267 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom266, !dbg !1142
  %187 = load i32, i32* %tx, align 4, !dbg !1143
  %idxprom268 = sext i32 %187 to i64, !dbg !1142
  %arrayidx269 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx267, i64 0, i64 %idxprom268, !dbg !1142
  %188 = load float, float* %arrayidx269, align 4, !dbg !1142
  %189 = load float, float* %jc, align 4, !dbg !1144
  %sub270 = fsub float %188, %189, !dbg !1145
  store float %sub270, float* %n, align 4, !dbg !1146
  %190 = load i32, i32* %ty, align 4, !dbg !1147
  %add271 = add nsw i32 %190, 1, !dbg !1148
  %idxprom272 = sext i32 %add271 to i64, !dbg !1149
  %arrayidx273 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom272, !dbg !1149
  %191 = load i32, i32* %tx, align 4, !dbg !1150
  %idxprom274 = sext i32 %191 to i64, !dbg !1149
  %arrayidx275 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx273, i64 0, i64 %idxprom274, !dbg !1149
  %192 = load float, float* %arrayidx275, align 4, !dbg !1149
  %193 = load float, float* %jc, align 4, !dbg !1151
  %sub276 = fsub float %192, %193, !dbg !1152
  store float %sub276, float* %s, align 4, !dbg !1153
  %194 = load i32, i32* %ty, align 4, !dbg !1154
  %idxprom277 = sext i32 %194 to i64, !dbg !1155
  %arrayidx278 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom277, !dbg !1155
  %195 = load i32, i32* %tx, align 4, !dbg !1156
  %sub279 = sub nsw i32 %195, 1, !dbg !1157
  %idxprom280 = sext i32 %sub279 to i64, !dbg !1155
  %arrayidx281 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx278, i64 0, i64 %idxprom280, !dbg !1155
  %196 = load float, float* %arrayidx281, align 4, !dbg !1155
  %197 = load float, float* %jc, align 4, !dbg !1158
  %sub282 = fsub float %196, %197, !dbg !1159
  store float %sub282, float* %w, align 4, !dbg !1160
  %198 = load i32, i32* %ty, align 4, !dbg !1161
  %idxprom283 = sext i32 %198 to i64, !dbg !1162
  %arrayidx284 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom283, !dbg !1162
  %199 = load i32, i32* %tx, align 4, !dbg !1163
  %idxprom285 = sext i32 %199 to i64, !dbg !1162
  %arrayidx286 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx284, i64 0, i64 %idxprom285, !dbg !1162
  %200 = load float, float* %arrayidx286, align 4, !dbg !1162
  %201 = load float, float* %jc, align 4, !dbg !1164
  %sub287 = fsub float %200, %201, !dbg !1165
  store float %sub287, float* %e, align 4, !dbg !1166
  br label %if.end367, !dbg !1167

if.else288:                                       ; preds = %if.else262
  %202 = load i32, i32* %ty, align 4, !dbg !1168
  %cmp289 = icmp eq i32 %202, 15, !dbg !1170
  br i1 %cmp289, label %if.then290, label %if.else314, !dbg !1171

if.then290:                                       ; preds = %if.else288
  %203 = load i32, i32* %ty, align 4, !dbg !1172
  %sub291 = sub nsw i32 %203, 1, !dbg !1174
  %idxprom292 = sext i32 %sub291 to i64, !dbg !1175
  %arrayidx293 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom292, !dbg !1175
  %204 = load i32, i32* %tx, align 4, !dbg !1176
  %idxprom294 = sext i32 %204 to i64, !dbg !1175
  %arrayidx295 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx293, i64 0, i64 %idxprom294, !dbg !1175
  %205 = load float, float* %arrayidx295, align 4, !dbg !1175
  %206 = load float, float* %jc, align 4, !dbg !1177
  %sub296 = fsub float %205, %206, !dbg !1178
  store float %sub296, float* %n, align 4, !dbg !1179
  %207 = load i32, i32* %ty, align 4, !dbg !1180
  %idxprom297 = sext i32 %207 to i64, !dbg !1181
  %arrayidx298 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom297, !dbg !1181
  %208 = load i32, i32* %tx, align 4, !dbg !1182
  %idxprom299 = sext i32 %208 to i64, !dbg !1181
  %arrayidx300 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx298, i64 0, i64 %idxprom299, !dbg !1181
  %209 = load float, float* %arrayidx300, align 4, !dbg !1181
  %210 = load float, float* %jc, align 4, !dbg !1183
  %sub301 = fsub float %209, %210, !dbg !1184
  store float %sub301, float* %s, align 4, !dbg !1185
  %211 = load i32, i32* %ty, align 4, !dbg !1186
  %idxprom302 = sext i32 %211 to i64, !dbg !1187
  %arrayidx303 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom302, !dbg !1187
  %212 = load i32, i32* %tx, align 4, !dbg !1188
  %sub304 = sub nsw i32 %212, 1, !dbg !1189
  %idxprom305 = sext i32 %sub304 to i64, !dbg !1187
  %arrayidx306 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx303, i64 0, i64 %idxprom305, !dbg !1187
  %213 = load float, float* %arrayidx306, align 4, !dbg !1187
  %214 = load float, float* %jc, align 4, !dbg !1190
  %sub307 = fsub float %213, %214, !dbg !1191
  store float %sub307, float* %w, align 4, !dbg !1192
  %215 = load i32, i32* %ty, align 4, !dbg !1193
  %idxprom308 = sext i32 %215 to i64, !dbg !1194
  %arrayidx309 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom308, !dbg !1194
  %216 = load i32, i32* %tx, align 4, !dbg !1195
  %add310 = add nsw i32 %216, 1, !dbg !1196
  %idxprom311 = sext i32 %add310 to i64, !dbg !1194
  %arrayidx312 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx309, i64 0, i64 %idxprom311, !dbg !1194
  %217 = load float, float* %arrayidx312, align 4, !dbg !1194
  %218 = load float, float* %jc, align 4, !dbg !1197
  %sub313 = fsub float %217, %218, !dbg !1198
  store float %sub313, float* %e, align 4, !dbg !1199
  br label %if.end366, !dbg !1200

if.else314:                                       ; preds = %if.else288
  %219 = load i32, i32* %tx, align 4, !dbg !1201
  %cmp315 = icmp eq i32 %219, 0, !dbg !1203
  br i1 %cmp315, label %if.then316, label %if.else340, !dbg !1204

if.then316:                                       ; preds = %if.else314
  %220 = load i32, i32* %ty, align 4, !dbg !1205
  %sub317 = sub nsw i32 %220, 1, !dbg !1207
  %idxprom318 = sext i32 %sub317 to i64, !dbg !1208
  %arrayidx319 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom318, !dbg !1208
  %221 = load i32, i32* %tx, align 4, !dbg !1209
  %idxprom320 = sext i32 %221 to i64, !dbg !1208
  %arrayidx321 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx319, i64 0, i64 %idxprom320, !dbg !1208
  %222 = load float, float* %arrayidx321, align 4, !dbg !1208
  %223 = load float, float* %jc, align 4, !dbg !1210
  %sub322 = fsub float %222, %223, !dbg !1211
  store float %sub322, float* %n, align 4, !dbg !1212
  %224 = load i32, i32* %ty, align 4, !dbg !1213
  %add323 = add nsw i32 %224, 1, !dbg !1214
  %idxprom324 = sext i32 %add323 to i64, !dbg !1215
  %arrayidx325 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom324, !dbg !1215
  %225 = load i32, i32* %tx, align 4, !dbg !1216
  %idxprom326 = sext i32 %225 to i64, !dbg !1215
  %arrayidx327 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx325, i64 0, i64 %idxprom326, !dbg !1215
  %226 = load float, float* %arrayidx327, align 4, !dbg !1215
  %227 = load float, float* %jc, align 4, !dbg !1217
  %sub328 = fsub float %226, %227, !dbg !1218
  store float %sub328, float* %s, align 4, !dbg !1219
  %228 = load i32, i32* %ty, align 4, !dbg !1220
  %idxprom329 = sext i32 %228 to i64, !dbg !1221
  %arrayidx330 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom329, !dbg !1221
  %229 = load i32, i32* %tx, align 4, !dbg !1222
  %idxprom331 = sext i32 %229 to i64, !dbg !1221
  %arrayidx332 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx330, i64 0, i64 %idxprom331, !dbg !1221
  %230 = load float, float* %arrayidx332, align 4, !dbg !1221
  %231 = load float, float* %jc, align 4, !dbg !1223
  %sub333 = fsub float %230, %231, !dbg !1224
  store float %sub333, float* %w, align 4, !dbg !1225
  %232 = load i32, i32* %ty, align 4, !dbg !1226
  %idxprom334 = sext i32 %232 to i64, !dbg !1227
  %arrayidx335 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom334, !dbg !1227
  %233 = load i32, i32* %tx, align 4, !dbg !1228
  %add336 = add nsw i32 %233, 1, !dbg !1229
  %idxprom337 = sext i32 %add336 to i64, !dbg !1227
  %arrayidx338 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx335, i64 0, i64 %idxprom337, !dbg !1227
  %234 = load float, float* %arrayidx338, align 4, !dbg !1227
  %235 = load float, float* %jc, align 4, !dbg !1230
  %sub339 = fsub float %234, %235, !dbg !1231
  store float %sub339, float* %e, align 4, !dbg !1232
  br label %if.end365, !dbg !1233

if.else340:                                       ; preds = %if.else314
  %236 = load i32, i32* %ty, align 4, !dbg !1234
  %sub341 = sub nsw i32 %236, 1, !dbg !1236
  %idxprom342 = sext i32 %sub341 to i64, !dbg !1237
  %arrayidx343 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom342, !dbg !1237
  %237 = load i32, i32* %tx, align 4, !dbg !1238
  %idxprom344 = sext i32 %237 to i64, !dbg !1237
  %arrayidx345 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx343, i64 0, i64 %idxprom344, !dbg !1237
  %238 = load float, float* %arrayidx345, align 4, !dbg !1237
  %239 = load float, float* %jc, align 4, !dbg !1239
  %sub346 = fsub float %238, %239, !dbg !1240
  store float %sub346, float* %n, align 4, !dbg !1241
  %240 = load i32, i32* %ty, align 4, !dbg !1242
  %add347 = add nsw i32 %240, 1, !dbg !1243
  %idxprom348 = sext i32 %add347 to i64, !dbg !1244
  %arrayidx349 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom348, !dbg !1244
  %241 = load i32, i32* %tx, align 4, !dbg !1245
  %idxprom350 = sext i32 %241 to i64, !dbg !1244
  %arrayidx351 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx349, i64 0, i64 %idxprom350, !dbg !1244
  %242 = load float, float* %arrayidx351, align 4, !dbg !1244
  %243 = load float, float* %jc, align 4, !dbg !1246
  %sub352 = fsub float %242, %243, !dbg !1247
  store float %sub352, float* %s, align 4, !dbg !1248
  %244 = load i32, i32* %ty, align 4, !dbg !1249
  %idxprom353 = sext i32 %244 to i64, !dbg !1250
  %arrayidx354 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom353, !dbg !1250
  %245 = load i32, i32* %tx, align 4, !dbg !1251
  %sub355 = sub nsw i32 %245, 1, !dbg !1252
  %idxprom356 = sext i32 %sub355 to i64, !dbg !1250
  %arrayidx357 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx354, i64 0, i64 %idxprom356, !dbg !1250
  %246 = load float, float* %arrayidx357, align 4, !dbg !1250
  %247 = load float, float* %jc, align 4, !dbg !1253
  %sub358 = fsub float %246, %247, !dbg !1254
  store float %sub358, float* %w, align 4, !dbg !1255
  %248 = load i32, i32* %ty, align 4, !dbg !1256
  %idxprom359 = sext i32 %248 to i64, !dbg !1257
  %arrayidx360 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom359, !dbg !1257
  %249 = load i32, i32* %tx, align 4, !dbg !1258
  %add361 = add nsw i32 %249, 1, !dbg !1259
  %idxprom362 = sext i32 %add361 to i64, !dbg !1257
  %arrayidx363 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx360, i64 0, i64 %idxprom362, !dbg !1257
  %250 = load float, float* %arrayidx363, align 4, !dbg !1257
  %251 = load float, float* %jc, align 4, !dbg !1260
  %sub364 = fsub float %250, %251, !dbg !1261
  store float %sub364, float* %e, align 4, !dbg !1262
  br label %if.end365

if.end365:                                        ; preds = %if.else340, %if.then316
  br label %if.end366

if.end366:                                        ; preds = %if.end365, %if.then290
  br label %if.end367

if.end367:                                        ; preds = %if.end366, %if.then264
  br label %if.end368

if.end368:                                        ; preds = %if.end367, %if.then238
  br label %if.end369

if.end369:                                        ; preds = %if.end368, %if.then213
  br label %if.end370

if.end370:                                        ; preds = %if.end369, %if.then186
  br label %if.end371

if.end371:                                        ; preds = %if.end370, %if.then159
  br label %if.end372

if.end372:                                        ; preds = %if.end371, %if.then132
  %252 = load float, float* %n, align 4, !dbg !1263
  %253 = load float, float* %n, align 4, !dbg !1264
  %mul373 = fmul float %252, %253, !dbg !1265
  %254 = load float, float* %s, align 4, !dbg !1266
  %255 = load float, float* %s, align 4, !dbg !1267
  %mul374 = fmul float %254, %255, !dbg !1268
  %add375 = fadd float %mul373, %mul374, !dbg !1269
  %256 = load float, float* %w, align 4, !dbg !1270
  %257 = load float, float* %w, align 4, !dbg !1271
  %mul376 = fmul float %256, %257, !dbg !1272
  %add377 = fadd float %add375, %mul376, !dbg !1273
  %258 = load float, float* %e, align 4, !dbg !1274
  %259 = load float, float* %e, align 4, !dbg !1275
  %mul378 = fmul float %258, %259, !dbg !1276
  %add379 = fadd float %add377, %mul378, !dbg !1277
  %260 = load float, float* %jc, align 4, !dbg !1278
  %261 = load float, float* %jc, align 4, !dbg !1279
  %mul380 = fmul float %260, %261, !dbg !1280
  %div = fdiv float %add379, %mul380, !dbg !1281
  store float %div, float* %g2, align 4, !dbg !1282
  %262 = load float, float* %n, align 4, !dbg !1283
  %263 = load float, float* %s, align 4, !dbg !1284
  %add381 = fadd float %262, %263, !dbg !1285
  %264 = load float, float* %w, align 4, !dbg !1286
  %add382 = fadd float %add381, %264, !dbg !1287
  %265 = load float, float* %e, align 4, !dbg !1288
  %add383 = fadd float %add382, %265, !dbg !1289
  %266 = load float, float* %jc, align 4, !dbg !1290
  %div384 = fdiv float %add383, %266, !dbg !1291
  store float %div384, float* %l, align 4, !dbg !1292
  %267 = load float, float* %g2, align 4, !dbg !1293
  %conv = fpext float %267 to double, !dbg !1293
  %mul385 = fmul double 5.000000e-01, %conv, !dbg !1294
  %268 = load float, float* %l, align 4, !dbg !1295
  %269 = load float, float* %l, align 4, !dbg !1296
  %mul386 = fmul float %268, %269, !dbg !1297
  %conv387 = fpext float %mul386 to double, !dbg !1298
  %mul388 = fmul double 6.250000e-02, %conv387, !dbg !1299
  %sub389 = fsub double %mul385, %mul388, !dbg !1300
  %conv390 = fptrunc double %sub389 to float, !dbg !1301
  store float %conv390, float* %num, align 4, !dbg !1302
  %270 = load float, float* %l, align 4, !dbg !1303
  %conv391 = fpext float %270 to double, !dbg !1303
  %mul392 = fmul double 2.500000e-01, %conv391, !dbg !1304
  %add393 = fadd double 1.000000e+00, %mul392, !dbg !1305
  %conv394 = fptrunc double %add393 to float, !dbg !1306
  store float %conv394, float* %den, align 4, !dbg !1307
  %271 = load float, float* %num, align 4, !dbg !1308
  %272 = load float, float* %den, align 4, !dbg !1309
  %273 = load float, float* %den, align 4, !dbg !1310
  %mul395 = fmul float %272, %273, !dbg !1311
  %div396 = fdiv float %271, %mul395, !dbg !1312
  store float %div396, float* %qsqr, align 4, !dbg !1313
  %274 = load float, float* %qsqr, align 4, !dbg !1314
  %275 = load float, float* %q0sqr.addr, align 4, !dbg !1315
  %sub397 = fsub float %274, %275, !dbg !1316
  %276 = load float, float* %q0sqr.addr, align 4, !dbg !1317
  %277 = load float, float* %q0sqr.addr, align 4, !dbg !1318
  %add398 = fadd float 1.000000e+00, %277, !dbg !1319
  %mul399 = fmul float %276, %add398, !dbg !1320
  %div400 = fdiv float %sub397, %mul399, !dbg !1321
  store float %div400, float* %den, align 4, !dbg !1322
  %278 = load float, float* %den, align 4, !dbg !1323
  %conv401 = fpext float %278 to double, !dbg !1323
  %add402 = fadd double 1.000000e+00, %conv401, !dbg !1324
  %div403 = fdiv double 1.000000e+00, %add402, !dbg !1325
  %conv404 = fptrunc double %div403 to float, !dbg !1326
  store float %conv404, float* %c, align 4, !dbg !1327
  %279 = load float, float* %c, align 4, !dbg !1328
  %cmp405 = fcmp olt float %279, 0.000000e+00, !dbg !1330
  br i1 %cmp405, label %if.then406, label %if.else411, !dbg !1331

if.then406:                                       ; preds = %if.end372
  %280 = load i32, i32* %ty, align 4, !dbg !1332
  %idxprom407 = sext i32 %280 to i64, !dbg !1335
  %arrayidx408 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom407, !dbg !1335
  %281 = load i32, i32* %tx, align 4, !dbg !1336
  %idxprom409 = sext i32 %281 to i64, !dbg !1335
  %arrayidx410 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx408, i64 0, i64 %idxprom409, !dbg !1335
  store float 0.000000e+00, float* %arrayidx410, align 4, !dbg !1337
  br label %if.end424, !dbg !1338

if.else411:                                       ; preds = %if.end372
  %282 = load float, float* %c, align 4, !dbg !1339
  %cmp412 = fcmp ogt float %282, 1.000000e+00, !dbg !1341
  br i1 %cmp412, label %if.then413, label %if.else418, !dbg !1342

if.then413:                                       ; preds = %if.else411
  %283 = load i32, i32* %ty, align 4, !dbg !1343
  %idxprom414 = sext i32 %283 to i64, !dbg !1346
  %arrayidx415 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom414, !dbg !1346
  %284 = load i32, i32* %tx, align 4, !dbg !1347
  %idxprom416 = sext i32 %284 to i64, !dbg !1346
  %arrayidx417 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx415, i64 0, i64 %idxprom416, !dbg !1346
  store float 1.000000e+00, float* %arrayidx417, align 4, !dbg !1348
  br label %if.end423, !dbg !1349

if.else418:                                       ; preds = %if.else411
  %285 = load float, float* %c, align 4, !dbg !1350
  %286 = load i32, i32* %ty, align 4, !dbg !1352
  %idxprom419 = sext i32 %286 to i64, !dbg !1353
  %arrayidx420 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom419, !dbg !1353
  %287 = load i32, i32* %tx, align 4, !dbg !1354
  %idxprom421 = sext i32 %287 to i64, !dbg !1353
  %arrayidx422 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx420, i64 0, i64 %idxprom421, !dbg !1353
  store float %285, float* %arrayidx422, align 4, !dbg !1355
  br label %if.end423

if.end423:                                        ; preds = %if.else418, %if.then413
  br label %if.end424

if.end424:                                        ; preds = %if.end423, %if.then406
  call void @llvm.nvvm.barrier0(), !dbg !1356
  %288 = load i32, i32* %ty, align 4, !dbg !1357
  %idxprom425 = sext i32 %288 to i64, !dbg !1358
  %arrayidx426 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom425, !dbg !1358
  %289 = load i32, i32* %tx, align 4, !dbg !1359
  %idxprom427 = sext i32 %289 to i64, !dbg !1358
  %arrayidx428 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx426, i64 0, i64 %idxprom427, !dbg !1358
  %290 = load float, float* %arrayidx428, align 4, !dbg !1358
  %291 = load float*, float** %C_cuda.addr, align 8, !dbg !1360
  %292 = load i32, i32* %index, align 4, !dbg !1361
  %idxprom429 = sext i32 %292 to i64, !dbg !1360
  %arrayidx430 = getelementptr inbounds float, float* %291, i64 %idxprom429, !dbg !1360
  store float %290, float* %arrayidx430, align 4, !dbg !1362
  %293 = load float, float* %e, align 4, !dbg !1363
  %294 = load float*, float** %E_C.addr, align 8, !dbg !1364
  %295 = load i32, i32* %index, align 4, !dbg !1365
  %idxprom431 = sext i32 %295 to i64, !dbg !1364
  %arrayidx432 = getelementptr inbounds float, float* %294, i64 %idxprom431, !dbg !1364
  store float %293, float* %arrayidx432, align 4, !dbg !1366
  %296 = load float, float* %w, align 4, !dbg !1367
  %297 = load float*, float** %W_C.addr, align 8, !dbg !1368
  %298 = load i32, i32* %index, align 4, !dbg !1369
  %idxprom433 = sext i32 %298 to i64, !dbg !1368
  %arrayidx434 = getelementptr inbounds float, float* %297, i64 %idxprom433, !dbg !1368
  store float %296, float* %arrayidx434, align 4, !dbg !1370
  %299 = load float, float* %s, align 4, !dbg !1371
  %300 = load float*, float** %S_C.addr, align 8, !dbg !1372
  %301 = load i32, i32* %index, align 4, !dbg !1373
  %idxprom435 = sext i32 %301 to i64, !dbg !1372
  %arrayidx436 = getelementptr inbounds float, float* %300, i64 %idxprom435, !dbg !1372
  store float %299, float* %arrayidx436, align 4, !dbg !1374
  %302 = load float, float* %n, align 4, !dbg !1375
  %303 = load float*, float** %N_C.addr, align 8, !dbg !1376
  %304 = load i32, i32* %index, align 4, !dbg !1377
  %idxprom437 = sext i32 %304 to i64, !dbg !1376
  %arrayidx438 = getelementptr inbounds float, float* %303, i64 %idxprom437, !dbg !1376
  store float %302, float* %arrayidx438, align 4, !dbg !1378
  ret void, !dbg !1379
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: convergent nounwind
define void @_Z11srad_cuda_2PfS_S_S_S_S_iiff(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %lambda, float %q0sqr) #0 !dbg !21 {
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
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_s = alloca i32, align 4
  %index_e = alloca i32, align 4
  %cc = alloca float, align 4
  %cn = alloca float, align 4
  %cs = alloca float, align 4
  %ce = alloca float, align 4
  %cw = alloca float, align 4
  %d_sum = alloca float, align 4
  store float* %E_C, float** %E_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %E_C.addr, metadata !1380, metadata !595), !dbg !1381
  store float* %W_C, float** %W_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %W_C.addr, metadata !1382, metadata !595), !dbg !1383
  store float* %N_C, float** %N_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %N_C.addr, metadata !1384, metadata !595), !dbg !1385
  store float* %S_C, float** %S_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %S_C.addr, metadata !1386, metadata !595), !dbg !1387
  store float* %J_cuda, float** %J_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %J_cuda.addr, metadata !1388, metadata !595), !dbg !1389
  store float* %C_cuda, float** %C_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_cuda.addr, metadata !1390, metadata !595), !dbg !1391
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !1392, metadata !595), !dbg !1393
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !1394, metadata !595), !dbg !1395
  store float %lambda, float* %lambda.addr, align 4
  call void @llvm.dbg.declare(metadata float* %lambda.addr, metadata !1396, metadata !595), !dbg !1397
  store float %q0sqr, float* %q0sqr.addr, align 4
  call void @llvm.dbg.declare(metadata float* %q0sqr.addr, metadata !1398, metadata !595), !dbg !1399
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !1400, metadata !595), !dbg !1401
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !1402, !range !652
  store i32 %0, i32* %bx, align 4, !dbg !1401
  call void @llvm.dbg.declare(metadata i32* %by, metadata !1404, metadata !595), !dbg !1405
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !1406, !range !652
  store i32 %1, i32* %by, align 4, !dbg !1405
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !1408, metadata !595), !dbg !1409
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !1410, !range !688
  store i32 %2, i32* %tx, align 4, !dbg !1409
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !1412, metadata !595), !dbg !1413
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !1414, !range !688
  store i32 %3, i32* %ty, align 4, !dbg !1413
  call void @llvm.dbg.declare(metadata i32* %index, metadata !1416, metadata !595), !dbg !1417
  %4 = load i32, i32* %cols.addr, align 4, !dbg !1418
  %mul = mul nsw i32 %4, 16, !dbg !1419
  %5 = load i32, i32* %by, align 4, !dbg !1420
  %mul4 = mul nsw i32 %mul, %5, !dbg !1421
  %6 = load i32, i32* %bx, align 4, !dbg !1422
  %mul5 = mul nsw i32 16, %6, !dbg !1423
  %add = add nsw i32 %mul4, %mul5, !dbg !1424
  %7 = load i32, i32* %cols.addr, align 4, !dbg !1425
  %8 = load i32, i32* %ty, align 4, !dbg !1426
  %mul6 = mul nsw i32 %7, %8, !dbg !1427
  %add7 = add nsw i32 %add, %mul6, !dbg !1428
  %9 = load i32, i32* %tx, align 4, !dbg !1429
  %add8 = add nsw i32 %add7, %9, !dbg !1430
  store i32 %add8, i32* %index, align 4, !dbg !1417
  call void @llvm.dbg.declare(metadata i32* %index_s, metadata !1431, metadata !595), !dbg !1432
  %10 = load i32, i32* %cols.addr, align 4, !dbg !1433
  %mul9 = mul nsw i32 %10, 16, !dbg !1434
  %11 = load i32, i32* %by, align 4, !dbg !1435
  %mul10 = mul nsw i32 %mul9, %11, !dbg !1436
  %12 = load i32, i32* %bx, align 4, !dbg !1437
  %mul11 = mul nsw i32 16, %12, !dbg !1438
  %add12 = add nsw i32 %mul10, %mul11, !dbg !1439
  %13 = load i32, i32* %cols.addr, align 4, !dbg !1440
  %mul13 = mul nsw i32 %13, 16, !dbg !1441
  %add14 = add nsw i32 %add12, %mul13, !dbg !1442
  %14 = load i32, i32* %tx, align 4, !dbg !1443
  %add15 = add nsw i32 %add14, %14, !dbg !1444
  store i32 %add15, i32* %index_s, align 4, !dbg !1432
  call void @llvm.dbg.declare(metadata i32* %index_e, metadata !1445, metadata !595), !dbg !1446
  %15 = load i32, i32* %cols.addr, align 4, !dbg !1447
  %mul16 = mul nsw i32 %15, 16, !dbg !1448
  %16 = load i32, i32* %by, align 4, !dbg !1449
  %mul17 = mul nsw i32 %mul16, %16, !dbg !1450
  %17 = load i32, i32* %bx, align 4, !dbg !1451
  %mul18 = mul nsw i32 16, %17, !dbg !1452
  %add19 = add nsw i32 %mul17, %mul18, !dbg !1453
  %18 = load i32, i32* %cols.addr, align 4, !dbg !1454
  %19 = load i32, i32* %ty, align 4, !dbg !1455
  %mul20 = mul nsw i32 %18, %19, !dbg !1456
  %add21 = add nsw i32 %add19, %mul20, !dbg !1457
  %add22 = add nsw i32 %add21, 16, !dbg !1458
  store i32 %add22, i32* %index_e, align 4, !dbg !1446
  call void @llvm.dbg.declare(metadata float* %cc, metadata !1459, metadata !595), !dbg !1460
  call void @llvm.dbg.declare(metadata float* %cn, metadata !1461, metadata !595), !dbg !1462
  call void @llvm.dbg.declare(metadata float* %cs, metadata !1463, metadata !595), !dbg !1464
  call void @llvm.dbg.declare(metadata float* %ce, metadata !1465, metadata !595), !dbg !1466
  call void @llvm.dbg.declare(metadata float* %cw, metadata !1467, metadata !595), !dbg !1468
  call void @llvm.dbg.declare(metadata float* %d_sum, metadata !1469, metadata !595), !dbg !1470
  %20 = load float*, float** %J_cuda.addr, align 8, !dbg !1471
  %21 = load i32, i32* %index, align 4, !dbg !1472
  %idxprom = sext i32 %21 to i64, !dbg !1471
  %arrayidx = getelementptr inbounds float, float* %20, i64 %idxprom, !dbg !1471
  %22 = load float, float* %arrayidx, align 4, !dbg !1471
  %23 = load i32, i32* %ty, align 4, !dbg !1473
  %idxprom23 = sext i32 %23 to i64, !dbg !1474
  %arrayidx24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom23, !dbg !1474
  %24 = load i32, i32* %tx, align 4, !dbg !1475
  %idxprom25 = sext i32 %24 to i64, !dbg !1474
  %arrayidx26 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx24, i64 0, i64 %idxprom25, !dbg !1474
  store float %22, float* %arrayidx26, align 4, !dbg !1476
  call void @llvm.nvvm.barrier0(), !dbg !1477
  %25 = load float*, float** %C_cuda.addr, align 8, !dbg !1478
  %26 = load i32, i32* %index_s, align 4, !dbg !1479
  %idxprom27 = sext i32 %26 to i64, !dbg !1478
  %arrayidx28 = getelementptr inbounds float, float* %25, i64 %idxprom27, !dbg !1478
  %27 = load float, float* %arrayidx28, align 4, !dbg !1478
  %28 = load i32, i32* %ty, align 4, !dbg !1480
  %idxprom29 = sext i32 %28 to i64, !dbg !1481
  %arrayidx30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom29, !dbg !1481
  %29 = load i32, i32* %tx, align 4, !dbg !1482
  %idxprom31 = sext i32 %29 to i64, !dbg !1481
  %arrayidx32 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx30, i64 0, i64 %idxprom31, !dbg !1481
  store float %27, float* %arrayidx32, align 4, !dbg !1483
  %30 = load i32, i32* %by, align 4, !dbg !1484
  %31 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.y() #3, !dbg !1486, !range !859
  %sub = sub i32 %31, 1, !dbg !1488
  %cmp = icmp eq i32 %30, %sub, !dbg !1489
  br i1 %cmp, label %if.then, label %if.end, !dbg !1490

if.then:                                          ; preds = %entry
  %32 = load float*, float** %C_cuda.addr, align 8, !dbg !1491
  %33 = load i32, i32* %cols.addr, align 4, !dbg !1493
  %mul34 = mul nsw i32 %33, 16, !dbg !1494
  %34 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.y() #3, !dbg !1495, !range !859
  %sub36 = sub i32 %34, 1, !dbg !1497
  %mul37 = mul i32 %mul34, %sub36, !dbg !1498
  %35 = load i32, i32* %bx, align 4, !dbg !1499
  %mul38 = mul nsw i32 16, %35, !dbg !1500
  %add39 = add i32 %mul37, %mul38, !dbg !1501
  %36 = load i32, i32* %cols.addr, align 4, !dbg !1502
  %mul40 = mul nsw i32 %36, 15, !dbg !1503
  %add41 = add i32 %add39, %mul40, !dbg !1504
  %37 = load i32, i32* %tx, align 4, !dbg !1505
  %add42 = add i32 %add41, %37, !dbg !1506
  %idxprom43 = zext i32 %add42 to i64, !dbg !1491
  %arrayidx44 = getelementptr inbounds float, float* %32, i64 %idxprom43, !dbg !1491
  %38 = load float, float* %arrayidx44, align 4, !dbg !1491
  %39 = load i32, i32* %ty, align 4, !dbg !1507
  %idxprom45 = sext i32 %39 to i64, !dbg !1508
  %arrayidx46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom45, !dbg !1508
  %40 = load i32, i32* %tx, align 4, !dbg !1509
  %idxprom47 = sext i32 %40 to i64, !dbg !1508
  %arrayidx48 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx46, i64 0, i64 %idxprom47, !dbg !1508
  store float %38, float* %arrayidx48, align 4, !dbg !1510
  br label %if.end, !dbg !1511

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.nvvm.barrier0(), !dbg !1512
  %41 = load float*, float** %C_cuda.addr, align 8, !dbg !1513
  %42 = load i32, i32* %index_e, align 4, !dbg !1514
  %idxprom49 = sext i32 %42 to i64, !dbg !1513
  %arrayidx50 = getelementptr inbounds float, float* %41, i64 %idxprom49, !dbg !1513
  %43 = load float, float* %arrayidx50, align 4, !dbg !1513
  %44 = load i32, i32* %ty, align 4, !dbg !1515
  %idxprom51 = sext i32 %44 to i64, !dbg !1516
  %arrayidx52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom51, !dbg !1516
  %45 = load i32, i32* %tx, align 4, !dbg !1517
  %idxprom53 = sext i32 %45 to i64, !dbg !1516
  %arrayidx54 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx52, i64 0, i64 %idxprom53, !dbg !1516
  store float %43, float* %arrayidx54, align 4, !dbg !1518
  %46 = load i32, i32* %bx, align 4, !dbg !1519
  %47 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3, !dbg !1521, !range !859
  %sub56 = sub i32 %47, 1, !dbg !1523
  %cmp57 = icmp eq i32 %46, %sub56, !dbg !1524
  br i1 %cmp57, label %if.then58, label %if.end75, !dbg !1525

if.then58:                                        ; preds = %if.end
  %48 = load float*, float** %C_cuda.addr, align 8, !dbg !1526
  %49 = load i32, i32* %cols.addr, align 4, !dbg !1528
  %mul59 = mul nsw i32 %49, 16, !dbg !1529
  %50 = load i32, i32* %by, align 4, !dbg !1530
  %mul60 = mul nsw i32 %mul59, %50, !dbg !1531
  %51 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3, !dbg !1532, !range !859
  %sub62 = sub i32 %51, 1, !dbg !1534
  %mul63 = mul i32 16, %sub62, !dbg !1535
  %add64 = add i32 %mul60, %mul63, !dbg !1536
  %52 = load i32, i32* %cols.addr, align 4, !dbg !1537
  %53 = load i32, i32* %ty, align 4, !dbg !1538
  %mul65 = mul nsw i32 %52, %53, !dbg !1539
  %add66 = add i32 %add64, %mul65, !dbg !1540
  %add67 = add i32 %add66, 16, !dbg !1541
  %sub68 = sub i32 %add67, 1, !dbg !1542
  %idxprom69 = zext i32 %sub68 to i64, !dbg !1526
  %arrayidx70 = getelementptr inbounds float, float* %48, i64 %idxprom69, !dbg !1526
  %54 = load float, float* %arrayidx70, align 4, !dbg !1526
  %55 = load i32, i32* %ty, align 4, !dbg !1543
  %idxprom71 = sext i32 %55 to i64, !dbg !1544
  %arrayidx72 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom71, !dbg !1544
  %56 = load i32, i32* %tx, align 4, !dbg !1545
  %idxprom73 = sext i32 %56 to i64, !dbg !1544
  %arrayidx74 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx72, i64 0, i64 %idxprom73, !dbg !1544
  store float %54, float* %arrayidx74, align 4, !dbg !1546
  br label %if.end75, !dbg !1547

if.end75:                                         ; preds = %if.then58, %if.end
  call void @llvm.nvvm.barrier0(), !dbg !1548
  %57 = load float*, float** %C_cuda.addr, align 8, !dbg !1549
  %58 = load i32, i32* %index, align 4, !dbg !1550
  %idxprom76 = sext i32 %58 to i64, !dbg !1549
  %arrayidx77 = getelementptr inbounds float, float* %57, i64 %idxprom76, !dbg !1549
  %59 = load float, float* %arrayidx77, align 4, !dbg !1549
  %60 = load i32, i32* %ty, align 4, !dbg !1551
  %idxprom78 = sext i32 %60 to i64, !dbg !1552
  %arrayidx79 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom78, !dbg !1552
  %61 = load i32, i32* %tx, align 4, !dbg !1553
  %idxprom80 = sext i32 %61 to i64, !dbg !1552
  %arrayidx81 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx79, i64 0, i64 %idxprom80, !dbg !1552
  store float %59, float* %arrayidx81, align 4, !dbg !1554
  call void @llvm.nvvm.barrier0(), !dbg !1555
  %62 = load i32, i32* %ty, align 4, !dbg !1556
  %idxprom82 = sext i32 %62 to i64, !dbg !1557
  %arrayidx83 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom82, !dbg !1557
  %63 = load i32, i32* %tx, align 4, !dbg !1558
  %idxprom84 = sext i32 %63 to i64, !dbg !1557
  %arrayidx85 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx83, i64 0, i64 %idxprom84, !dbg !1557
  %64 = load float, float* %arrayidx85, align 4, !dbg !1557
  store float %64, float* %cc, align 4, !dbg !1559
  %65 = load i32, i32* %ty, align 4, !dbg !1560
  %cmp86 = icmp eq i32 %65, 15, !dbg !1562
  br i1 %cmp86, label %land.lhs.true, label %if.else, !dbg !1563

land.lhs.true:                                    ; preds = %if.end75
  %66 = load i32, i32* %tx, align 4, !dbg !1564
  %cmp87 = icmp eq i32 %66, 15, !dbg !1566
  br i1 %cmp87, label %if.then88, label %if.else, !dbg !1567

if.then88:                                        ; preds = %land.lhs.true
  %67 = load float, float* %cc, align 4, !dbg !1568
  store float %67, float* %cn, align 4, !dbg !1570
  %68 = load i32, i32* %ty, align 4, !dbg !1571
  %idxprom89 = sext i32 %68 to i64, !dbg !1572
  %arrayidx90 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom89, !dbg !1572
  %69 = load i32, i32* %tx, align 4, !dbg !1573
  %idxprom91 = sext i32 %69 to i64, !dbg !1572
  %arrayidx92 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx90, i64 0, i64 %idxprom91, !dbg !1572
  %70 = load float, float* %arrayidx92, align 4, !dbg !1572
  store float %70, float* %cs, align 4, !dbg !1574
  %71 = load float, float* %cc, align 4, !dbg !1575
  store float %71, float* %cw, align 4, !dbg !1576
  %72 = load i32, i32* %ty, align 4, !dbg !1577
  %idxprom93 = sext i32 %72 to i64, !dbg !1578
  %arrayidx94 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom93, !dbg !1578
  %73 = load i32, i32* %tx, align 4, !dbg !1579
  %idxprom95 = sext i32 %73 to i64, !dbg !1578
  %arrayidx96 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx94, i64 0, i64 %idxprom95, !dbg !1578
  %74 = load float, float* %arrayidx96, align 4, !dbg !1578
  store float %74, float* %ce, align 4, !dbg !1580
  br label %if.end133, !dbg !1581

if.else:                                          ; preds = %land.lhs.true, %if.end75
  %75 = load i32, i32* %tx, align 4, !dbg !1582
  %cmp97 = icmp eq i32 %75, 15, !dbg !1584
  br i1 %cmp97, label %if.then98, label %if.else108, !dbg !1585

if.then98:                                        ; preds = %if.else
  %76 = load float, float* %cc, align 4, !dbg !1586
  store float %76, float* %cn, align 4, !dbg !1588
  %77 = load i32, i32* %ty, align 4, !dbg !1589
  %add99 = add nsw i32 %77, 1, !dbg !1590
  %idxprom100 = sext i32 %add99 to i64, !dbg !1591
  %arrayidx101 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom100, !dbg !1591
  %78 = load i32, i32* %tx, align 4, !dbg !1592
  %idxprom102 = sext i32 %78 to i64, !dbg !1591
  %arrayidx103 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx101, i64 0, i64 %idxprom102, !dbg !1591
  %79 = load float, float* %arrayidx103, align 4, !dbg !1591
  store float %79, float* %cs, align 4, !dbg !1593
  %80 = load float, float* %cc, align 4, !dbg !1594
  store float %80, float* %cw, align 4, !dbg !1595
  %81 = load i32, i32* %ty, align 4, !dbg !1596
  %idxprom104 = sext i32 %81 to i64, !dbg !1597
  %arrayidx105 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom104, !dbg !1597
  %82 = load i32, i32* %tx, align 4, !dbg !1598
  %idxprom106 = sext i32 %82 to i64, !dbg !1597
  %arrayidx107 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx105, i64 0, i64 %idxprom106, !dbg !1597
  %83 = load float, float* %arrayidx107, align 4, !dbg !1597
  store float %83, float* %ce, align 4, !dbg !1599
  br label %if.end132, !dbg !1600

if.else108:                                       ; preds = %if.else
  %84 = load i32, i32* %ty, align 4, !dbg !1601
  %cmp109 = icmp eq i32 %84, 15, !dbg !1603
  br i1 %cmp109, label %if.then110, label %if.else120, !dbg !1604

if.then110:                                       ; preds = %if.else108
  %85 = load float, float* %cc, align 4, !dbg !1605
  store float %85, float* %cn, align 4, !dbg !1607
  %86 = load i32, i32* %ty, align 4, !dbg !1608
  %idxprom111 = sext i32 %86 to i64, !dbg !1609
  %arrayidx112 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom111, !dbg !1609
  %87 = load i32, i32* %tx, align 4, !dbg !1610
  %idxprom113 = sext i32 %87 to i64, !dbg !1609
  %arrayidx114 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx112, i64 0, i64 %idxprom113, !dbg !1609
  %88 = load float, float* %arrayidx114, align 4, !dbg !1609
  store float %88, float* %cs, align 4, !dbg !1611
  %89 = load float, float* %cc, align 4, !dbg !1612
  store float %89, float* %cw, align 4, !dbg !1613
  %90 = load i32, i32* %ty, align 4, !dbg !1614
  %idxprom115 = sext i32 %90 to i64, !dbg !1615
  %arrayidx116 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom115, !dbg !1615
  %91 = load i32, i32* %tx, align 4, !dbg !1616
  %add117 = add nsw i32 %91, 1, !dbg !1617
  %idxprom118 = sext i32 %add117 to i64, !dbg !1615
  %arrayidx119 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx116, i64 0, i64 %idxprom118, !dbg !1615
  %92 = load float, float* %arrayidx119, align 4, !dbg !1615
  store float %92, float* %ce, align 4, !dbg !1618
  br label %if.end131, !dbg !1619

if.else120:                                       ; preds = %if.else108
  %93 = load float, float* %cc, align 4, !dbg !1620
  store float %93, float* %cn, align 4, !dbg !1622
  %94 = load i32, i32* %ty, align 4, !dbg !1623
  %add121 = add nsw i32 %94, 1, !dbg !1624
  %idxprom122 = sext i32 %add121 to i64, !dbg !1625
  %arrayidx123 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom122, !dbg !1625
  %95 = load i32, i32* %tx, align 4, !dbg !1626
  %idxprom124 = sext i32 %95 to i64, !dbg !1625
  %arrayidx125 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx123, i64 0, i64 %idxprom124, !dbg !1625
  %96 = load float, float* %arrayidx125, align 4, !dbg !1625
  store float %96, float* %cs, align 4, !dbg !1627
  %97 = load float, float* %cc, align 4, !dbg !1628
  store float %97, float* %cw, align 4, !dbg !1629
  %98 = load i32, i32* %ty, align 4, !dbg !1630
  %idxprom126 = sext i32 %98 to i64, !dbg !1631
  %arrayidx127 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom126, !dbg !1631
  %99 = load i32, i32* %tx, align 4, !dbg !1632
  %add128 = add nsw i32 %99, 1, !dbg !1633
  %idxprom129 = sext i32 %add128 to i64, !dbg !1631
  %arrayidx130 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx127, i64 0, i64 %idxprom129, !dbg !1631
  %100 = load float, float* %arrayidx130, align 4, !dbg !1631
  store float %100, float* %ce, align 4, !dbg !1634
  br label %if.end131

if.end131:                                        ; preds = %if.else120, %if.then110
  br label %if.end132

if.end132:                                        ; preds = %if.end131, %if.then98
  br label %if.end133

if.end133:                                        ; preds = %if.end132, %if.then88
  %101 = load float, float* %cn, align 4, !dbg !1635
  %102 = load float*, float** %N_C.addr, align 8, !dbg !1636
  %103 = load i32, i32* %index, align 4, !dbg !1637
  %idxprom134 = sext i32 %103 to i64, !dbg !1636
  %arrayidx135 = getelementptr inbounds float, float* %102, i64 %idxprom134, !dbg !1636
  %104 = load float, float* %arrayidx135, align 4, !dbg !1636
  %mul136 = fmul float %101, %104, !dbg !1638
  %105 = load float, float* %cs, align 4, !dbg !1639
  %106 = load float*, float** %S_C.addr, align 8, !dbg !1640
  %107 = load i32, i32* %index, align 4, !dbg !1641
  %idxprom137 = sext i32 %107 to i64, !dbg !1640
  %arrayidx138 = getelementptr inbounds float, float* %106, i64 %idxprom137, !dbg !1640
  %108 = load float, float* %arrayidx138, align 4, !dbg !1640
  %mul139 = fmul float %105, %108, !dbg !1642
  %add140 = fadd float %mul136, %mul139, !dbg !1643
  %109 = load float, float* %cw, align 4, !dbg !1644
  %110 = load float*, float** %W_C.addr, align 8, !dbg !1645
  %111 = load i32, i32* %index, align 4, !dbg !1646
  %idxprom141 = sext i32 %111 to i64, !dbg !1645
  %arrayidx142 = getelementptr inbounds float, float* %110, i64 %idxprom141, !dbg !1645
  %112 = load float, float* %arrayidx142, align 4, !dbg !1645
  %mul143 = fmul float %109, %112, !dbg !1647
  %add144 = fadd float %add140, %mul143, !dbg !1648
  %113 = load float, float* %ce, align 4, !dbg !1649
  %114 = load float*, float** %E_C.addr, align 8, !dbg !1650
  %115 = load i32, i32* %index, align 4, !dbg !1651
  %idxprom145 = sext i32 %115 to i64, !dbg !1650
  %arrayidx146 = getelementptr inbounds float, float* %114, i64 %idxprom145, !dbg !1650
  %116 = load float, float* %arrayidx146, align 4, !dbg !1650
  %mul147 = fmul float %113, %116, !dbg !1652
  %add148 = fadd float %add144, %mul147, !dbg !1653
  store float %add148, float* %d_sum, align 4, !dbg !1654
  %117 = load i32, i32* %ty, align 4, !dbg !1655
  %idxprom149 = sext i32 %117 to i64, !dbg !1656
  %arrayidx150 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom149, !dbg !1656
  %118 = load i32, i32* %tx, align 4, !dbg !1657
  %idxprom151 = sext i32 %118 to i64, !dbg !1656
  %arrayidx152 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx150, i64 0, i64 %idxprom151, !dbg !1656
  %119 = load float, float* %arrayidx152, align 4, !dbg !1656
  %conv = fpext float %119 to double, !dbg !1656
  %120 = load float, float* %lambda.addr, align 4, !dbg !1658
  %conv153 = fpext float %120 to double, !dbg !1658
  %mul154 = fmul double 2.500000e-01, %conv153, !dbg !1659
  %121 = load float, float* %d_sum, align 4, !dbg !1660
  %conv155 = fpext float %121 to double, !dbg !1660
  %mul156 = fmul double %mul154, %conv155, !dbg !1661
  %add157 = fadd double %conv, %mul156, !dbg !1662
  %conv158 = fptrunc double %add157 to float, !dbg !1656
  %122 = load i32, i32* %ty, align 4, !dbg !1663
  %idxprom159 = sext i32 %122 to i64, !dbg !1664
  %arrayidx160 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE13c_cuda_result to [16 x [16 x float]]*), i64 0, i64 %idxprom159, !dbg !1664
  %123 = load i32, i32* %tx, align 4, !dbg !1665
  %idxprom161 = sext i32 %123 to i64, !dbg !1664
  %arrayidx162 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx160, i64 0, i64 %idxprom161, !dbg !1664
  store float %conv158, float* %arrayidx162, align 4, !dbg !1666
  call void @llvm.nvvm.barrier0(), !dbg !1667
  %124 = load i32, i32* %ty, align 4, !dbg !1668
  %idxprom163 = sext i32 %124 to i64, !dbg !1669
  %arrayidx164 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE13c_cuda_result to [16 x [16 x float]]*), i64 0, i64 %idxprom163, !dbg !1669
  %125 = load i32, i32* %tx, align 4, !dbg !1670
  %idxprom165 = sext i32 %125 to i64, !dbg !1669
  %arrayidx166 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx164, i64 0, i64 %idxprom165, !dbg !1669
  %126 = load float, float* %arrayidx166, align 4, !dbg !1669
  %127 = load float*, float** %J_cuda.addr, align 8, !dbg !1671
  %128 = load i32, i32* %index, align 4, !dbg !1672
  %idxprom167 = sext i32 %128 to i64, !dbg !1671
  %arrayidx168 = getelementptr inbounds float, float* %127, i64 %idxprom167, !dbg !1671
  store float %126, float* %arrayidx168, align 4, !dbg !1673
  ret void, !dbg !1674
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.y() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!8}
!nvvm.annotations = !{!583, !584, !585, !586, !585, !587, !587, !587, !587, !588, !588, !587}
!llvm.module.flags = !{!589, !590, !591}
!llvm.ident = !{!592}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!593}

!0 = distinct !DIGlobalVariable(name: "temp", scope: !1, file: !2, line: 36, type: !13, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "srad_cuda_1", linkageName: "_Z11srad_cuda_1PfS_S_S_S_S_iif", scope: !2, file: !2, line: 5, type: !3, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !10)
!2 = !DIFile(filename: "./srad_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !5, !5, !5, !5, !5, !7, !7, !6}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!7 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!8 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !9, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, globals: !11, imports: !28)
!9 = !DIFile(filename: "srad.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!10 = !{}
!11 = !{!0, !12, !16, !17, !18, !19, !20, !24, !25, !26, !27}
!12 = distinct !DIGlobalVariable(name: "temp_result", scope: !1, file: !2, line: 37, type: !13, isLocal: true, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8192, align: 32, elements: !14)
!14 = !{!15, !15}
!15 = !DISubrange(count: 16)
!16 = distinct !DIGlobalVariable(name: "north", scope: !1, file: !2, line: 39, type: !13, isLocal: true, isDefinition: true)
!17 = distinct !DIGlobalVariable(name: "south", scope: !1, file: !2, line: 40, type: !13, isLocal: true, isDefinition: true)
!18 = distinct !DIGlobalVariable(name: "east", scope: !1, file: !2, line: 41, type: !13, isLocal: true, isDefinition: true)
!19 = distinct !DIGlobalVariable(name: "west", scope: !1, file: !2, line: 42, type: !13, isLocal: true, isDefinition: true)
!20 = distinct !DIGlobalVariable(name: "south_c", scope: !21, file: !2, line: 188, type: !13, isLocal: true, isDefinition: true)
!21 = distinct !DISubprogram(name: "srad_cuda_2", linkageName: "_Z11srad_cuda_2PfS_S_S_S_S_iiff", scope: !2, file: !2, line: 160, type: !22, isLocal: false, isDefinition: true, scopeLine: 172, flags: DIFlagPrototyped, isOptimized: false, unit: !8, variables: !10)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !5, !5, !5, !5, !5, !5, !7, !7, !6, !6}
!24 = distinct !DIGlobalVariable(name: "east_c", scope: !21, file: !2, line: 189, type: !13, isLocal: true, isDefinition: true)
!25 = distinct !DIGlobalVariable(name: "c_cuda_temp", scope: !21, file: !2, line: 191, type: !13, isLocal: true, isDefinition: true)
!26 = distinct !DIGlobalVariable(name: "c_cuda_result", scope: !21, file: !2, line: 192, type: !13, isLocal: true, isDefinition: true)
!27 = distinct !DIGlobalVariable(name: "temp", scope: !21, file: !2, line: 193, type: !13, isLocal: true, isDefinition: true)
!28 = !{!29, !36, !40, !42, !44, !46, !48, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !72, !74, !76, !78, !80, !84, !86, !88, !90, !94, !99, !101, !103, !108, !112, !114, !116, !118, !120, !122, !124, !126, !128, !133, !137, !139, !141, !145, !147, !149, !151, !153, !155, !159, !161, !163, !167, !175, !179, !181, !183, !187, !189, !191, !195, !197, !199, !203, !205, !207, !209, !211, !213, !215, !217, !219, !221, !226, !228, !230, !234, !236, !238, !240, !242, !244, !246, !248, !252, !256, !258, !260, !265, !267, !269, !271, !273, !275, !277, !281, !287, !291, !295, !300, !302, !306, !310, !324, !328, !332, !336, !340, !345, !347, !351, !355, !359, !367, !371, !375, !379, !383, !388, !394, !398, !402, !404, !412, !416, !424, !426, !428, !432, !436, !440, !445, !449, !454, !455, !456, !457, !460, !461, !462, !463, !464, !465, !466, !469, !471, !473, !475, !477, !479, !481, !483, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !548, !550, !554, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581}
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !32, line: 189)
!30 = !DINamespace(name: "std", scope: null, file: !31, line: 188)
!31 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!32 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !31, file: !31, line: 44, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35}
!35 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !37, line: 190)
!37 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !31, file: !31, line: 46, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DISubroutineType(types: !39)
!39 = !{!6, !6}
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !41, line: 191)
!41 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !31, file: !31, line: 48, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !43, line: 192)
!43 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !31, file: !31, line: 50, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !45, line: 193)
!45 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !31, file: !31, line: 52, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !47, line: 194)
!47 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !31, file: !31, line: 56, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !49, line: 195)
!49 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !31, file: !31, line: 54, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DISubroutineType(types: !51)
!51 = !{!6, !6, !6}
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !53, line: 196)
!53 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !31, file: !31, line: 58, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !55, line: 197)
!55 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !31, file: !31, line: 60, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !57, line: 198)
!57 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !31, file: !31, line: 62, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !59, line: 199)
!59 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !31, file: !31, line: 64, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !61, line: 200)
!61 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !31, file: !31, line: 66, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !63, line: 201)
!63 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !31, file: !31, line: 68, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !65, line: 202)
!65 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !31, file: !31, line: 72, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !67, line: 203)
!67 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !31, file: !31, line: 70, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !69, line: 204)
!69 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !31, file: !31, line: 76, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !71, line: 205)
!71 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !31, file: !31, line: 74, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !73, line: 206)
!73 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !31, file: !31, line: 78, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !75, line: 207)
!75 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !31, file: !31, line: 80, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !77, line: 208)
!77 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !31, file: !31, line: 82, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !79, line: 209)
!79 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !31, file: !31, line: 84, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !81, line: 210)
!81 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !31, file: !31, line: 86, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DISubroutineType(types: !83)
!83 = !{!6, !6, !6, !6}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !85, line: 211)
!85 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !31, file: !31, line: 88, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !87, line: 212)
!87 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !31, file: !31, line: 90, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !89, line: 213)
!89 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !31, file: !31, line: 92, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !91, line: 214)
!91 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !31, file: !31, line: 94, type: !92, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !6}
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !95, line: 215)
!95 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !31, file: !31, line: 96, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DISubroutineType(types: !97)
!97 = !{!6, !6, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !100, line: 216)
!100 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !31, file: !31, line: 98, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !102, line: 217)
!102 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !31, file: !31, line: 100, type: !92, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !104, line: 218)
!104 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !31, file: !31, line: 102, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DISubroutineType(types: !106)
!106 = !{!107, !6}
!107 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !109, line: 219)
!109 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !31, file: !31, line: 106, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DISubroutineType(types: !111)
!111 = !{!107, !6, !6}
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !113, line: 220)
!113 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !31, file: !31, line: 105, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !115, line: 221)
!115 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !31, file: !31, line: 108, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !117, line: 222)
!117 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !31, file: !31, line: 112, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !119, line: 223)
!119 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !31, file: !31, line: 111, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !121, line: 224)
!121 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !31, file: !31, line: 114, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !123, line: 225)
!123 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !31, file: !31, line: 116, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !125, line: 226)
!125 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !31, file: !31, line: 118, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !127, line: 227)
!127 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !31, file: !31, line: 120, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !129, line: 228)
!129 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !31, file: !31, line: 121, type: !130, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DISubroutineType(types: !131)
!131 = !{!132, !132}
!132 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !134, line: 229)
!134 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !31, file: !31, line: 123, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DISubroutineType(types: !136)
!136 = !{!6, !6, !7}
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !138, line: 230)
!138 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !31, file: !31, line: 125, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !140, line: 231)
!140 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !31, file: !31, line: 126, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !142, line: 232)
!142 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !31, file: !31, line: 128, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DISubroutineType(types: !144)
!144 = !{!35, !6}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !146, line: 233)
!146 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !31, file: !31, line: 138, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !148, line: 234)
!148 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !31, file: !31, line: 130, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !150, line: 235)
!150 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !31, file: !31, line: 132, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !152, line: 236)
!152 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !31, file: !31, line: 134, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !154, line: 237)
!154 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !31, file: !31, line: 136, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !156, line: 238)
!156 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !31, file: !31, line: 140, type: !157, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!132, !6}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !160, line: 239)
!160 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !31, file: !31, line: 142, type: !157, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !162, line: 240)
!162 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !31, file: !31, line: 143, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !164, line: 241)
!164 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !31, file: !31, line: 145, type: !165, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DISubroutineType(types: !166)
!166 = !{!6, !6, !5}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !168, line: 242)
!168 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !31, file: !31, line: 146, type: !169, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{!171, !172}
!171 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !173, size: 64, align: 64)
!173 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !174)
!174 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !176, line: 243)
!176 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !31, file: !31, line: 147, type: !177, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DISubroutineType(types: !178)
!178 = !{!6, !172}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !180, line: 244)
!180 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !31, file: !31, line: 149, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !182, line: 245)
!182 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !31, file: !31, line: 151, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !184, line: 246)
!184 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !31, file: !31, line: 153, type: !185, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DISubroutineType(types: !186)
!186 = !{!6, !6, !171}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !188, line: 247)
!188 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !31, file: !31, line: 158, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !190, line: 248)
!190 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !31, file: !31, line: 160, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !192, line: 249)
!192 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !31, file: !31, line: 162, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!6, !6, !6, !98}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !196, line: 250)
!196 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !31, file: !31, line: 164, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !198, line: 251)
!198 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !31, file: !31, line: 166, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !200, line: 252)
!200 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !31, file: !31, line: 168, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!6, !6, !132}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !204, line: 253)
!204 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !31, file: !31, line: 170, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !206, line: 254)
!206 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !31, file: !31, line: 172, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !208, line: 255)
!208 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !31, file: !31, line: 174, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !210, line: 256)
!210 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !31, file: !31, line: 176, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !212, line: 257)
!212 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !31, file: !31, line: 178, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !214, line: 258)
!214 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !31, file: !31, line: 180, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !216, line: 259)
!216 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !31, file: !31, line: 182, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !218, line: 260)
!218 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !31, file: !31, line: 184, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !220, line: 261)
!220 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !31, file: !31, line: 186, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !222, line: 102)
!222 = !DISubprogram(name: "acos", scope: !223, file: !223, line: 54, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!224 = !DISubroutineType(types: !225)
!225 = !{!171, !171}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !227, line: 121)
!227 = !DISubprogram(name: "asin", scope: !223, file: !223, line: 56, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !229, line: 140)
!229 = !DISubprogram(name: "atan", scope: !223, file: !223, line: 58, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !231, line: 159)
!231 = !DISubprogram(name: "atan2", scope: !223, file: !223, line: 60, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{!171, !171, !171}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !235, line: 180)
!235 = !DISubprogram(name: "ceil", scope: !223, file: !223, line: 178, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !237, line: 199)
!237 = !DISubprogram(name: "cos", scope: !223, file: !223, line: 63, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !239, line: 218)
!239 = !DISubprogram(name: "cosh", scope: !223, file: !223, line: 72, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !241, line: 237)
!241 = !DISubprogram(name: "exp", scope: !223, file: !223, line: 100, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !243, line: 256)
!243 = !DISubprogram(name: "fabs", scope: !223, file: !223, line: 181, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !245, line: 275)
!245 = !DISubprogram(name: "floor", scope: !223, file: !223, line: 184, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !247, line: 294)
!247 = !DISubprogram(name: "fmod", scope: !223, file: !223, line: 187, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !249, line: 315)
!249 = !DISubprogram(name: "frexp", scope: !223, file: !223, line: 103, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{!171, !171, !98}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !253, line: 334)
!253 = !DISubprogram(name: "ldexp", scope: !223, file: !223, line: 106, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{!171, !171, !7}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !257, line: 353)
!257 = !DISubprogram(name: "log", scope: !223, file: !223, line: 109, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !259, line: 372)
!259 = !DISubprogram(name: "log10", scope: !223, file: !223, line: 112, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !261, line: 391)
!261 = !DISubprogram(name: "modf", scope: !223, file: !223, line: 115, type: !262, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DISubroutineType(types: !263)
!263 = !{!171, !171, !264}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64, align: 64)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !266, line: 403)
!266 = !DISubprogram(name: "pow", scope: !223, file: !223, line: 153, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !268, line: 440)
!268 = !DISubprogram(name: "sin", scope: !223, file: !223, line: 65, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !270, line: 459)
!270 = !DISubprogram(name: "sinh", scope: !223, file: !223, line: 74, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !272, line: 478)
!272 = !DISubprogram(name: "sqrt", scope: !223, file: !223, line: 156, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !274, line: 497)
!274 = !DISubprogram(name: "tan", scope: !223, file: !223, line: 67, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !276, line: 516)
!276 = !DISubprogram(name: "tanh", scope: !223, file: !223, line: 76, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !278, line: 118)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !279, line: 101, baseType: !280)
!279 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!280 = !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !282, line: 119)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !279, line: 109, baseType: !283)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 105, size: 128, align: 64, elements: !284, identifier: "_ZTS6ldiv_t")
!284 = !{!285, !286}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !283, file: !279, line: 107, baseType: !132, size: 64, align: 64)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !283, file: !279, line: 108, baseType: !132, size: 64, align: 64, offset: 64)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !288, line: 121)
!288 = !DISubprogram(name: "abort", scope: !279, file: !279, line: 515, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!289 = !DISubroutineType(types: !290)
!290 = !{null}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !292, line: 122)
!292 = !DISubprogram(name: "abs", scope: !279, file: !279, line: 774, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!7, !7}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !296, line: 123)
!296 = !DISubprogram(name: "atexit", scope: !279, file: !279, line: 519, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!7, !299}
!299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64, align: 64)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !301, line: 129)
!301 = !DISubprogram(name: "atof", scope: !279, file: !279, line: 144, type: !169, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !303, line: 130)
!303 = !DISubprogram(name: "atoi", scope: !279, file: !279, line: 147, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!7, !172}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !307, line: 131)
!307 = !DISubprogram(name: "atol", scope: !279, file: !279, line: 150, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!132, !172}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !311, line: 132)
!311 = !DISubprogram(name: "bsearch", scope: !279, file: !279, line: 754, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{!314, !315, !315, !317, !317, !320}
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 64, align: 64)
!316 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!317 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !318, line: 62, baseType: !319)
!318 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!319 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !279, line: 741, baseType: !321)
!321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !322, size: 64, align: 64)
!322 = !DISubroutineType(types: !323)
!323 = !{!7, !315, !315}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !325, line: 133)
!325 = !DISubprogram(name: "calloc", scope: !279, file: !279, line: 468, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!314, !317, !317}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !329, line: 134)
!329 = !DISubprogram(name: "div", scope: !279, file: !279, line: 788, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!278, !7, !7}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !333, line: 135)
!333 = !DISubprogram(name: "exit", scope: !279, file: !279, line: 543, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{null, !7}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !337, line: 136)
!337 = !DISubprogram(name: "free", scope: !279, file: !279, line: 483, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{null, !314}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !341, line: 137)
!341 = !DISubprogram(name: "getenv", scope: !279, file: !279, line: 564, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{!344, !172}
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64, align: 64)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !346, line: 138)
!346 = !DISubprogram(name: "labs", scope: !279, file: !279, line: 775, type: !130, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !348, line: 139)
!348 = !DISubprogram(name: "ldiv", scope: !279, file: !279, line: 790, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!282, !132, !132}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !352, line: 140)
!352 = !DISubprogram(name: "malloc", scope: !279, file: !279, line: 466, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{!314, !317}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !356, line: 142)
!356 = !DISubprogram(name: "mblen", scope: !279, file: !279, line: 862, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!7, !172, !317}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !360, line: 143)
!360 = !DISubprogram(name: "mbstowcs", scope: !279, file: !279, line: 873, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{!317, !363, !366, !317}
!363 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !364)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64, align: 64)
!365 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!366 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !172)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !368, line: 144)
!368 = !DISubprogram(name: "mbtowc", scope: !279, file: !279, line: 865, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!7, !363, !366, !317}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !372, line: 146)
!372 = !DISubprogram(name: "qsort", scope: !279, file: !279, line: 764, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !314, !317, !317, !320}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !376, line: 152)
!376 = !DISubprogram(name: "rand", scope: !279, file: !279, line: 374, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!7}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !380, line: 153)
!380 = !DISubprogram(name: "realloc", scope: !279, file: !279, line: 480, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!381 = !DISubroutineType(types: !382)
!382 = !{!314, !314, !317}
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !384, line: 154)
!384 = !DISubprogram(name: "srand", scope: !279, file: !279, line: 376, type: !385, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!385 = !DISubroutineType(types: !386)
!386 = !{null, !387}
!387 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !389, line: 155)
!389 = !DISubprogram(name: "strtod", scope: !279, file: !279, line: 164, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !DISubroutineType(types: !391)
!391 = !{!171, !366, !392}
!392 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !393)
!393 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 64, align: 64)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !395, line: 156)
!395 = !DISubprogram(name: "strtol", scope: !279, file: !279, line: 183, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!132, !366, !392, !7}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !399, line: 157)
!399 = !DISubprogram(name: "strtoul", scope: !279, file: !279, line: 187, type: !400, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DISubroutineType(types: !401)
!401 = !{!319, !366, !392, !7}
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !403, line: 158)
!403 = !DISubprogram(name: "system", scope: !279, file: !279, line: 716, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !405, line: 160)
!405 = !DISubprogram(name: "wcstombs", scope: !279, file: !279, line: 876, type: !406, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!406 = !DISubroutineType(types: !407)
!407 = !{!317, !408, !409, !317}
!408 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !344)
!409 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !410)
!410 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !411, size: 64, align: 64)
!411 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !365)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !413, line: 161)
!413 = !DISubprogram(name: "wctomb", scope: !279, file: !279, line: 869, type: !414, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!414 = !DISubroutineType(types: !415)
!415 = !{!7, !344, !365}
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !419, line: 214)
!417 = !DINamespace(name: "__gnu_cxx", scope: null, file: !418, line: 220)
!418 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !279, line: 121, baseType: !420)
!420 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 117, size: 128, align: 64, elements: !421, identifier: "_ZTS7lldiv_t")
!421 = !{!422, !423}
!422 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !420, file: !279, line: 119, baseType: !35, size: 64, align: 64)
!423 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !420, file: !279, line: 120, baseType: !35, size: 64, align: 64, offset: 64)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !425, line: 220)
!425 = !DISubprogram(name: "_Exit", scope: !279, file: !279, line: 557, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !427, line: 224)
!427 = !DISubprogram(name: "llabs", scope: !279, file: !279, line: 779, type: !33, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !429, line: 230)
!429 = !DISubprogram(name: "lldiv", scope: !279, file: !279, line: 796, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!419, !35, !35}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !433, line: 241)
!433 = !DISubprogram(name: "atoll", scope: !279, file: !279, line: 157, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!35, !172}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !437, line: 242)
!437 = !DISubprogram(name: "strtoll", scope: !279, file: !279, line: 209, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!35, !366, !392, !7}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !441, line: 243)
!441 = !DISubprogram(name: "strtoull", scope: !279, file: !279, line: 214, type: !442, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DISubroutineType(types: !443)
!443 = !{!444, !366, !392, !7}
!444 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !446, line: 245)
!446 = !DISubprogram(name: "strtof", scope: !279, file: !279, line: 172, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!6, !366, !392}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !417, entity: !450, line: 246)
!450 = !DISubprogram(name: "strtold", scope: !279, file: !279, line: 175, type: !451, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!451 = !DISubroutineType(types: !452)
!452 = !{!453, !366, !392}
!453 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !419, line: 254)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !425, line: 256)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !427, line: 258)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !458, line: 259)
!458 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !417, file: !459, line: 227, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!459 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !429, line: 260)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !433, line: 262)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !446, line: 263)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !437, line: 264)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !441, line: 265)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !450, line: 266)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !467, line: 397)
!467 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !468, file: !468, line: 1342, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !470, line: 398)
!470 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !468, file: !468, line: 1370, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !472, line: 399)
!472 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !468, file: !468, line: 1337, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !474, line: 400)
!474 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !468, file: !468, line: 1375, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !476, line: 401)
!476 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !468, file: !468, line: 1327, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !478, line: 402)
!478 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !468, file: !468, line: 1332, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !480, line: 403)
!480 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !468, file: !468, line: 1380, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !482, line: 404)
!482 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !468, file: !468, line: 1430, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !484, line: 405)
!484 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !485, file: !485, line: 667, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !487, line: 406)
!487 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !468, file: !468, line: 1189, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !489, line: 407)
!489 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !468, file: !468, line: 1243, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !491, line: 408)
!491 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !468, file: !468, line: 1312, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !493, line: 409)
!493 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !468, file: !468, line: 1490, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !495, line: 410)
!495 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !468, file: !468, line: 1480, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !497, line: 411)
!497 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !485, file: !485, line: 657, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !499, line: 412)
!499 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !468, file: !468, line: 1294, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !501, line: 413)
!501 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !468, file: !468, line: 1385, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !503, line: 414)
!503 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !485, file: !485, line: 607, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !505, line: 415)
!505 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !468, file: !468, line: 1616, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !507, line: 416)
!507 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !485, file: !485, line: 597, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !509, line: 417)
!509 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !468, file: !468, line: 1568, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !511, line: 418)
!511 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !485, file: !485, line: 622, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !513, line: 419)
!513 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !485, file: !485, line: 617, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !515, line: 420)
!515 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !468, file: !468, line: 1553, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !517, line: 421)
!517 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !468, file: !468, line: 1543, type: !96, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !519, line: 422)
!519 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !468, file: !468, line: 1390, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !521, line: 423)
!521 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !468, file: !468, line: 1621, type: !92, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !523, line: 424)
!523 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !468, file: !468, line: 1520, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !525, line: 425)
!525 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !468, file: !468, line: 1515, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !527, line: 426)
!527 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !468, file: !468, line: 1149, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !529, line: 427)
!529 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !468, file: !468, line: 1602, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !531, line: 428)
!531 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !468, file: !468, line: 1356, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !533, line: 429)
!533 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !468, file: !468, line: 1365, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !535, line: 430)
!535 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !468, file: !468, line: 1285, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !537, line: 431)
!537 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !468, file: !468, line: 1626, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !539, line: 432)
!539 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !468, file: !468, line: 1347, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !541, line: 433)
!541 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !468, file: !468, line: 1140, type: !157, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !543, line: 434)
!543 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !468, file: !468, line: 1607, type: !157, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !545, line: 435)
!545 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !468, file: !468, line: 1548, type: !165, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !547, line: 436)
!547 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !468, file: !468, line: 1154, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !549, line: 437)
!549 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !468, file: !468, line: 1218, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !551, line: 438)
!551 = !DISubprogram(name: "nexttowardf", scope: !223, file: !223, line: 294, type: !552, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DISubroutineType(types: !553)
!553 = !{!6, !6, !453}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !551, line: 439)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !556, line: 440)
!556 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !468, file: !468, line: 1583, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !558, line: 441)
!558 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !468, file: !468, line: 1558, type: !50, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !560, line: 442)
!560 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !468, file: !468, line: 1563, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !562, line: 443)
!562 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !468, file: !468, line: 1135, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !564, line: 444)
!564 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !468, file: !468, line: 1597, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !566, line: 445)
!566 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !468, file: !468, line: 1530, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !568, line: 446)
!568 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !468, file: !468, line: 1525, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !570, line: 447)
!570 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !468, file: !468, line: 1234, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !572, line: 448)
!572 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !468, file: !468, line: 1317, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !574, line: 449)
!574 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !485, file: !485, line: 907, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !576, line: 450)
!576 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !468, file: !468, line: 1276, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !578, line: 451)
!578 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !468, file: !468, line: 1322, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !580, line: 452)
!580 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !468, file: !468, line: 1592, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !582, line: 453)
!582 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !485, file: !485, line: 662, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!583 = !{void (float*, float*, float*, float*, float*, float*, i32, i32, float)* @_Z11srad_cuda_1PfS_S_S_S_S_iif, !"kernel", i32 1}
!584 = !{void (float*, float*, float*, float*, float*, float*, i32, i32, float, float)* @_Z11srad_cuda_2PfS_S_S_S_S_iiff, !"kernel", i32 1}
!585 = !{null, !"align", i32 8}
!586 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!587 = !{null, !"align", i32 16}
!588 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!589 = !{i32 2, !"Dwarf Version", i32 4}
!590 = !{i32 2, !"Debug Info Version", i32 3}
!591 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!592 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!593 = !{i32 1, i32 2}
!594 = !DILocalVariable(name: "E_C", arg: 1, scope: !1, file: !2, line: 6, type: !5)
!595 = !DIExpression()
!596 = !DILocation(line: 6, column: 12, scope: !1)
!597 = !DILocalVariable(name: "W_C", arg: 2, scope: !1, file: !2, line: 7, type: !5)
!598 = !DILocation(line: 7, column: 12, scope: !1)
!599 = !DILocalVariable(name: "N_C", arg: 3, scope: !1, file: !2, line: 8, type: !5)
!600 = !DILocation(line: 8, column: 12, scope: !1)
!601 = !DILocalVariable(name: "S_C", arg: 4, scope: !1, file: !2, line: 9, type: !5)
!602 = !DILocation(line: 9, column: 12, scope: !1)
!603 = !DILocalVariable(name: "J_cuda", arg: 5, scope: !1, file: !2, line: 10, type: !5)
!604 = !DILocation(line: 10, column: 13, scope: !1)
!605 = !DILocalVariable(name: "C_cuda", arg: 6, scope: !1, file: !2, line: 11, type: !5)
!606 = !DILocation(line: 11, column: 13, scope: !1)
!607 = !DILocalVariable(name: "cols", arg: 7, scope: !1, file: !2, line: 12, type: !7)
!608 = !DILocation(line: 12, column: 9, scope: !1)
!609 = !DILocalVariable(name: "rows", arg: 8, scope: !1, file: !2, line: 13, type: !7)
!610 = !DILocation(line: 13, column: 9, scope: !1)
!611 = !DILocalVariable(name: "q0sqr", arg: 9, scope: !1, file: !2, line: 14, type: !6)
!612 = !DILocation(line: 14, column: 11, scope: !1)
!613 = !DILocalVariable(name: "bx", scope: !1, file: !2, line: 19, type: !7)
!614 = !DILocation(line: 19, column: 7, scope: !1)
!615 = !DILocation(line: 78, column: 3, scope: !616, inlinedAt: !651)
!616 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !618, file: !617, line: 78, type: !621, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !620, variables: !10)
!617 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!618 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !617, line: 77, size: 8, align: 8, elements: !619, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!619 = !{!620, !623, !624, !625, !636, !640, !644, !647}
!620 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !618, file: !617, line: 78, type: !621, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DISubroutineType(types: !622)
!622 = !{!387}
!623 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !618, file: !617, line: 79, type: !621, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !618, file: !617, line: 80, type: !621, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!625 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !618, file: !617, line: 83, type: !626, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DISubroutineType(types: !627)
!627 = !{!628, !634}
!628 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !629, line: 190, size: 96, align: 32, elements: !630, identifier: "_ZTS5uint3")
!629 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!630 = !{!631, !632, !633}
!631 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !628, file: !629, line: 192, baseType: !387, size: 32, align: 32)
!632 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !628, file: !629, line: 192, baseType: !387, size: 32, align: 32, offset: 32)
!633 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !628, file: !629, line: 192, baseType: !387, size: 32, align: 32, offset: 64)
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!635 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !618)
!636 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !618, file: !617, line: 85, type: !637, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!637 = !DISubroutineType(types: !638)
!638 = !{null, !639}
!639 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !618, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!640 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !618, file: !617, line: 85, type: !641, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!641 = !DISubroutineType(types: !642)
!642 = !{null, !639, !643}
!643 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !635, size: 64, align: 64)
!644 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !618, file: !617, line: 85, type: !645, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!645 = !DISubroutineType(types: !646)
!646 = !{null, !634, !643}
!647 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !618, file: !617, line: 85, type: !648, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!648 = !DISubroutineType(types: !649)
!649 = !{!650, !634}
!650 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !618, size: 64, align: 64)
!651 = distinct !DILocation(line: 19, column: 12, scope: !1)
!652 = !{i32 0, i32 65535}
!653 = !DILocalVariable(name: "by", scope: !1, file: !2, line: 20, type: !7)
!654 = !DILocation(line: 20, column: 7, scope: !1)
!655 = !DILocation(line: 79, column: 3, scope: !656, inlinedAt: !657)
!656 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !618, file: !617, line: 79, type: !621, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !623, variables: !10)
!657 = distinct !DILocation(line: 20, column: 12, scope: !1)
!658 = !DILocalVariable(name: "tx", scope: !1, file: !2, line: 23, type: !7)
!659 = !DILocation(line: 23, column: 7, scope: !1)
!660 = !DILocation(line: 67, column: 3, scope: !661, inlinedAt: !687)
!661 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !662, file: !617, line: 67, type: !621, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !664, variables: !10)
!662 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !617, line: 66, size: 8, align: 8, elements: !663, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!663 = !{!664, !665, !666, !667, !672, !676, !680, !683}
!664 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !662, file: !617, line: 67, type: !621, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!665 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !662, file: !617, line: 68, type: !621, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!666 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !662, file: !617, line: 69, type: !621, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!667 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !662, file: !617, line: 72, type: !668, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!668 = !DISubroutineType(types: !669)
!669 = !{!628, !670}
!670 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !671, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!671 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !662)
!672 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !662, file: !617, line: 74, type: !673, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!673 = !DISubroutineType(types: !674)
!674 = !{null, !675}
!675 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!676 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !662, file: !617, line: 74, type: !677, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !675, !679}
!679 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !671, size: 64, align: 64)
!680 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !662, file: !617, line: 74, type: !681, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!681 = !DISubroutineType(types: !682)
!682 = !{null, !670, !679}
!683 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !662, file: !617, line: 74, type: !684, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!684 = !DISubroutineType(types: !685)
!685 = !{!686, !670}
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 64, align: 64)
!687 = distinct !DILocation(line: 23, column: 12, scope: !1)
!688 = !{i32 0, i32 1024}
!689 = !DILocalVariable(name: "ty", scope: !1, file: !2, line: 24, type: !7)
!690 = !DILocation(line: 24, column: 7, scope: !1)
!691 = !DILocation(line: 68, column: 3, scope: !692, inlinedAt: !693)
!692 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !662, file: !617, line: 68, type: !621, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !665, variables: !10)
!693 = distinct !DILocation(line: 24, column: 12, scope: !1)
!694 = !DILocalVariable(name: "index", scope: !1, file: !2, line: 27, type: !7)
!695 = !DILocation(line: 27, column: 7, scope: !1)
!696 = !DILocation(line: 27, column: 17, scope: !1)
!697 = !DILocation(line: 27, column: 22, scope: !1)
!698 = !DILocation(line: 27, column: 37, scope: !1)
!699 = !DILocation(line: 27, column: 35, scope: !1)
!700 = !DILocation(line: 27, column: 55, scope: !1)
!701 = !DILocation(line: 27, column: 53, scope: !1)
!702 = !DILocation(line: 27, column: 40, scope: !1)
!703 = !DILocation(line: 27, column: 60, scope: !1)
!704 = !DILocation(line: 27, column: 67, scope: !1)
!705 = !DILocation(line: 27, column: 65, scope: !1)
!706 = !DILocation(line: 27, column: 58, scope: !1)
!707 = !DILocation(line: 27, column: 72, scope: !1)
!708 = !DILocation(line: 27, column: 70, scope: !1)
!709 = !DILocalVariable(name: "index_n", scope: !1, file: !2, line: 28, type: !7)
!710 = !DILocation(line: 28, column: 7, scope: !1)
!711 = !DILocation(line: 28, column: 17, scope: !1)
!712 = !DILocation(line: 28, column: 22, scope: !1)
!713 = !DILocation(line: 28, column: 37, scope: !1)
!714 = !DILocation(line: 28, column: 35, scope: !1)
!715 = !DILocation(line: 28, column: 55, scope: !1)
!716 = !DILocation(line: 28, column: 53, scope: !1)
!717 = !DILocation(line: 28, column: 40, scope: !1)
!718 = !DILocation(line: 28, column: 60, scope: !1)
!719 = !DILocation(line: 28, column: 58, scope: !1)
!720 = !DILocation(line: 28, column: 65, scope: !1)
!721 = !DILocation(line: 28, column: 63, scope: !1)
!722 = !DILocalVariable(name: "index_s", scope: !1, file: !2, line: 29, type: !7)
!723 = !DILocation(line: 29, column: 7, scope: !1)
!724 = !DILocation(line: 29, column: 17, scope: !1)
!725 = !DILocation(line: 29, column: 22, scope: !1)
!726 = !DILocation(line: 29, column: 37, scope: !1)
!727 = !DILocation(line: 29, column: 35, scope: !1)
!728 = !DILocation(line: 29, column: 55, scope: !1)
!729 = !DILocation(line: 29, column: 53, scope: !1)
!730 = !DILocation(line: 29, column: 40, scope: !1)
!731 = !DILocation(line: 29, column: 60, scope: !1)
!732 = !DILocation(line: 29, column: 65, scope: !1)
!733 = !DILocation(line: 29, column: 58, scope: !1)
!734 = !DILocation(line: 29, column: 80, scope: !1)
!735 = !DILocation(line: 29, column: 78, scope: !1)
!736 = !DILocalVariable(name: "index_w", scope: !1, file: !2, line: 30, type: !7)
!737 = !DILocation(line: 30, column: 7, scope: !1)
!738 = !DILocation(line: 30, column: 17, scope: !1)
!739 = !DILocation(line: 30, column: 22, scope: !1)
!740 = !DILocation(line: 30, column: 37, scope: !1)
!741 = !DILocation(line: 30, column: 35, scope: !1)
!742 = !DILocation(line: 30, column: 55, scope: !1)
!743 = !DILocation(line: 30, column: 53, scope: !1)
!744 = !DILocation(line: 30, column: 40, scope: !1)
!745 = !DILocation(line: 30, column: 60, scope: !1)
!746 = !DILocation(line: 30, column: 67, scope: !1)
!747 = !DILocation(line: 30, column: 65, scope: !1)
!748 = !DILocation(line: 30, column: 58, scope: !1)
!749 = !DILocation(line: 30, column: 70, scope: !1)
!750 = !DILocalVariable(name: "index_e", scope: !1, file: !2, line: 31, type: !7)
!751 = !DILocation(line: 31, column: 7, scope: !1)
!752 = !DILocation(line: 31, column: 17, scope: !1)
!753 = !DILocation(line: 31, column: 22, scope: !1)
!754 = !DILocation(line: 31, column: 37, scope: !1)
!755 = !DILocation(line: 31, column: 35, scope: !1)
!756 = !DILocation(line: 31, column: 55, scope: !1)
!757 = !DILocation(line: 31, column: 53, scope: !1)
!758 = !DILocation(line: 31, column: 40, scope: !1)
!759 = !DILocation(line: 31, column: 60, scope: !1)
!760 = !DILocation(line: 31, column: 67, scope: !1)
!761 = !DILocation(line: 31, column: 65, scope: !1)
!762 = !DILocation(line: 31, column: 58, scope: !1)
!763 = !DILocation(line: 31, column: 70, scope: !1)
!764 = !DILocalVariable(name: "n", scope: !1, file: !2, line: 33, type: !6)
!765 = !DILocation(line: 33, column: 9, scope: !1)
!766 = !DILocalVariable(name: "w", scope: !1, file: !2, line: 33, type: !6)
!767 = !DILocation(line: 33, column: 12, scope: !1)
!768 = !DILocalVariable(name: "e", scope: !1, file: !2, line: 33, type: !6)
!769 = !DILocation(line: 33, column: 15, scope: !1)
!770 = !DILocalVariable(name: "s", scope: !1, file: !2, line: 33, type: !6)
!771 = !DILocation(line: 33, column: 18, scope: !1)
!772 = !DILocalVariable(name: "jc", scope: !1, file: !2, line: 33, type: !6)
!773 = !DILocation(line: 33, column: 21, scope: !1)
!774 = !DILocalVariable(name: "g2", scope: !1, file: !2, line: 33, type: !6)
!775 = !DILocation(line: 33, column: 25, scope: !1)
!776 = !DILocalVariable(name: "l", scope: !1, file: !2, line: 33, type: !6)
!777 = !DILocation(line: 33, column: 29, scope: !1)
!778 = !DILocalVariable(name: "num", scope: !1, file: !2, line: 33, type: !6)
!779 = !DILocation(line: 33, column: 32, scope: !1)
!780 = !DILocalVariable(name: "den", scope: !1, file: !2, line: 33, type: !6)
!781 = !DILocation(line: 33, column: 37, scope: !1)
!782 = !DILocalVariable(name: "qsqr", scope: !1, file: !2, line: 33, type: !6)
!783 = !DILocation(line: 33, column: 42, scope: !1)
!784 = !DILocalVariable(name: "c", scope: !1, file: !2, line: 33, type: !6)
!785 = !DILocation(line: 33, column: 48, scope: !1)
!786 = !DILocation(line: 45, column: 19, scope: !1)
!787 = !DILocation(line: 45, column: 26, scope: !1)
!788 = !DILocation(line: 45, column: 9, scope: !1)
!789 = !DILocation(line: 45, column: 3, scope: !1)
!790 = !DILocation(line: 45, column: 13, scope: !1)
!791 = !DILocation(line: 45, column: 17, scope: !1)
!792 = !DILocation(line: 46, column: 19, scope: !1)
!793 = !DILocation(line: 46, column: 26, scope: !1)
!794 = !DILocation(line: 46, column: 9, scope: !1)
!795 = !DILocation(line: 46, column: 3, scope: !1)
!796 = !DILocation(line: 46, column: 13, scope: !1)
!797 = !DILocation(line: 46, column: 17, scope: !1)
!798 = !DILocation(line: 47, column: 8, scope: !799)
!799 = distinct !DILexicalBlock(scope: !1, file: !2, line: 47, column: 8)
!800 = !DILocation(line: 47, column: 11, scope: !799)
!801 = !DILocation(line: 47, column: 8, scope: !1)
!802 = !DILocation(line: 48, column: 19, scope: !803)
!803 = distinct !DILexicalBlock(scope: !799, file: !2, line: 47, column: 17)
!804 = !DILocation(line: 48, column: 39, scope: !803)
!805 = !DILocation(line: 48, column: 37, scope: !803)
!806 = !DILocation(line: 48, column: 44, scope: !803)
!807 = !DILocation(line: 48, column: 42, scope: !803)
!808 = !DILocation(line: 48, column: 9, scope: !803)
!809 = !DILocation(line: 48, column: 3, scope: !803)
!810 = !DILocation(line: 48, column: 13, scope: !803)
!811 = !DILocation(line: 48, column: 17, scope: !803)
!812 = !DILocation(line: 49, column: 3, scope: !803)
!813 = !DILocation(line: 50, column: 13, scope: !814)
!814 = distinct !DILexicalBlock(scope: !799, file: !2, line: 50, column: 13)
!815 = !DILocation(line: 101, column: 3, scope: !816, inlinedAt: !858)
!816 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv", scope: !817, file: !617, line: 101, type: !621, isLocal: false, isDefinition: true, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !820, variables: !10)
!817 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_gridDim_t", file: !617, line: 99, size: 8, align: 8, elements: !818, identifier: "_ZTS24__cuda_builtin_gridDim_t")
!818 = !{!819, !820, !821, !822, !843, !847, !851, !854}
!819 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv", scope: !817, file: !617, line: 100, type: !621, isLocal: false, isDefinition: false, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: false)
!820 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv", scope: !817, file: !617, line: 101, type: !621, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: false)
!821 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_zEv", scope: !817, file: !617, line: 102, type: !621, isLocal: false, isDefinition: false, scopeLine: 102, flags: DIFlagPrototyped, isOptimized: false)
!822 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__cuda_builtin_gridDim_tcv4dim3Ev", scope: !817, file: !617, line: 105, type: !823, isLocal: false, isDefinition: false, scopeLine: 105, flags: DIFlagPrototyped, isOptimized: false)
!823 = !DISubroutineType(types: !824)
!824 = !{!825, !841}
!825 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !629, line: 417, size: 96, align: 32, elements: !826, identifier: "_ZTS4dim3")
!826 = !{!827, !828, !829, !830, !834, !838}
!827 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !825, file: !629, line: 419, baseType: !387, size: 32, align: 32)
!828 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !825, file: !629, line: 419, baseType: !387, size: 32, align: 32, offset: 32)
!829 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !825, file: !629, line: 419, baseType: !387, size: 32, align: 32, offset: 64)
!830 = !DISubprogram(name: "dim3", scope: !825, file: !629, line: 421, type: !831, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!831 = !DISubroutineType(types: !832)
!832 = !{null, !833, !387, !387, !387}
!833 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !825, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!834 = !DISubprogram(name: "dim3", scope: !825, file: !629, line: 422, type: !835, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!835 = !DISubroutineType(types: !836)
!836 = !{null, !833, !837}
!837 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !629, line: 383, baseType: !628)
!838 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !825, file: !629, line: 423, type: !839, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!839 = !DISubroutineType(types: !840)
!840 = !{!837, !833}
!841 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !842, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!842 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !817)
!843 = !DISubprogram(name: "__cuda_builtin_gridDim_t", scope: !817, file: !617, line: 107, type: !844, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!844 = !DISubroutineType(types: !845)
!845 = !{null, !846}
!846 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !817, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!847 = !DISubprogram(name: "__cuda_builtin_gridDim_t", scope: !817, file: !617, line: 107, type: !848, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!848 = !DISubroutineType(types: !849)
!849 = !{null, !846, !850}
!850 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !842, size: 64, align: 64)
!851 = !DISubprogram(name: "operator=", linkageName: "_ZNK24__cuda_builtin_gridDim_taSERKS_", scope: !817, file: !617, line: 107, type: !852, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!852 = !DISubroutineType(types: !853)
!853 = !{null, !841, !850}
!854 = !DISubprogram(name: "operator&", linkageName: "_ZNK24__cuda_builtin_gridDim_tadEv", scope: !817, file: !617, line: 107, type: !855, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!855 = !DISubroutineType(types: !856)
!856 = !{!857, !841}
!857 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !817, size: 64, align: 64)
!858 = distinct !DILocation(line: 50, column: 19, scope: !814)
!859 = !{i32 1, i32 65536}
!860 = !DILocation(line: 50, column: 29, scope: !814)
!861 = !DILocation(line: 50, column: 16, scope: !814)
!862 = !DILocation(line: 50, column: 13, scope: !799)
!863 = !DILocation(line: 51, column: 19, scope: !864)
!864 = distinct !DILexicalBlock(scope: !814, file: !2, line: 50, column: 34)
!865 = !DILocation(line: 51, column: 26, scope: !864)
!866 = !DILocation(line: 51, column: 31, scope: !864)
!867 = !DILocation(line: 101, column: 3, scope: !816, inlinedAt: !868)
!868 = distinct !DILocation(line: 51, column: 47, scope: !864)
!869 = !DILocation(line: 51, column: 57, scope: !864)
!870 = !DILocation(line: 51, column: 44, scope: !864)
!871 = !DILocation(line: 51, column: 77, scope: !864)
!872 = !DILocation(line: 51, column: 75, scope: !864)
!873 = !DILocation(line: 51, column: 62, scope: !864)
!874 = !DILocation(line: 51, column: 82, scope: !864)
!875 = !DILocation(line: 51, column: 87, scope: !864)
!876 = !DILocation(line: 51, column: 80, scope: !864)
!877 = !DILocation(line: 51, column: 110, scope: !864)
!878 = !DILocation(line: 51, column: 108, scope: !864)
!879 = !DILocation(line: 51, column: 9, scope: !864)
!880 = !DILocation(line: 51, column: 3, scope: !864)
!881 = !DILocation(line: 51, column: 13, scope: !864)
!882 = !DILocation(line: 51, column: 17, scope: !864)
!883 = !DILocation(line: 52, column: 3, scope: !864)
!884 = !DILocation(line: 53, column: 4, scope: !1)
!885 = !DILocation(line: 55, column: 18, scope: !1)
!886 = !DILocation(line: 55, column: 25, scope: !1)
!887 = !DILocation(line: 55, column: 8, scope: !1)
!888 = !DILocation(line: 55, column: 3, scope: !1)
!889 = !DILocation(line: 55, column: 12, scope: !1)
!890 = !DILocation(line: 55, column: 16, scope: !1)
!891 = !DILocation(line: 56, column: 18, scope: !1)
!892 = !DILocation(line: 56, column: 25, scope: !1)
!893 = !DILocation(line: 56, column: 8, scope: !1)
!894 = !DILocation(line: 56, column: 3, scope: !1)
!895 = !DILocation(line: 56, column: 12, scope: !1)
!896 = !DILocation(line: 56, column: 16, scope: !1)
!897 = !DILocation(line: 58, column: 8, scope: !898)
!898 = distinct !DILexicalBlock(scope: !1, file: !2, line: 58, column: 8)
!899 = !DILocation(line: 58, column: 11, scope: !898)
!900 = !DILocation(line: 58, column: 8, scope: !1)
!901 = !DILocation(line: 59, column: 18, scope: !902)
!902 = distinct !DILexicalBlock(scope: !898, file: !2, line: 58, column: 17)
!903 = !DILocation(line: 59, column: 25, scope: !902)
!904 = !DILocation(line: 59, column: 30, scope: !902)
!905 = !DILocation(line: 59, column: 45, scope: !902)
!906 = !DILocation(line: 59, column: 43, scope: !902)
!907 = !DILocation(line: 59, column: 50, scope: !902)
!908 = !DILocation(line: 59, column: 57, scope: !902)
!909 = !DILocation(line: 59, column: 55, scope: !902)
!910 = !DILocation(line: 59, column: 48, scope: !902)
!911 = !DILocation(line: 59, column: 8, scope: !902)
!912 = !DILocation(line: 59, column: 3, scope: !902)
!913 = !DILocation(line: 59, column: 12, scope: !902)
!914 = !DILocation(line: 59, column: 16, scope: !902)
!915 = !DILocation(line: 60, column: 3, scope: !902)
!916 = !DILocation(line: 61, column: 13, scope: !917)
!917 = distinct !DILexicalBlock(scope: !898, file: !2, line: 61, column: 13)
!918 = !DILocation(line: 100, column: 3, scope: !919, inlinedAt: !920)
!919 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv", scope: !817, file: !617, line: 100, type: !621, isLocal: false, isDefinition: true, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: false, unit: !8, declaration: !819, variables: !10)
!920 = distinct !DILocation(line: 61, column: 19, scope: !917)
!921 = !DILocation(line: 61, column: 29, scope: !917)
!922 = !DILocation(line: 61, column: 16, scope: !917)
!923 = !DILocation(line: 61, column: 13, scope: !898)
!924 = !DILocation(line: 62, column: 18, scope: !925)
!925 = distinct !DILexicalBlock(scope: !917, file: !2, line: 61, column: 34)
!926 = !DILocation(line: 62, column: 25, scope: !925)
!927 = !DILocation(line: 62, column: 30, scope: !925)
!928 = !DILocation(line: 62, column: 45, scope: !925)
!929 = !DILocation(line: 62, column: 43, scope: !925)
!930 = !DILocation(line: 100, column: 3, scope: !919, inlinedAt: !931)
!931 = distinct !DILocation(line: 62, column: 65, scope: !925)
!932 = !DILocation(line: 62, column: 75, scope: !925)
!933 = !DILocation(line: 62, column: 61, scope: !925)
!934 = !DILocation(line: 62, column: 48, scope: !925)
!935 = !DILocation(line: 62, column: 82, scope: !925)
!936 = !DILocation(line: 62, column: 89, scope: !925)
!937 = !DILocation(line: 62, column: 87, scope: !925)
!938 = !DILocation(line: 62, column: 80, scope: !925)
!939 = !DILocation(line: 62, column: 92, scope: !925)
!940 = !DILocation(line: 62, column: 104, scope: !925)
!941 = !DILocation(line: 62, column: 8, scope: !925)
!942 = !DILocation(line: 62, column: 3, scope: !925)
!943 = !DILocation(line: 62, column: 12, scope: !925)
!944 = !DILocation(line: 62, column: 16, scope: !925)
!945 = !DILocation(line: 63, column: 3, scope: !925)
!946 = !DILocation(line: 65, column: 3, scope: !1)
!947 = !DILocation(line: 69, column: 23, scope: !1)
!948 = !DILocation(line: 69, column: 30, scope: !1)
!949 = !DILocation(line: 69, column: 8, scope: !1)
!950 = !DILocation(line: 69, column: 3, scope: !1)
!951 = !DILocation(line: 69, column: 12, scope: !1)
!952 = !DILocation(line: 69, column: 21, scope: !1)
!953 = !DILocation(line: 71, column: 3, scope: !1)
!954 = !DILocation(line: 73, column: 14, scope: !1)
!955 = !DILocation(line: 73, column: 9, scope: !1)
!956 = !DILocation(line: 73, column: 18, scope: !1)
!957 = !DILocation(line: 73, column: 7, scope: !1)
!958 = !DILocation(line: 75, column: 9, scope: !959)
!959 = distinct !DILexicalBlock(scope: !1, file: !2, line: 75, column: 9)
!960 = !DILocation(line: 75, column: 12, scope: !959)
!961 = !DILocation(line: 75, column: 17, scope: !959)
!962 = !DILocation(line: 75, column: 20, scope: !963)
!963 = !DILexicalBlockFile(scope: !959, file: !2, discriminator: 1)
!964 = !DILocation(line: 75, column: 23, scope: !963)
!965 = !DILocation(line: 75, column: 9, scope: !963)
!966 = !DILocation(line: 76, column: 13, scope: !967)
!967 = distinct !DILexicalBlock(scope: !959, file: !2, line: 75, column: 29)
!968 = !DILocation(line: 76, column: 7, scope: !967)
!969 = !DILocation(line: 76, column: 17, scope: !967)
!970 = !DILocation(line: 76, column: 23, scope: !967)
!971 = !DILocation(line: 76, column: 21, scope: !967)
!972 = !DILocation(line: 76, column: 5, scope: !967)
!973 = !DILocation(line: 77, column: 15, scope: !967)
!974 = !DILocation(line: 77, column: 17, scope: !967)
!975 = !DILocation(line: 77, column: 10, scope: !967)
!976 = !DILocation(line: 77, column: 21, scope: !967)
!977 = !DILocation(line: 77, column: 27, scope: !967)
!978 = !DILocation(line: 77, column: 25, scope: !967)
!979 = !DILocation(line: 77, column: 8, scope: !967)
!980 = !DILocation(line: 78, column: 15, scope: !967)
!981 = !DILocation(line: 78, column: 10, scope: !967)
!982 = !DILocation(line: 78, column: 19, scope: !967)
!983 = !DILocation(line: 78, column: 26, scope: !967)
!984 = !DILocation(line: 78, column: 24, scope: !967)
!985 = !DILocation(line: 78, column: 8, scope: !967)
!986 = !DILocation(line: 79, column: 15, scope: !967)
!987 = !DILocation(line: 79, column: 10, scope: !967)
!988 = !DILocation(line: 79, column: 19, scope: !967)
!989 = !DILocation(line: 79, column: 21, scope: !967)
!990 = !DILocation(line: 79, column: 27, scope: !967)
!991 = !DILocation(line: 79, column: 25, scope: !967)
!992 = !DILocation(line: 79, column: 8, scope: !967)
!993 = !DILocation(line: 80, column: 4, scope: !967)
!994 = !DILocation(line: 81, column: 14, scope: !995)
!995 = distinct !DILexicalBlock(scope: !959, file: !2, line: 81, column: 14)
!996 = !DILocation(line: 81, column: 17, scope: !995)
!997 = !DILocation(line: 81, column: 22, scope: !995)
!998 = !DILocation(line: 81, column: 25, scope: !999)
!999 = !DILexicalBlockFile(scope: !995, file: !2, discriminator: 1)
!1000 = !DILocation(line: 81, column: 28, scope: !999)
!1001 = !DILocation(line: 81, column: 14, scope: !999)
!1002 = !DILocation(line: 82, column: 13, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !995, file: !2, line: 81, column: 45)
!1004 = !DILocation(line: 82, column: 7, scope: !1003)
!1005 = !DILocation(line: 82, column: 17, scope: !1003)
!1006 = !DILocation(line: 82, column: 23, scope: !1003)
!1007 = !DILocation(line: 82, column: 21, scope: !1003)
!1008 = !DILocation(line: 82, column: 5, scope: !1003)
!1009 = !DILocation(line: 83, column: 15, scope: !1003)
!1010 = !DILocation(line: 83, column: 17, scope: !1003)
!1011 = !DILocation(line: 83, column: 10, scope: !1003)
!1012 = !DILocation(line: 83, column: 21, scope: !1003)
!1013 = !DILocation(line: 83, column: 27, scope: !1003)
!1014 = !DILocation(line: 83, column: 25, scope: !1003)
!1015 = !DILocation(line: 83, column: 8, scope: !1003)
!1016 = !DILocation(line: 84, column: 15, scope: !1003)
!1017 = !DILocation(line: 84, column: 10, scope: !1003)
!1018 = !DILocation(line: 84, column: 19, scope: !1003)
!1019 = !DILocation(line: 84, column: 21, scope: !1003)
!1020 = !DILocation(line: 84, column: 27, scope: !1003)
!1021 = !DILocation(line: 84, column: 25, scope: !1003)
!1022 = !DILocation(line: 84, column: 8, scope: !1003)
!1023 = !DILocation(line: 85, column: 15, scope: !1003)
!1024 = !DILocation(line: 85, column: 10, scope: !1003)
!1025 = !DILocation(line: 85, column: 19, scope: !1003)
!1026 = !DILocation(line: 85, column: 25, scope: !1003)
!1027 = !DILocation(line: 85, column: 23, scope: !1003)
!1028 = !DILocation(line: 85, column: 8, scope: !1003)
!1029 = !DILocation(line: 86, column: 4, scope: !1003)
!1030 = !DILocation(line: 87, column: 14, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !995, file: !2, line: 87, column: 14)
!1032 = !DILocation(line: 87, column: 17, scope: !1031)
!1033 = !DILocation(line: 87, column: 34, scope: !1031)
!1034 = !DILocation(line: 87, column: 37, scope: !1035)
!1035 = !DILexicalBlockFile(scope: !1031, file: !2, discriminator: 1)
!1036 = !DILocation(line: 87, column: 40, scope: !1035)
!1037 = !DILocation(line: 87, column: 14, scope: !1035)
!1038 = !DILocation(line: 88, column: 12, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1031, file: !2, line: 87, column: 58)
!1040 = !DILocation(line: 88, column: 14, scope: !1039)
!1041 = !DILocation(line: 88, column: 7, scope: !1039)
!1042 = !DILocation(line: 88, column: 18, scope: !1039)
!1043 = !DILocation(line: 88, column: 24, scope: !1039)
!1044 = !DILocation(line: 88, column: 22, scope: !1039)
!1045 = !DILocation(line: 88, column: 5, scope: !1039)
!1046 = !DILocation(line: 89, column: 16, scope: !1039)
!1047 = !DILocation(line: 89, column: 10, scope: !1039)
!1048 = !DILocation(line: 89, column: 20, scope: !1039)
!1049 = !DILocation(line: 89, column: 26, scope: !1039)
!1050 = !DILocation(line: 89, column: 24, scope: !1039)
!1051 = !DILocation(line: 89, column: 8, scope: !1039)
!1052 = !DILocation(line: 90, column: 15, scope: !1039)
!1053 = !DILocation(line: 90, column: 10, scope: !1039)
!1054 = !DILocation(line: 90, column: 19, scope: !1039)
!1055 = !DILocation(line: 90, column: 21, scope: !1039)
!1056 = !DILocation(line: 90, column: 27, scope: !1039)
!1057 = !DILocation(line: 90, column: 25, scope: !1039)
!1058 = !DILocation(line: 90, column: 8, scope: !1039)
!1059 = !DILocation(line: 91, column: 15, scope: !1039)
!1060 = !DILocation(line: 91, column: 10, scope: !1039)
!1061 = !DILocation(line: 91, column: 19, scope: !1039)
!1062 = !DILocation(line: 91, column: 26, scope: !1039)
!1063 = !DILocation(line: 91, column: 24, scope: !1039)
!1064 = !DILocation(line: 91, column: 8, scope: !1039)
!1065 = !DILocation(line: 92, column: 4, scope: !1039)
!1066 = !DILocation(line: 93, column: 14, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1031, file: !2, line: 93, column: 14)
!1068 = !DILocation(line: 93, column: 17, scope: !1067)
!1069 = !DILocation(line: 93, column: 34, scope: !1067)
!1070 = !DILocation(line: 93, column: 37, scope: !1071)
!1071 = !DILexicalBlockFile(scope: !1067, file: !2, discriminator: 1)
!1072 = !DILocation(line: 93, column: 40, scope: !1071)
!1073 = !DILocation(line: 93, column: 14, scope: !1071)
!1074 = !DILocation(line: 94, column: 12, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1067, file: !2, line: 93, column: 46)
!1076 = !DILocation(line: 94, column: 14, scope: !1075)
!1077 = !DILocation(line: 94, column: 7, scope: !1075)
!1078 = !DILocation(line: 94, column: 18, scope: !1075)
!1079 = !DILocation(line: 94, column: 24, scope: !1075)
!1080 = !DILocation(line: 94, column: 22, scope: !1075)
!1081 = !DILocation(line: 94, column: 5, scope: !1075)
!1082 = !DILocation(line: 95, column: 16, scope: !1075)
!1083 = !DILocation(line: 95, column: 10, scope: !1075)
!1084 = !DILocation(line: 95, column: 20, scope: !1075)
!1085 = !DILocation(line: 95, column: 26, scope: !1075)
!1086 = !DILocation(line: 95, column: 24, scope: !1075)
!1087 = !DILocation(line: 95, column: 8, scope: !1075)
!1088 = !DILocation(line: 96, column: 15, scope: !1075)
!1089 = !DILocation(line: 96, column: 10, scope: !1075)
!1090 = !DILocation(line: 96, column: 19, scope: !1075)
!1091 = !DILocation(line: 96, column: 26, scope: !1075)
!1092 = !DILocation(line: 96, column: 24, scope: !1075)
!1093 = !DILocation(line: 96, column: 8, scope: !1075)
!1094 = !DILocation(line: 97, column: 15, scope: !1075)
!1095 = !DILocation(line: 97, column: 10, scope: !1075)
!1096 = !DILocation(line: 97, column: 19, scope: !1075)
!1097 = !DILocation(line: 97, column: 21, scope: !1075)
!1098 = !DILocation(line: 97, column: 27, scope: !1075)
!1099 = !DILocation(line: 97, column: 25, scope: !1075)
!1100 = !DILocation(line: 97, column: 8, scope: !1075)
!1101 = !DILocation(line: 98, column: 4, scope: !1075)
!1102 = !DILocation(line: 100, column: 14, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1067, file: !2, line: 100, column: 14)
!1104 = !DILocation(line: 100, column: 17, scope: !1103)
!1105 = !DILocation(line: 100, column: 14, scope: !1067)
!1106 = !DILocation(line: 101, column: 13, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1103, file: !2, line: 100, column: 23)
!1108 = !DILocation(line: 101, column: 7, scope: !1107)
!1109 = !DILocation(line: 101, column: 17, scope: !1107)
!1110 = !DILocation(line: 101, column: 23, scope: !1107)
!1111 = !DILocation(line: 101, column: 21, scope: !1107)
!1112 = !DILocation(line: 101, column: 5, scope: !1107)
!1113 = !DILocation(line: 102, column: 15, scope: !1107)
!1114 = !DILocation(line: 102, column: 17, scope: !1107)
!1115 = !DILocation(line: 102, column: 10, scope: !1107)
!1116 = !DILocation(line: 102, column: 21, scope: !1107)
!1117 = !DILocation(line: 102, column: 27, scope: !1107)
!1118 = !DILocation(line: 102, column: 25, scope: !1107)
!1119 = !DILocation(line: 102, column: 8, scope: !1107)
!1120 = !DILocation(line: 103, column: 15, scope: !1107)
!1121 = !DILocation(line: 103, column: 10, scope: !1107)
!1122 = !DILocation(line: 103, column: 19, scope: !1107)
!1123 = !DILocation(line: 103, column: 21, scope: !1107)
!1124 = !DILocation(line: 103, column: 27, scope: !1107)
!1125 = !DILocation(line: 103, column: 25, scope: !1107)
!1126 = !DILocation(line: 103, column: 8, scope: !1107)
!1127 = !DILocation(line: 104, column: 15, scope: !1107)
!1128 = !DILocation(line: 104, column: 10, scope: !1107)
!1129 = !DILocation(line: 104, column: 19, scope: !1107)
!1130 = !DILocation(line: 104, column: 21, scope: !1107)
!1131 = !DILocation(line: 104, column: 27, scope: !1107)
!1132 = !DILocation(line: 104, column: 25, scope: !1107)
!1133 = !DILocation(line: 104, column: 8, scope: !1107)
!1134 = !DILocation(line: 105, column: 4, scope: !1107)
!1135 = !DILocation(line: 106, column: 14, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1103, file: !2, line: 106, column: 14)
!1137 = !DILocation(line: 106, column: 17, scope: !1136)
!1138 = !DILocation(line: 106, column: 14, scope: !1103)
!1139 = !DILocation(line: 107, column: 12, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1136, file: !2, line: 106, column: 35)
!1141 = !DILocation(line: 107, column: 14, scope: !1140)
!1142 = !DILocation(line: 107, column: 7, scope: !1140)
!1143 = !DILocation(line: 107, column: 18, scope: !1140)
!1144 = !DILocation(line: 107, column: 24, scope: !1140)
!1145 = !DILocation(line: 107, column: 22, scope: !1140)
!1146 = !DILocation(line: 107, column: 5, scope: !1140)
!1147 = !DILocation(line: 108, column: 15, scope: !1140)
!1148 = !DILocation(line: 108, column: 17, scope: !1140)
!1149 = !DILocation(line: 108, column: 10, scope: !1140)
!1150 = !DILocation(line: 108, column: 21, scope: !1140)
!1151 = !DILocation(line: 108, column: 27, scope: !1140)
!1152 = !DILocation(line: 108, column: 25, scope: !1140)
!1153 = !DILocation(line: 108, column: 8, scope: !1140)
!1154 = !DILocation(line: 109, column: 15, scope: !1140)
!1155 = !DILocation(line: 109, column: 10, scope: !1140)
!1156 = !DILocation(line: 109, column: 19, scope: !1140)
!1157 = !DILocation(line: 109, column: 21, scope: !1140)
!1158 = !DILocation(line: 109, column: 27, scope: !1140)
!1159 = !DILocation(line: 109, column: 25, scope: !1140)
!1160 = !DILocation(line: 109, column: 8, scope: !1140)
!1161 = !DILocation(line: 110, column: 15, scope: !1140)
!1162 = !DILocation(line: 110, column: 10, scope: !1140)
!1163 = !DILocation(line: 110, column: 19, scope: !1140)
!1164 = !DILocation(line: 110, column: 25, scope: !1140)
!1165 = !DILocation(line: 110, column: 23, scope: !1140)
!1166 = !DILocation(line: 110, column: 8, scope: !1140)
!1167 = !DILocation(line: 111, column: 4, scope: !1140)
!1168 = !DILocation(line: 112, column: 14, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1136, file: !2, line: 112, column: 14)
!1170 = !DILocation(line: 112, column: 17, scope: !1169)
!1171 = !DILocation(line: 112, column: 14, scope: !1136)
!1172 = !DILocation(line: 113, column: 12, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1169, file: !2, line: 112, column: 34)
!1174 = !DILocation(line: 113, column: 14, scope: !1173)
!1175 = !DILocation(line: 113, column: 7, scope: !1173)
!1176 = !DILocation(line: 113, column: 18, scope: !1173)
!1177 = !DILocation(line: 113, column: 24, scope: !1173)
!1178 = !DILocation(line: 113, column: 22, scope: !1173)
!1179 = !DILocation(line: 113, column: 5, scope: !1173)
!1180 = !DILocation(line: 114, column: 16, scope: !1173)
!1181 = !DILocation(line: 114, column: 10, scope: !1173)
!1182 = !DILocation(line: 114, column: 20, scope: !1173)
!1183 = !DILocation(line: 114, column: 26, scope: !1173)
!1184 = !DILocation(line: 114, column: 24, scope: !1173)
!1185 = !DILocation(line: 114, column: 8, scope: !1173)
!1186 = !DILocation(line: 115, column: 15, scope: !1173)
!1187 = !DILocation(line: 115, column: 10, scope: !1173)
!1188 = !DILocation(line: 115, column: 19, scope: !1173)
!1189 = !DILocation(line: 115, column: 21, scope: !1173)
!1190 = !DILocation(line: 115, column: 27, scope: !1173)
!1191 = !DILocation(line: 115, column: 25, scope: !1173)
!1192 = !DILocation(line: 115, column: 8, scope: !1173)
!1193 = !DILocation(line: 116, column: 15, scope: !1173)
!1194 = !DILocation(line: 116, column: 10, scope: !1173)
!1195 = !DILocation(line: 116, column: 19, scope: !1173)
!1196 = !DILocation(line: 116, column: 21, scope: !1173)
!1197 = !DILocation(line: 116, column: 27, scope: !1173)
!1198 = !DILocation(line: 116, column: 25, scope: !1173)
!1199 = !DILocation(line: 116, column: 8, scope: !1173)
!1200 = !DILocation(line: 117, column: 4, scope: !1173)
!1201 = !DILocation(line: 118, column: 14, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1169, file: !2, line: 118, column: 14)
!1203 = !DILocation(line: 118, column: 17, scope: !1202)
!1204 = !DILocation(line: 118, column: 14, scope: !1169)
!1205 = !DILocation(line: 119, column: 12, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1202, file: !2, line: 118, column: 23)
!1207 = !DILocation(line: 119, column: 14, scope: !1206)
!1208 = !DILocation(line: 119, column: 7, scope: !1206)
!1209 = !DILocation(line: 119, column: 18, scope: !1206)
!1210 = !DILocation(line: 119, column: 24, scope: !1206)
!1211 = !DILocation(line: 119, column: 22, scope: !1206)
!1212 = !DILocation(line: 119, column: 5, scope: !1206)
!1213 = !DILocation(line: 120, column: 15, scope: !1206)
!1214 = !DILocation(line: 120, column: 17, scope: !1206)
!1215 = !DILocation(line: 120, column: 10, scope: !1206)
!1216 = !DILocation(line: 120, column: 21, scope: !1206)
!1217 = !DILocation(line: 120, column: 27, scope: !1206)
!1218 = !DILocation(line: 120, column: 25, scope: !1206)
!1219 = !DILocation(line: 120, column: 8, scope: !1206)
!1220 = !DILocation(line: 121, column: 15, scope: !1206)
!1221 = !DILocation(line: 121, column: 10, scope: !1206)
!1222 = !DILocation(line: 121, column: 19, scope: !1206)
!1223 = !DILocation(line: 121, column: 25, scope: !1206)
!1224 = !DILocation(line: 121, column: 23, scope: !1206)
!1225 = !DILocation(line: 121, column: 8, scope: !1206)
!1226 = !DILocation(line: 122, column: 15, scope: !1206)
!1227 = !DILocation(line: 122, column: 10, scope: !1206)
!1228 = !DILocation(line: 122, column: 19, scope: !1206)
!1229 = !DILocation(line: 122, column: 21, scope: !1206)
!1230 = !DILocation(line: 122, column: 27, scope: !1206)
!1231 = !DILocation(line: 122, column: 25, scope: !1206)
!1232 = !DILocation(line: 122, column: 8, scope: !1206)
!1233 = !DILocation(line: 123, column: 4, scope: !1206)
!1234 = !DILocation(line: 125, column: 12, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1202, file: !2, line: 124, column: 8)
!1236 = !DILocation(line: 125, column: 14, scope: !1235)
!1237 = !DILocation(line: 125, column: 7, scope: !1235)
!1238 = !DILocation(line: 125, column: 18, scope: !1235)
!1239 = !DILocation(line: 125, column: 24, scope: !1235)
!1240 = !DILocation(line: 125, column: 22, scope: !1235)
!1241 = !DILocation(line: 125, column: 5, scope: !1235)
!1242 = !DILocation(line: 126, column: 15, scope: !1235)
!1243 = !DILocation(line: 126, column: 17, scope: !1235)
!1244 = !DILocation(line: 126, column: 10, scope: !1235)
!1245 = !DILocation(line: 126, column: 21, scope: !1235)
!1246 = !DILocation(line: 126, column: 27, scope: !1235)
!1247 = !DILocation(line: 126, column: 25, scope: !1235)
!1248 = !DILocation(line: 126, column: 8, scope: !1235)
!1249 = !DILocation(line: 127, column: 15, scope: !1235)
!1250 = !DILocation(line: 127, column: 10, scope: !1235)
!1251 = !DILocation(line: 127, column: 19, scope: !1235)
!1252 = !DILocation(line: 127, column: 21, scope: !1235)
!1253 = !DILocation(line: 127, column: 27, scope: !1235)
!1254 = !DILocation(line: 127, column: 25, scope: !1235)
!1255 = !DILocation(line: 127, column: 8, scope: !1235)
!1256 = !DILocation(line: 128, column: 15, scope: !1235)
!1257 = !DILocation(line: 128, column: 10, scope: !1235)
!1258 = !DILocation(line: 128, column: 19, scope: !1235)
!1259 = !DILocation(line: 128, column: 21, scope: !1235)
!1260 = !DILocation(line: 128, column: 27, scope: !1235)
!1261 = !DILocation(line: 128, column: 25, scope: !1235)
!1262 = !DILocation(line: 128, column: 8, scope: !1235)
!1263 = !DILocation(line: 132, column: 12, scope: !1)
!1264 = !DILocation(line: 132, column: 16, scope: !1)
!1265 = !DILocation(line: 132, column: 14, scope: !1)
!1266 = !DILocation(line: 132, column: 20, scope: !1)
!1267 = !DILocation(line: 132, column: 24, scope: !1)
!1268 = !DILocation(line: 132, column: 22, scope: !1)
!1269 = !DILocation(line: 132, column: 18, scope: !1)
!1270 = !DILocation(line: 132, column: 28, scope: !1)
!1271 = !DILocation(line: 132, column: 32, scope: !1)
!1272 = !DILocation(line: 132, column: 30, scope: !1)
!1273 = !DILocation(line: 132, column: 26, scope: !1)
!1274 = !DILocation(line: 132, column: 36, scope: !1)
!1275 = !DILocation(line: 132, column: 40, scope: !1)
!1276 = !DILocation(line: 132, column: 38, scope: !1)
!1277 = !DILocation(line: 132, column: 34, scope: !1)
!1278 = !DILocation(line: 132, column: 47, scope: !1)
!1279 = !DILocation(line: 132, column: 52, scope: !1)
!1280 = !DILocation(line: 132, column: 50, scope: !1)
!1281 = !DILocation(line: 132, column: 44, scope: !1)
!1282 = !DILocation(line: 132, column: 8, scope: !1)
!1283 = !DILocation(line: 134, column: 11, scope: !1)
!1284 = !DILocation(line: 134, column: 15, scope: !1)
!1285 = !DILocation(line: 134, column: 13, scope: !1)
!1286 = !DILocation(line: 134, column: 19, scope: !1)
!1287 = !DILocation(line: 134, column: 17, scope: !1)
!1288 = !DILocation(line: 134, column: 23, scope: !1)
!1289 = !DILocation(line: 134, column: 21, scope: !1)
!1290 = !DILocation(line: 134, column: 29, scope: !1)
!1291 = !DILocation(line: 134, column: 27, scope: !1)
!1292 = !DILocation(line: 134, column: 7, scope: !1)
!1293 = !DILocation(line: 136, column: 14, scope: !1)
!1294 = !DILocation(line: 136, column: 13, scope: !1)
!1295 = !DILocation(line: 136, column: 33, scope: !1)
!1296 = !DILocation(line: 136, column: 35, scope: !1)
!1297 = !DILocation(line: 136, column: 34, scope: !1)
!1298 = !DILocation(line: 136, column: 32, scope: !1)
!1299 = !DILocation(line: 136, column: 31, scope: !1)
!1300 = !DILocation(line: 136, column: 18, scope: !1)
!1301 = !DILocation(line: 136, column: 9, scope: !1)
!1302 = !DILocation(line: 136, column: 7, scope: !1)
!1303 = !DILocation(line: 137, column: 18, scope: !1)
!1304 = !DILocation(line: 137, column: 17, scope: !1)
!1305 = !DILocation(line: 137, column: 11, scope: !1)
!1306 = !DILocation(line: 137, column: 9, scope: !1)
!1307 = !DILocation(line: 137, column: 7, scope: !1)
!1308 = !DILocation(line: 138, column: 9, scope: !1)
!1309 = !DILocation(line: 138, column: 14, scope: !1)
!1310 = !DILocation(line: 138, column: 18, scope: !1)
!1311 = !DILocation(line: 138, column: 17, scope: !1)
!1312 = !DILocation(line: 138, column: 12, scope: !1)
!1313 = !DILocation(line: 138, column: 7, scope: !1)
!1314 = !DILocation(line: 141, column: 9, scope: !1)
!1315 = !DILocation(line: 141, column: 14, scope: !1)
!1316 = !DILocation(line: 141, column: 13, scope: !1)
!1317 = !DILocation(line: 141, column: 24, scope: !1)
!1318 = !DILocation(line: 141, column: 35, scope: !1)
!1319 = !DILocation(line: 141, column: 34, scope: !1)
!1320 = !DILocation(line: 141, column: 30, scope: !1)
!1321 = !DILocation(line: 141, column: 21, scope: !1)
!1322 = !DILocation(line: 141, column: 6, scope: !1)
!1323 = !DILocation(line: 142, column: 17, scope: !1)
!1324 = !DILocation(line: 142, column: 16, scope: !1)
!1325 = !DILocation(line: 142, column: 10, scope: !1)
!1326 = !DILocation(line: 142, column: 6, scope: !1)
!1327 = !DILocation(line: 142, column: 4, scope: !1)
!1328 = !DILocation(line: 145, column: 6, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1, file: !2, line: 145, column: 6)
!1330 = !DILocation(line: 145, column: 8, scope: !1329)
!1331 = !DILocation(line: 145, column: 6, scope: !1)
!1332 = !DILocation(line: 145, column: 25, scope: !1333)
!1333 = !DILexicalBlockFile(scope: !1334, file: !2, discriminator: 1)
!1334 = distinct !DILexicalBlock(scope: !1329, file: !2, line: 145, column: 12)
!1335 = !DILocation(line: 145, column: 13, scope: !1333)
!1336 = !DILocation(line: 145, column: 29, scope: !1333)
!1337 = !DILocation(line: 145, column: 33, scope: !1333)
!1338 = !DILocation(line: 145, column: 37, scope: !1333)
!1339 = !DILocation(line: 146, column: 11, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1329, file: !2, line: 146, column: 11)
!1341 = !DILocation(line: 146, column: 13, scope: !1340)
!1342 = !DILocation(line: 146, column: 11, scope: !1329)
!1343 = !DILocation(line: 146, column: 31, scope: !1344)
!1344 = !DILexicalBlockFile(scope: !1345, file: !2, discriminator: 1)
!1345 = distinct !DILexicalBlock(scope: !1340, file: !2, line: 146, column: 18)
!1346 = !DILocation(line: 146, column: 19, scope: !1344)
!1347 = !DILocation(line: 146, column: 35, scope: !1344)
!1348 = !DILocation(line: 146, column: 39, scope: !1344)
!1349 = !DILocation(line: 146, column: 43, scope: !1344)
!1350 = !DILocation(line: 147, column: 30, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1340, file: !2, line: 147, column: 7)
!1352 = !DILocation(line: 147, column: 20, scope: !1351)
!1353 = !DILocation(line: 147, column: 8, scope: !1351)
!1354 = !DILocation(line: 147, column: 24, scope: !1351)
!1355 = !DILocation(line: 147, column: 28, scope: !1351)
!1356 = !DILocation(line: 149, column: 5, scope: !1)
!1357 = !DILocation(line: 151, column: 33, scope: !1)
!1358 = !DILocation(line: 151, column: 21, scope: !1)
!1359 = !DILocation(line: 151, column: 37, scope: !1)
!1360 = !DILocation(line: 151, column: 5, scope: !1)
!1361 = !DILocation(line: 151, column: 12, scope: !1)
!1362 = !DILocation(line: 151, column: 19, scope: !1)
!1363 = !DILocation(line: 152, column: 15, scope: !1)
!1364 = !DILocation(line: 152, column: 2, scope: !1)
!1365 = !DILocation(line: 152, column: 6, scope: !1)
!1366 = !DILocation(line: 152, column: 13, scope: !1)
!1367 = !DILocation(line: 153, column: 15, scope: !1)
!1368 = !DILocation(line: 153, column: 2, scope: !1)
!1369 = !DILocation(line: 153, column: 6, scope: !1)
!1370 = !DILocation(line: 153, column: 13, scope: !1)
!1371 = !DILocation(line: 154, column: 15, scope: !1)
!1372 = !DILocation(line: 154, column: 2, scope: !1)
!1373 = !DILocation(line: 154, column: 6, scope: !1)
!1374 = !DILocation(line: 154, column: 13, scope: !1)
!1375 = !DILocation(line: 155, column: 15, scope: !1)
!1376 = !DILocation(line: 155, column: 2, scope: !1)
!1377 = !DILocation(line: 155, column: 6, scope: !1)
!1378 = !DILocation(line: 155, column: 13, scope: !1)
!1379 = !DILocation(line: 157, column: 1, scope: !1)
!1380 = !DILocalVariable(name: "E_C", arg: 1, scope: !21, file: !2, line: 161, type: !5)
!1381 = !DILocation(line: 161, column: 12, scope: !21)
!1382 = !DILocalVariable(name: "W_C", arg: 2, scope: !21, file: !2, line: 162, type: !5)
!1383 = !DILocation(line: 162, column: 12, scope: !21)
!1384 = !DILocalVariable(name: "N_C", arg: 3, scope: !21, file: !2, line: 163, type: !5)
!1385 = !DILocation(line: 163, column: 12, scope: !21)
!1386 = !DILocalVariable(name: "S_C", arg: 4, scope: !21, file: !2, line: 164, type: !5)
!1387 = !DILocation(line: 164, column: 12, scope: !21)
!1388 = !DILocalVariable(name: "J_cuda", arg: 5, scope: !21, file: !2, line: 165, type: !5)
!1389 = !DILocation(line: 165, column: 13, scope: !21)
!1390 = !DILocalVariable(name: "C_cuda", arg: 6, scope: !21, file: !2, line: 166, type: !5)
!1391 = !DILocation(line: 166, column: 13, scope: !21)
!1392 = !DILocalVariable(name: "cols", arg: 7, scope: !21, file: !2, line: 167, type: !7)
!1393 = !DILocation(line: 167, column: 9, scope: !21)
!1394 = !DILocalVariable(name: "rows", arg: 8, scope: !21, file: !2, line: 168, type: !7)
!1395 = !DILocation(line: 168, column: 9, scope: !21)
!1396 = !DILocalVariable(name: "lambda", arg: 9, scope: !21, file: !2, line: 169, type: !6)
!1397 = !DILocation(line: 169, column: 11, scope: !21)
!1398 = !DILocalVariable(name: "q0sqr", arg: 10, scope: !21, file: !2, line: 170, type: !6)
!1399 = !DILocation(line: 170, column: 11, scope: !21)
!1400 = !DILocalVariable(name: "bx", scope: !21, file: !2, line: 174, type: !7)
!1401 = !DILocation(line: 174, column: 6, scope: !21)
!1402 = !DILocation(line: 78, column: 3, scope: !616, inlinedAt: !1403)
!1403 = distinct !DILocation(line: 174, column: 11, scope: !21)
!1404 = !DILocalVariable(name: "by", scope: !21, file: !2, line: 175, type: !7)
!1405 = !DILocation(line: 175, column: 9, scope: !21)
!1406 = !DILocation(line: 79, column: 3, scope: !656, inlinedAt: !1407)
!1407 = distinct !DILocation(line: 175, column: 14, scope: !21)
!1408 = !DILocalVariable(name: "tx", scope: !21, file: !2, line: 178, type: !7)
!1409 = !DILocation(line: 178, column: 9, scope: !21)
!1410 = !DILocation(line: 67, column: 3, scope: !661, inlinedAt: !1411)
!1411 = distinct !DILocation(line: 178, column: 14, scope: !21)
!1412 = !DILocalVariable(name: "ty", scope: !21, file: !2, line: 179, type: !7)
!1413 = !DILocation(line: 179, column: 9, scope: !21)
!1414 = !DILocation(line: 68, column: 3, scope: !692, inlinedAt: !1415)
!1415 = distinct !DILocation(line: 179, column: 14, scope: !21)
!1416 = !DILocalVariable(name: "index", scope: !21, file: !2, line: 182, type: !7)
!1417 = !DILocation(line: 182, column: 9, scope: !21)
!1418 = !DILocation(line: 182, column: 19, scope: !21)
!1419 = !DILocation(line: 182, column: 24, scope: !21)
!1420 = !DILocation(line: 182, column: 39, scope: !21)
!1421 = !DILocation(line: 182, column: 37, scope: !21)
!1422 = !DILocation(line: 182, column: 57, scope: !21)
!1423 = !DILocation(line: 182, column: 55, scope: !21)
!1424 = !DILocation(line: 182, column: 42, scope: !21)
!1425 = !DILocation(line: 182, column: 62, scope: !21)
!1426 = !DILocation(line: 182, column: 69, scope: !21)
!1427 = !DILocation(line: 182, column: 67, scope: !21)
!1428 = !DILocation(line: 182, column: 60, scope: !21)
!1429 = !DILocation(line: 182, column: 74, scope: !21)
!1430 = !DILocation(line: 182, column: 72, scope: !21)
!1431 = !DILocalVariable(name: "index_s", scope: !21, file: !2, line: 183, type: !7)
!1432 = !DILocation(line: 183, column: 6, scope: !21)
!1433 = !DILocation(line: 183, column: 16, scope: !21)
!1434 = !DILocation(line: 183, column: 21, scope: !21)
!1435 = !DILocation(line: 183, column: 36, scope: !21)
!1436 = !DILocation(line: 183, column: 34, scope: !21)
!1437 = !DILocation(line: 183, column: 54, scope: !21)
!1438 = !DILocation(line: 183, column: 52, scope: !21)
!1439 = !DILocation(line: 183, column: 39, scope: !21)
!1440 = !DILocation(line: 183, column: 59, scope: !21)
!1441 = !DILocation(line: 183, column: 64, scope: !21)
!1442 = !DILocation(line: 183, column: 57, scope: !21)
!1443 = !DILocation(line: 183, column: 79, scope: !21)
!1444 = !DILocation(line: 183, column: 77, scope: !21)
!1445 = !DILocalVariable(name: "index_e", scope: !21, file: !2, line: 184, type: !7)
!1446 = !DILocation(line: 184, column: 9, scope: !21)
!1447 = !DILocation(line: 184, column: 19, scope: !21)
!1448 = !DILocation(line: 184, column: 24, scope: !21)
!1449 = !DILocation(line: 184, column: 39, scope: !21)
!1450 = !DILocation(line: 184, column: 37, scope: !21)
!1451 = !DILocation(line: 184, column: 57, scope: !21)
!1452 = !DILocation(line: 184, column: 55, scope: !21)
!1453 = !DILocation(line: 184, column: 42, scope: !21)
!1454 = !DILocation(line: 184, column: 62, scope: !21)
!1455 = !DILocation(line: 184, column: 69, scope: !21)
!1456 = !DILocation(line: 184, column: 67, scope: !21)
!1457 = !DILocation(line: 184, column: 60, scope: !21)
!1458 = !DILocation(line: 184, column: 72, scope: !21)
!1459 = !DILocalVariable(name: "cc", scope: !21, file: !2, line: 185, type: !6)
!1460 = !DILocation(line: 185, column: 8, scope: !21)
!1461 = !DILocalVariable(name: "cn", scope: !21, file: !2, line: 185, type: !6)
!1462 = !DILocation(line: 185, column: 12, scope: !21)
!1463 = !DILocalVariable(name: "cs", scope: !21, file: !2, line: 185, type: !6)
!1464 = !DILocation(line: 185, column: 16, scope: !21)
!1465 = !DILocalVariable(name: "ce", scope: !21, file: !2, line: 185, type: !6)
!1466 = !DILocation(line: 185, column: 20, scope: !21)
!1467 = !DILocalVariable(name: "cw", scope: !21, file: !2, line: 185, type: !6)
!1468 = !DILocation(line: 185, column: 24, scope: !21)
!1469 = !DILocalVariable(name: "d_sum", scope: !21, file: !2, line: 185, type: !6)
!1470 = !DILocation(line: 185, column: 28, scope: !21)
!1471 = !DILocation(line: 196, column: 22, scope: !21)
!1472 = !DILocation(line: 196, column: 29, scope: !21)
!1473 = !DILocation(line: 196, column: 7, scope: !21)
!1474 = !DILocation(line: 196, column: 2, scope: !21)
!1475 = !DILocation(line: 196, column: 11, scope: !21)
!1476 = !DILocation(line: 196, column: 20, scope: !21)
!1477 = !DILocation(line: 198, column: 5, scope: !21)
!1478 = !DILocation(line: 200, column: 20, scope: !21)
!1479 = !DILocation(line: 200, column: 27, scope: !21)
!1480 = !DILocation(line: 200, column: 10, scope: !21)
!1481 = !DILocation(line: 200, column: 2, scope: !21)
!1482 = !DILocation(line: 200, column: 14, scope: !21)
!1483 = !DILocation(line: 200, column: 18, scope: !21)
!1484 = !DILocation(line: 202, column: 7, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !21, file: !2, line: 202, column: 7)
!1486 = !DILocation(line: 101, column: 3, scope: !816, inlinedAt: !1487)
!1487 = distinct !DILocation(line: 202, column: 13, scope: !1485)
!1488 = !DILocation(line: 202, column: 23, scope: !1485)
!1489 = !DILocation(line: 202, column: 10, scope: !1485)
!1490 = !DILocation(line: 202, column: 7, scope: !21)
!1491 = !DILocation(line: 203, column: 20, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1485, file: !2, line: 202, column: 28)
!1493 = !DILocation(line: 203, column: 27, scope: !1492)
!1494 = !DILocation(line: 203, column: 32, scope: !1492)
!1495 = !DILocation(line: 101, column: 3, scope: !816, inlinedAt: !1496)
!1496 = distinct !DILocation(line: 203, column: 48, scope: !1492)
!1497 = !DILocation(line: 203, column: 58, scope: !1492)
!1498 = !DILocation(line: 203, column: 45, scope: !1492)
!1499 = !DILocation(line: 203, column: 78, scope: !1492)
!1500 = !DILocation(line: 203, column: 76, scope: !1492)
!1501 = !DILocation(line: 203, column: 63, scope: !1492)
!1502 = !DILocation(line: 203, column: 83, scope: !1492)
!1503 = !DILocation(line: 203, column: 88, scope: !1492)
!1504 = !DILocation(line: 203, column: 81, scope: !1492)
!1505 = !DILocation(line: 203, column: 111, scope: !1492)
!1506 = !DILocation(line: 203, column: 109, scope: !1492)
!1507 = !DILocation(line: 203, column: 10, scope: !1492)
!1508 = !DILocation(line: 203, column: 2, scope: !1492)
!1509 = !DILocation(line: 203, column: 14, scope: !1492)
!1510 = !DILocation(line: 203, column: 18, scope: !1492)
!1511 = !DILocation(line: 204, column: 2, scope: !1492)
!1512 = !DILocation(line: 205, column: 2, scope: !21)
!1513 = !DILocation(line: 208, column: 19, scope: !21)
!1514 = !DILocation(line: 208, column: 26, scope: !21)
!1515 = !DILocation(line: 208, column: 9, scope: !21)
!1516 = !DILocation(line: 208, column: 2, scope: !21)
!1517 = !DILocation(line: 208, column: 13, scope: !21)
!1518 = !DILocation(line: 208, column: 17, scope: !21)
!1519 = !DILocation(line: 210, column: 7, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !21, file: !2, line: 210, column: 7)
!1521 = !DILocation(line: 100, column: 3, scope: !919, inlinedAt: !1522)
!1522 = distinct !DILocation(line: 210, column: 13, scope: !1520)
!1523 = !DILocation(line: 210, column: 23, scope: !1520)
!1524 = !DILocation(line: 210, column: 10, scope: !1520)
!1525 = !DILocation(line: 210, column: 7, scope: !21)
!1526 = !DILocation(line: 211, column: 19, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1520, file: !2, line: 210, column: 28)
!1528 = !DILocation(line: 211, column: 26, scope: !1527)
!1529 = !DILocation(line: 211, column: 31, scope: !1527)
!1530 = !DILocation(line: 211, column: 46, scope: !1527)
!1531 = !DILocation(line: 211, column: 44, scope: !1527)
!1532 = !DILocation(line: 100, column: 3, scope: !919, inlinedAt: !1533)
!1533 = distinct !DILocation(line: 211, column: 66, scope: !1527)
!1534 = !DILocation(line: 211, column: 76, scope: !1527)
!1535 = !DILocation(line: 211, column: 62, scope: !1527)
!1536 = !DILocation(line: 211, column: 49, scope: !1527)
!1537 = !DILocation(line: 211, column: 83, scope: !1527)
!1538 = !DILocation(line: 211, column: 90, scope: !1527)
!1539 = !DILocation(line: 211, column: 88, scope: !1527)
!1540 = !DILocation(line: 211, column: 81, scope: !1527)
!1541 = !DILocation(line: 211, column: 93, scope: !1527)
!1542 = !DILocation(line: 211, column: 105, scope: !1527)
!1543 = !DILocation(line: 211, column: 9, scope: !1527)
!1544 = !DILocation(line: 211, column: 2, scope: !1527)
!1545 = !DILocation(line: 211, column: 13, scope: !1527)
!1546 = !DILocation(line: 211, column: 17, scope: !1527)
!1547 = !DILocation(line: 212, column: 2, scope: !1527)
!1548 = !DILocation(line: 214, column: 5, scope: !21)
!1549 = !DILocation(line: 216, column: 32, scope: !21)
!1550 = !DILocation(line: 216, column: 39, scope: !21)
!1551 = !DILocation(line: 216, column: 17, scope: !21)
!1552 = !DILocation(line: 216, column: 5, scope: !21)
!1553 = !DILocation(line: 216, column: 21, scope: !21)
!1554 = !DILocation(line: 216, column: 30, scope: !21)
!1555 = !DILocation(line: 218, column: 5, scope: !21)
!1556 = !DILocation(line: 220, column: 19, scope: !21)
!1557 = !DILocation(line: 220, column: 7, scope: !21)
!1558 = !DILocation(line: 220, column: 23, scope: !21)
!1559 = !DILocation(line: 220, column: 5, scope: !21)
!1560 = !DILocation(line: 222, column: 9, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !21, file: !2, line: 222, column: 9)
!1562 = !DILocation(line: 222, column: 12, scope: !1561)
!1563 = !DILocation(line: 222, column: 29, scope: !1561)
!1564 = !DILocation(line: 222, column: 32, scope: !1565)
!1565 = !DILexicalBlockFile(scope: !1561, file: !2, discriminator: 1)
!1566 = !DILocation(line: 222, column: 35, scope: !1565)
!1567 = !DILocation(line: 222, column: 9, scope: !1565)
!1568 = !DILocation(line: 223, column: 8, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1561, file: !2, line: 222, column: 53)
!1570 = !DILocation(line: 223, column: 6, scope: !1569)
!1571 = !DILocation(line: 224, column: 19, scope: !1569)
!1572 = !DILocation(line: 224, column: 11, scope: !1569)
!1573 = !DILocation(line: 224, column: 23, scope: !1569)
!1574 = !DILocation(line: 224, column: 9, scope: !1569)
!1575 = !DILocation(line: 225, column: 11, scope: !1569)
!1576 = !DILocation(line: 225, column: 9, scope: !1569)
!1577 = !DILocation(line: 226, column: 18, scope: !1569)
!1578 = !DILocation(line: 226, column: 11, scope: !1569)
!1579 = !DILocation(line: 226, column: 22, scope: !1569)
!1580 = !DILocation(line: 226, column: 9, scope: !1569)
!1581 = !DILocation(line: 227, column: 4, scope: !1569)
!1582 = !DILocation(line: 228, column: 14, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1561, file: !2, line: 228, column: 14)
!1584 = !DILocation(line: 228, column: 17, scope: !1583)
!1585 = !DILocation(line: 228, column: 14, scope: !1561)
!1586 = !DILocation(line: 229, column: 8, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1583, file: !2, line: 228, column: 35)
!1588 = !DILocation(line: 229, column: 6, scope: !1587)
!1589 = !DILocation(line: 230, column: 23, scope: !1587)
!1590 = !DILocation(line: 230, column: 25, scope: !1587)
!1591 = !DILocation(line: 230, column: 11, scope: !1587)
!1592 = !DILocation(line: 230, column: 29, scope: !1587)
!1593 = !DILocation(line: 230, column: 9, scope: !1587)
!1594 = !DILocation(line: 231, column: 11, scope: !1587)
!1595 = !DILocation(line: 231, column: 9, scope: !1587)
!1596 = !DILocation(line: 232, column: 18, scope: !1587)
!1597 = !DILocation(line: 232, column: 11, scope: !1587)
!1598 = !DILocation(line: 232, column: 22, scope: !1587)
!1599 = !DILocation(line: 232, column: 9, scope: !1587)
!1600 = !DILocation(line: 233, column: 4, scope: !1587)
!1601 = !DILocation(line: 234, column: 14, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1583, file: !2, line: 234, column: 14)
!1603 = !DILocation(line: 234, column: 17, scope: !1602)
!1604 = !DILocation(line: 234, column: 14, scope: !1583)
!1605 = !DILocation(line: 235, column: 8, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1602, file: !2, line: 234, column: 34)
!1607 = !DILocation(line: 235, column: 6, scope: !1606)
!1608 = !DILocation(line: 236, column: 19, scope: !1606)
!1609 = !DILocation(line: 236, column: 11, scope: !1606)
!1610 = !DILocation(line: 236, column: 23, scope: !1606)
!1611 = !DILocation(line: 236, column: 9, scope: !1606)
!1612 = !DILocation(line: 237, column: 11, scope: !1606)
!1613 = !DILocation(line: 237, column: 9, scope: !1606)
!1614 = !DILocation(line: 238, column: 23, scope: !1606)
!1615 = !DILocation(line: 238, column: 11, scope: !1606)
!1616 = !DILocation(line: 238, column: 27, scope: !1606)
!1617 = !DILocation(line: 238, column: 29, scope: !1606)
!1618 = !DILocation(line: 238, column: 9, scope: !1606)
!1619 = !DILocation(line: 239, column: 4, scope: !1606)
!1620 = !DILocation(line: 241, column: 8, scope: !1621)
!1621 = distinct !DILexicalBlock(scope: !1602, file: !2, line: 240, column: 8)
!1622 = !DILocation(line: 241, column: 6, scope: !1621)
!1623 = !DILocation(line: 242, column: 23, scope: !1621)
!1624 = !DILocation(line: 242, column: 25, scope: !1621)
!1625 = !DILocation(line: 242, column: 11, scope: !1621)
!1626 = !DILocation(line: 242, column: 29, scope: !1621)
!1627 = !DILocation(line: 242, column: 9, scope: !1621)
!1628 = !DILocation(line: 243, column: 11, scope: !1621)
!1629 = !DILocation(line: 243, column: 9, scope: !1621)
!1630 = !DILocation(line: 244, column: 23, scope: !1621)
!1631 = !DILocation(line: 244, column: 11, scope: !1621)
!1632 = !DILocation(line: 244, column: 27, scope: !1621)
!1633 = !DILocation(line: 244, column: 29, scope: !1621)
!1634 = !DILocation(line: 244, column: 9, scope: !1621)
!1635 = !DILocation(line: 248, column: 12, scope: !21)
!1636 = !DILocation(line: 248, column: 17, scope: !21)
!1637 = !DILocation(line: 248, column: 21, scope: !21)
!1638 = !DILocation(line: 248, column: 15, scope: !21)
!1639 = !DILocation(line: 248, column: 30, scope: !21)
!1640 = !DILocation(line: 248, column: 35, scope: !21)
!1641 = !DILocation(line: 248, column: 39, scope: !21)
!1642 = !DILocation(line: 248, column: 33, scope: !21)
!1643 = !DILocation(line: 248, column: 28, scope: !21)
!1644 = !DILocation(line: 248, column: 48, scope: !21)
!1645 = !DILocation(line: 248, column: 53, scope: !21)
!1646 = !DILocation(line: 248, column: 57, scope: !21)
!1647 = !DILocation(line: 248, column: 51, scope: !21)
!1648 = !DILocation(line: 248, column: 46, scope: !21)
!1649 = !DILocation(line: 248, column: 66, scope: !21)
!1650 = !DILocation(line: 248, column: 71, scope: !21)
!1651 = !DILocation(line: 248, column: 75, scope: !21)
!1652 = !DILocation(line: 248, column: 69, scope: !21)
!1653 = !DILocation(line: 248, column: 64, scope: !21)
!1654 = !DILocation(line: 248, column: 10, scope: !21)
!1655 = !DILocation(line: 251, column: 33, scope: !21)
!1656 = !DILocation(line: 251, column: 28, scope: !21)
!1657 = !DILocation(line: 251, column: 37, scope: !21)
!1658 = !DILocation(line: 251, column: 50, scope: !21)
!1659 = !DILocation(line: 251, column: 48, scope: !21)
!1660 = !DILocation(line: 251, column: 59, scope: !21)
!1661 = !DILocation(line: 251, column: 57, scope: !21)
!1662 = !DILocation(line: 251, column: 41, scope: !21)
!1663 = !DILocation(line: 251, column: 18, scope: !21)
!1664 = !DILocation(line: 251, column: 4, scope: !21)
!1665 = !DILocation(line: 251, column: 22, scope: !21)
!1666 = !DILocation(line: 251, column: 26, scope: !21)
!1667 = !DILocation(line: 253, column: 4, scope: !21)
!1668 = !DILocation(line: 255, column: 34, scope: !21)
!1669 = !DILocation(line: 255, column: 20, scope: !21)
!1670 = !DILocation(line: 255, column: 38, scope: !21)
!1671 = !DILocation(line: 255, column: 4, scope: !21)
!1672 = !DILocation(line: 255, column: 11, scope: !21)
!1673 = !DILocation(line: 255, column: 18, scope: !21)
!1674 = !DILocation(line: 257, column: 1, scope: !21)
