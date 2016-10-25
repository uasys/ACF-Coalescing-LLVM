; ModuleID = 'needle.cu'
source_filename = "needle.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ20needle_cuda_shared_1PiS_iiiiE4temp = internal addrspace(3) global [17 x [17 x i32]] zeroinitializer, align 4, !dbg !0
@_ZZ20needle_cuda_shared_1PiS_iiiiE3ref = internal addrspace(3) global [16 x [16 x i32]] zeroinitializer, align 4, !dbg !11
@_ZZ20needle_cuda_shared_2PiS_iiiiE4temp = internal addrspace(3) global [17 x [17 x i32]] zeroinitializer, align 4, !dbg !15
@_ZZ20needle_cuda_shared_2PiS_iiiiE3ref = internal addrspace(3) global [16 x [16 x i32]] zeroinitializer, align 4, !dbg !20

; Function Attrs: convergent nounwind
define i32 @_Z7maximumiii(i32 %a, i32 %b, i32 %c) #0 !dbg !588 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !591, metadata !592), !dbg !593
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !594, metadata !592), !dbg !595
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !596, metadata !592), !dbg !597
  call void @llvm.dbg.declare(metadata i32* %k, metadata !598, metadata !592), !dbg !599
  %0 = load i32, i32* %a.addr, align 4, !dbg !600
  %1 = load i32, i32* %b.addr, align 4, !dbg !602
  %cmp = icmp sle i32 %0, %1, !dbg !603
  br i1 %cmp, label %if.then, label %if.else, !dbg !604

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %b.addr, align 4, !dbg !605
  store i32 %2, i32* %k, align 4, !dbg !606
  br label %if.end, !dbg !607

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !608
  store i32 %3, i32* %k, align 4, !dbg !609
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %k, align 4, !dbg !610
  %5 = load i32, i32* %c.addr, align 4, !dbg !612
  %cmp1 = icmp sle i32 %4, %5, !dbg !613
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !614

if.then2:                                         ; preds = %if.end
  %6 = load i32, i32* %c.addr, align 4, !dbg !615
  store i32 %6, i32* %retval, align 4, !dbg !616
  br label %return, !dbg !616

if.else3:                                         ; preds = %if.end
  %7 = load i32, i32* %k, align 4, !dbg !617
  store i32 %7, i32* %retval, align 4, !dbg !618
  br label %return, !dbg !618

return:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %retval, align 4, !dbg !619
  ret i32 %8, !dbg !619
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
define void @_Z20needle_cuda_shared_1PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #0 !dbg !1 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %b_index_x = alloca i32, align 4
  %b_index_y = alloca i32, align 4
  %index = alloca i32, align 4
  %index_n = alloca i32, align 4
  %index_w = alloca i32, align 4
  %index_nw = alloca i32, align 4
  %ty = alloca i32, align 4
  %m = alloca i32, align 4
  %t_index_x = alloca i32, align 4
  %t_index_y = alloca i32, align 4
  %m90 = alloca i32, align 4
  %t_index_x96 = alloca i32, align 4
  %t_index_y99 = alloca i32, align 4
  %ty134 = alloca i32, align 4
  store i32* %referrence, i32** %referrence.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %referrence.addr, metadata !620, metadata !592), !dbg !621
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %matrix_cuda.addr, metadata !622, metadata !592), !dbg !623
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !624, metadata !592), !dbg !625
  store i32 %penalty, i32* %penalty.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %penalty.addr, metadata !626, metadata !592), !dbg !627
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !628, metadata !592), !dbg !629
  store i32 %block_width, i32* %block_width.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %block_width.addr, metadata !630, metadata !592), !dbg !631
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !632, metadata !592), !dbg !633
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !634, !range !671
  store i32 %0, i32* %bx, align 4, !dbg !633
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !672, metadata !592), !dbg !673
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !674, !range !702
  store i32 %1, i32* %tx, align 4, !dbg !673
  call void @llvm.dbg.declare(metadata i32* %b_index_x, metadata !703, metadata !592), !dbg !704
  %2 = load i32, i32* %bx, align 4, !dbg !705
  store i32 %2, i32* %b_index_x, align 4, !dbg !704
  call void @llvm.dbg.declare(metadata i32* %b_index_y, metadata !706, metadata !592), !dbg !707
  %3 = load i32, i32* %i.addr, align 4, !dbg !708
  %sub = sub nsw i32 %3, 1, !dbg !709
  %4 = load i32, i32* %bx, align 4, !dbg !710
  %sub2 = sub nsw i32 %sub, %4, !dbg !711
  store i32 %sub2, i32* %b_index_y, align 4, !dbg !707
  call void @llvm.dbg.declare(metadata i32* %index, metadata !712, metadata !592), !dbg !713
  %5 = load i32, i32* %cols.addr, align 4, !dbg !714
  %mul = mul nsw i32 %5, 16, !dbg !715
  %6 = load i32, i32* %b_index_y, align 4, !dbg !716
  %mul3 = mul nsw i32 %mul, %6, !dbg !717
  %7 = load i32, i32* %b_index_x, align 4, !dbg !718
  %mul4 = mul nsw i32 16, %7, !dbg !719
  %add = add nsw i32 %mul3, %mul4, !dbg !720
  %8 = load i32, i32* %tx, align 4, !dbg !721
  %add5 = add nsw i32 %add, %8, !dbg !722
  %9 = load i32, i32* %cols.addr, align 4, !dbg !723
  %add6 = add nsw i32 %9, 1, !dbg !724
  %add7 = add nsw i32 %add5, %add6, !dbg !725
  store i32 %add7, i32* %index, align 4, !dbg !713
  call void @llvm.dbg.declare(metadata i32* %index_n, metadata !726, metadata !592), !dbg !727
  %10 = load i32, i32* %cols.addr, align 4, !dbg !728
  %mul8 = mul nsw i32 %10, 16, !dbg !729
  %11 = load i32, i32* %b_index_y, align 4, !dbg !730
  %mul9 = mul nsw i32 %mul8, %11, !dbg !731
  %12 = load i32, i32* %b_index_x, align 4, !dbg !732
  %mul10 = mul nsw i32 16, %12, !dbg !733
  %add11 = add nsw i32 %mul9, %mul10, !dbg !734
  %13 = load i32, i32* %tx, align 4, !dbg !735
  %add12 = add nsw i32 %add11, %13, !dbg !736
  %add13 = add nsw i32 %add12, 1, !dbg !737
  store i32 %add13, i32* %index_n, align 4, !dbg !727
  call void @llvm.dbg.declare(metadata i32* %index_w, metadata !738, metadata !592), !dbg !739
  %14 = load i32, i32* %cols.addr, align 4, !dbg !740
  %mul14 = mul nsw i32 %14, 16, !dbg !741
  %15 = load i32, i32* %b_index_y, align 4, !dbg !742
  %mul15 = mul nsw i32 %mul14, %15, !dbg !743
  %16 = load i32, i32* %b_index_x, align 4, !dbg !744
  %mul16 = mul nsw i32 16, %16, !dbg !745
  %add17 = add nsw i32 %mul15, %mul16, !dbg !746
  %17 = load i32, i32* %cols.addr, align 4, !dbg !747
  %add18 = add nsw i32 %add17, %17, !dbg !748
  store i32 %add18, i32* %index_w, align 4, !dbg !739
  call void @llvm.dbg.declare(metadata i32* %index_nw, metadata !749, metadata !592), !dbg !750
  %18 = load i32, i32* %cols.addr, align 4, !dbg !751
  %mul19 = mul nsw i32 %18, 16, !dbg !752
  %19 = load i32, i32* %b_index_y, align 4, !dbg !753
  %mul20 = mul nsw i32 %mul19, %19, !dbg !754
  %20 = load i32, i32* %b_index_x, align 4, !dbg !755
  %mul21 = mul nsw i32 16, %20, !dbg !756
  %add22 = add nsw i32 %mul20, %mul21, !dbg !757
  store i32 %add22, i32* %index_nw, align 4, !dbg !750
  %21 = load i32, i32* %tx, align 4, !dbg !758
  %cmp = icmp eq i32 %21, 0, !dbg !760
  br i1 %cmp, label %if.then, label %if.end, !dbg !761

if.then:                                          ; preds = %entry
  %22 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !762
  %23 = load i32, i32* %index_nw, align 4, !dbg !763
  %idxprom = sext i32 %23 to i64, !dbg !762
  %arrayidx = getelementptr inbounds i32, i32* %22, i64 %idxprom, !dbg !762
  %24 = load i32, i32* %arrayidx, align 4, !dbg !762
  %25 = load i32, i32* %tx, align 4, !dbg !764
  %idxprom23 = sext i32 %25 to i64, !dbg !765
  %arrayidx24 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom23, !dbg !765
  %arrayidx25 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx24, i64 0, i64 0, !dbg !765
  store i32 %24, i32* %arrayidx25, align 4, !dbg !766
  br label %if.end, !dbg !765

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !767, metadata !592), !dbg !769
  store i32 0, i32* %ty, align 4, !dbg !769
  br label %for.cond, !dbg !770

for.cond:                                         ; preds = %for.inc, %if.end
  %26 = load i32, i32* %ty, align 4, !dbg !771
  %cmp26 = icmp slt i32 %26, 16, !dbg !774
  br i1 %cmp26, label %for.body, label %for.end, !dbg !775

for.body:                                         ; preds = %for.cond
  %27 = load i32*, i32** %referrence.addr, align 8, !dbg !776
  %28 = load i32, i32* %index, align 4, !dbg !777
  %29 = load i32, i32* %cols.addr, align 4, !dbg !778
  %30 = load i32, i32* %ty, align 4, !dbg !779
  %mul27 = mul nsw i32 %29, %30, !dbg !780
  %add28 = add nsw i32 %28, %mul27, !dbg !781
  %idxprom29 = sext i32 %add28 to i64, !dbg !776
  %arrayidx30 = getelementptr inbounds i32, i32* %27, i64 %idxprom29, !dbg !776
  %31 = load i32, i32* %arrayidx30, align 4, !dbg !776
  %32 = load i32, i32* %ty, align 4, !dbg !782
  %idxprom31 = sext i32 %32 to i64, !dbg !783
  %arrayidx32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom31, !dbg !783
  %33 = load i32, i32* %tx, align 4, !dbg !784
  %idxprom33 = sext i32 %33 to i64, !dbg !783
  %arrayidx34 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx32, i64 0, i64 %idxprom33, !dbg !783
  store i32 %31, i32* %arrayidx34, align 4, !dbg !785
  br label %for.inc, !dbg !783

for.inc:                                          ; preds = %for.body
  %34 = load i32, i32* %ty, align 4, !dbg !786
  %inc = add nsw i32 %34, 1, !dbg !786
  store i32 %inc, i32* %ty, align 4, !dbg !786
  br label %for.cond, !dbg !788, !llvm.loop !789

for.end:                                          ; preds = %for.cond
  call void @llvm.nvvm.barrier0(), !dbg !791
  %35 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !792
  %36 = load i32, i32* %index_w, align 4, !dbg !793
  %37 = load i32, i32* %cols.addr, align 4, !dbg !794
  %38 = load i32, i32* %tx, align 4, !dbg !795
  %mul35 = mul nsw i32 %37, %38, !dbg !796
  %add36 = add nsw i32 %36, %mul35, !dbg !797
  %idxprom37 = sext i32 %add36 to i64, !dbg !792
  %arrayidx38 = getelementptr inbounds i32, i32* %35, i64 %idxprom37, !dbg !792
  %39 = load i32, i32* %arrayidx38, align 4, !dbg !792
  %40 = load i32, i32* %tx, align 4, !dbg !798
  %add39 = add nsw i32 %40, 1, !dbg !799
  %idxprom40 = sext i32 %add39 to i64, !dbg !800
  %arrayidx41 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom40, !dbg !800
  %arrayidx42 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx41, i64 0, i64 0, !dbg !800
  store i32 %39, i32* %arrayidx42, align 4, !dbg !801
  call void @llvm.nvvm.barrier0(), !dbg !802
  %41 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !803
  %42 = load i32, i32* %index_n, align 4, !dbg !804
  %idxprom43 = sext i32 %42 to i64, !dbg !803
  %arrayidx44 = getelementptr inbounds i32, i32* %41, i64 %idxprom43, !dbg !803
  %43 = load i32, i32* %arrayidx44, align 4, !dbg !803
  %44 = load i32, i32* %tx, align 4, !dbg !805
  %add45 = add nsw i32 %44, 1, !dbg !806
  %idxprom46 = sext i32 %add45 to i64, !dbg !807
  %arrayidx47 = getelementptr inbounds [17 x i32], [17 x i32]* getelementptr inbounds ([17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 0), i64 0, i64 %idxprom46, !dbg !807
  store i32 %43, i32* %arrayidx47, align 4, !dbg !808
  call void @llvm.nvvm.barrier0(), !dbg !809
  call void @llvm.dbg.declare(metadata i32* %m, metadata !810, metadata !592), !dbg !812
  store i32 0, i32* %m, align 4, !dbg !812
  br label %for.cond48, !dbg !813

for.cond48:                                       ; preds = %for.inc87, %for.end
  %45 = load i32, i32* %m, align 4, !dbg !814
  %cmp49 = icmp slt i32 %45, 16, !dbg !817
  br i1 %cmp49, label %for.body50, label %for.end89, !dbg !818

for.body50:                                       ; preds = %for.cond48
  %46 = load i32, i32* %tx, align 4, !dbg !819
  %47 = load i32, i32* %m, align 4, !dbg !822
  %cmp51 = icmp sle i32 %46, %47, !dbg !823
  br i1 %cmp51, label %if.then52, label %if.end86, !dbg !824

if.then52:                                        ; preds = %for.body50
  call void @llvm.dbg.declare(metadata i32* %t_index_x, metadata !825, metadata !592), !dbg !827
  %48 = load i32, i32* %tx, align 4, !dbg !828
  %add53 = add nsw i32 %48, 1, !dbg !829
  store i32 %add53, i32* %t_index_x, align 4, !dbg !827
  call void @llvm.dbg.declare(metadata i32* %t_index_y, metadata !830, metadata !592), !dbg !831
  %49 = load i32, i32* %m, align 4, !dbg !832
  %50 = load i32, i32* %tx, align 4, !dbg !833
  %sub54 = sub nsw i32 %49, %50, !dbg !834
  %add55 = add nsw i32 %sub54, 1, !dbg !835
  store i32 %add55, i32* %t_index_y, align 4, !dbg !831
  %51 = load i32, i32* %t_index_y, align 4, !dbg !836
  %sub56 = sub nsw i32 %51, 1, !dbg !837
  %idxprom57 = sext i32 %sub56 to i64, !dbg !838
  %arrayidx58 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom57, !dbg !838
  %52 = load i32, i32* %t_index_x, align 4, !dbg !839
  %sub59 = sub nsw i32 %52, 1, !dbg !840
  %idxprom60 = sext i32 %sub59 to i64, !dbg !838
  %arrayidx61 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx58, i64 0, i64 %idxprom60, !dbg !838
  %53 = load i32, i32* %arrayidx61, align 4, !dbg !838
  %54 = load i32, i32* %t_index_y, align 4, !dbg !841
  %sub62 = sub nsw i32 %54, 1, !dbg !842
  %idxprom63 = sext i32 %sub62 to i64, !dbg !843
  %arrayidx64 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom63, !dbg !843
  %55 = load i32, i32* %t_index_x, align 4, !dbg !844
  %sub65 = sub nsw i32 %55, 1, !dbg !845
  %idxprom66 = sext i32 %sub65 to i64, !dbg !843
  %arrayidx67 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx64, i64 0, i64 %idxprom66, !dbg !843
  %56 = load i32, i32* %arrayidx67, align 4, !dbg !843
  %add68 = add nsw i32 %53, %56, !dbg !846
  %57 = load i32, i32* %t_index_y, align 4, !dbg !847
  %idxprom69 = sext i32 %57 to i64, !dbg !848
  %arrayidx70 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom69, !dbg !848
  %58 = load i32, i32* %t_index_x, align 4, !dbg !849
  %sub71 = sub nsw i32 %58, 1, !dbg !850
  %idxprom72 = sext i32 %sub71 to i64, !dbg !848
  %arrayidx73 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx70, i64 0, i64 %idxprom72, !dbg !848
  %59 = load i32, i32* %arrayidx73, align 4, !dbg !848
  %60 = load i32, i32* %penalty.addr, align 4, !dbg !851
  %sub74 = sub nsw i32 %59, %60, !dbg !852
  %61 = load i32, i32* %t_index_y, align 4, !dbg !853
  %sub75 = sub nsw i32 %61, 1, !dbg !854
  %idxprom76 = sext i32 %sub75 to i64, !dbg !855
  %arrayidx77 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom76, !dbg !855
  %62 = load i32, i32* %t_index_x, align 4, !dbg !856
  %idxprom78 = sext i32 %62 to i64, !dbg !855
  %arrayidx79 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx77, i64 0, i64 %idxprom78, !dbg !855
  %63 = load i32, i32* %arrayidx79, align 4, !dbg !855
  %64 = load i32, i32* %penalty.addr, align 4, !dbg !857
  %sub80 = sub nsw i32 %63, %64, !dbg !858
  %call81 = call i32 @_Z7maximumiii(i32 %add68, i32 %sub74, i32 %sub80) #2, !dbg !859
  %65 = load i32, i32* %t_index_y, align 4, !dbg !860
  %idxprom82 = sext i32 %65 to i64, !dbg !861
  %arrayidx83 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom82, !dbg !861
  %66 = load i32, i32* %t_index_x, align 4, !dbg !862
  %idxprom84 = sext i32 %66 to i64, !dbg !861
  %arrayidx85 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx83, i64 0, i64 %idxprom84, !dbg !861
  store i32 %call81, i32* %arrayidx85, align 4, !dbg !863
  br label %if.end86, !dbg !864

if.end86:                                         ; preds = %if.then52, %for.body50
  call void @llvm.nvvm.barrier0(), !dbg !865
  br label %for.inc87, !dbg !866

for.inc87:                                        ; preds = %if.end86
  %67 = load i32, i32* %m, align 4, !dbg !867
  %inc88 = add nsw i32 %67, 1, !dbg !867
  store i32 %inc88, i32* %m, align 4, !dbg !867
  br label %for.cond48, !dbg !869, !llvm.loop !870

for.end89:                                        ; preds = %for.cond48
  call void @llvm.dbg.declare(metadata i32* %m90, metadata !872, metadata !592), !dbg !874
  store i32 14, i32* %m90, align 4, !dbg !874
  br label %for.cond91, !dbg !875

for.cond91:                                       ; preds = %for.inc132, %for.end89
  %68 = load i32, i32* %m90, align 4, !dbg !876
  %cmp92 = icmp sge i32 %68, 0, !dbg !879
  br i1 %cmp92, label %for.body93, label %for.end133, !dbg !880

for.body93:                                       ; preds = %for.cond91
  %69 = load i32, i32* %tx, align 4, !dbg !881
  %70 = load i32, i32* %m90, align 4, !dbg !884
  %cmp94 = icmp sle i32 %69, %70, !dbg !885
  br i1 %cmp94, label %if.then95, label %if.end131, !dbg !886

if.then95:                                        ; preds = %for.body93
  call void @llvm.dbg.declare(metadata i32* %t_index_x96, metadata !887, metadata !592), !dbg !889
  %71 = load i32, i32* %tx, align 4, !dbg !890
  %add97 = add nsw i32 %71, 16, !dbg !891
  %72 = load i32, i32* %m90, align 4, !dbg !892
  %sub98 = sub nsw i32 %add97, %72, !dbg !893
  store i32 %sub98, i32* %t_index_x96, align 4, !dbg !889
  call void @llvm.dbg.declare(metadata i32* %t_index_y99, metadata !894, metadata !592), !dbg !895
  %73 = load i32, i32* %tx, align 4, !dbg !896
  %sub100 = sub nsw i32 16, %73, !dbg !897
  store i32 %sub100, i32* %t_index_y99, align 4, !dbg !895
  %74 = load i32, i32* %t_index_y99, align 4, !dbg !898
  %sub101 = sub nsw i32 %74, 1, !dbg !899
  %idxprom102 = sext i32 %sub101 to i64, !dbg !900
  %arrayidx103 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom102, !dbg !900
  %75 = load i32, i32* %t_index_x96, align 4, !dbg !901
  %sub104 = sub nsw i32 %75, 1, !dbg !902
  %idxprom105 = sext i32 %sub104 to i64, !dbg !900
  %arrayidx106 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx103, i64 0, i64 %idxprom105, !dbg !900
  %76 = load i32, i32* %arrayidx106, align 4, !dbg !900
  %77 = load i32, i32* %t_index_y99, align 4, !dbg !903
  %sub107 = sub nsw i32 %77, 1, !dbg !904
  %idxprom108 = sext i32 %sub107 to i64, !dbg !905
  %arrayidx109 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom108, !dbg !905
  %78 = load i32, i32* %t_index_x96, align 4, !dbg !906
  %sub110 = sub nsw i32 %78, 1, !dbg !907
  %idxprom111 = sext i32 %sub110 to i64, !dbg !905
  %arrayidx112 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx109, i64 0, i64 %idxprom111, !dbg !905
  %79 = load i32, i32* %arrayidx112, align 4, !dbg !905
  %add113 = add nsw i32 %76, %79, !dbg !908
  %80 = load i32, i32* %t_index_y99, align 4, !dbg !909
  %idxprom114 = sext i32 %80 to i64, !dbg !910
  %arrayidx115 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom114, !dbg !910
  %81 = load i32, i32* %t_index_x96, align 4, !dbg !911
  %sub116 = sub nsw i32 %81, 1, !dbg !912
  %idxprom117 = sext i32 %sub116 to i64, !dbg !910
  %arrayidx118 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx115, i64 0, i64 %idxprom117, !dbg !910
  %82 = load i32, i32* %arrayidx118, align 4, !dbg !910
  %83 = load i32, i32* %penalty.addr, align 4, !dbg !913
  %sub119 = sub nsw i32 %82, %83, !dbg !914
  %84 = load i32, i32* %t_index_y99, align 4, !dbg !915
  %sub120 = sub nsw i32 %84, 1, !dbg !916
  %idxprom121 = sext i32 %sub120 to i64, !dbg !917
  %arrayidx122 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom121, !dbg !917
  %85 = load i32, i32* %t_index_x96, align 4, !dbg !918
  %idxprom123 = sext i32 %85 to i64, !dbg !917
  %arrayidx124 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx122, i64 0, i64 %idxprom123, !dbg !917
  %86 = load i32, i32* %arrayidx124, align 4, !dbg !917
  %87 = load i32, i32* %penalty.addr, align 4, !dbg !919
  %sub125 = sub nsw i32 %86, %87, !dbg !920
  %call126 = call i32 @_Z7maximumiii(i32 %add113, i32 %sub119, i32 %sub125) #2, !dbg !921
  %88 = load i32, i32* %t_index_y99, align 4, !dbg !922
  %idxprom127 = sext i32 %88 to i64, !dbg !923
  %arrayidx128 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom127, !dbg !923
  %89 = load i32, i32* %t_index_x96, align 4, !dbg !924
  %idxprom129 = sext i32 %89 to i64, !dbg !923
  %arrayidx130 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx128, i64 0, i64 %idxprom129, !dbg !923
  store i32 %call126, i32* %arrayidx130, align 4, !dbg !925
  br label %if.end131, !dbg !926

if.end131:                                        ; preds = %if.then95, %for.body93
  call void @llvm.nvvm.barrier0(), !dbg !927
  br label %for.inc132, !dbg !928

for.inc132:                                       ; preds = %if.end131
  %90 = load i32, i32* %m90, align 4, !dbg !929
  %dec = add nsw i32 %90, -1, !dbg !929
  store i32 %dec, i32* %m90, align 4, !dbg !929
  br label %for.cond91, !dbg !931, !llvm.loop !932

for.end133:                                       ; preds = %for.cond91
  call void @llvm.dbg.declare(metadata i32* %ty134, metadata !934, metadata !592), !dbg !936
  store i32 0, i32* %ty134, align 4, !dbg !936
  br label %for.cond135, !dbg !937

for.cond135:                                      ; preds = %for.inc148, %for.end133
  %91 = load i32, i32* %ty134, align 4, !dbg !938
  %cmp136 = icmp slt i32 %91, 16, !dbg !941
  br i1 %cmp136, label %for.body137, label %for.end150, !dbg !942

for.body137:                                      ; preds = %for.cond135
  %92 = load i32, i32* %ty134, align 4, !dbg !943
  %add138 = add nsw i32 %92, 1, !dbg !944
  %idxprom139 = sext i32 %add138 to i64, !dbg !945
  %arrayidx140 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom139, !dbg !945
  %93 = load i32, i32* %tx, align 4, !dbg !946
  %add141 = add nsw i32 %93, 1, !dbg !947
  %idxprom142 = sext i32 %add141 to i64, !dbg !945
  %arrayidx143 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx140, i64 0, i64 %idxprom142, !dbg !945
  %94 = load i32, i32* %arrayidx143, align 4, !dbg !945
  %95 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !948
  %96 = load i32, i32* %index, align 4, !dbg !949
  %97 = load i32, i32* %ty134, align 4, !dbg !950
  %98 = load i32, i32* %cols.addr, align 4, !dbg !951
  %mul144 = mul nsw i32 %97, %98, !dbg !952
  %add145 = add nsw i32 %96, %mul144, !dbg !953
  %idxprom146 = sext i32 %add145 to i64, !dbg !948
  %arrayidx147 = getelementptr inbounds i32, i32* %95, i64 %idxprom146, !dbg !948
  store i32 %94, i32* %arrayidx147, align 4, !dbg !954
  br label %for.inc148, !dbg !948

for.inc148:                                       ; preds = %for.body137
  %99 = load i32, i32* %ty134, align 4, !dbg !955
  %inc149 = add nsw i32 %99, 1, !dbg !955
  store i32 %inc149, i32* %ty134, align 4, !dbg !955
  br label %for.cond135, !dbg !957, !llvm.loop !958

for.end150:                                       ; preds = %for.cond135
  ret void, !dbg !960
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: convergent nounwind
define void @_Z20needle_cuda_shared_2PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #0 !dbg !16 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %b_index_x = alloca i32, align 4
  %b_index_y = alloca i32, align 4
  %index = alloca i32, align 4
  %index_n = alloca i32, align 4
  %index_w = alloca i32, align 4
  %index_nw = alloca i32, align 4
  %ty = alloca i32, align 4
  %m = alloca i32, align 4
  %t_index_x = alloca i32, align 4
  %t_index_y = alloca i32, align 4
  %m92 = alloca i32, align 4
  %t_index_x98 = alloca i32, align 4
  %t_index_y101 = alloca i32, align 4
  %ty136 = alloca i32, align 4
  store i32* %referrence, i32** %referrence.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %referrence.addr, metadata !961, metadata !592), !dbg !962
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %matrix_cuda.addr, metadata !963, metadata !592), !dbg !964
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !965, metadata !592), !dbg !966
  store i32 %penalty, i32* %penalty.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %penalty.addr, metadata !967, metadata !592), !dbg !968
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !969, metadata !592), !dbg !970
  store i32 %block_width, i32* %block_width.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %block_width.addr, metadata !971, metadata !592), !dbg !972
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !973, metadata !592), !dbg !974
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !975, !range !671
  store i32 %0, i32* %bx, align 4, !dbg !974
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !977, metadata !592), !dbg !978
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !979, !range !702
  store i32 %1, i32* %tx, align 4, !dbg !978
  call void @llvm.dbg.declare(metadata i32* %b_index_x, metadata !981, metadata !592), !dbg !982
  %2 = load i32, i32* %bx, align 4, !dbg !983
  %3 = load i32, i32* %block_width.addr, align 4, !dbg !984
  %add = add nsw i32 %2, %3, !dbg !985
  %4 = load i32, i32* %i.addr, align 4, !dbg !986
  %sub = sub nsw i32 %add, %4, !dbg !987
  store i32 %sub, i32* %b_index_x, align 4, !dbg !982
  call void @llvm.dbg.declare(metadata i32* %b_index_y, metadata !988, metadata !592), !dbg !989
  %5 = load i32, i32* %block_width.addr, align 4, !dbg !990
  %6 = load i32, i32* %bx, align 4, !dbg !991
  %sub2 = sub nsw i32 %5, %6, !dbg !992
  %sub3 = sub nsw i32 %sub2, 1, !dbg !993
  store i32 %sub3, i32* %b_index_y, align 4, !dbg !989
  call void @llvm.dbg.declare(metadata i32* %index, metadata !994, metadata !592), !dbg !995
  %7 = load i32, i32* %cols.addr, align 4, !dbg !996
  %mul = mul nsw i32 %7, 16, !dbg !997
  %8 = load i32, i32* %b_index_y, align 4, !dbg !998
  %mul4 = mul nsw i32 %mul, %8, !dbg !999
  %9 = load i32, i32* %b_index_x, align 4, !dbg !1000
  %mul5 = mul nsw i32 16, %9, !dbg !1001
  %add6 = add nsw i32 %mul4, %mul5, !dbg !1002
  %10 = load i32, i32* %tx, align 4, !dbg !1003
  %add7 = add nsw i32 %add6, %10, !dbg !1004
  %11 = load i32, i32* %cols.addr, align 4, !dbg !1005
  %add8 = add nsw i32 %11, 1, !dbg !1006
  %add9 = add nsw i32 %add7, %add8, !dbg !1007
  store i32 %add9, i32* %index, align 4, !dbg !995
  call void @llvm.dbg.declare(metadata i32* %index_n, metadata !1008, metadata !592), !dbg !1009
  %12 = load i32, i32* %cols.addr, align 4, !dbg !1010
  %mul10 = mul nsw i32 %12, 16, !dbg !1011
  %13 = load i32, i32* %b_index_y, align 4, !dbg !1012
  %mul11 = mul nsw i32 %mul10, %13, !dbg !1013
  %14 = load i32, i32* %b_index_x, align 4, !dbg !1014
  %mul12 = mul nsw i32 16, %14, !dbg !1015
  %add13 = add nsw i32 %mul11, %mul12, !dbg !1016
  %15 = load i32, i32* %tx, align 4, !dbg !1017
  %add14 = add nsw i32 %add13, %15, !dbg !1018
  %add15 = add nsw i32 %add14, 1, !dbg !1019
  store i32 %add15, i32* %index_n, align 4, !dbg !1009
  call void @llvm.dbg.declare(metadata i32* %index_w, metadata !1020, metadata !592), !dbg !1021
  %16 = load i32, i32* %cols.addr, align 4, !dbg !1022
  %mul16 = mul nsw i32 %16, 16, !dbg !1023
  %17 = load i32, i32* %b_index_y, align 4, !dbg !1024
  %mul17 = mul nsw i32 %mul16, %17, !dbg !1025
  %18 = load i32, i32* %b_index_x, align 4, !dbg !1026
  %mul18 = mul nsw i32 16, %18, !dbg !1027
  %add19 = add nsw i32 %mul17, %mul18, !dbg !1028
  %19 = load i32, i32* %cols.addr, align 4, !dbg !1029
  %add20 = add nsw i32 %add19, %19, !dbg !1030
  store i32 %add20, i32* %index_w, align 4, !dbg !1021
  call void @llvm.dbg.declare(metadata i32* %index_nw, metadata !1031, metadata !592), !dbg !1032
  %20 = load i32, i32* %cols.addr, align 4, !dbg !1033
  %mul21 = mul nsw i32 %20, 16, !dbg !1034
  %21 = load i32, i32* %b_index_y, align 4, !dbg !1035
  %mul22 = mul nsw i32 %mul21, %21, !dbg !1036
  %22 = load i32, i32* %b_index_x, align 4, !dbg !1037
  %mul23 = mul nsw i32 16, %22, !dbg !1038
  %add24 = add nsw i32 %mul22, %mul23, !dbg !1039
  store i32 %add24, i32* %index_nw, align 4, !dbg !1032
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !1040, metadata !592), !dbg !1042
  store i32 0, i32* %ty, align 4, !dbg !1042
  br label %for.cond, !dbg !1043

for.cond:                                         ; preds = %for.inc, %entry
  %23 = load i32, i32* %ty, align 4, !dbg !1044
  %cmp = icmp slt i32 %23, 16, !dbg !1047
  br i1 %cmp, label %for.body, label %for.end, !dbg !1048

for.body:                                         ; preds = %for.cond
  %24 = load i32*, i32** %referrence.addr, align 8, !dbg !1049
  %25 = load i32, i32* %index, align 4, !dbg !1050
  %26 = load i32, i32* %cols.addr, align 4, !dbg !1051
  %27 = load i32, i32* %ty, align 4, !dbg !1052
  %mul25 = mul nsw i32 %26, %27, !dbg !1053
  %add26 = add nsw i32 %25, %mul25, !dbg !1054
  %idxprom = sext i32 %add26 to i64, !dbg !1049
  %arrayidx = getelementptr inbounds i32, i32* %24, i64 %idxprom, !dbg !1049
  %28 = load i32, i32* %arrayidx, align 4, !dbg !1049
  %29 = load i32, i32* %ty, align 4, !dbg !1055
  %idxprom27 = sext i32 %29 to i64, !dbg !1056
  %arrayidx28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom27, !dbg !1056
  %30 = load i32, i32* %tx, align 4, !dbg !1057
  %idxprom29 = sext i32 %30 to i64, !dbg !1056
  %arrayidx30 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx28, i64 0, i64 %idxprom29, !dbg !1056
  store i32 %28, i32* %arrayidx30, align 4, !dbg !1058
  br label %for.inc, !dbg !1056

for.inc:                                          ; preds = %for.body
  %31 = load i32, i32* %ty, align 4, !dbg !1059
  %inc = add nsw i32 %31, 1, !dbg !1059
  store i32 %inc, i32* %ty, align 4, !dbg !1059
  br label %for.cond, !dbg !1061, !llvm.loop !1062

for.end:                                          ; preds = %for.cond
  call void @llvm.nvvm.barrier0(), !dbg !1064
  %32 = load i32, i32* %tx, align 4, !dbg !1065
  %cmp31 = icmp eq i32 %32, 0, !dbg !1067
  br i1 %cmp31, label %if.then, label %if.end, !dbg !1068

if.then:                                          ; preds = %for.end
  %33 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !1069
  %34 = load i32, i32* %index_nw, align 4, !dbg !1070
  %idxprom32 = sext i32 %34 to i64, !dbg !1069
  %arrayidx33 = getelementptr inbounds i32, i32* %33, i64 %idxprom32, !dbg !1069
  %35 = load i32, i32* %arrayidx33, align 4, !dbg !1069
  %36 = load i32, i32* %tx, align 4, !dbg !1071
  %idxprom34 = sext i32 %36 to i64, !dbg !1072
  %arrayidx35 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom34, !dbg !1072
  %arrayidx36 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx35, i64 0, i64 0, !dbg !1072
  store i32 %35, i32* %arrayidx36, align 4, !dbg !1073
  br label %if.end, !dbg !1072

if.end:                                           ; preds = %if.then, %for.end
  %37 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !1074
  %38 = load i32, i32* %index_w, align 4, !dbg !1075
  %39 = load i32, i32* %cols.addr, align 4, !dbg !1076
  %40 = load i32, i32* %tx, align 4, !dbg !1077
  %mul37 = mul nsw i32 %39, %40, !dbg !1078
  %add38 = add nsw i32 %38, %mul37, !dbg !1079
  %idxprom39 = sext i32 %add38 to i64, !dbg !1074
  %arrayidx40 = getelementptr inbounds i32, i32* %37, i64 %idxprom39, !dbg !1074
  %41 = load i32, i32* %arrayidx40, align 4, !dbg !1074
  %42 = load i32, i32* %tx, align 4, !dbg !1080
  %add41 = add nsw i32 %42, 1, !dbg !1081
  %idxprom42 = sext i32 %add41 to i64, !dbg !1082
  %arrayidx43 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom42, !dbg !1082
  %arrayidx44 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx43, i64 0, i64 0, !dbg !1082
  store i32 %41, i32* %arrayidx44, align 4, !dbg !1083
  call void @llvm.nvvm.barrier0(), !dbg !1084
  %43 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !1085
  %44 = load i32, i32* %index_n, align 4, !dbg !1086
  %idxprom45 = sext i32 %44 to i64, !dbg !1085
  %arrayidx46 = getelementptr inbounds i32, i32* %43, i64 %idxprom45, !dbg !1085
  %45 = load i32, i32* %arrayidx46, align 4, !dbg !1085
  %46 = load i32, i32* %tx, align 4, !dbg !1087
  %add47 = add nsw i32 %46, 1, !dbg !1088
  %idxprom48 = sext i32 %add47 to i64, !dbg !1089
  %arrayidx49 = getelementptr inbounds [17 x i32], [17 x i32]* getelementptr inbounds ([17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 0), i64 0, i64 %idxprom48, !dbg !1089
  store i32 %45, i32* %arrayidx49, align 4, !dbg !1090
  call void @llvm.nvvm.barrier0(), !dbg !1091
  call void @llvm.dbg.declare(metadata i32* %m, metadata !1092, metadata !592), !dbg !1094
  store i32 0, i32* %m, align 4, !dbg !1094
  br label %for.cond50, !dbg !1095

for.cond50:                                       ; preds = %for.inc89, %if.end
  %47 = load i32, i32* %m, align 4, !dbg !1096
  %cmp51 = icmp slt i32 %47, 16, !dbg !1099
  br i1 %cmp51, label %for.body52, label %for.end91, !dbg !1100

for.body52:                                       ; preds = %for.cond50
  %48 = load i32, i32* %tx, align 4, !dbg !1101
  %49 = load i32, i32* %m, align 4, !dbg !1104
  %cmp53 = icmp sle i32 %48, %49, !dbg !1105
  br i1 %cmp53, label %if.then54, label %if.end88, !dbg !1106

if.then54:                                        ; preds = %for.body52
  call void @llvm.dbg.declare(metadata i32* %t_index_x, metadata !1107, metadata !592), !dbg !1109
  %50 = load i32, i32* %tx, align 4, !dbg !1110
  %add55 = add nsw i32 %50, 1, !dbg !1111
  store i32 %add55, i32* %t_index_x, align 4, !dbg !1109
  call void @llvm.dbg.declare(metadata i32* %t_index_y, metadata !1112, metadata !592), !dbg !1113
  %51 = load i32, i32* %m, align 4, !dbg !1114
  %52 = load i32, i32* %tx, align 4, !dbg !1115
  %sub56 = sub nsw i32 %51, %52, !dbg !1116
  %add57 = add nsw i32 %sub56, 1, !dbg !1117
  store i32 %add57, i32* %t_index_y, align 4, !dbg !1113
  %53 = load i32, i32* %t_index_y, align 4, !dbg !1118
  %sub58 = sub nsw i32 %53, 1, !dbg !1119
  %idxprom59 = sext i32 %sub58 to i64, !dbg !1120
  %arrayidx60 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom59, !dbg !1120
  %54 = load i32, i32* %t_index_x, align 4, !dbg !1121
  %sub61 = sub nsw i32 %54, 1, !dbg !1122
  %idxprom62 = sext i32 %sub61 to i64, !dbg !1120
  %arrayidx63 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx60, i64 0, i64 %idxprom62, !dbg !1120
  %55 = load i32, i32* %arrayidx63, align 4, !dbg !1120
  %56 = load i32, i32* %t_index_y, align 4, !dbg !1123
  %sub64 = sub nsw i32 %56, 1, !dbg !1124
  %idxprom65 = sext i32 %sub64 to i64, !dbg !1125
  %arrayidx66 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom65, !dbg !1125
  %57 = load i32, i32* %t_index_x, align 4, !dbg !1126
  %sub67 = sub nsw i32 %57, 1, !dbg !1127
  %idxprom68 = sext i32 %sub67 to i64, !dbg !1125
  %arrayidx69 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx66, i64 0, i64 %idxprom68, !dbg !1125
  %58 = load i32, i32* %arrayidx69, align 4, !dbg !1125
  %add70 = add nsw i32 %55, %58, !dbg !1128
  %59 = load i32, i32* %t_index_y, align 4, !dbg !1129
  %idxprom71 = sext i32 %59 to i64, !dbg !1130
  %arrayidx72 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom71, !dbg !1130
  %60 = load i32, i32* %t_index_x, align 4, !dbg !1131
  %sub73 = sub nsw i32 %60, 1, !dbg !1132
  %idxprom74 = sext i32 %sub73 to i64, !dbg !1130
  %arrayidx75 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx72, i64 0, i64 %idxprom74, !dbg !1130
  %61 = load i32, i32* %arrayidx75, align 4, !dbg !1130
  %62 = load i32, i32* %penalty.addr, align 4, !dbg !1133
  %sub76 = sub nsw i32 %61, %62, !dbg !1134
  %63 = load i32, i32* %t_index_y, align 4, !dbg !1135
  %sub77 = sub nsw i32 %63, 1, !dbg !1136
  %idxprom78 = sext i32 %sub77 to i64, !dbg !1137
  %arrayidx79 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom78, !dbg !1137
  %64 = load i32, i32* %t_index_x, align 4, !dbg !1138
  %idxprom80 = sext i32 %64 to i64, !dbg !1137
  %arrayidx81 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx79, i64 0, i64 %idxprom80, !dbg !1137
  %65 = load i32, i32* %arrayidx81, align 4, !dbg !1137
  %66 = load i32, i32* %penalty.addr, align 4, !dbg !1139
  %sub82 = sub nsw i32 %65, %66, !dbg !1140
  %call83 = call i32 @_Z7maximumiii(i32 %add70, i32 %sub76, i32 %sub82) #2, !dbg !1141
  %67 = load i32, i32* %t_index_y, align 4, !dbg !1142
  %idxprom84 = sext i32 %67 to i64, !dbg !1143
  %arrayidx85 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom84, !dbg !1143
  %68 = load i32, i32* %t_index_x, align 4, !dbg !1144
  %idxprom86 = sext i32 %68 to i64, !dbg !1143
  %arrayidx87 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx85, i64 0, i64 %idxprom86, !dbg !1143
  store i32 %call83, i32* %arrayidx87, align 4, !dbg !1145
  br label %if.end88, !dbg !1146

if.end88:                                         ; preds = %if.then54, %for.body52
  call void @llvm.nvvm.barrier0(), !dbg !1147
  br label %for.inc89, !dbg !1148

for.inc89:                                        ; preds = %if.end88
  %69 = load i32, i32* %m, align 4, !dbg !1149
  %inc90 = add nsw i32 %69, 1, !dbg !1149
  store i32 %inc90, i32* %m, align 4, !dbg !1149
  br label %for.cond50, !dbg !1151, !llvm.loop !1152

for.end91:                                        ; preds = %for.cond50
  call void @llvm.dbg.declare(metadata i32* %m92, metadata !1154, metadata !592), !dbg !1156
  store i32 14, i32* %m92, align 4, !dbg !1156
  br label %for.cond93, !dbg !1157

for.cond93:                                       ; preds = %for.inc134, %for.end91
  %70 = load i32, i32* %m92, align 4, !dbg !1158
  %cmp94 = icmp sge i32 %70, 0, !dbg !1161
  br i1 %cmp94, label %for.body95, label %for.end135, !dbg !1162

for.body95:                                       ; preds = %for.cond93
  %71 = load i32, i32* %tx, align 4, !dbg !1163
  %72 = load i32, i32* %m92, align 4, !dbg !1166
  %cmp96 = icmp sle i32 %71, %72, !dbg !1167
  br i1 %cmp96, label %if.then97, label %if.end133, !dbg !1168

if.then97:                                        ; preds = %for.body95
  call void @llvm.dbg.declare(metadata i32* %t_index_x98, metadata !1169, metadata !592), !dbg !1171
  %73 = load i32, i32* %tx, align 4, !dbg !1172
  %add99 = add nsw i32 %73, 16, !dbg !1173
  %74 = load i32, i32* %m92, align 4, !dbg !1174
  %sub100 = sub nsw i32 %add99, %74, !dbg !1175
  store i32 %sub100, i32* %t_index_x98, align 4, !dbg !1171
  call void @llvm.dbg.declare(metadata i32* %t_index_y101, metadata !1176, metadata !592), !dbg !1177
  %75 = load i32, i32* %tx, align 4, !dbg !1178
  %sub102 = sub nsw i32 16, %75, !dbg !1179
  store i32 %sub102, i32* %t_index_y101, align 4, !dbg !1177
  %76 = load i32, i32* %t_index_y101, align 4, !dbg !1180
  %sub103 = sub nsw i32 %76, 1, !dbg !1181
  %idxprom104 = sext i32 %sub103 to i64, !dbg !1182
  %arrayidx105 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom104, !dbg !1182
  %77 = load i32, i32* %t_index_x98, align 4, !dbg !1183
  %sub106 = sub nsw i32 %77, 1, !dbg !1184
  %idxprom107 = sext i32 %sub106 to i64, !dbg !1182
  %arrayidx108 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx105, i64 0, i64 %idxprom107, !dbg !1182
  %78 = load i32, i32* %arrayidx108, align 4, !dbg !1182
  %79 = load i32, i32* %t_index_y101, align 4, !dbg !1185
  %sub109 = sub nsw i32 %79, 1, !dbg !1186
  %idxprom110 = sext i32 %sub109 to i64, !dbg !1187
  %arrayidx111 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom110, !dbg !1187
  %80 = load i32, i32* %t_index_x98, align 4, !dbg !1188
  %sub112 = sub nsw i32 %80, 1, !dbg !1189
  %idxprom113 = sext i32 %sub112 to i64, !dbg !1187
  %arrayidx114 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx111, i64 0, i64 %idxprom113, !dbg !1187
  %81 = load i32, i32* %arrayidx114, align 4, !dbg !1187
  %add115 = add nsw i32 %78, %81, !dbg !1190
  %82 = load i32, i32* %t_index_y101, align 4, !dbg !1191
  %idxprom116 = sext i32 %82 to i64, !dbg !1192
  %arrayidx117 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom116, !dbg !1192
  %83 = load i32, i32* %t_index_x98, align 4, !dbg !1193
  %sub118 = sub nsw i32 %83, 1, !dbg !1194
  %idxprom119 = sext i32 %sub118 to i64, !dbg !1192
  %arrayidx120 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx117, i64 0, i64 %idxprom119, !dbg !1192
  %84 = load i32, i32* %arrayidx120, align 4, !dbg !1192
  %85 = load i32, i32* %penalty.addr, align 4, !dbg !1195
  %sub121 = sub nsw i32 %84, %85, !dbg !1196
  %86 = load i32, i32* %t_index_y101, align 4, !dbg !1197
  %sub122 = sub nsw i32 %86, 1, !dbg !1198
  %idxprom123 = sext i32 %sub122 to i64, !dbg !1199
  %arrayidx124 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom123, !dbg !1199
  %87 = load i32, i32* %t_index_x98, align 4, !dbg !1200
  %idxprom125 = sext i32 %87 to i64, !dbg !1199
  %arrayidx126 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx124, i64 0, i64 %idxprom125, !dbg !1199
  %88 = load i32, i32* %arrayidx126, align 4, !dbg !1199
  %89 = load i32, i32* %penalty.addr, align 4, !dbg !1201
  %sub127 = sub nsw i32 %88, %89, !dbg !1202
  %call128 = call i32 @_Z7maximumiii(i32 %add115, i32 %sub121, i32 %sub127) #2, !dbg !1203
  %90 = load i32, i32* %t_index_y101, align 4, !dbg !1204
  %idxprom129 = sext i32 %90 to i64, !dbg !1205
  %arrayidx130 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom129, !dbg !1205
  %91 = load i32, i32* %t_index_x98, align 4, !dbg !1206
  %idxprom131 = sext i32 %91 to i64, !dbg !1205
  %arrayidx132 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx130, i64 0, i64 %idxprom131, !dbg !1205
  store i32 %call128, i32* %arrayidx132, align 4, !dbg !1207
  br label %if.end133, !dbg !1208

if.end133:                                        ; preds = %if.then97, %for.body95
  call void @llvm.nvvm.barrier0(), !dbg !1209
  br label %for.inc134, !dbg !1210

for.inc134:                                       ; preds = %if.end133
  %92 = load i32, i32* %m92, align 4, !dbg !1211
  %dec = add nsw i32 %92, -1, !dbg !1211
  store i32 %dec, i32* %m92, align 4, !dbg !1211
  br label %for.cond93, !dbg !1213, !llvm.loop !1214

for.end135:                                       ; preds = %for.cond93
  call void @llvm.dbg.declare(metadata i32* %ty136, metadata !1216, metadata !592), !dbg !1218
  store i32 0, i32* %ty136, align 4, !dbg !1218
  br label %for.cond137, !dbg !1219

for.cond137:                                      ; preds = %for.inc150, %for.end135
  %93 = load i32, i32* %ty136, align 4, !dbg !1220
  %cmp138 = icmp slt i32 %93, 16, !dbg !1223
  br i1 %cmp138, label %for.body139, label %for.end152, !dbg !1224

for.body139:                                      ; preds = %for.cond137
  %94 = load i32, i32* %ty136, align 4, !dbg !1225
  %add140 = add nsw i32 %94, 1, !dbg !1226
  %idxprom141 = sext i32 %add140 to i64, !dbg !1227
  %arrayidx142 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom141, !dbg !1227
  %95 = load i32, i32* %tx, align 4, !dbg !1228
  %add143 = add nsw i32 %95, 1, !dbg !1229
  %idxprom144 = sext i32 %add143 to i64, !dbg !1227
  %arrayidx145 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx142, i64 0, i64 %idxprom144, !dbg !1227
  %96 = load i32, i32* %arrayidx145, align 4, !dbg !1227
  %97 = load i32*, i32** %matrix_cuda.addr, align 8, !dbg !1230
  %98 = load i32, i32* %index, align 4, !dbg !1231
  %99 = load i32, i32* %ty136, align 4, !dbg !1232
  %100 = load i32, i32* %cols.addr, align 4, !dbg !1233
  %mul146 = mul nsw i32 %99, %100, !dbg !1234
  %add147 = add nsw i32 %98, %mul146, !dbg !1235
  %idxprom148 = sext i32 %add147 to i64, !dbg !1230
  %arrayidx149 = getelementptr inbounds i32, i32* %97, i64 %idxprom148, !dbg !1230
  store i32 %96, i32* %arrayidx149, align 4, !dbg !1236
  br label %for.inc150, !dbg !1230

for.inc150:                                       ; preds = %for.body139
  %101 = load i32, i32* %ty136, align 4, !dbg !1237
  %inc151 = add nsw i32 %101, 1, !dbg !1237
  store i32 %inc151, i32* %ty136, align 4, !dbg !1237
  br label %for.cond137, !dbg !1239, !llvm.loop !1240

for.end152:                                       ; preds = %for.cond137
  ret void, !dbg !1242
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!7}
!nvvm.annotations = !{!577, !578, !579, !580, !579, !581, !581, !581, !581, !582, !582, !581}
!llvm.module.flags = !{!583, !584, !585}
!llvm.ident = !{!586}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!587}

!0 = distinct !DIGlobalVariable(name: "temp", scope: !1, file: !2, line: 45, type: !17, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "needle_cuda_shared_1", linkageName: "_Z20needle_cuda_shared_1PiS_iiii", scope: !2, file: !2, line: 27, type: !3, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !7, variables: !9)
!2 = !DIFile(filename: "./needle_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !5, !6, !6, !6, !6}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !8, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, imports: !21)
!8 = !DIFile(filename: "needle.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!9 = !{}
!10 = !{!0, !11, !15, !20}
!11 = distinct !DIGlobalVariable(name: "ref", scope: !1, file: !2, line: 46, type: !12, isLocal: true, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8192, align: 32, elements: !13)
!13 = !{!14, !14}
!14 = !DISubrange(count: 16)
!15 = distinct !DIGlobalVariable(name: "temp", scope: !16, file: !2, line: 128, type: !17, isLocal: true, isDefinition: true)
!16 = distinct !DISubprogram(name: "needle_cuda_shared_2", linkageName: "_Z20needle_cuda_shared_2PiS_iiii", scope: !2, file: !2, line: 108, type: !3, isLocal: false, isDefinition: true, scopeLine: 115, flags: DIFlagPrototyped, isOptimized: false, unit: !7, variables: !9)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 9248, align: 32, elements: !18)
!18 = !{!19, !19}
!19 = !DISubrange(count: 17)
!20 = distinct !DIGlobalVariable(name: "ref", scope: !16, file: !2, line: 129, type: !12, isLocal: true, isDefinition: true)
!21 = !{!22, !29, !34, !36, !38, !40, !42, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !72, !74, !78, !80, !82, !84, !88, !92, !94, !96, !101, !105, !107, !109, !111, !113, !115, !117, !119, !121, !126, !130, !132, !134, !138, !140, !142, !144, !146, !148, !152, !154, !156, !161, !169, !173, !175, !177, !181, !183, !185, !189, !191, !193, !197, !199, !201, !203, !205, !207, !209, !211, !213, !215, !220, !222, !224, !228, !230, !232, !234, !236, !238, !240, !242, !246, !250, !252, !254, !259, !261, !263, !265, !267, !269, !271, !275, !281, !285, !289, !294, !296, !300, !304, !318, !322, !326, !330, !334, !339, !341, !345, !349, !353, !361, !365, !369, !373, !377, !382, !388, !392, !396, !398, !406, !410, !418, !420, !422, !426, !430, !434, !439, !443, !448, !449, !450, !451, !454, !455, !456, !457, !458, !459, !460, !463, !465, !467, !469, !471, !473, !475, !477, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !548, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575}
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !25, line: 189)
!23 = !DINamespace(name: "std", scope: null, file: !24, line: 188)
!24 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!25 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !24, file: !24, line: 44, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !28}
!28 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !30, line: 190)
!30 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !24, file: !24, line: 46, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !33}
!33 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !35, line: 191)
!35 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !24, file: !24, line: 48, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !37, line: 192)
!37 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !24, file: !24, line: 50, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !39, line: 193)
!39 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !24, file: !24, line: 52, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !41, line: 194)
!41 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !24, file: !24, line: 56, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !43, line: 195)
!43 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !24, file: !24, line: 54, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DISubroutineType(types: !45)
!45 = !{!33, !33, !33}
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !47, line: 196)
!47 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !24, file: !24, line: 58, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !49, line: 197)
!49 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !24, file: !24, line: 60, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !51, line: 198)
!51 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !24, file: !24, line: 62, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !53, line: 199)
!53 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !24, file: !24, line: 64, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !55, line: 200)
!55 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !24, file: !24, line: 66, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !57, line: 201)
!57 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !24, file: !24, line: 68, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !59, line: 202)
!59 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !24, file: !24, line: 72, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !61, line: 203)
!61 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !24, file: !24, line: 70, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !63, line: 204)
!63 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !24, file: !24, line: 76, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !65, line: 205)
!65 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !24, file: !24, line: 74, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !67, line: 206)
!67 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !24, file: !24, line: 78, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !69, line: 207)
!69 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !24, file: !24, line: 80, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !71, line: 208)
!71 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !24, file: !24, line: 82, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !73, line: 209)
!73 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !24, file: !24, line: 84, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !75, line: 210)
!75 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !24, file: !24, line: 86, type: !76, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DISubroutineType(types: !77)
!77 = !{!33, !33, !33, !33}
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !79, line: 211)
!79 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !24, file: !24, line: 88, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !81, line: 212)
!81 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !24, file: !24, line: 90, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !83, line: 213)
!83 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !24, file: !24, line: 92, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !85, line: 214)
!85 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !24, file: !24, line: 94, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DISubroutineType(types: !87)
!87 = !{!6, !33}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !89, line: 215)
!89 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !24, file: !24, line: 96, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DISubroutineType(types: !91)
!91 = !{!33, !33, !5}
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !93, line: 216)
!93 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !24, file: !24, line: 98, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !95, line: 217)
!95 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !24, file: !24, line: 100, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !97, line: 218)
!97 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !24, file: !24, line: 102, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!100, !33}
!100 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !102, line: 219)
!102 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !24, file: !24, line: 106, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DISubroutineType(types: !104)
!104 = !{!100, !33, !33}
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
!129 = !{!33, !33, !6}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !131, line: 230)
!131 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !24, file: !24, line: 125, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !133, line: 231)
!133 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !24, file: !24, line: 126, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !135, line: 232)
!135 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !24, file: !24, line: 128, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DISubroutineType(types: !137)
!137 = !{!28, !33}
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
!151 = !{!125, !33}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !153, line: 239)
!153 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !24, file: !24, line: 142, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !155, line: 240)
!155 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !24, file: !24, line: 143, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !157, line: 241)
!157 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !24, file: !24, line: 145, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DISubroutineType(types: !159)
!159 = !{!33, !33, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, align: 64)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !162, line: 242)
!162 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !24, file: !24, line: 146, type: !163, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DISubroutineType(types: !164)
!164 = !{!165, !166}
!165 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64, align: 64)
!167 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !168)
!168 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !170, line: 243)
!170 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !24, file: !24, line: 147, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DISubroutineType(types: !172)
!172 = !{!33, !166}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !174, line: 244)
!174 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !24, file: !24, line: 149, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !176, line: 245)
!176 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !24, file: !24, line: 151, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !178, line: 246)
!178 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !24, file: !24, line: 153, type: !179, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DISubroutineType(types: !180)
!180 = !{!33, !33, !165}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !182, line: 247)
!182 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !24, file: !24, line: 158, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !184, line: 248)
!184 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !24, file: !24, line: 160, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !186, line: 249)
!186 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !24, file: !24, line: 162, type: !187, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DISubroutineType(types: !188)
!188 = !{!33, !33, !33, !5}
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !190, line: 250)
!190 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !24, file: !24, line: 164, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !192, line: 251)
!192 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !24, file: !24, line: 166, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !194, line: 252)
!194 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !24, file: !24, line: 168, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{!33, !33, !125}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !198, line: 253)
!198 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !24, file: !24, line: 170, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !200, line: 254)
!200 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !24, file: !24, line: 172, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !202, line: 255)
!202 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !24, file: !24, line: 174, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !204, line: 256)
!204 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !24, file: !24, line: 176, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !206, line: 257)
!206 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !24, file: !24, line: 178, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !208, line: 258)
!208 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !24, file: !24, line: 180, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !210, line: 259)
!210 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !24, file: !24, line: 182, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !212, line: 260)
!212 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !24, file: !24, line: 184, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !214, line: 261)
!214 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !24, file: !24, line: 186, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !216, line: 102)
!216 = !DISubprogram(name: "acos", scope: !217, file: !217, line: 54, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!218 = !DISubroutineType(types: !219)
!219 = !{!165, !165}
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !221, line: 121)
!221 = !DISubprogram(name: "asin", scope: !217, file: !217, line: 56, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !223, line: 140)
!223 = !DISubprogram(name: "atan", scope: !217, file: !217, line: 58, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !225, line: 159)
!225 = !DISubprogram(name: "atan2", scope: !217, file: !217, line: 60, type: !226, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DISubroutineType(types: !227)
!227 = !{!165, !165, !165}
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !229, line: 180)
!229 = !DISubprogram(name: "ceil", scope: !217, file: !217, line: 178, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !231, line: 199)
!231 = !DISubprogram(name: "cos", scope: !217, file: !217, line: 63, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !233, line: 218)
!233 = !DISubprogram(name: "cosh", scope: !217, file: !217, line: 72, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !235, line: 237)
!235 = !DISubprogram(name: "exp", scope: !217, file: !217, line: 100, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !237, line: 256)
!237 = !DISubprogram(name: "fabs", scope: !217, file: !217, line: 181, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !239, line: 275)
!239 = !DISubprogram(name: "floor", scope: !217, file: !217, line: 184, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !241, line: 294)
!241 = !DISubprogram(name: "fmod", scope: !217, file: !217, line: 187, type: !226, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !243, line: 315)
!243 = !DISubprogram(name: "frexp", scope: !217, file: !217, line: 103, type: !244, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DISubroutineType(types: !245)
!245 = !{!165, !165, !5}
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !247, line: 334)
!247 = !DISubprogram(name: "ldexp", scope: !217, file: !217, line: 106, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DISubroutineType(types: !249)
!249 = !{!165, !165, !6}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !251, line: 353)
!251 = !DISubprogram(name: "log", scope: !217, file: !217, line: 109, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !253, line: 372)
!253 = !DISubprogram(name: "log10", scope: !217, file: !217, line: 112, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !255, line: 391)
!255 = !DISubprogram(name: "modf", scope: !217, file: !217, line: 115, type: !256, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DISubroutineType(types: !257)
!257 = !{!165, !165, !258}
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64, align: 64)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !260, line: 403)
!260 = !DISubprogram(name: "pow", scope: !217, file: !217, line: 153, type: !226, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !262, line: 440)
!262 = !DISubprogram(name: "sin", scope: !217, file: !217, line: 65, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !264, line: 459)
!264 = !DISubprogram(name: "sinh", scope: !217, file: !217, line: 74, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !266, line: 478)
!266 = !DISubprogram(name: "sqrt", scope: !217, file: !217, line: 156, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !268, line: 497)
!268 = !DISubprogram(name: "tan", scope: !217, file: !217, line: 67, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !270, line: 516)
!270 = !DISubprogram(name: "tanh", scope: !217, file: !217, line: 76, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !272, line: 118)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !273, line: 101, baseType: !274)
!273 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!274 = !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !276, line: 119)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !273, line: 109, baseType: !277)
!277 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 105, size: 128, align: 64, elements: !278, identifier: "_ZTS6ldiv_t")
!278 = !{!279, !280}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !277, file: !273, line: 107, baseType: !125, size: 64, align: 64)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !277, file: !273, line: 108, baseType: !125, size: 64, align: 64, offset: 64)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !282, line: 121)
!282 = !DISubprogram(name: "abort", scope: !273, file: !273, line: 515, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!283 = !DISubroutineType(types: !284)
!284 = !{null}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !286, line: 122)
!286 = !DISubprogram(name: "abs", scope: !273, file: !273, line: 774, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DISubroutineType(types: !288)
!288 = !{!6, !6}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !290, line: 123)
!290 = !DISubprogram(name: "atexit", scope: !273, file: !273, line: 519, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DISubroutineType(types: !292)
!292 = !{!6, !293}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64, align: 64)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !295, line: 129)
!295 = !DISubprogram(name: "atof", scope: !273, file: !273, line: 144, type: !163, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !297, line: 130)
!297 = !DISubprogram(name: "atoi", scope: !273, file: !273, line: 147, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DISubroutineType(types: !299)
!299 = !{!6, !166}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !301, line: 131)
!301 = !DISubprogram(name: "atol", scope: !273, file: !273, line: 150, type: !302, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DISubroutineType(types: !303)
!303 = !{!125, !166}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !305, line: 132)
!305 = !DISubprogram(name: "bsearch", scope: !273, file: !273, line: 754, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DISubroutineType(types: !307)
!307 = !{!308, !309, !309, !311, !311, !314}
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64, align: 64)
!310 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!311 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !312, line: 62, baseType: !313)
!312 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!313 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!314 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !273, line: 741, baseType: !315)
!315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 64, align: 64)
!316 = !DISubroutineType(types: !317)
!317 = !{!6, !309, !309}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !319, line: 133)
!319 = !DISubprogram(name: "calloc", scope: !273, file: !273, line: 468, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DISubroutineType(types: !321)
!321 = !{!308, !311, !311}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !323, line: 134)
!323 = !DISubprogram(name: "div", scope: !273, file: !273, line: 788, type: !324, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DISubroutineType(types: !325)
!325 = !{!272, !6, !6}
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !327, line: 135)
!327 = !DISubprogram(name: "exit", scope: !273, file: !273, line: 543, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!328 = !DISubroutineType(types: !329)
!329 = !{null, !6}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !331, line: 136)
!331 = !DISubprogram(name: "free", scope: !273, file: !273, line: 483, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DISubroutineType(types: !333)
!333 = !{null, !308}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !335, line: 137)
!335 = !DISubprogram(name: "getenv", scope: !273, file: !273, line: 564, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!338, !166}
!338 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64, align: 64)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !340, line: 138)
!340 = !DISubprogram(name: "labs", scope: !273, file: !273, line: 775, type: !123, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !342, line: 139)
!342 = !DISubprogram(name: "ldiv", scope: !273, file: !273, line: 790, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DISubroutineType(types: !344)
!344 = !{!276, !125, !125}
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !346, line: 140)
!346 = !DISubprogram(name: "malloc", scope: !273, file: !273, line: 466, type: !347, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DISubroutineType(types: !348)
!348 = !{!308, !311}
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !350, line: 142)
!350 = !DISubprogram(name: "mblen", scope: !273, file: !273, line: 862, type: !351, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!351 = !DISubroutineType(types: !352)
!352 = !{!6, !166, !311}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !354, line: 143)
!354 = !DISubprogram(name: "mbstowcs", scope: !273, file: !273, line: 873, type: !355, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!355 = !DISubroutineType(types: !356)
!356 = !{!311, !357, !360, !311}
!357 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !358)
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64, align: 64)
!359 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!360 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !166)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !362, line: 144)
!362 = !DISubprogram(name: "mbtowc", scope: !273, file: !273, line: 865, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DISubroutineType(types: !364)
!364 = !{!6, !357, !360, !311}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !366, line: 146)
!366 = !DISubprogram(name: "qsort", scope: !273, file: !273, line: 764, type: !367, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!367 = !DISubroutineType(types: !368)
!368 = !{null, !308, !311, !311, !314}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !370, line: 152)
!370 = !DISubprogram(name: "rand", scope: !273, file: !273, line: 374, type: !371, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!371 = !DISubroutineType(types: !372)
!372 = !{!6}
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !374, line: 153)
!374 = !DISubprogram(name: "realloc", scope: !273, file: !273, line: 480, type: !375, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!375 = !DISubroutineType(types: !376)
!376 = !{!308, !308, !311}
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !378, line: 154)
!378 = !DISubprogram(name: "srand", scope: !273, file: !273, line: 376, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!379 = !DISubroutineType(types: !380)
!380 = !{null, !381}
!381 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !383, line: 155)
!383 = !DISubprogram(name: "strtod", scope: !273, file: !273, line: 164, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!165, !360, !386}
!386 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !387)
!387 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64, align: 64)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !389, line: 156)
!389 = !DISubprogram(name: "strtol", scope: !273, file: !273, line: 183, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !DISubroutineType(types: !391)
!391 = !{!125, !360, !386, !6}
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !393, line: 157)
!393 = !DISubprogram(name: "strtoul", scope: !273, file: !273, line: 187, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DISubroutineType(types: !395)
!395 = !{!313, !360, !386, !6}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !397, line: 158)
!397 = !DISubprogram(name: "system", scope: !273, file: !273, line: 716, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !399, line: 160)
!399 = !DISubprogram(name: "wcstombs", scope: !273, file: !273, line: 876, type: !400, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DISubroutineType(types: !401)
!401 = !{!311, !402, !403, !311}
!402 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !338)
!403 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !404)
!404 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !405, size: 64, align: 64)
!405 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !359)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !407, line: 161)
!407 = !DISubprogram(name: "wctomb", scope: !273, file: !273, line: 869, type: !408, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !DISubroutineType(types: !409)
!409 = !{!6, !338, !359}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !413, line: 214)
!411 = !DINamespace(name: "__gnu_cxx", scope: null, file: !412, line: 220)
!412 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !273, line: 121, baseType: !414)
!414 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 117, size: 128, align: 64, elements: !415, identifier: "_ZTS7lldiv_t")
!415 = !{!416, !417}
!416 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !414, file: !273, line: 119, baseType: !28, size: 64, align: 64)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !414, file: !273, line: 120, baseType: !28, size: 64, align: 64, offset: 64)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !419, line: 220)
!419 = !DISubprogram(name: "_Exit", scope: !273, file: !273, line: 557, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !421, line: 224)
!421 = !DISubprogram(name: "llabs", scope: !273, file: !273, line: 779, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !423, line: 230)
!423 = !DISubprogram(name: "lldiv", scope: !273, file: !273, line: 796, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{!413, !28, !28}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !427, line: 241)
!427 = !DISubprogram(name: "atoll", scope: !273, file: !273, line: 157, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{!28, !166}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !431, line: 242)
!431 = !DISubprogram(name: "strtoll", scope: !273, file: !273, line: 209, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DISubroutineType(types: !433)
!433 = !{!28, !360, !386, !6}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !435, line: 243)
!435 = !DISubprogram(name: "strtoull", scope: !273, file: !273, line: 214, type: !436, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!436 = !DISubroutineType(types: !437)
!437 = !{!438, !360, !386, !6}
!438 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !440, line: 245)
!440 = !DISubprogram(name: "strtof", scope: !273, file: !273, line: 172, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!441 = !DISubroutineType(types: !442)
!442 = !{!33, !360, !386}
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !411, entity: !444, line: 246)
!444 = !DISubprogram(name: "strtold", scope: !273, file: !273, line: 175, type: !445, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!445 = !DISubroutineType(types: !446)
!446 = !{!447, !360, !386}
!447 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !413, line: 254)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !419, line: 256)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !421, line: 258)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !452, line: 259)
!452 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !411, file: !453, line: 227, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!453 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !423, line: 260)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !427, line: 262)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !440, line: 263)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !431, line: 264)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !435, line: 265)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !444, line: 266)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !461, line: 397)
!461 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !462, file: !462, line: 1342, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !464, line: 398)
!464 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !462, file: !462, line: 1370, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !466, line: 399)
!466 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !462, file: !462, line: 1337, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !468, line: 400)
!468 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !462, file: !462, line: 1375, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !470, line: 401)
!470 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !462, file: !462, line: 1327, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !472, line: 402)
!472 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !462, file: !462, line: 1332, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !474, line: 403)
!474 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !462, file: !462, line: 1380, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !476, line: 404)
!476 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !462, file: !462, line: 1430, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !478, line: 405)
!478 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !479, file: !479, line: 667, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !481, line: 406)
!481 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !462, file: !462, line: 1189, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !483, line: 407)
!483 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !462, file: !462, line: 1243, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !485, line: 408)
!485 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !462, file: !462, line: 1312, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !487, line: 409)
!487 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !462, file: !462, line: 1490, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !489, line: 410)
!489 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !462, file: !462, line: 1480, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !491, line: 411)
!491 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !479, file: !479, line: 657, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !493, line: 412)
!493 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !462, file: !462, line: 1294, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !495, line: 413)
!495 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !462, file: !462, line: 1385, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !497, line: 414)
!497 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !479, file: !479, line: 607, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !499, line: 415)
!499 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !462, file: !462, line: 1616, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !501, line: 416)
!501 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !479, file: !479, line: 597, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !503, line: 417)
!503 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !462, file: !462, line: 1568, type: !76, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !505, line: 418)
!505 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !479, file: !479, line: 622, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !507, line: 419)
!507 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !479, file: !479, line: 617, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !509, line: 420)
!509 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !462, file: !462, line: 1553, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !511, line: 421)
!511 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !462, file: !462, line: 1543, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !513, line: 422)
!513 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !462, file: !462, line: 1390, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !515, line: 423)
!515 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !462, file: !462, line: 1621, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !517, line: 424)
!517 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !462, file: !462, line: 1520, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !519, line: 425)
!519 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !462, file: !462, line: 1515, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !521, line: 426)
!521 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !462, file: !462, line: 1149, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !523, line: 427)
!523 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !462, file: !462, line: 1602, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !525, line: 428)
!525 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !462, file: !462, line: 1356, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !527, line: 429)
!527 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !462, file: !462, line: 1365, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !529, line: 430)
!529 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !462, file: !462, line: 1285, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !531, line: 431)
!531 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !462, file: !462, line: 1626, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !533, line: 432)
!533 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !462, file: !462, line: 1347, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !535, line: 433)
!535 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !462, file: !462, line: 1140, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !537, line: 434)
!537 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !462, file: !462, line: 1607, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !539, line: 435)
!539 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !462, file: !462, line: 1548, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !541, line: 436)
!541 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !462, file: !462, line: 1154, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !543, line: 437)
!543 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !462, file: !462, line: 1218, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !545, line: 438)
!545 = !DISubprogram(name: "nexttowardf", scope: !217, file: !217, line: 294, type: !546, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DISubroutineType(types: !547)
!547 = !{!33, !33, !447}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !545, line: 439)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !550, line: 440)
!550 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !462, file: !462, line: 1583, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !552, line: 441)
!552 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !462, file: !462, line: 1558, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !554, line: 442)
!554 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !462, file: !462, line: 1563, type: !187, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !556, line: 443)
!556 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !462, file: !462, line: 1135, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !558, line: 444)
!558 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !462, file: !462, line: 1597, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !560, line: 445)
!560 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !462, file: !462, line: 1530, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !562, line: 446)
!562 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !462, file: !462, line: 1525, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !564, line: 447)
!564 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !462, file: !462, line: 1234, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !566, line: 448)
!566 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !462, file: !462, line: 1317, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !568, line: 449)
!568 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !479, file: !479, line: 907, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !570, line: 450)
!570 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !462, file: !462, line: 1276, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !572, line: 451)
!572 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !462, file: !462, line: 1322, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !574, line: 452)
!574 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !462, file: !462, line: 1592, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !576, line: 453)
!576 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !479, file: !479, line: 662, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !{void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_1PiS_iiii, !"kernel", i32 1}
!578 = !{void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_2PiS_iiii, !"kernel", i32 1}
!579 = !{null, !"align", i32 8}
!580 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!581 = !{null, !"align", i32 16}
!582 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!583 = !{i32 2, !"Dwarf Version", i32 4}
!584 = !{i32 2, !"Debug Info Version", i32 3}
!585 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!586 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!587 = !{i32 1, i32 2}
!588 = distinct !DISubprogram(name: "maximum", linkageName: "_Z7maximumiii", scope: !2, file: !2, line: 9, type: !589, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !7, variables: !9)
!589 = !DISubroutineType(types: !590)
!590 = !{!6, !6, !6, !6}
!591 = !DILocalVariable(name: "a", arg: 1, scope: !588, file: !2, line: 9, type: !6)
!592 = !DIExpression()
!593 = !DILocation(line: 9, column: 14, scope: !588)
!594 = !DILocalVariable(name: "b", arg: 2, scope: !588, file: !2, line: 10, type: !6)
!595 = !DILocation(line: 10, column: 8, scope: !588)
!596 = !DILocalVariable(name: "c", arg: 3, scope: !588, file: !2, line: 11, type: !6)
!597 = !DILocation(line: 11, column: 8, scope: !588)
!598 = !DILocalVariable(name: "k", scope: !588, file: !2, line: 13, type: !6)
!599 = !DILocation(line: 13, column: 5, scope: !588)
!600 = !DILocation(line: 14, column: 5, scope: !601)
!601 = distinct !DILexicalBlock(scope: !588, file: !2, line: 14, column: 5)
!602 = !DILocation(line: 14, column: 10, scope: !601)
!603 = !DILocation(line: 14, column: 7, scope: !601)
!604 = !DILocation(line: 14, column: 5, scope: !588)
!605 = !DILocation(line: 15, column: 5, scope: !601)
!606 = !DILocation(line: 15, column: 3, scope: !601)
!607 = !DILocation(line: 15, column: 1, scope: !601)
!608 = !DILocation(line: 17, column: 5, scope: !601)
!609 = !DILocation(line: 17, column: 3, scope: !601)
!610 = !DILocation(line: 19, column: 5, scope: !611)
!611 = distinct !DILexicalBlock(scope: !588, file: !2, line: 19, column: 5)
!612 = !DILocation(line: 19, column: 9, scope: !611)
!613 = !DILocation(line: 19, column: 7, scope: !611)
!614 = !DILocation(line: 19, column: 5, scope: !588)
!615 = !DILocation(line: 20, column: 8, scope: !611)
!616 = !DILocation(line: 20, column: 1, scope: !611)
!617 = !DILocation(line: 22, column: 8, scope: !611)
!618 = !DILocation(line: 22, column: 1, scope: !611)
!619 = !DILocation(line: 24, column: 1, scope: !588)
!620 = !DILocalVariable(name: "referrence", arg: 1, scope: !1, file: !2, line: 27, type: !5)
!621 = !DILocation(line: 27, column: 29, scope: !1)
!622 = !DILocalVariable(name: "matrix_cuda", arg: 2, scope: !1, file: !2, line: 28, type: !5)
!623 = !DILocation(line: 28, column: 11, scope: !1)
!624 = !DILocalVariable(name: "cols", arg: 3, scope: !1, file: !2, line: 29, type: !6)
!625 = !DILocation(line: 29, column: 10, scope: !1)
!626 = !DILocalVariable(name: "penalty", arg: 4, scope: !1, file: !2, line: 30, type: !6)
!627 = !DILocation(line: 30, column: 10, scope: !1)
!628 = !DILocalVariable(name: "i", arg: 5, scope: !1, file: !2, line: 31, type: !6)
!629 = !DILocation(line: 31, column: 10, scope: !1)
!630 = !DILocalVariable(name: "block_width", arg: 6, scope: !1, file: !2, line: 32, type: !6)
!631 = !DILocation(line: 32, column: 10, scope: !1)
!632 = !DILocalVariable(name: "bx", scope: !1, file: !2, line: 34, type: !6)
!633 = !DILocation(line: 34, column: 7, scope: !1)
!634 = !DILocation(line: 78, column: 3, scope: !635, inlinedAt: !670)
!635 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !637, file: !636, line: 78, type: !640, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !7, declaration: !639, variables: !9)
!636 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!637 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !636, line: 77, size: 8, align: 8, elements: !638, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!638 = !{!639, !642, !643, !644, !655, !659, !663, !666}
!639 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !637, file: !636, line: 78, type: !640, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!640 = !DISubroutineType(types: !641)
!641 = !{!381}
!642 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !637, file: !636, line: 79, type: !640, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !637, file: !636, line: 80, type: !640, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!644 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !637, file: !636, line: 83, type: !645, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DISubroutineType(types: !646)
!646 = !{!647, !653}
!647 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !648, line: 190, size: 96, align: 32, elements: !649, identifier: "_ZTS5uint3")
!648 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!649 = !{!650, !651, !652}
!650 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !647, file: !648, line: 192, baseType: !381, size: 32, align: 32)
!651 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !647, file: !648, line: 192, baseType: !381, size: 32, align: 32, offset: 32)
!652 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !647, file: !648, line: 192, baseType: !381, size: 32, align: 32, offset: 64)
!653 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !654, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!654 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !637)
!655 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !637, file: !636, line: 85, type: !656, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!656 = !DISubroutineType(types: !657)
!657 = !{null, !658}
!658 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !637, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!659 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !637, file: !636, line: 85, type: !660, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!660 = !DISubroutineType(types: !661)
!661 = !{null, !658, !662}
!662 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !654, size: 64, align: 64)
!663 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !637, file: !636, line: 85, type: !664, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{null, !653, !662}
!666 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !637, file: !636, line: 85, type: !667, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!667 = !DISubroutineType(types: !668)
!668 = !{!669, !653}
!669 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !637, size: 64, align: 64)
!670 = distinct !DILocation(line: 34, column: 12, scope: !1)
!671 = !{i32 0, i32 65535}
!672 = !DILocalVariable(name: "tx", scope: !1, file: !2, line: 35, type: !6)
!673 = !DILocation(line: 35, column: 7, scope: !1)
!674 = !DILocation(line: 67, column: 3, scope: !675, inlinedAt: !701)
!675 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !676, file: !636, line: 67, type: !640, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !7, declaration: !678, variables: !9)
!676 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !636, line: 66, size: 8, align: 8, elements: !677, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!677 = !{!678, !679, !680, !681, !686, !690, !694, !697}
!678 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !676, file: !636, line: 67, type: !640, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!679 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !676, file: !636, line: 68, type: !640, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!680 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !676, file: !636, line: 69, type: !640, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!681 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !676, file: !636, line: 72, type: !682, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!682 = !DISubroutineType(types: !683)
!683 = !{!647, !684}
!684 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !685, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!685 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !676)
!686 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !676, file: !636, line: 74, type: !687, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!687 = !DISubroutineType(types: !688)
!688 = !{null, !689}
!689 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !676, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!690 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !676, file: !636, line: 74, type: !691, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!691 = !DISubroutineType(types: !692)
!692 = !{null, !689, !693}
!693 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !685, size: 64, align: 64)
!694 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !676, file: !636, line: 74, type: !695, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!695 = !DISubroutineType(types: !696)
!696 = !{null, !684, !693}
!697 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !676, file: !636, line: 74, type: !698, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!698 = !DISubroutineType(types: !699)
!699 = !{!700, !684}
!700 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !676, size: 64, align: 64)
!701 = distinct !DILocation(line: 35, column: 12, scope: !1)
!702 = !{i32 0, i32 1024}
!703 = !DILocalVariable(name: "b_index_x", scope: !1, file: !2, line: 37, type: !6)
!704 = !DILocation(line: 37, column: 7, scope: !1)
!705 = !DILocation(line: 37, column: 19, scope: !1)
!706 = !DILocalVariable(name: "b_index_y", scope: !1, file: !2, line: 38, type: !6)
!707 = !DILocation(line: 38, column: 7, scope: !1)
!708 = !DILocation(line: 38, column: 19, scope: !1)
!709 = !DILocation(line: 38, column: 21, scope: !1)
!710 = !DILocation(line: 38, column: 27, scope: !1)
!711 = !DILocation(line: 38, column: 25, scope: !1)
!712 = !DILocalVariable(name: "index", scope: !1, file: !2, line: 40, type: !6)
!713 = !DILocation(line: 40, column: 7, scope: !1)
!714 = !DILocation(line: 40, column: 17, scope: !1)
!715 = !DILocation(line: 40, column: 22, scope: !1)
!716 = !DILocation(line: 40, column: 37, scope: !1)
!717 = !DILocation(line: 40, column: 35, scope: !1)
!718 = !DILocation(line: 40, column: 62, scope: !1)
!719 = !DILocation(line: 40, column: 60, scope: !1)
!720 = !DILocation(line: 40, column: 47, scope: !1)
!721 = !DILocation(line: 40, column: 74, scope: !1)
!722 = !DILocation(line: 40, column: 72, scope: !1)
!723 = !DILocation(line: 40, column: 81, scope: !1)
!724 = !DILocation(line: 40, column: 86, scope: !1)
!725 = !DILocation(line: 40, column: 77, scope: !1)
!726 = !DILocalVariable(name: "index_n", scope: !1, file: !2, line: 41, type: !6)
!727 = !DILocation(line: 41, column: 7, scope: !1)
!728 = !DILocation(line: 41, column: 19, scope: !1)
!729 = !DILocation(line: 41, column: 24, scope: !1)
!730 = !DILocation(line: 41, column: 39, scope: !1)
!731 = !DILocation(line: 41, column: 37, scope: !1)
!732 = !DILocation(line: 41, column: 64, scope: !1)
!733 = !DILocation(line: 41, column: 62, scope: !1)
!734 = !DILocation(line: 41, column: 49, scope: !1)
!735 = !DILocation(line: 41, column: 76, scope: !1)
!736 = !DILocation(line: 41, column: 74, scope: !1)
!737 = !DILocation(line: 41, column: 79, scope: !1)
!738 = !DILocalVariable(name: "index_w", scope: !1, file: !2, line: 42, type: !6)
!739 = !DILocation(line: 42, column: 7, scope: !1)
!740 = !DILocation(line: 42, column: 19, scope: !1)
!741 = !DILocation(line: 42, column: 24, scope: !1)
!742 = !DILocation(line: 42, column: 39, scope: !1)
!743 = !DILocation(line: 42, column: 37, scope: !1)
!744 = !DILocation(line: 42, column: 64, scope: !1)
!745 = !DILocation(line: 42, column: 62, scope: !1)
!746 = !DILocation(line: 42, column: 49, scope: !1)
!747 = !DILocation(line: 42, column: 78, scope: !1)
!748 = !DILocation(line: 42, column: 74, scope: !1)
!749 = !DILocalVariable(name: "index_nw", scope: !1, file: !2, line: 43, type: !6)
!750 = !DILocation(line: 43, column: 7, scope: !1)
!751 = !DILocation(line: 43, column: 19, scope: !1)
!752 = !DILocation(line: 43, column: 24, scope: !1)
!753 = !DILocation(line: 43, column: 39, scope: !1)
!754 = !DILocation(line: 43, column: 37, scope: !1)
!755 = !DILocation(line: 43, column: 64, scope: !1)
!756 = !DILocation(line: 43, column: 62, scope: !1)
!757 = !DILocation(line: 43, column: 49, scope: !1)
!758 = !DILocation(line: 48, column: 8, scope: !759)
!759 = distinct !DILexicalBlock(scope: !1, file: !2, line: 48, column: 8)
!760 = !DILocation(line: 48, column: 11, scope: !759)
!761 = !DILocation(line: 48, column: 8, scope: !1)
!762 = !DILocation(line: 49, column: 19, scope: !759)
!763 = !DILocation(line: 49, column: 31, scope: !759)
!764 = !DILocation(line: 49, column: 10, scope: !759)
!765 = !DILocation(line: 49, column: 5, scope: !759)
!766 = !DILocation(line: 49, column: 17, scope: !759)
!767 = !DILocalVariable(name: "ty", scope: !768, file: !2, line: 52, type: !6)
!768 = distinct !DILexicalBlock(scope: !1, file: !2, line: 52, column: 3)
!769 = !DILocation(line: 52, column: 13, scope: !768)
!770 = !DILocation(line: 52, column: 9, scope: !768)
!771 = !DILocation(line: 52, column: 22, scope: !772)
!772 = !DILexicalBlockFile(scope: !773, file: !2, discriminator: 1)
!773 = distinct !DILexicalBlock(scope: !768, file: !2, line: 52, column: 3)
!774 = !DILocation(line: 52, column: 25, scope: !772)
!775 = !DILocation(line: 52, column: 3, scope: !772)
!776 = !DILocation(line: 53, column: 17, scope: !773)
!777 = !DILocation(line: 53, column: 28, scope: !773)
!778 = !DILocation(line: 53, column: 36, scope: !773)
!779 = !DILocation(line: 53, column: 43, scope: !773)
!780 = !DILocation(line: 53, column: 41, scope: !773)
!781 = !DILocation(line: 53, column: 34, scope: !773)
!782 = !DILocation(line: 53, column: 7, scope: !773)
!783 = !DILocation(line: 53, column: 3, scope: !773)
!784 = !DILocation(line: 53, column: 11, scope: !773)
!785 = !DILocation(line: 53, column: 15, scope: !773)
!786 = !DILocation(line: 52, column: 42, scope: !787)
!787 = !DILexicalBlockFile(scope: !773, file: !2, discriminator: 2)
!788 = !DILocation(line: 52, column: 3, scope: !787)
!789 = distinct !{!789, !790}
!790 = !DILocation(line: 52, column: 3, scope: !1)
!791 = !DILocation(line: 55, column: 3, scope: !1)
!792 = !DILocation(line: 57, column: 21, scope: !1)
!793 = !DILocation(line: 57, column: 33, scope: !1)
!794 = !DILocation(line: 57, column: 43, scope: !1)
!795 = !DILocation(line: 57, column: 50, scope: !1)
!796 = !DILocation(line: 57, column: 48, scope: !1)
!797 = !DILocation(line: 57, column: 41, scope: !1)
!798 = !DILocation(line: 57, column: 8, scope: !1)
!799 = !DILocation(line: 57, column: 11, scope: !1)
!800 = !DILocation(line: 57, column: 3, scope: !1)
!801 = !DILocation(line: 57, column: 19, scope: !1)
!802 = !DILocation(line: 59, column: 3, scope: !1)
!803 = !DILocation(line: 61, column: 21, scope: !1)
!804 = !DILocation(line: 61, column: 33, scope: !1)
!805 = !DILocation(line: 61, column: 11, scope: !1)
!806 = !DILocation(line: 61, column: 14, scope: !1)
!807 = !DILocation(line: 61, column: 3, scope: !1)
!808 = !DILocation(line: 61, column: 19, scope: !1)
!809 = !DILocation(line: 63, column: 3, scope: !1)
!810 = !DILocalVariable(name: "m", scope: !811, file: !2, line: 66, type: !6)
!811 = distinct !DILexicalBlock(scope: !1, file: !2, line: 66, column: 3)
!812 = !DILocation(line: 66, column: 12, scope: !811)
!813 = !DILocation(line: 66, column: 8, scope: !811)
!814 = !DILocation(line: 66, column: 20, scope: !815)
!815 = !DILexicalBlockFile(scope: !816, file: !2, discriminator: 1)
!816 = distinct !DILexicalBlock(scope: !811, file: !2, line: 66, column: 3)
!817 = !DILocation(line: 66, column: 22, scope: !815)
!818 = !DILocation(line: 66, column: 3, scope: !815)
!819 = !DILocation(line: 68, column: 9, scope: !820)
!820 = distinct !DILexicalBlock(scope: !821, file: !2, line: 68, column: 9)
!821 = distinct !DILexicalBlock(scope: !816, file: !2, line: 66, column: 41)
!822 = !DILocation(line: 68, column: 15, scope: !820)
!823 = !DILocation(line: 68, column: 12, scope: !820)
!824 = !DILocation(line: 68, column: 9, scope: !821)
!825 = !DILocalVariable(name: "t_index_x", scope: !826, file: !2, line: 70, type: !6)
!826 = distinct !DILexicalBlock(scope: !820, file: !2, line: 68, column: 18)
!827 = !DILocation(line: 70, column: 9, scope: !826)
!828 = !DILocation(line: 70, column: 22, scope: !826)
!829 = !DILocation(line: 70, column: 25, scope: !826)
!830 = !DILocalVariable(name: "t_index_y", scope: !826, file: !2, line: 71, type: !6)
!831 = !DILocation(line: 71, column: 9, scope: !826)
!832 = !DILocation(line: 71, column: 22, scope: !826)
!833 = !DILocation(line: 71, column: 26, scope: !826)
!834 = !DILocation(line: 71, column: 24, scope: !826)
!835 = !DILocation(line: 71, column: 29, scope: !826)
!836 = !DILocation(line: 73, column: 54, scope: !826)
!837 = !DILocation(line: 73, column: 63, scope: !826)
!838 = !DILocation(line: 73, column: 49, scope: !826)
!839 = !DILocation(line: 73, column: 67, scope: !826)
!840 = !DILocation(line: 73, column: 76, scope: !826)
!841 = !DILocation(line: 73, column: 86, scope: !826)
!842 = !DILocation(line: 73, column: 95, scope: !826)
!843 = !DILocation(line: 73, column: 82, scope: !826)
!844 = !DILocation(line: 73, column: 99, scope: !826)
!845 = !DILocation(line: 73, column: 108, scope: !826)
!846 = !DILocation(line: 73, column: 80, scope: !826)
!847 = !DILocation(line: 74, column: 48, scope: !826)
!848 = !DILocation(line: 74, column: 43, scope: !826)
!849 = !DILocation(line: 74, column: 59, scope: !826)
!850 = !DILocation(line: 74, column: 68, scope: !826)
!851 = !DILocation(line: 74, column: 75, scope: !826)
!852 = !DILocation(line: 74, column: 73, scope: !826)
!853 = !DILocation(line: 75, column: 18, scope: !826)
!854 = !DILocation(line: 75, column: 27, scope: !826)
!855 = !DILocation(line: 75, column: 13, scope: !826)
!856 = !DILocation(line: 75, column: 31, scope: !826)
!857 = !DILocation(line: 75, column: 45, scope: !826)
!858 = !DILocation(line: 75, column: 43, scope: !826)
!859 = !DILocation(line: 73, column: 40, scope: !826)
!860 = !DILocation(line: 73, column: 16, scope: !826)
!861 = !DILocation(line: 73, column: 11, scope: !826)
!862 = !DILocation(line: 73, column: 27, scope: !826)
!863 = !DILocation(line: 73, column: 38, scope: !826)
!864 = !DILocation(line: 79, column: 4, scope: !826)
!865 = !DILocation(line: 81, column: 4, scope: !821)
!866 = !DILocation(line: 83, column: 5, scope: !821)
!867 = !DILocation(line: 66, column: 38, scope: !868)
!868 = !DILexicalBlockFile(scope: !816, file: !2, discriminator: 2)
!869 = !DILocation(line: 66, column: 3, scope: !868)
!870 = distinct !{!870, !871}
!871 = !DILocation(line: 66, column: 3, scope: !1)
!872 = !DILocalVariable(name: "m", scope: !873, file: !2, line: 85, type: !6)
!873 = distinct !DILexicalBlock(scope: !1, file: !2, line: 85, column: 2)
!874 = !DILocation(line: 85, column: 11, scope: !873)
!875 = !DILocation(line: 85, column: 7, scope: !873)
!876 = !DILocation(line: 85, column: 32, scope: !877)
!877 = !DILexicalBlockFile(scope: !878, file: !2, discriminator: 1)
!878 = distinct !DILexicalBlock(scope: !873, file: !2, line: 85, column: 2)
!879 = !DILocation(line: 85, column: 34, scope: !877)
!880 = !DILocation(line: 85, column: 2, scope: !877)
!881 = !DILocation(line: 87, column: 9, scope: !882)
!882 = distinct !DILexicalBlock(scope: !883, file: !2, line: 87, column: 9)
!883 = distinct !DILexicalBlock(scope: !878, file: !2, line: 85, column: 44)
!884 = !DILocation(line: 87, column: 15, scope: !882)
!885 = !DILocation(line: 87, column: 12, scope: !882)
!886 = !DILocation(line: 87, column: 9, scope: !883)
!887 = !DILocalVariable(name: "t_index_x", scope: !888, file: !2, line: 89, type: !6)
!888 = distinct !DILexicalBlock(scope: !882, file: !2, line: 87, column: 17)
!889 = !DILocation(line: 89, column: 9, scope: !888)
!890 = !DILocation(line: 89, column: 22, scope: !888)
!891 = !DILocation(line: 89, column: 25, scope: !888)
!892 = !DILocation(line: 89, column: 40, scope: !888)
!893 = !DILocation(line: 89, column: 38, scope: !888)
!894 = !DILocalVariable(name: "t_index_y", scope: !888, file: !2, line: 90, type: !6)
!895 = !DILocation(line: 90, column: 9, scope: !888)
!896 = !DILocation(line: 90, column: 35, scope: !888)
!897 = !DILocation(line: 90, column: 33, scope: !888)
!898 = !DILocation(line: 92, column: 54, scope: !888)
!899 = !DILocation(line: 92, column: 63, scope: !888)
!900 = !DILocation(line: 92, column: 49, scope: !888)
!901 = !DILocation(line: 92, column: 67, scope: !888)
!902 = !DILocation(line: 92, column: 76, scope: !888)
!903 = !DILocation(line: 92, column: 86, scope: !888)
!904 = !DILocation(line: 92, column: 95, scope: !888)
!905 = !DILocation(line: 92, column: 82, scope: !888)
!906 = !DILocation(line: 92, column: 99, scope: !888)
!907 = !DILocation(line: 92, column: 108, scope: !888)
!908 = !DILocation(line: 92, column: 80, scope: !888)
!909 = !DILocation(line: 93, column: 48, scope: !888)
!910 = !DILocation(line: 93, column: 43, scope: !888)
!911 = !DILocation(line: 93, column: 59, scope: !888)
!912 = !DILocation(line: 93, column: 68, scope: !888)
!913 = !DILocation(line: 93, column: 75, scope: !888)
!914 = !DILocation(line: 93, column: 73, scope: !888)
!915 = !DILocation(line: 94, column: 18, scope: !888)
!916 = !DILocation(line: 94, column: 27, scope: !888)
!917 = !DILocation(line: 94, column: 13, scope: !888)
!918 = !DILocation(line: 94, column: 31, scope: !888)
!919 = !DILocation(line: 94, column: 45, scope: !888)
!920 = !DILocation(line: 94, column: 43, scope: !888)
!921 = !DILocation(line: 92, column: 40, scope: !888)
!922 = !DILocation(line: 92, column: 16, scope: !888)
!923 = !DILocation(line: 92, column: 11, scope: !888)
!924 = !DILocation(line: 92, column: 27, scope: !888)
!925 = !DILocation(line: 92, column: 38, scope: !888)
!926 = !DILocation(line: 96, column: 4, scope: !888)
!927 = !DILocation(line: 98, column: 4, scope: !883)
!928 = !DILocation(line: 99, column: 3, scope: !883)
!929 = !DILocation(line: 85, column: 41, scope: !930)
!930 = !DILexicalBlockFile(scope: !878, file: !2, discriminator: 2)
!931 = !DILocation(line: 85, column: 2, scope: !930)
!932 = distinct !{!932, !933}
!933 = !DILocation(line: 85, column: 2, scope: !1)
!934 = !DILocalVariable(name: "ty", scope: !935, file: !2, line: 101, type: !6)
!935 = distinct !DILexicalBlock(scope: !1, file: !2, line: 101, column: 3)
!936 = !DILocation(line: 101, column: 13, scope: !935)
!937 = !DILocation(line: 101, column: 9, scope: !935)
!938 = !DILocation(line: 101, column: 22, scope: !939)
!939 = !DILexicalBlockFile(scope: !940, file: !2, discriminator: 1)
!940 = distinct !DILexicalBlock(scope: !935, file: !2, line: 101, column: 3)
!941 = !DILocation(line: 101, column: 25, scope: !939)
!942 = !DILocation(line: 101, column: 3, scope: !939)
!943 = !DILocation(line: 102, column: 41, scope: !940)
!944 = !DILocation(line: 102, column: 43, scope: !940)
!945 = !DILocation(line: 102, column: 36, scope: !940)
!946 = !DILocation(line: 102, column: 47, scope: !940)
!947 = !DILocation(line: 102, column: 49, scope: !940)
!948 = !DILocation(line: 102, column: 3, scope: !940)
!949 = !DILocation(line: 102, column: 15, scope: !940)
!950 = !DILocation(line: 102, column: 23, scope: !940)
!951 = !DILocation(line: 102, column: 28, scope: !940)
!952 = !DILocation(line: 102, column: 26, scope: !940)
!953 = !DILocation(line: 102, column: 21, scope: !940)
!954 = !DILocation(line: 102, column: 34, scope: !940)
!955 = !DILocation(line: 101, column: 42, scope: !956)
!956 = !DILexicalBlockFile(scope: !940, file: !2, discriminator: 2)
!957 = !DILocation(line: 101, column: 3, scope: !956)
!958 = distinct !{!958, !959}
!959 = !DILocation(line: 101, column: 3, scope: !1)
!960 = !DILocation(line: 104, column: 1, scope: !1)
!961 = !DILocalVariable(name: "referrence", arg: 1, scope: !16, file: !2, line: 108, type: !5)
!962 = !DILocation(line: 108, column: 29, scope: !16)
!963 = !DILocalVariable(name: "matrix_cuda", arg: 2, scope: !16, file: !2, line: 109, type: !5)
!964 = !DILocation(line: 109, column: 11, scope: !16)
!965 = !DILocalVariable(name: "cols", arg: 3, scope: !16, file: !2, line: 111, type: !6)
!966 = !DILocation(line: 111, column: 10, scope: !16)
!967 = !DILocalVariable(name: "penalty", arg: 4, scope: !16, file: !2, line: 112, type: !6)
!968 = !DILocation(line: 112, column: 10, scope: !16)
!969 = !DILocalVariable(name: "i", arg: 5, scope: !16, file: !2, line: 113, type: !6)
!970 = !DILocation(line: 113, column: 10, scope: !16)
!971 = !DILocalVariable(name: "block_width", arg: 6, scope: !16, file: !2, line: 114, type: !6)
!972 = !DILocation(line: 114, column: 10, scope: !16)
!973 = !DILocalVariable(name: "bx", scope: !16, file: !2, line: 117, type: !6)
!974 = !DILocation(line: 117, column: 7, scope: !16)
!975 = !DILocation(line: 78, column: 3, scope: !635, inlinedAt: !976)
!976 = distinct !DILocation(line: 117, column: 12, scope: !16)
!977 = !DILocalVariable(name: "tx", scope: !16, file: !2, line: 118, type: !6)
!978 = !DILocation(line: 118, column: 7, scope: !16)
!979 = !DILocation(line: 67, column: 3, scope: !675, inlinedAt: !980)
!980 = distinct !DILocation(line: 118, column: 12, scope: !16)
!981 = !DILocalVariable(name: "b_index_x", scope: !16, file: !2, line: 120, type: !6)
!982 = !DILocation(line: 120, column: 7, scope: !16)
!983 = !DILocation(line: 120, column: 19, scope: !16)
!984 = !DILocation(line: 120, column: 24, scope: !16)
!985 = !DILocation(line: 120, column: 22, scope: !16)
!986 = !DILocation(line: 120, column: 38, scope: !16)
!987 = !DILocation(line: 120, column: 36, scope: !16)
!988 = !DILocalVariable(name: "b_index_y", scope: !16, file: !2, line: 121, type: !6)
!989 = !DILocation(line: 121, column: 7, scope: !16)
!990 = !DILocation(line: 121, column: 19, scope: !16)
!991 = !DILocation(line: 121, column: 33, scope: !16)
!992 = !DILocation(line: 121, column: 31, scope: !16)
!993 = !DILocation(line: 121, column: 36, scope: !16)
!994 = !DILocalVariable(name: "index", scope: !16, file: !2, line: 123, type: !6)
!995 = !DILocation(line: 123, column: 7, scope: !16)
!996 = !DILocation(line: 123, column: 17, scope: !16)
!997 = !DILocation(line: 123, column: 22, scope: !16)
!998 = !DILocation(line: 123, column: 37, scope: !16)
!999 = !DILocation(line: 123, column: 35, scope: !16)
!1000 = !DILocation(line: 123, column: 62, scope: !16)
!1001 = !DILocation(line: 123, column: 60, scope: !16)
!1002 = !DILocation(line: 123, column: 47, scope: !16)
!1003 = !DILocation(line: 123, column: 74, scope: !16)
!1004 = !DILocation(line: 123, column: 72, scope: !16)
!1005 = !DILocation(line: 123, column: 81, scope: !16)
!1006 = !DILocation(line: 123, column: 86, scope: !16)
!1007 = !DILocation(line: 123, column: 77, scope: !16)
!1008 = !DILocalVariable(name: "index_n", scope: !16, file: !2, line: 124, type: !6)
!1009 = !DILocation(line: 124, column: 7, scope: !16)
!1010 = !DILocation(line: 124, column: 19, scope: !16)
!1011 = !DILocation(line: 124, column: 24, scope: !16)
!1012 = !DILocation(line: 124, column: 39, scope: !16)
!1013 = !DILocation(line: 124, column: 37, scope: !16)
!1014 = !DILocation(line: 124, column: 64, scope: !16)
!1015 = !DILocation(line: 124, column: 62, scope: !16)
!1016 = !DILocation(line: 124, column: 49, scope: !16)
!1017 = !DILocation(line: 124, column: 76, scope: !16)
!1018 = !DILocation(line: 124, column: 74, scope: !16)
!1019 = !DILocation(line: 124, column: 79, scope: !16)
!1020 = !DILocalVariable(name: "index_w", scope: !16, file: !2, line: 125, type: !6)
!1021 = !DILocation(line: 125, column: 7, scope: !16)
!1022 = !DILocation(line: 125, column: 19, scope: !16)
!1023 = !DILocation(line: 125, column: 24, scope: !16)
!1024 = !DILocation(line: 125, column: 39, scope: !16)
!1025 = !DILocation(line: 125, column: 37, scope: !16)
!1026 = !DILocation(line: 125, column: 64, scope: !16)
!1027 = !DILocation(line: 125, column: 62, scope: !16)
!1028 = !DILocation(line: 125, column: 49, scope: !16)
!1029 = !DILocation(line: 125, column: 78, scope: !16)
!1030 = !DILocation(line: 125, column: 74, scope: !16)
!1031 = !DILocalVariable(name: "index_nw", scope: !16, file: !2, line: 126, type: !6)
!1032 = !DILocation(line: 126, column: 9, scope: !16)
!1033 = !DILocation(line: 126, column: 21, scope: !16)
!1034 = !DILocation(line: 126, column: 26, scope: !16)
!1035 = !DILocation(line: 126, column: 41, scope: !16)
!1036 = !DILocation(line: 126, column: 39, scope: !16)
!1037 = !DILocation(line: 126, column: 66, scope: !16)
!1038 = !DILocation(line: 126, column: 64, scope: !16)
!1039 = !DILocation(line: 126, column: 51, scope: !16)
!1040 = !DILocalVariable(name: "ty", scope: !1041, file: !2, line: 131, type: !6)
!1041 = distinct !DILexicalBlock(scope: !16, file: !2, line: 131, column: 3)
!1042 = !DILocation(line: 131, column: 13, scope: !1041)
!1043 = !DILocation(line: 131, column: 9, scope: !1041)
!1044 = !DILocation(line: 131, column: 22, scope: !1045)
!1045 = !DILexicalBlockFile(scope: !1046, file: !2, discriminator: 1)
!1046 = distinct !DILexicalBlock(scope: !1041, file: !2, line: 131, column: 3)
!1047 = !DILocation(line: 131, column: 25, scope: !1045)
!1048 = !DILocation(line: 131, column: 3, scope: !1045)
!1049 = !DILocation(line: 132, column: 17, scope: !1046)
!1050 = !DILocation(line: 132, column: 28, scope: !1046)
!1051 = !DILocation(line: 132, column: 36, scope: !1046)
!1052 = !DILocation(line: 132, column: 43, scope: !1046)
!1053 = !DILocation(line: 132, column: 41, scope: !1046)
!1054 = !DILocation(line: 132, column: 34, scope: !1046)
!1055 = !DILocation(line: 132, column: 7, scope: !1046)
!1056 = !DILocation(line: 132, column: 3, scope: !1046)
!1057 = !DILocation(line: 132, column: 11, scope: !1046)
!1058 = !DILocation(line: 132, column: 15, scope: !1046)
!1059 = !DILocation(line: 131, column: 42, scope: !1060)
!1060 = !DILexicalBlockFile(scope: !1046, file: !2, discriminator: 2)
!1061 = !DILocation(line: 131, column: 3, scope: !1060)
!1062 = distinct !{!1062, !1063}
!1063 = !DILocation(line: 131, column: 3, scope: !16)
!1064 = !DILocation(line: 134, column: 3, scope: !16)
!1065 = !DILocation(line: 136, column: 8, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !16, file: !2, line: 136, column: 8)
!1067 = !DILocation(line: 136, column: 11, scope: !1066)
!1068 = !DILocation(line: 136, column: 8, scope: !16)
!1069 = !DILocation(line: 137, column: 19, scope: !1066)
!1070 = !DILocation(line: 137, column: 31, scope: !1066)
!1071 = !DILocation(line: 137, column: 10, scope: !1066)
!1072 = !DILocation(line: 137, column: 5, scope: !1066)
!1073 = !DILocation(line: 137, column: 17, scope: !1066)
!1074 = !DILocation(line: 140, column: 21, scope: !16)
!1075 = !DILocation(line: 140, column: 33, scope: !16)
!1076 = !DILocation(line: 140, column: 43, scope: !16)
!1077 = !DILocation(line: 140, column: 50, scope: !16)
!1078 = !DILocation(line: 140, column: 48, scope: !16)
!1079 = !DILocation(line: 140, column: 41, scope: !16)
!1080 = !DILocation(line: 140, column: 8, scope: !16)
!1081 = !DILocation(line: 140, column: 11, scope: !16)
!1082 = !DILocation(line: 140, column: 3, scope: !16)
!1083 = !DILocation(line: 140, column: 19, scope: !16)
!1084 = !DILocation(line: 142, column: 3, scope: !16)
!1085 = !DILocation(line: 144, column: 21, scope: !16)
!1086 = !DILocation(line: 144, column: 33, scope: !16)
!1087 = !DILocation(line: 144, column: 11, scope: !16)
!1088 = !DILocation(line: 144, column: 14, scope: !16)
!1089 = !DILocation(line: 144, column: 3, scope: !16)
!1090 = !DILocation(line: 144, column: 19, scope: !16)
!1091 = !DILocation(line: 146, column: 3, scope: !16)
!1092 = !DILocalVariable(name: "m", scope: !1093, file: !2, line: 149, type: !6)
!1093 = distinct !DILexicalBlock(scope: !16, file: !2, line: 149, column: 3)
!1094 = !DILocation(line: 149, column: 12, scope: !1093)
!1095 = !DILocation(line: 149, column: 8, scope: !1093)
!1096 = !DILocation(line: 149, column: 20, scope: !1097)
!1097 = !DILexicalBlockFile(scope: !1098, file: !2, discriminator: 1)
!1098 = distinct !DILexicalBlock(scope: !1093, file: !2, line: 149, column: 3)
!1099 = !DILocation(line: 149, column: 22, scope: !1097)
!1100 = !DILocation(line: 149, column: 3, scope: !1097)
!1101 = !DILocation(line: 151, column: 9, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1103, file: !2, line: 151, column: 9)
!1103 = distinct !DILexicalBlock(scope: !1098, file: !2, line: 149, column: 41)
!1104 = !DILocation(line: 151, column: 15, scope: !1102)
!1105 = !DILocation(line: 151, column: 12, scope: !1102)
!1106 = !DILocation(line: 151, column: 9, scope: !1103)
!1107 = !DILocalVariable(name: "t_index_x", scope: !1108, file: !2, line: 153, type: !6)
!1108 = distinct !DILexicalBlock(scope: !1102, file: !2, line: 151, column: 18)
!1109 = !DILocation(line: 153, column: 9, scope: !1108)
!1110 = !DILocation(line: 153, column: 22, scope: !1108)
!1111 = !DILocation(line: 153, column: 25, scope: !1108)
!1112 = !DILocalVariable(name: "t_index_y", scope: !1108, file: !2, line: 154, type: !6)
!1113 = !DILocation(line: 154, column: 9, scope: !1108)
!1114 = !DILocation(line: 154, column: 22, scope: !1108)
!1115 = !DILocation(line: 154, column: 26, scope: !1108)
!1116 = !DILocation(line: 154, column: 24, scope: !1108)
!1117 = !DILocation(line: 154, column: 29, scope: !1108)
!1118 = !DILocation(line: 156, column: 54, scope: !1108)
!1119 = !DILocation(line: 156, column: 63, scope: !1108)
!1120 = !DILocation(line: 156, column: 49, scope: !1108)
!1121 = !DILocation(line: 156, column: 67, scope: !1108)
!1122 = !DILocation(line: 156, column: 76, scope: !1108)
!1123 = !DILocation(line: 156, column: 86, scope: !1108)
!1124 = !DILocation(line: 156, column: 95, scope: !1108)
!1125 = !DILocation(line: 156, column: 82, scope: !1108)
!1126 = !DILocation(line: 156, column: 99, scope: !1108)
!1127 = !DILocation(line: 156, column: 108, scope: !1108)
!1128 = !DILocation(line: 156, column: 80, scope: !1108)
!1129 = !DILocation(line: 157, column: 48, scope: !1108)
!1130 = !DILocation(line: 157, column: 43, scope: !1108)
!1131 = !DILocation(line: 157, column: 59, scope: !1108)
!1132 = !DILocation(line: 157, column: 68, scope: !1108)
!1133 = !DILocation(line: 157, column: 75, scope: !1108)
!1134 = !DILocation(line: 157, column: 73, scope: !1108)
!1135 = !DILocation(line: 158, column: 18, scope: !1108)
!1136 = !DILocation(line: 158, column: 27, scope: !1108)
!1137 = !DILocation(line: 158, column: 13, scope: !1108)
!1138 = !DILocation(line: 158, column: 31, scope: !1108)
!1139 = !DILocation(line: 158, column: 45, scope: !1108)
!1140 = !DILocation(line: 158, column: 43, scope: !1108)
!1141 = !DILocation(line: 156, column: 40, scope: !1108)
!1142 = !DILocation(line: 156, column: 16, scope: !1108)
!1143 = !DILocation(line: 156, column: 11, scope: !1108)
!1144 = !DILocation(line: 156, column: 27, scope: !1108)
!1145 = !DILocation(line: 156, column: 38, scope: !1108)
!1146 = !DILocation(line: 160, column: 4, scope: !1108)
!1147 = !DILocation(line: 162, column: 4, scope: !1103)
!1148 = !DILocation(line: 164, column: 5, scope: !1103)
!1149 = !DILocation(line: 149, column: 38, scope: !1150)
!1150 = !DILexicalBlockFile(scope: !1098, file: !2, discriminator: 2)
!1151 = !DILocation(line: 149, column: 3, scope: !1150)
!1152 = distinct !{!1152, !1153}
!1153 = !DILocation(line: 149, column: 3, scope: !16)
!1154 = !DILocalVariable(name: "m", scope: !1155, file: !2, line: 167, type: !6)
!1155 = distinct !DILexicalBlock(scope: !16, file: !2, line: 167, column: 2)
!1156 = !DILocation(line: 167, column: 11, scope: !1155)
!1157 = !DILocation(line: 167, column: 7, scope: !1155)
!1158 = !DILocation(line: 167, column: 32, scope: !1159)
!1159 = !DILexicalBlockFile(scope: !1160, file: !2, discriminator: 1)
!1160 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 167, column: 2)
!1161 = !DILocation(line: 167, column: 34, scope: !1159)
!1162 = !DILocation(line: 167, column: 2, scope: !1159)
!1163 = !DILocation(line: 169, column: 9, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1165, file: !2, line: 169, column: 9)
!1165 = distinct !DILexicalBlock(scope: !1160, file: !2, line: 167, column: 44)
!1166 = !DILocation(line: 169, column: 15, scope: !1164)
!1167 = !DILocation(line: 169, column: 12, scope: !1164)
!1168 = !DILocation(line: 169, column: 9, scope: !1165)
!1169 = !DILocalVariable(name: "t_index_x", scope: !1170, file: !2, line: 171, type: !6)
!1170 = distinct !DILexicalBlock(scope: !1164, file: !2, line: 169, column: 17)
!1171 = !DILocation(line: 171, column: 9, scope: !1170)
!1172 = !DILocation(line: 171, column: 22, scope: !1170)
!1173 = !DILocation(line: 171, column: 25, scope: !1170)
!1174 = !DILocation(line: 171, column: 40, scope: !1170)
!1175 = !DILocation(line: 171, column: 38, scope: !1170)
!1176 = !DILocalVariable(name: "t_index_y", scope: !1170, file: !2, line: 172, type: !6)
!1177 = !DILocation(line: 172, column: 9, scope: !1170)
!1178 = !DILocation(line: 172, column: 35, scope: !1170)
!1179 = !DILocation(line: 172, column: 33, scope: !1170)
!1180 = !DILocation(line: 174, column: 54, scope: !1170)
!1181 = !DILocation(line: 174, column: 63, scope: !1170)
!1182 = !DILocation(line: 174, column: 49, scope: !1170)
!1183 = !DILocation(line: 174, column: 67, scope: !1170)
!1184 = !DILocation(line: 174, column: 76, scope: !1170)
!1185 = !DILocation(line: 174, column: 86, scope: !1170)
!1186 = !DILocation(line: 174, column: 95, scope: !1170)
!1187 = !DILocation(line: 174, column: 82, scope: !1170)
!1188 = !DILocation(line: 174, column: 99, scope: !1170)
!1189 = !DILocation(line: 174, column: 108, scope: !1170)
!1190 = !DILocation(line: 174, column: 80, scope: !1170)
!1191 = !DILocation(line: 175, column: 48, scope: !1170)
!1192 = !DILocation(line: 175, column: 43, scope: !1170)
!1193 = !DILocation(line: 175, column: 59, scope: !1170)
!1194 = !DILocation(line: 175, column: 68, scope: !1170)
!1195 = !DILocation(line: 175, column: 75, scope: !1170)
!1196 = !DILocation(line: 175, column: 73, scope: !1170)
!1197 = !DILocation(line: 176, column: 18, scope: !1170)
!1198 = !DILocation(line: 176, column: 27, scope: !1170)
!1199 = !DILocation(line: 176, column: 13, scope: !1170)
!1200 = !DILocation(line: 176, column: 31, scope: !1170)
!1201 = !DILocation(line: 176, column: 45, scope: !1170)
!1202 = !DILocation(line: 176, column: 43, scope: !1170)
!1203 = !DILocation(line: 174, column: 40, scope: !1170)
!1204 = !DILocation(line: 174, column: 16, scope: !1170)
!1205 = !DILocation(line: 174, column: 11, scope: !1170)
!1206 = !DILocation(line: 174, column: 27, scope: !1170)
!1207 = !DILocation(line: 174, column: 38, scope: !1170)
!1208 = !DILocation(line: 179, column: 4, scope: !1170)
!1209 = !DILocation(line: 181, column: 4, scope: !1165)
!1210 = !DILocation(line: 182, column: 3, scope: !1165)
!1211 = !DILocation(line: 167, column: 41, scope: !1212)
!1212 = !DILexicalBlockFile(scope: !1160, file: !2, discriminator: 2)
!1213 = !DILocation(line: 167, column: 2, scope: !1212)
!1214 = distinct !{!1214, !1215}
!1215 = !DILocation(line: 167, column: 2, scope: !16)
!1216 = !DILocalVariable(name: "ty", scope: !1217, file: !2, line: 185, type: !6)
!1217 = distinct !DILexicalBlock(scope: !16, file: !2, line: 185, column: 3)
!1218 = !DILocation(line: 185, column: 13, scope: !1217)
!1219 = !DILocation(line: 185, column: 9, scope: !1217)
!1220 = !DILocation(line: 185, column: 22, scope: !1221)
!1221 = !DILexicalBlockFile(scope: !1222, file: !2, discriminator: 1)
!1222 = distinct !DILexicalBlock(scope: !1217, file: !2, line: 185, column: 3)
!1223 = !DILocation(line: 185, column: 25, scope: !1221)
!1224 = !DILocation(line: 185, column: 3, scope: !1221)
!1225 = !DILocation(line: 186, column: 41, scope: !1222)
!1226 = !DILocation(line: 186, column: 43, scope: !1222)
!1227 = !DILocation(line: 186, column: 36, scope: !1222)
!1228 = !DILocation(line: 186, column: 47, scope: !1222)
!1229 = !DILocation(line: 186, column: 49, scope: !1222)
!1230 = !DILocation(line: 186, column: 3, scope: !1222)
!1231 = !DILocation(line: 186, column: 15, scope: !1222)
!1232 = !DILocation(line: 186, column: 23, scope: !1222)
!1233 = !DILocation(line: 186, column: 28, scope: !1222)
!1234 = !DILocation(line: 186, column: 26, scope: !1222)
!1235 = !DILocation(line: 186, column: 21, scope: !1222)
!1236 = !DILocation(line: 186, column: 34, scope: !1222)
!1237 = !DILocation(line: 185, column: 42, scope: !1238)
!1238 = !DILexicalBlockFile(scope: !1222, file: !2, discriminator: 2)
!1239 = !DILocation(line: 185, column: 3, scope: !1238)
!1240 = distinct !{!1240, !1241}
!1241 = !DILocation(line: 185, column: 3, scope: !16)
!1242 = !DILocation(line: 188, column: 1, scope: !16)
