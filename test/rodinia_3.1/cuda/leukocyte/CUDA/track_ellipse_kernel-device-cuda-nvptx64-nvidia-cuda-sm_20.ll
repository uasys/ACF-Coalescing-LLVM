; ModuleID = 'track_ellipse_kernel.cu'
source_filename = "track_ellipse_kernel.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF = internal addrspace(3) global [3321 x float] zeroinitializer, align 4, !dbg !0
@_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer = internal addrspace(3) global [320 x float] zeroinitializer, align 4, !dbg !14
@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE14cell_converged = internal addrspace(3) global i32 0, align 4, !dbg !21
@"$str" = private addrspace(1) constant [11 x i8] c"__CUDA_FTZ\00"

; Function Attrs: convergent nounwind
define float @_Z9heavisidef(float %x) #0 !dbg !592 {
entry:
  %a.addr.i.i = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %a.addr.i.i, metadata !593, metadata !594), !dbg !595
  %__x.addr.i = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %__x.addr.i, metadata !598, metadata !594), !dbg !599
  %x.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  call void @llvm.dbg.declare(metadata float* %x.addr, metadata !600, metadata !594), !dbg !601
  %0 = load float, float* %x.addr, align 4, !dbg !602
  store float %0, float* %__x.addr.i, align 4, !dbg !603
  %1 = load float, float* %__x.addr.i, align 4, !dbg !604
  store float %1, float* %a.addr.i.i, align 4, !dbg !605
  %2 = load float, float* %a.addr.i.i, align 4, !dbg !606
  %3 = call float @llvm.nvvm.fabs.f(float %2) #3, !dbg !607
  %4 = fcmp ogt float %3, 1.000000e+00, !dbg !607
  br i1 %4, label %5, label %7, !dbg !607

; <label>:5:                                      ; preds = %entry
  %6 = fdiv float 1.000000e+00, %3, !dbg !607
  br label %7, !dbg !607

; <label>:7:                                      ; preds = %5, %entry
  %t1.0.i.i.i = phi float [ %6, %5 ], [ %3, %entry ], !dbg !607
  %8 = call float @llvm.nvvm.mul.rn.f(float %t1.0.i.i.i, float %t1.0.i.i.i) #3, !dbg !607
  %9 = call float @llvm.nvvm.fma.rn.f(float %8, float 0xBFEA58FD40000000, float 0xC016B31060000000) #3, !dbg !607
  %10 = call float @llvm.nvvm.fma.rn.f(float %9, float %8, float 0xC01A4320E0000000) #3, !dbg !607
  %11 = fmul float %10, %8, !dbg !607
  %12 = fmul float %11, %t1.0.i.i.i, !dbg !607
  %13 = fadd float %8, 0x4026ABB800000000, !dbg !607
  %14 = call float @llvm.nvvm.fma.rn.f(float %13, float %8, float 0x403CD7AC00000000) #3, !dbg !607
  %15 = call float @llvm.nvvm.fma.rn.f(float %14, float %8, float 0x4033B25900000000) #3, !dbg !607
  %16 = fdiv float 1.000000e+00, %15, !dbg !607
  %17 = call float @llvm.nvvm.fma.rn.f(float %12, float %16, float %t1.0.i.i.i) #3, !dbg !607
  %18 = fcmp ogt float %3, 1.000000e+00, !dbg !607
  br i1 %18, label %19, label %21, !dbg !607

; <label>:19:                                     ; preds = %7
  %20 = fsub float 0x3FF921FB60000000, %17, !dbg !607
  br label %21, !dbg !607

; <label>:21:                                     ; preds = %19, %7
  %t1.1.i.i.i = phi float [ %20, %19 ], [ %17, %7 ], !dbg !607
  %22 = fcmp ole float %3, 0x7FF0000000000000, !dbg !607
  br i1 %22, label %23, label %_ZL4atanf.exit, !dbg !607

; <label>:23:                                     ; preds = %21
  %24 = bitcast float %t1.1.i.i.i to i32, !dbg !607
  %25 = bitcast float %2 to i32, !dbg !607
  %26 = and i32 %25, -2147483648, !dbg !607
  %27 = or i32 %24, %26, !dbg !607
  %28 = bitcast i32 %27 to float, !dbg !607
  br label %_ZL4atanf.exit, !dbg !607

_ZL4atanf.exit:                                   ; preds = %21, %23
  %t1.2.i.i.i = phi float [ %28, %23 ], [ %t1.1.i.i.i, %21 ], !dbg !607
  %conv = fpext float %t1.2.i.i.i to double, !dbg !603
  %mul = fmul double %conv, 0x3FD45F318E7ADAF5, !dbg !608
  %add = fadd double %mul, 5.000000e-01, !dbg !609
  %conv1 = fptrunc double %add to float, !dbg !610
  ret float %conv1, !dbg !611
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
define void @_Z12IMGVF_kernelPPfS0_PiS1_fffif(float** %IMGVF_array, float** %I_array, i32* %m_array, i32* %n_array, float %vx, float %vy, float %e, i32 %max_iterations, float %cutoff) #0 !dbg !1 {
entry:
  %f.addr.i.i = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %f.addr.i.i, metadata !612, metadata !594), !dbg !613
  %__x.addr.i = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %__x.addr.i, metadata !620, metadata !594), !dbg !621
  %IMGVF_array.addr = alloca float**, align 8
  %I_array.addr = alloca float**, align 8
  %m_array.addr = alloca i32*, align 8
  %n_array.addr = alloca i32*, align 8
  %vx.addr = alloca float, align 4
  %vy.addr = alloca float, align 4
  %e.addr = alloca float, align 4
  %max_iterations.addr = alloca i32, align 4
  %cutoff.addr = alloca float, align 4
  %cell_num = alloca i32, align 4
  %IMGVF_global = alloca float*, align 8
  %I = alloca float*, align 8
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %max = alloca i32, align 4
  %thread_id = alloca i32, align 4
  %thread_block = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %offset = alloca i32, align 4
  %one_nth = alloca float, align 4
  %tid_mod = alloca i32, align 4
  %tbsize_mod = alloca i32, align 4
  %one_over_e = alloca float, align 4
  %iterations = alloca i32, align 4
  %total_diff = alloca float, align 4
  %old_i = alloca i32, align 4
  %old_j = alloca i32, align 4
  %offset36 = alloca i32, align 4
  %new_val = alloca float, align 4
  %old_val = alloca float, align 4
  %rowU = alloca i32, align 4
  %rowD = alloca i32, align 4
  %colL = alloca i32, align 4
  %colR = alloca i32, align 4
  %U = alloca float, align 4
  %D = alloca float, align 4
  %L = alloca float, align 4
  %R = alloca float, align 4
  %UR = alloca float, align 4
  %DR = alloca float, align 4
  %UL = alloca float, align 4
  %DL = alloca float, align 4
  %UHe = alloca float, align 4
  %DHe = alloca float, align 4
  %LHe = alloca float, align 4
  %RHe = alloca float, align 4
  %URHe = alloca float, align 4
  %DRHe = alloca float, align 4
  %ULHe = alloca float, align 4
  %DLHe = alloca float, align 4
  %vI = alloca float, align 4
  %th = alloca i32, align 4
  %mean = alloca float, align 4
  %offset256 = alloca i32, align 4
  store float** %IMGVF_array, float*** %IMGVF_array.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %IMGVF_array.addr, metadata !622, metadata !594), !dbg !623
  store float** %I_array, float*** %I_array.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %I_array.addr, metadata !624, metadata !594), !dbg !625
  store i32* %m_array, i32** %m_array.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %m_array.addr, metadata !626, metadata !594), !dbg !627
  store i32* %n_array, i32** %n_array.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n_array.addr, metadata !628, metadata !594), !dbg !629
  store float %vx, float* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata float* %vx.addr, metadata !630, metadata !594), !dbg !631
  store float %vy, float* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata float* %vy.addr, metadata !632, metadata !594), !dbg !633
  store float %e, float* %e.addr, align 4
  call void @llvm.dbg.declare(metadata float* %e.addr, metadata !634, metadata !594), !dbg !635
  store i32 %max_iterations, i32* %max_iterations.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_iterations.addr, metadata !636, metadata !594), !dbg !637
  store float %cutoff, float* %cutoff.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cutoff.addr, metadata !638, metadata !594), !dbg !639
  call void @llvm.dbg.declare(metadata i32* %cell_num, metadata !640, metadata !594), !dbg !641
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !642, !range !679
  store i32 %0, i32* %cell_num, align 4, !dbg !641
  call void @llvm.dbg.declare(metadata float** %IMGVF_global, metadata !680, metadata !594), !dbg !681
  %1 = load float**, float*** %IMGVF_array.addr, align 8, !dbg !682
  %2 = load i32, i32* %cell_num, align 4, !dbg !683
  %idxprom = sext i32 %2 to i64, !dbg !682
  %arrayidx = getelementptr inbounds float*, float** %1, i64 %idxprom, !dbg !682
  %3 = load float*, float** %arrayidx, align 8, !dbg !682
  store float* %3, float** %IMGVF_global, align 8, !dbg !681
  call void @llvm.dbg.declare(metadata float** %I, metadata !684, metadata !594), !dbg !685
  %4 = load float**, float*** %I_array.addr, align 8, !dbg !686
  %5 = load i32, i32* %cell_num, align 4, !dbg !687
  %idxprom1 = sext i32 %5 to i64, !dbg !686
  %arrayidx2 = getelementptr inbounds float*, float** %4, i64 %idxprom1, !dbg !686
  %6 = load float*, float** %arrayidx2, align 8, !dbg !686
  store float* %6, float** %I, align 8, !dbg !685
  call void @llvm.dbg.declare(metadata i32* %m, metadata !688, metadata !594), !dbg !689
  %7 = load i32*, i32** %m_array.addr, align 8, !dbg !690
  %8 = load i32, i32* %cell_num, align 4, !dbg !691
  %idxprom3 = sext i32 %8 to i64, !dbg !690
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %idxprom3, !dbg !690
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !690
  store i32 %9, i32* %m, align 4, !dbg !689
  call void @llvm.dbg.declare(metadata i32* %n, metadata !692, metadata !594), !dbg !693
  %10 = load i32*, i32** %n_array.addr, align 8, !dbg !694
  %11 = load i32, i32* %cell_num, align 4, !dbg !695
  %idxprom5 = sext i32 %11 to i64, !dbg !694
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %idxprom5, !dbg !694
  %12 = load i32, i32* %arrayidx6, align 4, !dbg !694
  store i32 %12, i32* %n, align 4, !dbg !693
  call void @llvm.dbg.declare(metadata i32* %max, metadata !696, metadata !594), !dbg !697
  %13 = load i32, i32* %m, align 4, !dbg !698
  %14 = load i32, i32* %n, align 4, !dbg !699
  %mul = mul nsw i32 %13, %14, !dbg !700
  %add = add nsw i32 %mul, 320, !dbg !701
  %sub = sub nsw i32 %add, 1, !dbg !702
  %div = sdiv i32 %sub, 320, !dbg !703
  store i32 %div, i32* %max, align 4, !dbg !697
  call void @llvm.dbg.declare(metadata i32* %thread_id, metadata !704, metadata !594), !dbg !705
  %15 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !706, !range !734
  store i32 %15, i32* %thread_id, align 4, !dbg !705
  call void @llvm.dbg.declare(metadata i32* %thread_block, metadata !735, metadata !594), !dbg !736
  call void @llvm.dbg.declare(metadata i32* %i, metadata !737, metadata !594), !dbg !738
  call void @llvm.dbg.declare(metadata i32* %j, metadata !739, metadata !594), !dbg !740
  store i32 0, i32* %thread_block, align 4, !dbg !741
  br label %for.cond, !dbg !743

for.cond:                                         ; preds = %for.inc, %entry
  %16 = load i32, i32* %thread_block, align 4, !dbg !744
  %17 = load i32, i32* %max, align 4, !dbg !747
  %cmp = icmp slt i32 %16, %17, !dbg !748
  br i1 %cmp, label %for.body, label %for.end, !dbg !749

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !750, metadata !594), !dbg !752
  %18 = load i32, i32* %thread_block, align 4, !dbg !753
  %mul8 = mul nsw i32 %18, 320, !dbg !754
  store i32 %mul8, i32* %offset, align 4, !dbg !752
  %19 = load i32, i32* %thread_id, align 4, !dbg !755
  %20 = load i32, i32* %offset, align 4, !dbg !756
  %add9 = add nsw i32 %19, %20, !dbg !757
  %21 = load i32, i32* %n, align 4, !dbg !758
  %div10 = sdiv i32 %add9, %21, !dbg !759
  store i32 %div10, i32* %i, align 4, !dbg !760
  %22 = load i32, i32* %thread_id, align 4, !dbg !761
  %23 = load i32, i32* %offset, align 4, !dbg !762
  %add11 = add nsw i32 %22, %23, !dbg !763
  %24 = load i32, i32* %n, align 4, !dbg !764
  %rem = srem i32 %add11, %24, !dbg !765
  store i32 %rem, i32* %j, align 4, !dbg !766
  %25 = load i32, i32* %i, align 4, !dbg !767
  %26 = load i32, i32* %m, align 4, !dbg !769
  %cmp12 = icmp slt i32 %25, %26, !dbg !770
  br i1 %cmp12, label %if.then, label %if.end, !dbg !771

if.then:                                          ; preds = %for.body
  %27 = load float*, float** %IMGVF_global, align 8, !dbg !772
  %28 = load i32, i32* %i, align 4, !dbg !774
  %29 = load i32, i32* %n, align 4, !dbg !775
  %mul13 = mul nsw i32 %28, %29, !dbg !776
  %30 = load i32, i32* %j, align 4, !dbg !777
  %add14 = add nsw i32 %mul13, %30, !dbg !778
  %idxprom15 = sext i32 %add14 to i64, !dbg !772
  %arrayidx16 = getelementptr inbounds float, float* %27, i64 %idxprom15, !dbg !772
  %31 = load float, float* %arrayidx16, align 4, !dbg !772
  %32 = load i32, i32* %i, align 4, !dbg !779
  %33 = load i32, i32* %n, align 4, !dbg !780
  %mul17 = mul nsw i32 %32, %33, !dbg !781
  %34 = load i32, i32* %j, align 4, !dbg !782
  %add18 = add nsw i32 %mul17, %34, !dbg !783
  %idxprom19 = sext i32 %add18 to i64, !dbg !784
  %arrayidx20 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom19, !dbg !784
  store float %31, float* %arrayidx20, align 4, !dbg !785
  br label %if.end, !dbg !784

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !786

for.inc:                                          ; preds = %if.end
  %35 = load i32, i32* %thread_block, align 4, !dbg !787
  %inc = add nsw i32 %35, 1, !dbg !787
  store i32 %inc, i32* %thread_block, align 4, !dbg !787
  br label %for.cond, !dbg !789, !llvm.loop !790

for.end:                                          ; preds = %for.cond
  call void @llvm.nvvm.barrier0(), !dbg !792
  %36 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !793, !range !734
  %cmp22 = icmp eq i32 %36, 0, !dbg !796
  br i1 %cmp22, label %if.then23, label %if.end24, !dbg !797

if.then23:                                        ; preds = %for.end
  store i32 0, i32* addrspacecast (i32 addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE14cell_converged to i32*), align 4, !dbg !798
  br label %if.end24, !dbg !800

if.end24:                                         ; preds = %if.then23, %for.end
  call void @llvm.nvvm.barrier0(), !dbg !801
  call void @llvm.dbg.declare(metadata float* %one_nth, metadata !802, metadata !594), !dbg !804
  %37 = load i32, i32* %n, align 4, !dbg !805
  %conv = sitofp i32 %37 to float, !dbg !805
  %div25 = fdiv float 1.000000e+00, %conv, !dbg !806
  store float %div25, float* %one_nth, align 4, !dbg !804
  call void @llvm.dbg.declare(metadata i32* %tid_mod, metadata !807, metadata !594), !dbg !808
  %38 = load i32, i32* %thread_id, align 4, !dbg !809
  %39 = load i32, i32* %n, align 4, !dbg !810
  %rem26 = srem i32 %38, %39, !dbg !811
  store i32 %rem26, i32* %tid_mod, align 4, !dbg !808
  call void @llvm.dbg.declare(metadata i32* %tbsize_mod, metadata !812, metadata !594), !dbg !813
  %40 = load i32, i32* %n, align 4, !dbg !814
  %rem27 = srem i32 320, %40, !dbg !815
  store i32 %rem27, i32* %tbsize_mod, align 4, !dbg !813
  call void @llvm.dbg.declare(metadata float* %one_over_e, metadata !816, metadata !594), !dbg !817
  %41 = load float, float* %e.addr, align 4, !dbg !818
  %conv28 = fpext float %41 to double, !dbg !818
  %div29 = fdiv double 1.000000e+00, %conv28, !dbg !819
  %conv30 = fptrunc double %div29 to float, !dbg !820
  store float %conv30, float* %one_over_e, align 4, !dbg !817
  call void @llvm.dbg.declare(metadata i32* %iterations, metadata !821, metadata !594), !dbg !822
  store i32 0, i32* %iterations, align 4, !dbg !822
  br label %while.cond, !dbg !823

while.cond:                                       ; preds = %if.end251, %if.end24
  %42 = load i32, i32* addrspacecast (i32 addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE14cell_converged to i32*), align 4, !dbg !824
  %tobool = icmp ne i32 %42, 0, !dbg !824
  br i1 %tobool, label %land.end, label %land.rhs, !dbg !826

land.rhs:                                         ; preds = %while.cond
  %43 = load i32, i32* %iterations, align 4, !dbg !827
  %44 = load i32, i32* %max_iterations.addr, align 4, !dbg !829
  %cmp31 = icmp slt i32 %43, %44, !dbg !830
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %45 = phi i1 [ false, %while.cond ], [ %cmp31, %land.rhs ]
  br i1 %45, label %while.body, label %while.end, !dbg !831

while.body:                                       ; preds = %land.end
  call void @llvm.dbg.declare(metadata float* %total_diff, metadata !833, metadata !594), !dbg !834
  store float 0.000000e+00, float* %total_diff, align 4, !dbg !834
  call void @llvm.dbg.declare(metadata i32* %old_i, metadata !835, metadata !594), !dbg !836
  store i32 0, i32* %old_i, align 4, !dbg !836
  call void @llvm.dbg.declare(metadata i32* %old_j, metadata !837, metadata !594), !dbg !838
  store i32 0, i32* %old_j, align 4, !dbg !838
  %46 = load i32, i32* %tid_mod, align 4, !dbg !839
  %47 = load i32, i32* %tbsize_mod, align 4, !dbg !840
  %sub32 = sub nsw i32 %46, %47, !dbg !841
  store i32 %sub32, i32* %j, align 4, !dbg !842
  store i32 0, i32* %thread_block, align 4, !dbg !843
  br label %for.cond33, !dbg !844

for.cond33:                                       ; preds = %for.inc212, %while.body
  %48 = load i32, i32* %thread_block, align 4, !dbg !845
  %49 = load i32, i32* %max, align 4, !dbg !847
  %cmp34 = icmp slt i32 %48, %49, !dbg !848
  br i1 %cmp34, label %for.body35, label %for.end214, !dbg !849

for.body35:                                       ; preds = %for.cond33
  %50 = load i32, i32* %i, align 4, !dbg !850
  store i32 %50, i32* %old_i, align 4, !dbg !851
  %51 = load i32, i32* %j, align 4, !dbg !852
  store i32 %51, i32* %old_j, align 4, !dbg !853
  call void @llvm.dbg.declare(metadata i32* %offset36, metadata !854, metadata !594), !dbg !855
  %52 = load i32, i32* %thread_block, align 4, !dbg !856
  %mul37 = mul nsw i32 %52, 320, !dbg !857
  store i32 %mul37, i32* %offset36, align 4, !dbg !855
  %53 = load i32, i32* %thread_id, align 4, !dbg !858
  %54 = load i32, i32* %offset36, align 4, !dbg !859
  %add38 = add nsw i32 %53, %54, !dbg !860
  %conv39 = sitofp i32 %add38 to float, !dbg !861
  %55 = load float, float* %one_nth, align 4, !dbg !862
  %mul40 = fmul float %conv39, %55, !dbg !863
  %conv41 = fptosi float %mul40 to i32, !dbg !861
  store i32 %conv41, i32* %i, align 4, !dbg !864
  %56 = load i32, i32* %tbsize_mod, align 4, !dbg !865
  %57 = load i32, i32* %j, align 4, !dbg !866
  %add42 = add nsw i32 %57, %56, !dbg !866
  store i32 %add42, i32* %j, align 4, !dbg !866
  %58 = load i32, i32* %j, align 4, !dbg !867
  %59 = load i32, i32* %n, align 4, !dbg !869
  %cmp43 = icmp sge i32 %58, %59, !dbg !870
  br i1 %cmp43, label %if.then44, label %if.end46, !dbg !871

if.then44:                                        ; preds = %for.body35
  %60 = load i32, i32* %n, align 4, !dbg !872
  %61 = load i32, i32* %j, align 4, !dbg !874
  %sub45 = sub nsw i32 %61, %60, !dbg !874
  store i32 %sub45, i32* %j, align 4, !dbg !874
  br label %if.end46, !dbg !875

if.end46:                                         ; preds = %if.then44, %for.body35
  call void @llvm.dbg.declare(metadata float* %new_val, metadata !876, metadata !594), !dbg !877
  store float 0.000000e+00, float* %new_val, align 4, !dbg !877
  call void @llvm.dbg.declare(metadata float* %old_val, metadata !878, metadata !594), !dbg !879
  store float 0.000000e+00, float* %old_val, align 4, !dbg !879
  %62 = load i32, i32* %i, align 4, !dbg !880
  %63 = load i32, i32* %m, align 4, !dbg !882
  %cmp47 = icmp slt i32 %62, %63, !dbg !883
  br i1 %cmp47, label %if.then48, label %if.end181, !dbg !884

if.then48:                                        ; preds = %if.end46
  call void @llvm.dbg.declare(metadata i32* %rowU, metadata !885, metadata !594), !dbg !887
  %64 = load i32, i32* %i, align 4, !dbg !888
  %cmp49 = icmp eq i32 %64, 0, !dbg !889
  br i1 %cmp49, label %cond.true, label %cond.false, !dbg !890

cond.true:                                        ; preds = %if.then48
  br label %cond.end, !dbg !891

cond.false:                                       ; preds = %if.then48
  %65 = load i32, i32* %i, align 4, !dbg !893
  %sub50 = sub nsw i32 %65, 1, !dbg !895
  br label %cond.end, !dbg !896

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %sub50, %cond.false ], !dbg !897
  store i32 %cond, i32* %rowU, align 4, !dbg !899
  call void @llvm.dbg.declare(metadata i32* %rowD, metadata !900, metadata !594), !dbg !901
  %66 = load i32, i32* %i, align 4, !dbg !902
  %67 = load i32, i32* %m, align 4, !dbg !903
  %sub51 = sub nsw i32 %67, 1, !dbg !904
  %cmp52 = icmp eq i32 %66, %sub51, !dbg !905
  br i1 %cmp52, label %cond.true53, label %cond.false55, !dbg !906

cond.true53:                                      ; preds = %cond.end
  %68 = load i32, i32* %m, align 4, !dbg !907
  %sub54 = sub nsw i32 %68, 1, !dbg !908
  br label %cond.end57, !dbg !909

cond.false55:                                     ; preds = %cond.end
  %69 = load i32, i32* %i, align 4, !dbg !910
  %add56 = add nsw i32 %69, 1, !dbg !911
  br label %cond.end57, !dbg !912

cond.end57:                                       ; preds = %cond.false55, %cond.true53
  %cond58 = phi i32 [ %sub54, %cond.true53 ], [ %add56, %cond.false55 ], !dbg !913
  store i32 %cond58, i32* %rowD, align 4, !dbg !914
  call void @llvm.dbg.declare(metadata i32* %colL, metadata !915, metadata !594), !dbg !916
  %70 = load i32, i32* %j, align 4, !dbg !917
  %cmp59 = icmp eq i32 %70, 0, !dbg !918
  br i1 %cmp59, label %cond.true60, label %cond.false61, !dbg !919

cond.true60:                                      ; preds = %cond.end57
  br label %cond.end63, !dbg !920

cond.false61:                                     ; preds = %cond.end57
  %71 = load i32, i32* %j, align 4, !dbg !921
  %sub62 = sub nsw i32 %71, 1, !dbg !922
  br label %cond.end63, !dbg !923

cond.end63:                                       ; preds = %cond.false61, %cond.true60
  %cond64 = phi i32 [ 0, %cond.true60 ], [ %sub62, %cond.false61 ], !dbg !924
  store i32 %cond64, i32* %colL, align 4, !dbg !925
  call void @llvm.dbg.declare(metadata i32* %colR, metadata !926, metadata !594), !dbg !927
  %72 = load i32, i32* %j, align 4, !dbg !928
  %73 = load i32, i32* %n, align 4, !dbg !929
  %sub65 = sub nsw i32 %73, 1, !dbg !930
  %cmp66 = icmp eq i32 %72, %sub65, !dbg !931
  br i1 %cmp66, label %cond.true67, label %cond.false69, !dbg !932

cond.true67:                                      ; preds = %cond.end63
  %74 = load i32, i32* %n, align 4, !dbg !933
  %sub68 = sub nsw i32 %74, 1, !dbg !934
  br label %cond.end71, !dbg !935

cond.false69:                                     ; preds = %cond.end63
  %75 = load i32, i32* %j, align 4, !dbg !936
  %add70 = add nsw i32 %75, 1, !dbg !937
  br label %cond.end71, !dbg !938

cond.end71:                                       ; preds = %cond.false69, %cond.true67
  %cond72 = phi i32 [ %sub68, %cond.true67 ], [ %add70, %cond.false69 ], !dbg !939
  store i32 %cond72, i32* %colR, align 4, !dbg !940
  %76 = load i32, i32* %i, align 4, !dbg !941
  %77 = load i32, i32* %n, align 4, !dbg !942
  %mul73 = mul nsw i32 %76, %77, !dbg !943
  %78 = load i32, i32* %j, align 4, !dbg !944
  %add74 = add nsw i32 %mul73, %78, !dbg !945
  %idxprom75 = sext i32 %add74 to i64, !dbg !946
  %arrayidx76 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom75, !dbg !946
  %79 = load float, float* %arrayidx76, align 4, !dbg !946
  store float %79, float* %old_val, align 4, !dbg !947
  call void @llvm.dbg.declare(metadata float* %U, metadata !948, metadata !594), !dbg !949
  %80 = load i32, i32* %rowU, align 4, !dbg !950
  %81 = load i32, i32* %n, align 4, !dbg !951
  %mul77 = mul nsw i32 %80, %81, !dbg !952
  %82 = load i32, i32* %j, align 4, !dbg !953
  %add78 = add nsw i32 %mul77, %82, !dbg !954
  %idxprom79 = sext i32 %add78 to i64, !dbg !955
  %arrayidx80 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom79, !dbg !955
  %83 = load float, float* %arrayidx80, align 4, !dbg !955
  %84 = load float, float* %old_val, align 4, !dbg !956
  %sub81 = fsub float %83, %84, !dbg !957
  store float %sub81, float* %U, align 4, !dbg !949
  call void @llvm.dbg.declare(metadata float* %D, metadata !958, metadata !594), !dbg !959
  %85 = load i32, i32* %rowD, align 4, !dbg !960
  %86 = load i32, i32* %n, align 4, !dbg !961
  %mul82 = mul nsw i32 %85, %86, !dbg !962
  %87 = load i32, i32* %j, align 4, !dbg !963
  %add83 = add nsw i32 %mul82, %87, !dbg !964
  %idxprom84 = sext i32 %add83 to i64, !dbg !965
  %arrayidx85 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom84, !dbg !965
  %88 = load float, float* %arrayidx85, align 4, !dbg !965
  %89 = load float, float* %old_val, align 4, !dbg !966
  %sub86 = fsub float %88, %89, !dbg !967
  store float %sub86, float* %D, align 4, !dbg !959
  call void @llvm.dbg.declare(metadata float* %L, metadata !968, metadata !594), !dbg !969
  %90 = load i32, i32* %i, align 4, !dbg !970
  %91 = load i32, i32* %n, align 4, !dbg !971
  %mul87 = mul nsw i32 %90, %91, !dbg !972
  %92 = load i32, i32* %colL, align 4, !dbg !973
  %add88 = add nsw i32 %mul87, %92, !dbg !974
  %idxprom89 = sext i32 %add88 to i64, !dbg !975
  %arrayidx90 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom89, !dbg !975
  %93 = load float, float* %arrayidx90, align 4, !dbg !975
  %94 = load float, float* %old_val, align 4, !dbg !976
  %sub91 = fsub float %93, %94, !dbg !977
  store float %sub91, float* %L, align 4, !dbg !969
  call void @llvm.dbg.declare(metadata float* %R, metadata !978, metadata !594), !dbg !979
  %95 = load i32, i32* %i, align 4, !dbg !980
  %96 = load i32, i32* %n, align 4, !dbg !981
  %mul92 = mul nsw i32 %95, %96, !dbg !982
  %97 = load i32, i32* %colR, align 4, !dbg !983
  %add93 = add nsw i32 %mul92, %97, !dbg !984
  %idxprom94 = sext i32 %add93 to i64, !dbg !985
  %arrayidx95 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom94, !dbg !985
  %98 = load float, float* %arrayidx95, align 4, !dbg !985
  %99 = load float, float* %old_val, align 4, !dbg !986
  %sub96 = fsub float %98, %99, !dbg !987
  store float %sub96, float* %R, align 4, !dbg !979
  call void @llvm.dbg.declare(metadata float* %UR, metadata !988, metadata !594), !dbg !989
  %100 = load i32, i32* %rowU, align 4, !dbg !990
  %101 = load i32, i32* %n, align 4, !dbg !991
  %mul97 = mul nsw i32 %100, %101, !dbg !992
  %102 = load i32, i32* %colR, align 4, !dbg !993
  %add98 = add nsw i32 %mul97, %102, !dbg !994
  %idxprom99 = sext i32 %add98 to i64, !dbg !995
  %arrayidx100 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom99, !dbg !995
  %103 = load float, float* %arrayidx100, align 4, !dbg !995
  %104 = load float, float* %old_val, align 4, !dbg !996
  %sub101 = fsub float %103, %104, !dbg !997
  store float %sub101, float* %UR, align 4, !dbg !989
  call void @llvm.dbg.declare(metadata float* %DR, metadata !998, metadata !594), !dbg !999
  %105 = load i32, i32* %rowD, align 4, !dbg !1000
  %106 = load i32, i32* %n, align 4, !dbg !1001
  %mul102 = mul nsw i32 %105, %106, !dbg !1002
  %107 = load i32, i32* %colR, align 4, !dbg !1003
  %add103 = add nsw i32 %mul102, %107, !dbg !1004
  %idxprom104 = sext i32 %add103 to i64, !dbg !1005
  %arrayidx105 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom104, !dbg !1005
  %108 = load float, float* %arrayidx105, align 4, !dbg !1005
  %109 = load float, float* %old_val, align 4, !dbg !1006
  %sub106 = fsub float %108, %109, !dbg !1007
  store float %sub106, float* %DR, align 4, !dbg !999
  call void @llvm.dbg.declare(metadata float* %UL, metadata !1008, metadata !594), !dbg !1009
  %110 = load i32, i32* %rowU, align 4, !dbg !1010
  %111 = load i32, i32* %n, align 4, !dbg !1011
  %mul107 = mul nsw i32 %110, %111, !dbg !1012
  %112 = load i32, i32* %colL, align 4, !dbg !1013
  %add108 = add nsw i32 %mul107, %112, !dbg !1014
  %idxprom109 = sext i32 %add108 to i64, !dbg !1015
  %arrayidx110 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom109, !dbg !1015
  %113 = load float, float* %arrayidx110, align 4, !dbg !1015
  %114 = load float, float* %old_val, align 4, !dbg !1016
  %sub111 = fsub float %113, %114, !dbg !1017
  store float %sub111, float* %UL, align 4, !dbg !1009
  call void @llvm.dbg.declare(metadata float* %DL, metadata !1018, metadata !594), !dbg !1019
  %115 = load i32, i32* %rowD, align 4, !dbg !1020
  %116 = load i32, i32* %n, align 4, !dbg !1021
  %mul112 = mul nsw i32 %115, %116, !dbg !1022
  %117 = load i32, i32* %colL, align 4, !dbg !1023
  %add113 = add nsw i32 %mul112, %117, !dbg !1024
  %idxprom114 = sext i32 %add113 to i64, !dbg !1025
  %arrayidx115 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom114, !dbg !1025
  %118 = load float, float* %arrayidx115, align 4, !dbg !1025
  %119 = load float, float* %old_val, align 4, !dbg !1026
  %sub116 = fsub float %118, %119, !dbg !1027
  store float %sub116, float* %DL, align 4, !dbg !1019
  call void @llvm.dbg.declare(metadata float* %UHe, metadata !1028, metadata !594), !dbg !1029
  %120 = load float, float* %U, align 4, !dbg !1030
  %121 = load float, float* %vy.addr, align 4, !dbg !1031
  %sub117 = fsub float -0.000000e+00, %121, !dbg !1032
  %mul118 = fmul float %120, %sub117, !dbg !1033
  %122 = load float, float* %one_over_e, align 4, !dbg !1034
  %mul119 = fmul float %mul118, %122, !dbg !1035
  %call120 = call float @_Z9heavisidef(float %mul119) #2, !dbg !1036
  store float %call120, float* %UHe, align 4, !dbg !1029
  call void @llvm.dbg.declare(metadata float* %DHe, metadata !1037, metadata !594), !dbg !1038
  %123 = load float, float* %D, align 4, !dbg !1039
  %124 = load float, float* %vy.addr, align 4, !dbg !1040
  %mul121 = fmul float %123, %124, !dbg !1041
  %125 = load float, float* %one_over_e, align 4, !dbg !1042
  %mul122 = fmul float %mul121, %125, !dbg !1043
  %call123 = call float @_Z9heavisidef(float %mul122) #2, !dbg !1044
  store float %call123, float* %DHe, align 4, !dbg !1038
  call void @llvm.dbg.declare(metadata float* %LHe, metadata !1045, metadata !594), !dbg !1046
  %126 = load float, float* %L, align 4, !dbg !1047
  %127 = load float, float* %vx.addr, align 4, !dbg !1048
  %sub124 = fsub float -0.000000e+00, %127, !dbg !1049
  %mul125 = fmul float %126, %sub124, !dbg !1050
  %128 = load float, float* %one_over_e, align 4, !dbg !1051
  %mul126 = fmul float %mul125, %128, !dbg !1052
  %call127 = call float @_Z9heavisidef(float %mul126) #2, !dbg !1053
  store float %call127, float* %LHe, align 4, !dbg !1046
  call void @llvm.dbg.declare(metadata float* %RHe, metadata !1054, metadata !594), !dbg !1055
  %129 = load float, float* %R, align 4, !dbg !1056
  %130 = load float, float* %vx.addr, align 4, !dbg !1057
  %mul128 = fmul float %129, %130, !dbg !1058
  %131 = load float, float* %one_over_e, align 4, !dbg !1059
  %mul129 = fmul float %mul128, %131, !dbg !1060
  %call130 = call float @_Z9heavisidef(float %mul129) #2, !dbg !1061
  store float %call130, float* %RHe, align 4, !dbg !1055
  call void @llvm.dbg.declare(metadata float* %URHe, metadata !1062, metadata !594), !dbg !1063
  %132 = load float, float* %UR, align 4, !dbg !1064
  %133 = load float, float* %vx.addr, align 4, !dbg !1065
  %134 = load float, float* %vy.addr, align 4, !dbg !1066
  %sub131 = fsub float %133, %134, !dbg !1067
  %mul132 = fmul float %132, %sub131, !dbg !1068
  %135 = load float, float* %one_over_e, align 4, !dbg !1069
  %mul133 = fmul float %mul132, %135, !dbg !1070
  %call134 = call float @_Z9heavisidef(float %mul133) #2, !dbg !1071
  store float %call134, float* %URHe, align 4, !dbg !1063
  call void @llvm.dbg.declare(metadata float* %DRHe, metadata !1072, metadata !594), !dbg !1073
  %136 = load float, float* %DR, align 4, !dbg !1074
  %137 = load float, float* %vx.addr, align 4, !dbg !1075
  %138 = load float, float* %vy.addr, align 4, !dbg !1076
  %add135 = fadd float %137, %138, !dbg !1077
  %mul136 = fmul float %136, %add135, !dbg !1078
  %139 = load float, float* %one_over_e, align 4, !dbg !1079
  %mul137 = fmul float %mul136, %139, !dbg !1080
  %call138 = call float @_Z9heavisidef(float %mul137) #2, !dbg !1081
  store float %call138, float* %DRHe, align 4, !dbg !1073
  call void @llvm.dbg.declare(metadata float* %ULHe, metadata !1082, metadata !594), !dbg !1083
  %140 = load float, float* %UL, align 4, !dbg !1084
  %141 = load float, float* %vx.addr, align 4, !dbg !1085
  %sub139 = fsub float -0.000000e+00, %141, !dbg !1086
  %142 = load float, float* %vy.addr, align 4, !dbg !1087
  %sub140 = fsub float %sub139, %142, !dbg !1088
  %mul141 = fmul float %140, %sub140, !dbg !1089
  %143 = load float, float* %one_over_e, align 4, !dbg !1090
  %mul142 = fmul float %mul141, %143, !dbg !1091
  %call143 = call float @_Z9heavisidef(float %mul142) #2, !dbg !1092
  store float %call143, float* %ULHe, align 4, !dbg !1083
  call void @llvm.dbg.declare(metadata float* %DLHe, metadata !1093, metadata !594), !dbg !1094
  %144 = load float, float* %DL, align 4, !dbg !1095
  %145 = load float, float* %vx.addr, align 4, !dbg !1096
  %sub144 = fsub float -0.000000e+00, %145, !dbg !1097
  %146 = load float, float* %vy.addr, align 4, !dbg !1098
  %add145 = fadd float %sub144, %146, !dbg !1099
  %mul146 = fmul float %144, %add145, !dbg !1100
  %147 = load float, float* %one_over_e, align 4, !dbg !1101
  %mul147 = fmul float %mul146, %147, !dbg !1102
  %call148 = call float @_Z9heavisidef(float %mul147) #2, !dbg !1103
  store float %call148, float* %DLHe, align 4, !dbg !1094
  %148 = load float, float* %old_val, align 4, !dbg !1104
  %conv149 = fpext float %148 to double, !dbg !1104
  %149 = load float, float* %UHe, align 4, !dbg !1105
  %150 = load float, float* %U, align 4, !dbg !1106
  %mul150 = fmul float %149, %150, !dbg !1107
  %151 = load float, float* %DHe, align 4, !dbg !1108
  %152 = load float, float* %D, align 4, !dbg !1109
  %mul151 = fmul float %151, %152, !dbg !1110
  %add152 = fadd float %mul150, %mul151, !dbg !1111
  %153 = load float, float* %LHe, align 4, !dbg !1112
  %154 = load float, float* %L, align 4, !dbg !1113
  %mul153 = fmul float %153, %154, !dbg !1114
  %add154 = fadd float %add152, %mul153, !dbg !1115
  %155 = load float, float* %RHe, align 4, !dbg !1116
  %156 = load float, float* %R, align 4, !dbg !1117
  %mul155 = fmul float %155, %156, !dbg !1118
  %add156 = fadd float %add154, %mul155, !dbg !1119
  %157 = load float, float* %URHe, align 4, !dbg !1120
  %158 = load float, float* %UR, align 4, !dbg !1121
  %mul157 = fmul float %157, %158, !dbg !1122
  %add158 = fadd float %add156, %mul157, !dbg !1123
  %159 = load float, float* %DRHe, align 4, !dbg !1124
  %160 = load float, float* %DR, align 4, !dbg !1125
  %mul159 = fmul float %159, %160, !dbg !1126
  %add160 = fadd float %add158, %mul159, !dbg !1127
  %161 = load float, float* %ULHe, align 4, !dbg !1128
  %162 = load float, float* %UL, align 4, !dbg !1129
  %mul161 = fmul float %161, %162, !dbg !1130
  %add162 = fadd float %add160, %mul161, !dbg !1131
  %163 = load float, float* %DLHe, align 4, !dbg !1132
  %164 = load float, float* %DL, align 4, !dbg !1133
  %mul163 = fmul float %163, %164, !dbg !1134
  %add164 = fadd float %add162, %mul163, !dbg !1135
  %conv165 = fpext float %add164 to double, !dbg !1136
  %mul166 = fmul double 1.000000e-01, %conv165, !dbg !1137
  %add167 = fadd double %conv149, %mul166, !dbg !1138
  %conv168 = fptrunc double %add167 to float, !dbg !1104
  store float %conv168, float* %new_val, align 4, !dbg !1139
  call void @llvm.dbg.declare(metadata float* %vI, metadata !1140, metadata !594), !dbg !1141
  %165 = load float*, float** %I, align 8, !dbg !1142
  %166 = load i32, i32* %i, align 4, !dbg !1143
  %167 = load i32, i32* %n, align 4, !dbg !1144
  %mul169 = mul nsw i32 %166, %167, !dbg !1145
  %168 = load i32, i32* %j, align 4, !dbg !1146
  %add170 = add nsw i32 %mul169, %168, !dbg !1147
  %idxprom171 = sext i32 %add170 to i64, !dbg !1142
  %arrayidx172 = getelementptr inbounds float, float* %165, i64 %idxprom171, !dbg !1142
  %169 = load float, float* %arrayidx172, align 4, !dbg !1142
  store float %169, float* %vI, align 4, !dbg !1141
  %170 = load float, float* %vI, align 4, !dbg !1148
  %conv173 = fpext float %170 to double, !dbg !1148
  %mul174 = fmul double 2.000000e-01, %conv173, !dbg !1149
  %171 = load float, float* %new_val, align 4, !dbg !1150
  %172 = load float, float* %vI, align 4, !dbg !1151
  %sub175 = fsub float %171, %172, !dbg !1152
  %conv176 = fpext float %sub175 to double, !dbg !1153
  %mul177 = fmul double %mul174, %conv176, !dbg !1154
  %173 = load float, float* %new_val, align 4, !dbg !1155
  %conv178 = fpext float %173 to double, !dbg !1155
  %sub179 = fsub double %conv178, %mul177, !dbg !1155
  %conv180 = fptrunc double %sub179 to float, !dbg !1155
  store float %conv180, float* %new_val, align 4, !dbg !1155
  br label %if.end181, !dbg !1156

if.end181:                                        ; preds = %cond.end71, %if.end46
  %174 = load i32, i32* %thread_block, align 4, !dbg !1157
  %cmp182 = icmp sgt i32 %174, 0, !dbg !1159
  br i1 %cmp182, label %if.then183, label %if.end195, !dbg !1160

if.then183:                                       ; preds = %if.end181
  %175 = load i32, i32* %thread_block, align 4, !dbg !1161
  %sub184 = sub nsw i32 %175, 1, !dbg !1163
  %mul185 = mul nsw i32 %sub184, 320, !dbg !1164
  store i32 %mul185, i32* %offset36, align 4, !dbg !1165
  %176 = load i32, i32* %old_i, align 4, !dbg !1166
  %177 = load i32, i32* %m, align 4, !dbg !1168
  %cmp186 = icmp slt i32 %176, %177, !dbg !1169
  br i1 %cmp186, label %if.then187, label %if.end194, !dbg !1170

if.then187:                                       ; preds = %if.then183
  %178 = load i32, i32* %thread_id, align 4, !dbg !1171
  %idxprom188 = sext i32 %178 to i64, !dbg !1173
  %arrayidx189 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom188, !dbg !1173
  %179 = load float, float* %arrayidx189, align 4, !dbg !1173
  %180 = load i32, i32* %old_i, align 4, !dbg !1174
  %181 = load i32, i32* %n, align 4, !dbg !1175
  %mul190 = mul nsw i32 %180, %181, !dbg !1176
  %182 = load i32, i32* %old_j, align 4, !dbg !1177
  %add191 = add nsw i32 %mul190, %182, !dbg !1178
  %idxprom192 = sext i32 %add191 to i64, !dbg !1179
  %arrayidx193 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom192, !dbg !1179
  store float %179, float* %arrayidx193, align 4, !dbg !1180
  br label %if.end194, !dbg !1179

if.end194:                                        ; preds = %if.then187, %if.then183
  br label %if.end195, !dbg !1181

if.end195:                                        ; preds = %if.end194, %if.end181
  %183 = load i32, i32* %thread_block, align 4, !dbg !1182
  %184 = load i32, i32* %max, align 4, !dbg !1184
  %sub196 = sub nsw i32 %184, 1, !dbg !1185
  %cmp197 = icmp slt i32 %183, %sub196, !dbg !1186
  br i1 %cmp197, label %if.then198, label %if.else, !dbg !1187

if.then198:                                       ; preds = %if.end195
  %185 = load float, float* %new_val, align 4, !dbg !1188
  %186 = load i32, i32* %thread_id, align 4, !dbg !1190
  %idxprom199 = sext i32 %186 to i64, !dbg !1191
  %arrayidx200 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom199, !dbg !1191
  store float %185, float* %arrayidx200, align 4, !dbg !1192
  br label %if.end208, !dbg !1193

if.else:                                          ; preds = %if.end195
  %187 = load i32, i32* %i, align 4, !dbg !1194
  %188 = load i32, i32* %m, align 4, !dbg !1197
  %cmp201 = icmp slt i32 %187, %188, !dbg !1198
  br i1 %cmp201, label %if.then202, label %if.end207, !dbg !1199

if.then202:                                       ; preds = %if.else
  %189 = load float, float* %new_val, align 4, !dbg !1200
  %190 = load i32, i32* %i, align 4, !dbg !1202
  %191 = load i32, i32* %n, align 4, !dbg !1203
  %mul203 = mul nsw i32 %190, %191, !dbg !1204
  %192 = load i32, i32* %j, align 4, !dbg !1205
  %add204 = add nsw i32 %mul203, %192, !dbg !1206
  %idxprom205 = sext i32 %add204 to i64, !dbg !1207
  %arrayidx206 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom205, !dbg !1207
  store float %189, float* %arrayidx206, align 4, !dbg !1208
  br label %if.end207, !dbg !1207

if.end207:                                        ; preds = %if.then202, %if.else
  br label %if.end208

if.end208:                                        ; preds = %if.end207, %if.then198
  %193 = load float, float* %new_val, align 4, !dbg !1209
  %194 = load float, float* %old_val, align 4, !dbg !1210
  %sub209 = fsub float %193, %194, !dbg !1211
  store float %sub209, float* %__x.addr.i, align 4, !dbg !1212
  %195 = load float, float* %__x.addr.i, align 4, !dbg !1213
  store float %195, float* %f.addr.i.i, align 4, !dbg !1214
  %196 = load float, float* %f.addr.i.i, align 4, !dbg !1215
  %197 = call float @llvm.nvvm.fabs.f(float %196) #3, !dbg !1216
  %198 = load float, float* %total_diff, align 4, !dbg !1217
  %add211 = fadd float %198, %197, !dbg !1217
  store float %add211, float* %total_diff, align 4, !dbg !1217
  call void @llvm.nvvm.barrier0(), !dbg !1218
  br label %for.inc212, !dbg !1219

for.inc212:                                       ; preds = %if.end208
  %199 = load i32, i32* %thread_block, align 4, !dbg !1220
  %inc213 = add nsw i32 %199, 1, !dbg !1220
  store i32 %inc213, i32* %thread_block, align 4, !dbg !1220
  br label %for.cond33, !dbg !1222, !llvm.loop !1223

for.end214:                                       ; preds = %for.cond33
  %200 = load float, float* %total_diff, align 4, !dbg !1225
  %201 = load i32, i32* %thread_id, align 4, !dbg !1226
  %idxprom215 = sext i32 %201 to i64, !dbg !1227
  %arrayidx216 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom215, !dbg !1227
  store float %200, float* %arrayidx216, align 4, !dbg !1228
  call void @llvm.nvvm.barrier0(), !dbg !1229
  %202 = load i32, i32* %thread_id, align 4, !dbg !1230
  %cmp217 = icmp sge i32 %202, 256, !dbg !1232
  br i1 %cmp217, label %if.then218, label %if.end225, !dbg !1233

if.then218:                                       ; preds = %for.end214
  %203 = load i32, i32* %thread_id, align 4, !dbg !1234
  %idxprom219 = sext i32 %203 to i64, !dbg !1236
  %arrayidx220 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom219, !dbg !1236
  %204 = load float, float* %arrayidx220, align 4, !dbg !1236
  %205 = load i32, i32* %thread_id, align 4, !dbg !1237
  %sub221 = sub nsw i32 %205, 256, !dbg !1238
  %idxprom222 = sext i32 %sub221 to i64, !dbg !1239
  %arrayidx223 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom222, !dbg !1239
  %206 = load float, float* %arrayidx223, align 4, !dbg !1240
  %add224 = fadd float %206, %204, !dbg !1240
  store float %add224, float* %arrayidx223, align 4, !dbg !1240
  br label %if.end225, !dbg !1241

if.end225:                                        ; preds = %if.then218, %for.end214
  call void @llvm.nvvm.barrier0(), !dbg !1242
  call void @llvm.dbg.declare(metadata i32* %th, metadata !1243, metadata !594), !dbg !1244
  store i32 128, i32* %th, align 4, !dbg !1245
  br label %for.cond226, !dbg !1247

for.cond226:                                      ; preds = %for.inc238, %if.end225
  %207 = load i32, i32* %th, align 4, !dbg !1248
  %cmp227 = icmp sgt i32 %207, 0, !dbg !1251
  br i1 %cmp227, label %for.body228, label %for.end240, !dbg !1252

for.body228:                                      ; preds = %for.cond226
  %208 = load i32, i32* %thread_id, align 4, !dbg !1253
  %209 = load i32, i32* %th, align 4, !dbg !1256
  %cmp229 = icmp slt i32 %208, %209, !dbg !1257
  br i1 %cmp229, label %if.then230, label %if.end237, !dbg !1258

if.then230:                                       ; preds = %for.body228
  %210 = load i32, i32* %thread_id, align 4, !dbg !1259
  %211 = load i32, i32* %th, align 4, !dbg !1261
  %add231 = add nsw i32 %210, %211, !dbg !1262
  %idxprom232 = sext i32 %add231 to i64, !dbg !1263
  %arrayidx233 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom232, !dbg !1263
  %212 = load float, float* %arrayidx233, align 4, !dbg !1263
  %213 = load i32, i32* %thread_id, align 4, !dbg !1264
  %idxprom234 = sext i32 %213 to i64, !dbg !1265
  %arrayidx235 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom234, !dbg !1265
  %214 = load float, float* %arrayidx235, align 4, !dbg !1266
  %add236 = fadd float %214, %212, !dbg !1266
  store float %add236, float* %arrayidx235, align 4, !dbg !1266
  br label %if.end237, !dbg !1267

if.end237:                                        ; preds = %if.then230, %for.body228
  call void @llvm.nvvm.barrier0(), !dbg !1268
  br label %for.inc238, !dbg !1269

for.inc238:                                       ; preds = %if.end237
  %215 = load i32, i32* %th, align 4, !dbg !1270
  %div239 = sdiv i32 %215, 2, !dbg !1270
  store i32 %div239, i32* %th, align 4, !dbg !1270
  br label %for.cond226, !dbg !1272, !llvm.loop !1273

for.end240:                                       ; preds = %for.cond226
  %216 = load i32, i32* %thread_id, align 4, !dbg !1275
  %cmp241 = icmp eq i32 %216, 0, !dbg !1277
  br i1 %cmp241, label %if.then242, label %if.end251, !dbg !1278

if.then242:                                       ; preds = %for.end240
  call void @llvm.dbg.declare(metadata float* %mean, metadata !1279, metadata !594), !dbg !1281
  %217 = load i32, i32* %thread_id, align 4, !dbg !1282
  %idxprom243 = sext i32 %217 to i64, !dbg !1283
  %arrayidx244 = getelementptr inbounds [320 x float], [320 x float]* addrspacecast ([320 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE6buffer to [320 x float]*), i64 0, i64 %idxprom243, !dbg !1283
  %218 = load float, float* %arrayidx244, align 4, !dbg !1283
  %219 = load i32, i32* %m, align 4, !dbg !1284
  %220 = load i32, i32* %n, align 4, !dbg !1285
  %mul245 = mul nsw i32 %219, %220, !dbg !1286
  %conv246 = sitofp i32 %mul245 to float, !dbg !1287
  %div247 = fdiv float %218, %conv246, !dbg !1288
  store float %div247, float* %mean, align 4, !dbg !1281
  %221 = load float, float* %mean, align 4, !dbg !1289
  %222 = load float, float* %cutoff.addr, align 4, !dbg !1291
  %cmp248 = fcmp olt float %221, %222, !dbg !1292
  br i1 %cmp248, label %if.then249, label %if.end250, !dbg !1293

if.then249:                                       ; preds = %if.then242
  store i32 1, i32* addrspacecast (i32 addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE14cell_converged to i32*), align 4, !dbg !1294
  br label %if.end250, !dbg !1296

if.end250:                                        ; preds = %if.then249, %if.then242
  br label %if.end251, !dbg !1297

if.end251:                                        ; preds = %if.end250, %for.end240
  call void @llvm.nvvm.barrier0(), !dbg !1298
  %223 = load i32, i32* %iterations, align 4, !dbg !1299
  %inc252 = add nsw i32 %223, 1, !dbg !1299
  store i32 %inc252, i32* %iterations, align 4, !dbg !1299
  br label %while.cond, !dbg !1300, !llvm.loop !1302

while.end:                                        ; preds = %land.end
  store i32 0, i32* %thread_block, align 4, !dbg !1303
  br label %for.cond253, !dbg !1305

for.cond253:                                      ; preds = %for.inc273, %while.end
  %224 = load i32, i32* %thread_block, align 4, !dbg !1306
  %225 = load i32, i32* %max, align 4, !dbg !1309
  %cmp254 = icmp slt i32 %224, %225, !dbg !1310
  br i1 %cmp254, label %for.body255, label %for.end275, !dbg !1311

for.body255:                                      ; preds = %for.cond253
  call void @llvm.dbg.declare(metadata i32* %offset256, metadata !1312, metadata !594), !dbg !1314
  %226 = load i32, i32* %thread_block, align 4, !dbg !1315
  %mul257 = mul nsw i32 %226, 320, !dbg !1316
  store i32 %mul257, i32* %offset256, align 4, !dbg !1314
  %227 = load i32, i32* %thread_id, align 4, !dbg !1317
  %228 = load i32, i32* %offset256, align 4, !dbg !1318
  %add258 = add nsw i32 %227, %228, !dbg !1319
  %229 = load i32, i32* %n, align 4, !dbg !1320
  %div259 = sdiv i32 %add258, %229, !dbg !1321
  store i32 %div259, i32* %i, align 4, !dbg !1322
  %230 = load i32, i32* %thread_id, align 4, !dbg !1323
  %231 = load i32, i32* %offset256, align 4, !dbg !1324
  %add260 = add nsw i32 %230, %231, !dbg !1325
  %232 = load i32, i32* %n, align 4, !dbg !1326
  %rem261 = srem i32 %add260, %232, !dbg !1327
  store i32 %rem261, i32* %j, align 4, !dbg !1328
  %233 = load i32, i32* %i, align 4, !dbg !1329
  %234 = load i32, i32* %m, align 4, !dbg !1331
  %cmp262 = icmp slt i32 %233, %234, !dbg !1332
  br i1 %cmp262, label %if.then263, label %if.end272, !dbg !1333

if.then263:                                       ; preds = %for.body255
  %235 = load i32, i32* %i, align 4, !dbg !1334
  %236 = load i32, i32* %n, align 4, !dbg !1336
  %mul264 = mul nsw i32 %235, %236, !dbg !1337
  %237 = load i32, i32* %j, align 4, !dbg !1338
  %add265 = add nsw i32 %mul264, %237, !dbg !1339
  %idxprom266 = sext i32 %add265 to i64, !dbg !1340
  %arrayidx267 = getelementptr inbounds [3321 x float], [3321 x float]* addrspacecast ([3321 x float] addrspace(3)* @_ZZ12IMGVF_kernelPPfS0_PiS1_fffifE5IMGVF to [3321 x float]*), i64 0, i64 %idxprom266, !dbg !1340
  %238 = load float, float* %arrayidx267, align 4, !dbg !1340
  %239 = load float*, float** %IMGVF_global, align 8, !dbg !1341
  %240 = load i32, i32* %i, align 4, !dbg !1342
  %241 = load i32, i32* %n, align 4, !dbg !1343
  %mul268 = mul nsw i32 %240, %241, !dbg !1344
  %242 = load i32, i32* %j, align 4, !dbg !1345
  %add269 = add nsw i32 %mul268, %242, !dbg !1346
  %idxprom270 = sext i32 %add269 to i64, !dbg !1341
  %arrayidx271 = getelementptr inbounds float, float* %239, i64 %idxprom270, !dbg !1341
  store float %238, float* %arrayidx271, align 4, !dbg !1347
  br label %if.end272, !dbg !1341

if.end272:                                        ; preds = %if.then263, %for.body255
  br label %for.inc273, !dbg !1348

for.inc273:                                       ; preds = %if.end272
  %243 = load i32, i32* %thread_block, align 4, !dbg !1349
  %inc274 = add nsw i32 %243, 1, !dbg !1349
  store i32 %inc274, i32* %thread_block, align 4, !dbg !1349
  br label %for.cond253, !dbg !1351, !llvm.loop !1352

for.end275:                                       ; preds = %for.cond253
  ret void, !dbg !1354
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

declare i32 @__nvvm_reflect(i8*)

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fabs.ftz.f(float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fabs.f(float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.mul.rn.ftz.f(float, float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.mul.rn.f(float, float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fma.rn.ftz.f(float, float, float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fma.rn.f(float, float, float) #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!10}
!nvvm.annotations = !{!582, !583, !584, !583, !585, !585, !585, !585, !586, !586, !585}
!llvm.module.flags = !{!587, !588, !589}
!llvm.ident = !{!590}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!591}

!0 = distinct !DIGlobalVariable(name: "IMGVF", scope: !1, file: !2, line: 47, type: !579, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "IMGVF_kernel", linkageName: "_Z12IMGVF_kernelPPfS0_PiS1_fffif", scope: !2, file: !2, line: 43, type: !3, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, unit: !10, variables: !11)
!2 = !DIFile(filename: "track_ellipse_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !5, !8, !8, !7, !7, !7, !9, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !11, retainedTypes: !12, globals: !13, imports: !24)
!11 = !{}
!12 = !{!7}
!13 = !{!0, !14, !18, !21, !22}
!14 = distinct !DIGlobalVariable(name: "buffer", scope: !1, file: !2, line: 54, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 10240, align: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 320)
!18 = distinct !DIGlobalVariable(name: "threads_per_block", scope: !10, file: !2, line: 24, type: !19, isLocal: true, isDefinition: true, expr: !20)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!20 = !DIExpression(DW_OP_constu, 320, DW_OP_stack_value)
!21 = distinct !DIGlobalVariable(name: "cell_converged", scope: !1, file: !2, line: 81, type: !9, isLocal: true, isDefinition: true)
!22 = distinct !DIGlobalVariable(name: "next_lowest_power_of_two", scope: !10, file: !2, line: 26, type: !19, isLocal: true, isDefinition: true, expr: !23)
!23 = !DIExpression(DW_OP_constu, 256, DW_OP_stack_value)
!24 = !{!25, !32, !36, !38, !40, !42, !45, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !75, !77, !81, !83, !85, !87, !91, !95, !97, !99, !104, !108, !110, !112, !114, !116, !118, !120, !122, !124, !129, !133, !135, !137, !141, !143, !145, !147, !149, !151, !155, !157, !159, !163, !171, !175, !177, !179, !183, !185, !187, !191, !193, !195, !199, !201, !203, !205, !207, !209, !211, !213, !215, !217, !222, !224, !226, !230, !232, !234, !236, !238, !240, !242, !244, !248, !252, !254, !256, !261, !263, !265, !267, !269, !271, !273, !277, !283, !287, !291, !296, !298, !302, !306, !320, !324, !328, !332, !336, !341, !343, !347, !351, !355, !363, !367, !371, !375, !379, !384, !390, !394, !398, !400, !408, !412, !420, !422, !424, !428, !432, !436, !441, !445, !450, !451, !452, !453, !456, !457, !458, !459, !460, !461, !462, !465, !467, !469, !471, !473, !475, !477, !479, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !550, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577}
!25 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !28, line: 189)
!26 = !DINamespace(name: "std", scope: null, file: !27, line: 188)
!27 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!28 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !27, file: !27, line: 44, type: !29, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !31}
!31 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !33, line: 190)
!33 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !27, file: !27, line: 46, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DISubroutineType(types: !35)
!35 = !{!7, !7}
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !37, line: 191)
!37 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !27, file: !27, line: 48, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !39, line: 192)
!39 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !27, file: !27, line: 50, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !41, line: 193)
!41 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !27, file: !27, line: 52, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !43, line: 194)
!43 = distinct !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !44, file: !44, line: 55, type: !34, isLocal: true, isDefinition: true, scopeLine: 55, flags: DIFlagPrototyped, isOptimized: false, unit: !10, variables: !11)
!44 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_cmath.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !46, line: 195)
!46 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !27, file: !27, line: 54, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DISubroutineType(types: !48)
!48 = !{!7, !7, !7}
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
!72 = distinct !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !44, file: !44, line: 61, type: !34, isLocal: true, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !10, variables: !11)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !74, line: 208)
!74 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !27, file: !27, line: 82, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !76, line: 209)
!76 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !27, file: !27, line: 84, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !78, line: 210)
!78 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !27, file: !27, line: 86, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !7, !7}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !82, line: 211)
!82 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !27, file: !27, line: 88, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !84, line: 212)
!84 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !27, file: !27, line: 90, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !86, line: 213)
!86 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !27, file: !27, line: 92, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !88, line: 214)
!88 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !27, file: !27, line: 94, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DISubroutineType(types: !90)
!90 = !{!9, !7}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !92, line: 215)
!92 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !27, file: !27, line: 96, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !8}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !96, line: 216)
!96 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !27, file: !27, line: 98, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !98, line: 217)
!98 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !27, file: !27, line: 100, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !100, line: 218)
!100 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !27, file: !27, line: 102, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !7}
!103 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !105, line: 219)
!105 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !27, file: !27, line: 106, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DISubroutineType(types: !107)
!107 = !{!103, !7, !7}
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
!132 = !{!7, !7, !9}
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !134, line: 230)
!134 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !27, file: !27, line: 125, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !136, line: 231)
!136 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !27, file: !27, line: 126, type: !29, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !138, line: 232)
!138 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !27, file: !27, line: 128, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!31, !7}
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
!154 = !{!128, !7}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !156, line: 239)
!156 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !27, file: !27, line: 142, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !158, line: 240)
!158 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !27, file: !27, line: 143, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !160, line: 241)
!160 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !27, file: !27, line: 145, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!7, !7, !6}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !164, line: 242)
!164 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !27, file: !27, line: 146, type: !165, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DISubroutineType(types: !166)
!166 = !{!167, !168}
!167 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64, align: 64)
!169 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !170)
!170 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !172, line: 243)
!172 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !27, file: !27, line: 147, type: !173, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{!7, !168}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !176, line: 244)
!176 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !27, file: !27, line: 149, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !178, line: 245)
!178 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !27, file: !27, line: 151, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !180, line: 246)
!180 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !27, file: !27, line: 153, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!7, !7, !167}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !184, line: 247)
!184 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !27, file: !27, line: 158, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !186, line: 248)
!186 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !27, file: !27, line: 160, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !188, line: 249)
!188 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !27, file: !27, line: 162, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!7, !7, !7, !8}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !192, line: 250)
!192 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !27, file: !27, line: 164, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !194, line: 251)
!194 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !27, file: !27, line: 166, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !196, line: 252)
!196 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !27, file: !27, line: 168, type: !197, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!7, !7, !128}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !200, line: 253)
!200 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !27, file: !27, line: 170, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !202, line: 254)
!202 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !27, file: !27, line: 172, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !204, line: 255)
!204 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !27, file: !27, line: 174, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !206, line: 256)
!206 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !27, file: !27, line: 176, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !208, line: 257)
!208 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !27, file: !27, line: 178, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !210, line: 258)
!210 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !27, file: !27, line: 180, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !212, line: 259)
!212 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !27, file: !27, line: 182, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !214, line: 260)
!214 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !27, file: !27, line: 184, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !216, line: 261)
!216 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !27, file: !27, line: 186, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !218, line: 102)
!218 = !DISubprogram(name: "acos", scope: !219, file: !219, line: 54, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!220 = !DISubroutineType(types: !221)
!221 = !{!167, !167}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !223, line: 121)
!223 = !DISubprogram(name: "asin", scope: !219, file: !219, line: 56, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !225, line: 140)
!225 = !DISubprogram(name: "atan", scope: !219, file: !219, line: 58, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !227, line: 159)
!227 = !DISubprogram(name: "atan2", scope: !219, file: !219, line: 60, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!167, !167, !167}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !231, line: 180)
!231 = !DISubprogram(name: "ceil", scope: !219, file: !219, line: 178, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !233, line: 199)
!233 = !DISubprogram(name: "cos", scope: !219, file: !219, line: 63, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !235, line: 218)
!235 = !DISubprogram(name: "cosh", scope: !219, file: !219, line: 72, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !237, line: 237)
!237 = !DISubprogram(name: "exp", scope: !219, file: !219, line: 100, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !239, line: 256)
!239 = !DISubprogram(name: "fabs", scope: !219, file: !219, line: 181, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !241, line: 275)
!241 = !DISubprogram(name: "floor", scope: !219, file: !219, line: 184, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !243, line: 294)
!243 = !DISubprogram(name: "fmod", scope: !219, file: !219, line: 187, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !245, line: 315)
!245 = !DISubprogram(name: "frexp", scope: !219, file: !219, line: 103, type: !246, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DISubroutineType(types: !247)
!247 = !{!167, !167, !8}
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !249, line: 334)
!249 = !DISubprogram(name: "ldexp", scope: !219, file: !219, line: 106, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{!167, !167, !9}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !253, line: 353)
!253 = !DISubprogram(name: "log", scope: !219, file: !219, line: 109, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !255, line: 372)
!255 = !DISubprogram(name: "log10", scope: !219, file: !219, line: 112, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !257, line: 391)
!257 = !DISubprogram(name: "modf", scope: !219, file: !219, line: 115, type: !258, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DISubroutineType(types: !259)
!259 = !{!167, !167, !260}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64, align: 64)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !262, line: 403)
!262 = !DISubprogram(name: "pow", scope: !219, file: !219, line: 153, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !264, line: 440)
!264 = !DISubprogram(name: "sin", scope: !219, file: !219, line: 65, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !266, line: 459)
!266 = !DISubprogram(name: "sinh", scope: !219, file: !219, line: 74, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !268, line: 478)
!268 = !DISubprogram(name: "sqrt", scope: !219, file: !219, line: 156, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !270, line: 497)
!270 = !DISubprogram(name: "tan", scope: !219, file: !219, line: 67, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !272, line: 516)
!272 = !DISubprogram(name: "tanh", scope: !219, file: !219, line: 76, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !274, line: 118)
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !275, line: 101, baseType: !276)
!275 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!276 = !DICompositeType(tag: DW_TAG_structure_type, file: !275, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !278, line: 119)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !275, line: 109, baseType: !279)
!279 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !275, line: 105, size: 128, align: 64, elements: !280, identifier: "_ZTS6ldiv_t")
!280 = !{!281, !282}
!281 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !279, file: !275, line: 107, baseType: !128, size: 64, align: 64)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !279, file: !275, line: 108, baseType: !128, size: 64, align: 64, offset: 64)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !284, line: 121)
!284 = !DISubprogram(name: "abort", scope: !275, file: !275, line: 515, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!285 = !DISubroutineType(types: !286)
!286 = !{null}
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !288, line: 122)
!288 = !DISubprogram(name: "abs", scope: !275, file: !275, line: 774, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DISubroutineType(types: !290)
!290 = !{!9, !9}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !292, line: 123)
!292 = !DISubprogram(name: "atexit", scope: !275, file: !275, line: 519, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!9, !295}
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !285, size: 64, align: 64)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !297, line: 129)
!297 = !DISubprogram(name: "atof", scope: !275, file: !275, line: 144, type: !165, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !299, line: 130)
!299 = !DISubprogram(name: "atoi", scope: !275, file: !275, line: 147, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!9, !168}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !303, line: 131)
!303 = !DISubprogram(name: "atol", scope: !275, file: !275, line: 150, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!128, !168}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !307, line: 132)
!307 = !DISubprogram(name: "bsearch", scope: !275, file: !275, line: 754, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!310, !311, !311, !313, !313, !316}
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64, align: 64)
!312 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !314, line: 62, baseType: !315)
!314 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!315 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !275, line: 741, baseType: !317)
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 64, align: 64)
!318 = !DISubroutineType(types: !319)
!319 = !{!9, !311, !311}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !321, line: 133)
!321 = !DISubprogram(name: "calloc", scope: !275, file: !275, line: 468, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{!310, !313, !313}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !325, line: 134)
!325 = !DISubprogram(name: "div", scope: !275, file: !275, line: 788, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!274, !9, !9}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !329, line: 135)
!329 = !DISubprogram(name: "exit", scope: !275, file: !275, line: 543, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{null, !9}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !333, line: 136)
!333 = !DISubprogram(name: "free", scope: !275, file: !275, line: 483, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{null, !310}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !337, line: 137)
!337 = !DISubprogram(name: "getenv", scope: !275, file: !275, line: 564, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{!340, !168}
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64, align: 64)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !342, line: 138)
!342 = !DISubprogram(name: "labs", scope: !275, file: !275, line: 775, type: !126, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !344, line: 139)
!344 = !DISubprogram(name: "ldiv", scope: !275, file: !275, line: 790, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!278, !128, !128}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !348, line: 140)
!348 = !DISubprogram(name: "malloc", scope: !275, file: !275, line: 466, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!310, !313}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !352, line: 142)
!352 = !DISubprogram(name: "mblen", scope: !275, file: !275, line: 862, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{!9, !168, !313}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !356, line: 143)
!356 = !DISubprogram(name: "mbstowcs", scope: !275, file: !275, line: 873, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!313, !359, !362, !313}
!359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !360)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64, align: 64)
!361 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!362 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !168)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !364, line: 144)
!364 = !DISubprogram(name: "mbtowc", scope: !275, file: !275, line: 865, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!9, !359, !362, !313}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !368, line: 146)
!368 = !DISubprogram(name: "qsort", scope: !275, file: !275, line: 764, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{null, !310, !313, !313, !316}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !372, line: 152)
!372 = !DISubprogram(name: "rand", scope: !275, file: !275, line: 374, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{!9}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !376, line: 153)
!376 = !DISubprogram(name: "realloc", scope: !275, file: !275, line: 480, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!310, !310, !313}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !380, line: 154)
!380 = !DISubprogram(name: "srand", scope: !275, file: !275, line: 376, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!381 = !DISubroutineType(types: !382)
!382 = !{null, !383}
!383 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !385, line: 155)
!385 = !DISubprogram(name: "strtod", scope: !275, file: !275, line: 164, type: !386, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!386 = !DISubroutineType(types: !387)
!387 = !{!167, !362, !388}
!388 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !389)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 64, align: 64)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !391, line: 156)
!391 = !DISubprogram(name: "strtol", scope: !275, file: !275, line: 183, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DISubroutineType(types: !393)
!393 = !{!128, !362, !388, !9}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !395, line: 157)
!395 = !DISubprogram(name: "strtoul", scope: !275, file: !275, line: 187, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!315, !362, !388, !9}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !399, line: 158)
!399 = !DISubprogram(name: "system", scope: !275, file: !275, line: 716, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !401, line: 160)
!401 = !DISubprogram(name: "wcstombs", scope: !275, file: !275, line: 876, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DISubroutineType(types: !403)
!403 = !{!313, !404, !405, !313}
!404 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !340)
!405 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !406)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64, align: 64)
!407 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !361)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !409, line: 161)
!409 = !DISubprogram(name: "wctomb", scope: !275, file: !275, line: 869, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!410 = !DISubroutineType(types: !411)
!411 = !{!9, !340, !361}
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !415, line: 214)
!413 = !DINamespace(name: "__gnu_cxx", scope: null, file: !414, line: 220)
!414 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !275, line: 121, baseType: !416)
!416 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !275, line: 117, size: 128, align: 64, elements: !417, identifier: "_ZTS7lldiv_t")
!417 = !{!418, !419}
!418 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !416, file: !275, line: 119, baseType: !31, size: 64, align: 64)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !416, file: !275, line: 120, baseType: !31, size: 64, align: 64, offset: 64)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !421, line: 220)
!421 = !DISubprogram(name: "_Exit", scope: !275, file: !275, line: 557, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !423, line: 224)
!423 = !DISubprogram(name: "llabs", scope: !275, file: !275, line: 779, type: !29, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !425, line: 230)
!425 = !DISubprogram(name: "lldiv", scope: !275, file: !275, line: 796, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!415, !31, !31}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !429, line: 241)
!429 = !DISubprogram(name: "atoll", scope: !275, file: !275, line: 157, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!31, !168}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !433, line: 242)
!433 = !DISubprogram(name: "strtoll", scope: !275, file: !275, line: 209, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!31, !362, !388, !9}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !437, line: 243)
!437 = !DISubprogram(name: "strtoull", scope: !275, file: !275, line: 214, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!440, !362, !388, !9}
!440 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !442, line: 245)
!442 = !DISubprogram(name: "strtof", scope: !275, file: !275, line: 172, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!7, !362, !388}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !446, line: 246)
!446 = !DISubprogram(name: "strtold", scope: !275, file: !275, line: 175, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!449, !362, !388}
!449 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !415, line: 254)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !421, line: 256)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !423, line: 258)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !454, line: 259)
!454 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !413, file: !455, line: 227, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !425, line: 260)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !429, line: 262)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !442, line: 263)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !433, line: 264)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !437, line: 265)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !446, line: 266)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !463, line: 397)
!463 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !464, file: !464, line: 1342, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !466, line: 398)
!466 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !464, file: !464, line: 1370, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !468, line: 399)
!468 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !464, file: !464, line: 1337, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !470, line: 400)
!470 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !464, file: !464, line: 1375, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !472, line: 401)
!472 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !464, file: !464, line: 1327, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !474, line: 402)
!474 = distinct !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !464, file: !464, line: 1332, type: !34, isLocal: true, isDefinition: true, scopeLine: 1333, flags: DIFlagPrototyped, isOptimized: false, unit: !10, variables: !11)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !476, line: 403)
!476 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !464, file: !464, line: 1380, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !478, line: 404)
!478 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !464, file: !464, line: 1430, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !480, line: 405)
!480 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !481, file: !481, line: 667, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
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
!499 = distinct !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !481, file: !481, line: 607, type: !34, isLocal: true, isDefinition: true, scopeLine: 608, flags: DIFlagPrototyped, isOptimized: false, unit: !10, variables: !11)
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
!547 = !DISubprogram(name: "nexttowardf", scope: !219, file: !219, line: 294, type: !548, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!7, !7, !449}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !547, line: 439)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !552, line: 440)
!552 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !464, file: !464, line: 1583, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !554, line: 441)
!554 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !464, file: !464, line: 1558, type: !47, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !556, line: 442)
!556 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !464, file: !464, line: 1563, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !558, line: 443)
!558 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !464, file: !464, line: 1135, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !560, line: 444)
!560 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !464, file: !464, line: 1597, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !26, entity: !562, line: 445)
!562 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !464, file: !464, line: 1530, type: !197, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
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
!579 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 106272, align: 32, elements: !580)
!580 = !{!581}
!581 = !DISubrange(count: 3321)
!582 = !{void (float**, float**, i32*, i32*, float, float, float, i32, float)* @_Z12IMGVF_kernelPPfS0_PiS1_fffif, !"kernel", i32 1}
!583 = !{null, !"align", i32 8}
!584 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!585 = !{null, !"align", i32 16}
!586 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!587 = !{i32 2, !"Dwarf Version", i32 4}
!588 = !{i32 2, !"Debug Info Version", i32 3}
!589 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!590 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!591 = !{i32 1, i32 2}
!592 = distinct !DISubprogram(name: "heaviside", linkageName: "_Z9heavisidef", scope: !2, file: !2, line: 31, type: !34, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !10, variables: !11)
!593 = !DILocalVariable(name: "a", arg: 1, scope: !474, file: !464, line: 1332, type: !7)
!594 = !DIExpression()
!595 = !DILocation(line: 1332, column: 43, scope: !474, inlinedAt: !596)
!596 = distinct !DILocation(line: 55, column: 43, scope: !43, inlinedAt: !597)
!597 = distinct !DILocation(line: 32, column: 10, scope: !592)
!598 = !DILocalVariable(name: "__x", arg: 1, scope: !43, file: !44, line: 55, type: !7)
!599 = !DILocation(line: 55, column: 29, scope: !43, inlinedAt: !597)
!600 = !DILocalVariable(name: "x", arg: 1, scope: !592, file: !2, line: 31, type: !7)
!601 = !DILocation(line: 31, column: 34, scope: !592)
!602 = !DILocation(line: 32, column: 15, scope: !592)
!603 = !DILocation(line: 32, column: 10, scope: !592)
!604 = !DILocation(line: 55, column: 51, scope: !43, inlinedAt: !597)
!605 = !DILocation(line: 55, column: 43, scope: !43, inlinedAt: !597)
!606 = !DILocation(line: 1334, column: 21, scope: !474, inlinedAt: !596)
!607 = !DILocation(line: 1334, column: 10, scope: !474, inlinedAt: !596)
!608 = !DILocation(line: 32, column: 18, scope: !592)
!609 = !DILocation(line: 32, column: 33, scope: !592)
!610 = !DILocation(line: 32, column: 9, scope: !592)
!611 = !DILocation(line: 32, column: 2, scope: !592)
!612 = !DILocalVariable(name: "f", arg: 1, scope: !499, file: !481, line: 607, type: !7)
!613 = !DILocation(line: 607, column: 52, scope: !499, inlinedAt: !614)
!614 = distinct !DILocation(line: 61, column: 43, scope: !72, inlinedAt: !615)
!615 = distinct !DILocation(line: 173, column: 18, scope: !616)
!616 = distinct !DILexicalBlock(scope: !617, file: !2, line: 105, column: 62)
!617 = distinct !DILexicalBlock(scope: !618, file: !2, line: 105, column: 3)
!618 = distinct !DILexicalBlock(scope: !619, file: !2, line: 105, column: 3)
!619 = distinct !DILexicalBlock(scope: !1, file: !2, line: 96, column: 62)
!620 = !DILocalVariable(name: "__x", arg: 1, scope: !72, file: !44, line: 61, type: !7)
!621 = !DILocation(line: 61, column: 29, scope: !72, inlinedAt: !615)
!622 = !DILocalVariable(name: "IMGVF_array", arg: 1, scope: !1, file: !2, line: 43, type: !5)
!623 = !DILocation(line: 43, column: 38, scope: !1)
!624 = !DILocalVariable(name: "I_array", arg: 2, scope: !1, file: !2, line: 43, type: !5)
!625 = !DILocation(line: 43, column: 59, scope: !1)
!626 = !DILocalVariable(name: "m_array", arg: 3, scope: !1, file: !2, line: 43, type: !8)
!627 = !DILocation(line: 43, column: 73, scope: !1)
!628 = !DILocalVariable(name: "n_array", arg: 4, scope: !1, file: !2, line: 43, type: !8)
!629 = !DILocation(line: 43, column: 87, scope: !1)
!630 = !DILocalVariable(name: "vx", arg: 5, scope: !1, file: !2, line: 44, type: !7)
!631 = !DILocation(line: 44, column: 15, scope: !1)
!632 = !DILocalVariable(name: "vy", arg: 6, scope: !1, file: !2, line: 44, type: !7)
!633 = !DILocation(line: 44, column: 25, scope: !1)
!634 = !DILocalVariable(name: "e", arg: 7, scope: !1, file: !2, line: 44, type: !7)
!635 = !DILocation(line: 44, column: 35, scope: !1)
!636 = !DILocalVariable(name: "max_iterations", arg: 8, scope: !1, file: !2, line: 44, type: !9)
!637 = !DILocation(line: 44, column: 42, scope: !1)
!638 = !DILocalVariable(name: "cutoff", arg: 9, scope: !1, file: !2, line: 44, type: !7)
!639 = !DILocation(line: 44, column: 64, scope: !1)
!640 = !DILocalVariable(name: "cell_num", scope: !1, file: !2, line: 57, type: !9)
!641 = !DILocation(line: 57, column: 6, scope: !1)
!642 = !DILocation(line: 78, column: 3, scope: !643, inlinedAt: !678)
!643 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !645, file: !644, line: 78, type: !648, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !10, declaration: !647, variables: !11)
!644 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!645 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !644, line: 77, size: 8, align: 8, elements: !646, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!646 = !{!647, !650, !651, !652, !663, !667, !671, !674}
!647 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !645, file: !644, line: 78, type: !648, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!648 = !DISubroutineType(types: !649)
!649 = !{!383}
!650 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !645, file: !644, line: 79, type: !648, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !645, file: !644, line: 80, type: !648, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!652 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !645, file: !644, line: 83, type: !653, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DISubroutineType(types: !654)
!654 = !{!655, !661}
!655 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !656, line: 190, size: 96, align: 32, elements: !657, identifier: "_ZTS5uint3")
!656 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!657 = !{!658, !659, !660}
!658 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !655, file: !656, line: 192, baseType: !383, size: 32, align: 32)
!659 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !655, file: !656, line: 192, baseType: !383, size: 32, align: 32, offset: 32)
!660 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !655, file: !656, line: 192, baseType: !383, size: 32, align: 32, offset: 64)
!661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!662 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !645)
!663 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !645, file: !644, line: 85, type: !664, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{null, !666}
!666 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !645, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!667 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !645, file: !644, line: 85, type: !668, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!668 = !DISubroutineType(types: !669)
!669 = !{null, !666, !670}
!670 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !662, size: 64, align: 64)
!671 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !645, file: !644, line: 85, type: !672, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!672 = !DISubroutineType(types: !673)
!673 = !{null, !661, !670}
!674 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !645, file: !644, line: 85, type: !675, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!675 = !DISubroutineType(types: !676)
!676 = !{!677, !661}
!677 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !645, size: 64, align: 64)
!678 = distinct !DILocation(line: 57, column: 17, scope: !1)
!679 = !{i32 0, i32 65535}
!680 = !DILocalVariable(name: "IMGVF_global", scope: !1, file: !2, line: 60, type: !6)
!681 = !DILocation(line: 60, column: 9, scope: !1)
!682 = !DILocation(line: 60, column: 24, scope: !1)
!683 = !DILocation(line: 60, column: 36, scope: !1)
!684 = !DILocalVariable(name: "I", scope: !1, file: !2, line: 61, type: !6)
!685 = !DILocation(line: 61, column: 9, scope: !1)
!686 = !DILocation(line: 61, column: 13, scope: !1)
!687 = !DILocation(line: 61, column: 21, scope: !1)
!688 = !DILocalVariable(name: "m", scope: !1, file: !2, line: 64, type: !9)
!689 = !DILocation(line: 64, column: 6, scope: !1)
!690 = !DILocation(line: 64, column: 10, scope: !1)
!691 = !DILocation(line: 64, column: 18, scope: !1)
!692 = !DILocalVariable(name: "n", scope: !1, file: !2, line: 65, type: !9)
!693 = !DILocation(line: 65, column: 6, scope: !1)
!694 = !DILocation(line: 65, column: 10, scope: !1)
!695 = !DILocation(line: 65, column: 18, scope: !1)
!696 = !DILocalVariable(name: "max", scope: !1, file: !2, line: 68, type: !9)
!697 = !DILocation(line: 68, column: 6, scope: !1)
!698 = !DILocation(line: 68, column: 13, scope: !1)
!699 = !DILocation(line: 68, column: 17, scope: !1)
!700 = !DILocation(line: 68, column: 15, scope: !1)
!701 = !DILocation(line: 68, column: 19, scope: !1)
!702 = !DILocation(line: 68, column: 39, scope: !1)
!703 = !DILocation(line: 68, column: 44, scope: !1)
!704 = !DILocalVariable(name: "thread_id", scope: !1, file: !2, line: 71, type: !9)
!705 = !DILocation(line: 71, column: 6, scope: !1)
!706 = !DILocation(line: 67, column: 3, scope: !707, inlinedAt: !733)
!707 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !708, file: !644, line: 67, type: !648, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !10, declaration: !710, variables: !11)
!708 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !644, line: 66, size: 8, align: 8, elements: !709, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!709 = !{!710, !711, !712, !713, !718, !722, !726, !729}
!710 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !708, file: !644, line: 67, type: !648, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!711 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !708, file: !644, line: 68, type: !648, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!712 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !708, file: !644, line: 69, type: !648, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!713 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !708, file: !644, line: 72, type: !714, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!714 = !DISubroutineType(types: !715)
!715 = !{!655, !716}
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !717, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!717 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !708)
!718 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !708, file: !644, line: 74, type: !719, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!719 = !DISubroutineType(types: !720)
!720 = !{null, !721}
!721 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !708, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!722 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !708, file: !644, line: 74, type: !723, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!723 = !DISubroutineType(types: !724)
!724 = !{null, !721, !725}
!725 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !717, size: 64, align: 64)
!726 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !708, file: !644, line: 74, type: !727, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!727 = !DISubroutineType(types: !728)
!728 = !{null, !716, !725}
!729 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !708, file: !644, line: 74, type: !730, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!730 = !DISubroutineType(types: !731)
!731 = !{!732, !716}
!732 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !708, size: 64, align: 64)
!733 = distinct !DILocation(line: 71, column: 18, scope: !1)
!734 = !{i32 0, i32 1024}
!735 = !DILocalVariable(name: "thread_block", scope: !1, file: !2, line: 71, type: !9)
!736 = !DILocation(line: 71, column: 31, scope: !1)
!737 = !DILocalVariable(name: "i", scope: !1, file: !2, line: 71, type: !9)
!738 = !DILocation(line: 71, column: 45, scope: !1)
!739 = !DILocalVariable(name: "j", scope: !1, file: !2, line: 71, type: !9)
!740 = !DILocation(line: 71, column: 48, scope: !1)
!741 = !DILocation(line: 72, column: 20, scope: !742)
!742 = distinct !DILexicalBlock(scope: !1, file: !2, line: 72, column: 2)
!743 = !DILocation(line: 72, column: 7, scope: !742)
!744 = !DILocation(line: 72, column: 25, scope: !745)
!745 = !DILexicalBlockFile(scope: !746, file: !2, discriminator: 1)
!746 = distinct !DILexicalBlock(scope: !742, file: !2, line: 72, column: 2)
!747 = !DILocation(line: 72, column: 40, scope: !745)
!748 = !DILocation(line: 72, column: 38, scope: !745)
!749 = !DILocation(line: 72, column: 2, scope: !745)
!750 = !DILocalVariable(name: "offset", scope: !751, file: !2, line: 73, type: !9)
!751 = distinct !DILexicalBlock(scope: !746, file: !2, line: 72, column: 61)
!752 = !DILocation(line: 73, column: 7, scope: !751)
!753 = !DILocation(line: 73, column: 16, scope: !751)
!754 = !DILocation(line: 73, column: 29, scope: !751)
!755 = !DILocation(line: 74, column: 8, scope: !751)
!756 = !DILocation(line: 74, column: 20, scope: !751)
!757 = !DILocation(line: 74, column: 18, scope: !751)
!758 = !DILocation(line: 74, column: 30, scope: !751)
!759 = !DILocation(line: 74, column: 28, scope: !751)
!760 = !DILocation(line: 74, column: 5, scope: !751)
!761 = !DILocation(line: 75, column: 8, scope: !751)
!762 = !DILocation(line: 75, column: 20, scope: !751)
!763 = !DILocation(line: 75, column: 18, scope: !751)
!764 = !DILocation(line: 75, column: 30, scope: !751)
!765 = !DILocation(line: 75, column: 28, scope: !751)
!766 = !DILocation(line: 75, column: 5, scope: !751)
!767 = !DILocation(line: 76, column: 7, scope: !768)
!768 = distinct !DILexicalBlock(scope: !751, file: !2, line: 76, column: 7)
!769 = !DILocation(line: 76, column: 11, scope: !768)
!770 = !DILocation(line: 76, column: 9, scope: !768)
!771 = !DILocation(line: 76, column: 7, scope: !751)
!772 = !DILocation(line: 76, column: 35, scope: !773)
!773 = !DILexicalBlockFile(scope: !768, file: !2, discriminator: 1)
!774 = !DILocation(line: 76, column: 49, scope: !773)
!775 = !DILocation(line: 76, column: 53, scope: !773)
!776 = !DILocation(line: 76, column: 51, scope: !773)
!777 = !DILocation(line: 76, column: 58, scope: !773)
!778 = !DILocation(line: 76, column: 56, scope: !773)
!779 = !DILocation(line: 76, column: 21, scope: !773)
!780 = !DILocation(line: 76, column: 25, scope: !773)
!781 = !DILocation(line: 76, column: 23, scope: !773)
!782 = !DILocation(line: 76, column: 30, scope: !773)
!783 = !DILocation(line: 76, column: 28, scope: !773)
!784 = !DILocation(line: 76, column: 14, scope: !773)
!785 = !DILocation(line: 76, column: 33, scope: !773)
!786 = !DILocation(line: 77, column: 2, scope: !751)
!787 = !DILocation(line: 72, column: 57, scope: !788)
!788 = !DILexicalBlockFile(scope: !746, file: !2, discriminator: 2)
!789 = !DILocation(line: 72, column: 2, scope: !788)
!790 = distinct !{!790, !791}
!791 = !DILocation(line: 72, column: 2, scope: !1)
!792 = !DILocation(line: 78, column: 2, scope: !1)
!793 = !DILocation(line: 67, column: 3, scope: !707, inlinedAt: !794)
!794 = distinct !DILocation(line: 82, column: 6, scope: !795)
!795 = distinct !DILexicalBlock(scope: !1, file: !2, line: 82, column: 6)
!796 = !DILocation(line: 82, column: 18, scope: !795)
!797 = !DILocation(line: 82, column: 6, scope: !1)
!798 = !DILocation(line: 82, column: 39, scope: !799)
!799 = !DILexicalBlockFile(scope: !795, file: !2, discriminator: 1)
!800 = !DILocation(line: 82, column: 24, scope: !799)
!801 = !DILocation(line: 83, column: 2, scope: !1)
!802 = !DILocalVariable(name: "one_nth", scope: !1, file: !2, line: 86, type: !803)
!803 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!804 = !DILocation(line: 86, column: 14, scope: !1)
!805 = !DILocation(line: 86, column: 38, scope: !1)
!806 = !DILocation(line: 86, column: 28, scope: !1)
!807 = !DILocalVariable(name: "tid_mod", scope: !1, file: !2, line: 87, type: !19)
!808 = !DILocation(line: 87, column: 12, scope: !1)
!809 = !DILocation(line: 87, column: 22, scope: !1)
!810 = !DILocation(line: 87, column: 34, scope: !1)
!811 = !DILocation(line: 87, column: 32, scope: !1)
!812 = !DILocalVariable(name: "tbsize_mod", scope: !1, file: !2, line: 88, type: !19)
!813 = !DILocation(line: 88, column: 12, scope: !1)
!814 = !DILocation(line: 88, column: 45, scope: !1)
!815 = !DILocation(line: 88, column: 43, scope: !1)
!816 = !DILocalVariable(name: "one_over_e", scope: !1, file: !2, line: 91, type: !7)
!817 = !DILocation(line: 91, column: 8, scope: !1)
!818 = !DILocation(line: 91, column: 27, scope: !1)
!819 = !DILocation(line: 91, column: 25, scope: !1)
!820 = !DILocation(line: 91, column: 21, scope: !1)
!821 = !DILocalVariable(name: "iterations", scope: !1, file: !2, line: 95, type: !9)
!822 = !DILocation(line: 95, column: 6, scope: !1)
!823 = !DILocation(line: 96, column: 2, scope: !1)
!824 = !DILocation(line: 96, column: 12, scope: !825)
!825 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 1)
!826 = !DILocation(line: 96, column: 28, scope: !825)
!827 = !DILocation(line: 96, column: 32, scope: !828)
!828 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 2)
!829 = !DILocation(line: 96, column: 45, scope: !828)
!830 = !DILocation(line: 96, column: 43, scope: !828)
!831 = !DILocation(line: 96, column: 2, scope: !832)
!832 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 3)
!833 = !DILocalVariable(name: "total_diff", scope: !619, file: !2, line: 99, type: !7)
!834 = !DILocation(line: 99, column: 9, scope: !619)
!835 = !DILocalVariable(name: "old_i", scope: !619, file: !2, line: 101, type: !9)
!836 = !DILocation(line: 101, column: 7, scope: !619)
!837 = !DILocalVariable(name: "old_j", scope: !619, file: !2, line: 101, type: !9)
!838 = !DILocation(line: 101, column: 18, scope: !619)
!839 = !DILocation(line: 102, column: 7, scope: !619)
!840 = !DILocation(line: 102, column: 17, scope: !619)
!841 = !DILocation(line: 102, column: 15, scope: !619)
!842 = !DILocation(line: 102, column: 5, scope: !619)
!843 = !DILocation(line: 105, column: 21, scope: !618)
!844 = !DILocation(line: 105, column: 8, scope: !618)
!845 = !DILocation(line: 105, column: 26, scope: !846)
!846 = !DILexicalBlockFile(scope: !617, file: !2, discriminator: 1)
!847 = !DILocation(line: 105, column: 41, scope: !846)
!848 = !DILocation(line: 105, column: 39, scope: !846)
!849 = !DILocation(line: 105, column: 3, scope: !846)
!850 = !DILocation(line: 108, column: 12, scope: !616)
!851 = !DILocation(line: 108, column: 10, scope: !616)
!852 = !DILocation(line: 109, column: 12, scope: !616)
!853 = !DILocation(line: 109, column: 10, scope: !616)
!854 = !DILocalVariable(name: "offset", scope: !616, file: !2, line: 112, type: !9)
!855 = !DILocation(line: 112, column: 8, scope: !616)
!856 = !DILocation(line: 112, column: 17, scope: !616)
!857 = !DILocation(line: 112, column: 30, scope: !616)
!858 = !DILocation(line: 113, column: 9, scope: !616)
!859 = !DILocation(line: 113, column: 21, scope: !616)
!860 = !DILocation(line: 113, column: 19, scope: !616)
!861 = !DILocation(line: 113, column: 8, scope: !616)
!862 = !DILocation(line: 113, column: 31, scope: !616)
!863 = !DILocation(line: 113, column: 29, scope: !616)
!864 = !DILocation(line: 113, column: 6, scope: !616)
!865 = !DILocation(line: 114, column: 9, scope: !616)
!866 = !DILocation(line: 114, column: 6, scope: !616)
!867 = !DILocation(line: 115, column: 8, scope: !868)
!868 = distinct !DILexicalBlock(scope: !616, file: !2, line: 115, column: 8)
!869 = !DILocation(line: 115, column: 13, scope: !868)
!870 = !DILocation(line: 115, column: 10, scope: !868)
!871 = !DILocation(line: 115, column: 8, scope: !616)
!872 = !DILocation(line: 115, column: 21, scope: !873)
!873 = !DILexicalBlockFile(scope: !868, file: !2, discriminator: 1)
!874 = !DILocation(line: 115, column: 18, scope: !873)
!875 = !DILocation(line: 115, column: 16, scope: !873)
!876 = !DILocalVariable(name: "new_val", scope: !616, file: !2, line: 117, type: !7)
!877 = !DILocation(line: 117, column: 10, scope: !616)
!878 = !DILocalVariable(name: "old_val", scope: !616, file: !2, line: 117, type: !7)
!879 = !DILocation(line: 117, column: 25, scope: !616)
!880 = !DILocation(line: 120, column: 8, scope: !881)
!881 = distinct !DILexicalBlock(scope: !616, file: !2, line: 120, column: 8)
!882 = !DILocation(line: 120, column: 12, scope: !881)
!883 = !DILocation(line: 120, column: 10, scope: !881)
!884 = !DILocation(line: 120, column: 8, scope: !616)
!885 = !DILocalVariable(name: "rowU", scope: !886, file: !2, line: 122, type: !9)
!886 = distinct !DILexicalBlock(scope: !881, file: !2, line: 120, column: 15)
!887 = !DILocation(line: 122, column: 9, scope: !886)
!888 = !DILocation(line: 122, column: 17, scope: !886)
!889 = !DILocation(line: 122, column: 19, scope: !886)
!890 = !DILocation(line: 122, column: 16, scope: !886)
!891 = !DILocation(line: 122, column: 16, scope: !892)
!892 = !DILexicalBlockFile(scope: !886, file: !2, discriminator: 1)
!893 = !DILocation(line: 122, column: 31, scope: !894)
!894 = !DILexicalBlockFile(scope: !886, file: !2, discriminator: 2)
!895 = !DILocation(line: 122, column: 33, scope: !894)
!896 = !DILocation(line: 122, column: 16, scope: !894)
!897 = !DILocation(line: 122, column: 16, scope: !898)
!898 = !DILexicalBlockFile(scope: !886, file: !2, discriminator: 3)
!899 = !DILocation(line: 122, column: 9, scope: !898)
!900 = !DILocalVariable(name: "rowD", scope: !886, file: !2, line: 123, type: !9)
!901 = !DILocation(line: 123, column: 9, scope: !886)
!902 = !DILocation(line: 123, column: 17, scope: !886)
!903 = !DILocation(line: 123, column: 22, scope: !886)
!904 = !DILocation(line: 123, column: 24, scope: !886)
!905 = !DILocation(line: 123, column: 19, scope: !886)
!906 = !DILocation(line: 123, column: 16, scope: !886)
!907 = !DILocation(line: 123, column: 31, scope: !892)
!908 = !DILocation(line: 123, column: 33, scope: !892)
!909 = !DILocation(line: 123, column: 16, scope: !892)
!910 = !DILocation(line: 123, column: 39, scope: !894)
!911 = !DILocation(line: 123, column: 41, scope: !894)
!912 = !DILocation(line: 123, column: 16, scope: !894)
!913 = !DILocation(line: 123, column: 16, scope: !898)
!914 = !DILocation(line: 123, column: 9, scope: !898)
!915 = !DILocalVariable(name: "colL", scope: !886, file: !2, line: 124, type: !9)
!916 = !DILocation(line: 124, column: 9, scope: !886)
!917 = !DILocation(line: 124, column: 17, scope: !886)
!918 = !DILocation(line: 124, column: 19, scope: !886)
!919 = !DILocation(line: 124, column: 16, scope: !886)
!920 = !DILocation(line: 124, column: 16, scope: !892)
!921 = !DILocation(line: 124, column: 31, scope: !894)
!922 = !DILocation(line: 124, column: 33, scope: !894)
!923 = !DILocation(line: 124, column: 16, scope: !894)
!924 = !DILocation(line: 124, column: 16, scope: !898)
!925 = !DILocation(line: 124, column: 9, scope: !898)
!926 = !DILocalVariable(name: "colR", scope: !886, file: !2, line: 125, type: !9)
!927 = !DILocation(line: 125, column: 9, scope: !886)
!928 = !DILocation(line: 125, column: 17, scope: !886)
!929 = !DILocation(line: 125, column: 22, scope: !886)
!930 = !DILocation(line: 125, column: 24, scope: !886)
!931 = !DILocation(line: 125, column: 19, scope: !886)
!932 = !DILocation(line: 125, column: 16, scope: !886)
!933 = !DILocation(line: 125, column: 31, scope: !892)
!934 = !DILocation(line: 125, column: 33, scope: !892)
!935 = !DILocation(line: 125, column: 16, scope: !892)
!936 = !DILocation(line: 125, column: 39, scope: !894)
!937 = !DILocation(line: 125, column: 41, scope: !894)
!938 = !DILocation(line: 125, column: 16, scope: !894)
!939 = !DILocation(line: 125, column: 16, scope: !898)
!940 = !DILocation(line: 125, column: 9, scope: !898)
!941 = !DILocation(line: 128, column: 22, scope: !886)
!942 = !DILocation(line: 128, column: 26, scope: !886)
!943 = !DILocation(line: 128, column: 24, scope: !886)
!944 = !DILocation(line: 128, column: 31, scope: !886)
!945 = !DILocation(line: 128, column: 29, scope: !886)
!946 = !DILocation(line: 128, column: 15, scope: !886)
!947 = !DILocation(line: 128, column: 13, scope: !886)
!948 = !DILocalVariable(name: "U", scope: !886, file: !2, line: 129, type: !7)
!949 = !DILocation(line: 129, column: 11, scope: !886)
!950 = !DILocation(line: 129, column: 23, scope: !886)
!951 = !DILocation(line: 129, column: 30, scope: !886)
!952 = !DILocation(line: 129, column: 28, scope: !886)
!953 = !DILocation(line: 129, column: 35, scope: !886)
!954 = !DILocation(line: 129, column: 33, scope: !886)
!955 = !DILocation(line: 129, column: 16, scope: !886)
!956 = !DILocation(line: 129, column: 43, scope: !886)
!957 = !DILocation(line: 129, column: 41, scope: !886)
!958 = !DILocalVariable(name: "D", scope: !886, file: !2, line: 130, type: !7)
!959 = !DILocation(line: 130, column: 11, scope: !886)
!960 = !DILocation(line: 130, column: 23, scope: !886)
!961 = !DILocation(line: 130, column: 30, scope: !886)
!962 = !DILocation(line: 130, column: 28, scope: !886)
!963 = !DILocation(line: 130, column: 35, scope: !886)
!964 = !DILocation(line: 130, column: 33, scope: !886)
!965 = !DILocation(line: 130, column: 16, scope: !886)
!966 = !DILocation(line: 130, column: 43, scope: !886)
!967 = !DILocation(line: 130, column: 41, scope: !886)
!968 = !DILocalVariable(name: "L", scope: !886, file: !2, line: 131, type: !7)
!969 = !DILocation(line: 131, column: 11, scope: !886)
!970 = !DILocation(line: 131, column: 23, scope: !886)
!971 = !DILocation(line: 131, column: 30, scope: !886)
!972 = !DILocation(line: 131, column: 28, scope: !886)
!973 = !DILocation(line: 131, column: 35, scope: !886)
!974 = !DILocation(line: 131, column: 33, scope: !886)
!975 = !DILocation(line: 131, column: 16, scope: !886)
!976 = !DILocation(line: 131, column: 43, scope: !886)
!977 = !DILocation(line: 131, column: 41, scope: !886)
!978 = !DILocalVariable(name: "R", scope: !886, file: !2, line: 132, type: !7)
!979 = !DILocation(line: 132, column: 11, scope: !886)
!980 = !DILocation(line: 132, column: 23, scope: !886)
!981 = !DILocation(line: 132, column: 30, scope: !886)
!982 = !DILocation(line: 132, column: 28, scope: !886)
!983 = !DILocation(line: 132, column: 35, scope: !886)
!984 = !DILocation(line: 132, column: 33, scope: !886)
!985 = !DILocation(line: 132, column: 16, scope: !886)
!986 = !DILocation(line: 132, column: 43, scope: !886)
!987 = !DILocation(line: 132, column: 41, scope: !886)
!988 = !DILocalVariable(name: "UR", scope: !886, file: !2, line: 133, type: !7)
!989 = !DILocation(line: 133, column: 11, scope: !886)
!990 = !DILocation(line: 133, column: 23, scope: !886)
!991 = !DILocation(line: 133, column: 30, scope: !886)
!992 = !DILocation(line: 133, column: 28, scope: !886)
!993 = !DILocation(line: 133, column: 35, scope: !886)
!994 = !DILocation(line: 133, column: 33, scope: !886)
!995 = !DILocation(line: 133, column: 16, scope: !886)
!996 = !DILocation(line: 133, column: 43, scope: !886)
!997 = !DILocation(line: 133, column: 41, scope: !886)
!998 = !DILocalVariable(name: "DR", scope: !886, file: !2, line: 134, type: !7)
!999 = !DILocation(line: 134, column: 11, scope: !886)
!1000 = !DILocation(line: 134, column: 23, scope: !886)
!1001 = !DILocation(line: 134, column: 30, scope: !886)
!1002 = !DILocation(line: 134, column: 28, scope: !886)
!1003 = !DILocation(line: 134, column: 35, scope: !886)
!1004 = !DILocation(line: 134, column: 33, scope: !886)
!1005 = !DILocation(line: 134, column: 16, scope: !886)
!1006 = !DILocation(line: 134, column: 43, scope: !886)
!1007 = !DILocation(line: 134, column: 41, scope: !886)
!1008 = !DILocalVariable(name: "UL", scope: !886, file: !2, line: 135, type: !7)
!1009 = !DILocation(line: 135, column: 11, scope: !886)
!1010 = !DILocation(line: 135, column: 23, scope: !886)
!1011 = !DILocation(line: 135, column: 30, scope: !886)
!1012 = !DILocation(line: 135, column: 28, scope: !886)
!1013 = !DILocation(line: 135, column: 35, scope: !886)
!1014 = !DILocation(line: 135, column: 33, scope: !886)
!1015 = !DILocation(line: 135, column: 16, scope: !886)
!1016 = !DILocation(line: 135, column: 43, scope: !886)
!1017 = !DILocation(line: 135, column: 41, scope: !886)
!1018 = !DILocalVariable(name: "DL", scope: !886, file: !2, line: 136, type: !7)
!1019 = !DILocation(line: 136, column: 11, scope: !886)
!1020 = !DILocation(line: 136, column: 23, scope: !886)
!1021 = !DILocation(line: 136, column: 30, scope: !886)
!1022 = !DILocation(line: 136, column: 28, scope: !886)
!1023 = !DILocation(line: 136, column: 35, scope: !886)
!1024 = !DILocation(line: 136, column: 33, scope: !886)
!1025 = !DILocation(line: 136, column: 16, scope: !886)
!1026 = !DILocation(line: 136, column: 43, scope: !886)
!1027 = !DILocation(line: 136, column: 41, scope: !886)
!1028 = !DILocalVariable(name: "UHe", scope: !886, file: !2, line: 139, type: !7)
!1029 = !DILocation(line: 139, column: 11, scope: !886)
!1030 = !DILocation(line: 139, column: 29, scope: !886)
!1031 = !DILocation(line: 139, column: 41, scope: !886)
!1032 = !DILocation(line: 139, column: 40, scope: !886)
!1033 = !DILocation(line: 139, column: 32, scope: !886)
!1034 = !DILocation(line: 139, column: 48, scope: !886)
!1035 = !DILocation(line: 139, column: 46, scope: !886)
!1036 = !DILocation(line: 139, column: 18, scope: !886)
!1037 = !DILocalVariable(name: "DHe", scope: !886, file: !2, line: 140, type: !7)
!1038 = !DILocation(line: 140, column: 11, scope: !886)
!1039 = !DILocation(line: 140, column: 29, scope: !886)
!1040 = !DILocation(line: 140, column: 41, scope: !886)
!1041 = !DILocation(line: 140, column: 32, scope: !886)
!1042 = !DILocation(line: 140, column: 48, scope: !886)
!1043 = !DILocation(line: 140, column: 46, scope: !886)
!1044 = !DILocation(line: 140, column: 18, scope: !886)
!1045 = !DILocalVariable(name: "LHe", scope: !886, file: !2, line: 141, type: !7)
!1046 = !DILocation(line: 141, column: 11, scope: !886)
!1047 = !DILocation(line: 141, column: 29, scope: !886)
!1048 = !DILocation(line: 141, column: 36, scope: !886)
!1049 = !DILocation(line: 141, column: 35, scope: !886)
!1050 = !DILocation(line: 141, column: 32, scope: !886)
!1051 = !DILocation(line: 141, column: 48, scope: !886)
!1052 = !DILocation(line: 141, column: 46, scope: !886)
!1053 = !DILocation(line: 141, column: 18, scope: !886)
!1054 = !DILocalVariable(name: "RHe", scope: !886, file: !2, line: 142, type: !7)
!1055 = !DILocation(line: 142, column: 11, scope: !886)
!1056 = !DILocation(line: 142, column: 29, scope: !886)
!1057 = !DILocation(line: 142, column: 36, scope: !886)
!1058 = !DILocation(line: 142, column: 32, scope: !886)
!1059 = !DILocation(line: 142, column: 48, scope: !886)
!1060 = !DILocation(line: 142, column: 46, scope: !886)
!1061 = !DILocation(line: 142, column: 18, scope: !886)
!1062 = !DILocalVariable(name: "URHe", scope: !886, file: !2, line: 143, type: !7)
!1063 = !DILocation(line: 143, column: 11, scope: !886)
!1064 = !DILocation(line: 143, column: 29, scope: !886)
!1065 = !DILocation(line: 143, column: 36, scope: !886)
!1066 = !DILocation(line: 143, column: 41, scope: !886)
!1067 = !DILocation(line: 143, column: 39, scope: !886)
!1068 = !DILocation(line: 143, column: 32, scope: !886)
!1069 = !DILocation(line: 143, column: 48, scope: !886)
!1070 = !DILocation(line: 143, column: 46, scope: !886)
!1071 = !DILocation(line: 143, column: 18, scope: !886)
!1072 = !DILocalVariable(name: "DRHe", scope: !886, file: !2, line: 144, type: !7)
!1073 = !DILocation(line: 144, column: 11, scope: !886)
!1074 = !DILocation(line: 144, column: 29, scope: !886)
!1075 = !DILocation(line: 144, column: 36, scope: !886)
!1076 = !DILocation(line: 144, column: 41, scope: !886)
!1077 = !DILocation(line: 144, column: 39, scope: !886)
!1078 = !DILocation(line: 144, column: 32, scope: !886)
!1079 = !DILocation(line: 144, column: 48, scope: !886)
!1080 = !DILocation(line: 144, column: 46, scope: !886)
!1081 = !DILocation(line: 144, column: 18, scope: !886)
!1082 = !DILocalVariable(name: "ULHe", scope: !886, file: !2, line: 145, type: !7)
!1083 = !DILocation(line: 145, column: 11, scope: !886)
!1084 = !DILocation(line: 145, column: 29, scope: !886)
!1085 = !DILocation(line: 145, column: 36, scope: !886)
!1086 = !DILocation(line: 145, column: 35, scope: !886)
!1087 = !DILocation(line: 145, column: 41, scope: !886)
!1088 = !DILocation(line: 145, column: 39, scope: !886)
!1089 = !DILocation(line: 145, column: 32, scope: !886)
!1090 = !DILocation(line: 145, column: 48, scope: !886)
!1091 = !DILocation(line: 145, column: 46, scope: !886)
!1092 = !DILocation(line: 145, column: 18, scope: !886)
!1093 = !DILocalVariable(name: "DLHe", scope: !886, file: !2, line: 146, type: !7)
!1094 = !DILocation(line: 146, column: 11, scope: !886)
!1095 = !DILocation(line: 146, column: 29, scope: !886)
!1096 = !DILocation(line: 146, column: 36, scope: !886)
!1097 = !DILocation(line: 146, column: 35, scope: !886)
!1098 = !DILocation(line: 146, column: 41, scope: !886)
!1099 = !DILocation(line: 146, column: 39, scope: !886)
!1100 = !DILocation(line: 146, column: 32, scope: !886)
!1101 = !DILocation(line: 146, column: 48, scope: !886)
!1102 = !DILocation(line: 146, column: 46, scope: !886)
!1103 = !DILocation(line: 146, column: 18, scope: !886)
!1104 = !DILocation(line: 151, column: 15, scope: !886)
!1105 = !DILocation(line: 151, column: 42, scope: !886)
!1106 = !DILocation(line: 151, column: 49, scope: !886)
!1107 = !DILocation(line: 151, column: 47, scope: !886)
!1108 = !DILocation(line: 151, column: 54, scope: !886)
!1109 = !DILocation(line: 151, column: 61, scope: !886)
!1110 = !DILocation(line: 151, column: 59, scope: !886)
!1111 = !DILocation(line: 151, column: 52, scope: !886)
!1112 = !DILocation(line: 151, column: 66, scope: !886)
!1113 = !DILocation(line: 151, column: 73, scope: !886)
!1114 = !DILocation(line: 151, column: 71, scope: !886)
!1115 = !DILocation(line: 151, column: 64, scope: !886)
!1116 = !DILocation(line: 151, column: 78, scope: !886)
!1117 = !DILocation(line: 151, column: 85, scope: !886)
!1118 = !DILocation(line: 151, column: 83, scope: !886)
!1119 = !DILocation(line: 151, column: 76, scope: !886)
!1120 = !DILocation(line: 152, column: 15, scope: !886)
!1121 = !DILocation(line: 152, column: 22, scope: !886)
!1122 = !DILocation(line: 152, column: 20, scope: !886)
!1123 = !DILocation(line: 151, column: 87, scope: !886)
!1124 = !DILocation(line: 152, column: 27, scope: !886)
!1125 = !DILocation(line: 152, column: 34, scope: !886)
!1126 = !DILocation(line: 152, column: 32, scope: !886)
!1127 = !DILocation(line: 152, column: 25, scope: !886)
!1128 = !DILocation(line: 152, column: 39, scope: !886)
!1129 = !DILocation(line: 152, column: 46, scope: !886)
!1130 = !DILocation(line: 152, column: 44, scope: !886)
!1131 = !DILocation(line: 152, column: 37, scope: !886)
!1132 = !DILocation(line: 152, column: 51, scope: !886)
!1133 = !DILocation(line: 152, column: 58, scope: !886)
!1134 = !DILocation(line: 152, column: 56, scope: !886)
!1135 = !DILocation(line: 152, column: 49, scope: !886)
!1136 = !DILocation(line: 151, column: 41, scope: !886)
!1137 = !DILocation(line: 151, column: 39, scope: !886)
!1138 = !DILocation(line: 151, column: 23, scope: !886)
!1139 = !DILocation(line: 151, column: 13, scope: !886)
!1140 = !DILocalVariable(name: "vI", scope: !886, file: !2, line: 154, type: !7)
!1141 = !DILocation(line: 154, column: 11, scope: !886)
!1142 = !DILocation(line: 154, column: 16, scope: !886)
!1143 = !DILocation(line: 154, column: 19, scope: !886)
!1144 = !DILocation(line: 154, column: 23, scope: !886)
!1145 = !DILocation(line: 154, column: 21, scope: !886)
!1146 = !DILocation(line: 154, column: 28, scope: !886)
!1147 = !DILocation(line: 154, column: 26, scope: !886)
!1148 = !DILocation(line: 155, column: 34, scope: !886)
!1149 = !DILocation(line: 155, column: 32, scope: !886)
!1150 = !DILocation(line: 155, column: 40, scope: !886)
!1151 = !DILocation(line: 155, column: 50, scope: !886)
!1152 = !DILocation(line: 155, column: 48, scope: !886)
!1153 = !DILocation(line: 155, column: 39, scope: !886)
!1154 = !DILocation(line: 155, column: 37, scope: !886)
!1155 = !DILocation(line: 155, column: 13, scope: !886)
!1156 = !DILocation(line: 156, column: 4, scope: !886)
!1157 = !DILocation(line: 159, column: 8, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !616, file: !2, line: 159, column: 8)
!1159 = !DILocation(line: 159, column: 21, scope: !1158)
!1160 = !DILocation(line: 159, column: 8, scope: !616)
!1161 = !DILocation(line: 160, column: 15, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1158, file: !2, line: 159, column: 26)
!1163 = !DILocation(line: 160, column: 28, scope: !1162)
!1164 = !DILocation(line: 160, column: 33, scope: !1162)
!1165 = !DILocation(line: 160, column: 12, scope: !1162)
!1166 = !DILocation(line: 161, column: 9, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1162, file: !2, line: 161, column: 9)
!1168 = !DILocation(line: 161, column: 17, scope: !1167)
!1169 = !DILocation(line: 161, column: 15, scope: !1167)
!1170 = !DILocation(line: 161, column: 9, scope: !1162)
!1171 = !DILocation(line: 161, column: 56, scope: !1172)
!1172 = !DILexicalBlockFile(scope: !1167, file: !2, discriminator: 1)
!1173 = !DILocation(line: 161, column: 49, scope: !1172)
!1174 = !DILocation(line: 161, column: 27, scope: !1172)
!1175 = !DILocation(line: 161, column: 35, scope: !1172)
!1176 = !DILocation(line: 161, column: 33, scope: !1172)
!1177 = !DILocation(line: 161, column: 40, scope: !1172)
!1178 = !DILocation(line: 161, column: 38, scope: !1172)
!1179 = !DILocation(line: 161, column: 20, scope: !1172)
!1180 = !DILocation(line: 161, column: 47, scope: !1172)
!1181 = !DILocation(line: 162, column: 4, scope: !1162)
!1182 = !DILocation(line: 163, column: 8, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !616, file: !2, line: 163, column: 8)
!1184 = !DILocation(line: 163, column: 23, scope: !1183)
!1185 = !DILocation(line: 163, column: 27, scope: !1183)
!1186 = !DILocation(line: 163, column: 21, scope: !1183)
!1187 = !DILocation(line: 163, column: 8, scope: !616)
!1188 = !DILocation(line: 165, column: 25, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1183, file: !2, line: 163, column: 32)
!1190 = !DILocation(line: 165, column: 12, scope: !1189)
!1191 = !DILocation(line: 165, column: 5, scope: !1189)
!1192 = !DILocation(line: 165, column: 23, scope: !1189)
!1193 = !DILocation(line: 166, column: 4, scope: !1189)
!1194 = !DILocation(line: 169, column: 9, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1196, file: !2, line: 169, column: 9)
!1196 = distinct !DILexicalBlock(scope: !1183, file: !2, line: 166, column: 11)
!1197 = !DILocation(line: 169, column: 13, scope: !1195)
!1198 = !DILocation(line: 169, column: 11, scope: !1195)
!1199 = !DILocation(line: 169, column: 9, scope: !1196)
!1200 = !DILocation(line: 169, column: 37, scope: !1201)
!1201 = !DILexicalBlockFile(scope: !1195, file: !2, discriminator: 1)
!1202 = !DILocation(line: 169, column: 23, scope: !1201)
!1203 = !DILocation(line: 169, column: 27, scope: !1201)
!1204 = !DILocation(line: 169, column: 25, scope: !1201)
!1205 = !DILocation(line: 169, column: 32, scope: !1201)
!1206 = !DILocation(line: 169, column: 30, scope: !1201)
!1207 = !DILocation(line: 169, column: 16, scope: !1201)
!1208 = !DILocation(line: 169, column: 35, scope: !1201)
!1209 = !DILocation(line: 173, column: 23, scope: !616)
!1210 = !DILocation(line: 173, column: 33, scope: !616)
!1211 = !DILocation(line: 173, column: 31, scope: !616)
!1212 = !DILocation(line: 173, column: 18, scope: !616)
!1213 = !DILocation(line: 61, column: 51, scope: !72, inlinedAt: !615)
!1214 = !DILocation(line: 61, column: 43, scope: !72, inlinedAt: !615)
!1215 = !DILocation(line: 609, column: 21, scope: !499, inlinedAt: !614)
!1216 = !DILocation(line: 609, column: 10, scope: !499, inlinedAt: !614)
!1217 = !DILocation(line: 173, column: 15, scope: !616)
!1218 = !DILocation(line: 178, column: 4, scope: !616)
!1219 = !DILocation(line: 179, column: 3, scope: !616)
!1220 = !DILocation(line: 105, column: 58, scope: !1221)
!1221 = !DILexicalBlockFile(scope: !617, file: !2, discriminator: 2)
!1222 = !DILocation(line: 105, column: 3, scope: !1221)
!1223 = distinct !{!1223, !1224}
!1224 = !DILocation(line: 105, column: 3, scope: !619)
!1225 = !DILocation(line: 183, column: 23, scope: !619)
!1226 = !DILocation(line: 183, column: 10, scope: !619)
!1227 = !DILocation(line: 183, column: 3, scope: !619)
!1228 = !DILocation(line: 183, column: 21, scope: !619)
!1229 = !DILocation(line: 184, column: 3, scope: !619)
!1230 = !DILocation(line: 187, column: 7, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !619, file: !2, line: 187, column: 7)
!1232 = !DILocation(line: 187, column: 17, scope: !1231)
!1233 = !DILocation(line: 187, column: 7, scope: !619)
!1234 = !DILocation(line: 188, column: 59, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1231, file: !2, line: 187, column: 46)
!1236 = !DILocation(line: 188, column: 52, scope: !1235)
!1237 = !DILocation(line: 188, column: 11, scope: !1235)
!1238 = !DILocation(line: 188, column: 21, scope: !1235)
!1239 = !DILocation(line: 188, column: 4, scope: !1235)
!1240 = !DILocation(line: 188, column: 49, scope: !1235)
!1241 = !DILocation(line: 189, column: 3, scope: !1235)
!1242 = !DILocation(line: 190, column: 3, scope: !619)
!1243 = !DILocalVariable(name: "th", scope: !619, file: !2, line: 193, type: !9)
!1244 = !DILocation(line: 193, column: 7, scope: !619)
!1245 = !DILocation(line: 194, column: 11, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !619, file: !2, line: 194, column: 3)
!1247 = !DILocation(line: 194, column: 8, scope: !1246)
!1248 = !DILocation(line: 194, column: 43, scope: !1249)
!1249 = !DILexicalBlockFile(scope: !1250, file: !2, discriminator: 1)
!1250 = distinct !DILexicalBlock(scope: !1246, file: !2, line: 194, column: 3)
!1251 = !DILocation(line: 194, column: 46, scope: !1249)
!1252 = !DILocation(line: 194, column: 3, scope: !1249)
!1253 = !DILocation(line: 195, column: 8, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1255, file: !2, line: 195, column: 8)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !2, line: 194, column: 60)
!1256 = !DILocation(line: 195, column: 20, scope: !1254)
!1257 = !DILocation(line: 195, column: 18, scope: !1254)
!1258 = !DILocation(line: 195, column: 8, scope: !1255)
!1259 = !DILocation(line: 196, column: 33, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1254, file: !2, line: 195, column: 24)
!1261 = !DILocation(line: 196, column: 45, scope: !1260)
!1262 = !DILocation(line: 196, column: 43, scope: !1260)
!1263 = !DILocation(line: 196, column: 26, scope: !1260)
!1264 = !DILocation(line: 196, column: 12, scope: !1260)
!1265 = !DILocation(line: 196, column: 5, scope: !1260)
!1266 = !DILocation(line: 196, column: 23, scope: !1260)
!1267 = !DILocation(line: 197, column: 4, scope: !1260)
!1268 = !DILocation(line: 198, column: 4, scope: !1255)
!1269 = !DILocation(line: 199, column: 3, scope: !1255)
!1270 = !DILocation(line: 194, column: 54, scope: !1271)
!1271 = !DILexicalBlockFile(scope: !1250, file: !2, discriminator: 2)
!1272 = !DILocation(line: 194, column: 3, scope: !1271)
!1273 = distinct !{!1273, !1274}
!1274 = !DILocation(line: 194, column: 3, scope: !619)
!1275 = !DILocation(line: 202, column: 6, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !619, file: !2, line: 202, column: 6)
!1277 = !DILocation(line: 202, column: 16, scope: !1276)
!1278 = !DILocation(line: 202, column: 6, scope: !619)
!1279 = !DILocalVariable(name: "mean", scope: !1280, file: !2, line: 203, type: !7)
!1280 = distinct !DILexicalBlock(scope: !1276, file: !2, line: 202, column: 22)
!1281 = !DILocation(line: 203, column: 10, scope: !1280)
!1282 = !DILocation(line: 203, column: 24, scope: !1280)
!1283 = !DILocation(line: 203, column: 17, scope: !1280)
!1284 = !DILocation(line: 203, column: 46, scope: !1280)
!1285 = !DILocation(line: 203, column: 50, scope: !1280)
!1286 = !DILocation(line: 203, column: 48, scope: !1280)
!1287 = !DILocation(line: 203, column: 45, scope: !1280)
!1288 = !DILocation(line: 203, column: 35, scope: !1280)
!1289 = !DILocation(line: 204, column: 8, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1280, file: !2, line: 204, column: 8)
!1291 = !DILocation(line: 204, column: 15, scope: !1290)
!1292 = !DILocation(line: 204, column: 13, scope: !1290)
!1293 = !DILocation(line: 204, column: 8, scope: !1280)
!1294 = !DILocation(line: 206, column: 20, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1290, file: !2, line: 204, column: 23)
!1296 = !DILocation(line: 207, column: 4, scope: !1295)
!1297 = !DILocation(line: 208, column: 3, scope: !1280)
!1298 = !DILocation(line: 212, column: 3, scope: !619)
!1299 = !DILocation(line: 215, column: 13, scope: !619)
!1300 = !DILocation(line: 96, column: 2, scope: !1301)
!1301 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 4)
!1302 = distinct !{!1302, !823}
!1303 = !DILocation(line: 219, column: 20, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1, file: !2, line: 219, column: 2)
!1305 = !DILocation(line: 219, column: 7, scope: !1304)
!1306 = !DILocation(line: 219, column: 25, scope: !1307)
!1307 = !DILexicalBlockFile(scope: !1308, file: !2, discriminator: 1)
!1308 = distinct !DILexicalBlock(scope: !1304, file: !2, line: 219, column: 2)
!1309 = !DILocation(line: 219, column: 40, scope: !1307)
!1310 = !DILocation(line: 219, column: 38, scope: !1307)
!1311 = !DILocation(line: 219, column: 2, scope: !1307)
!1312 = !DILocalVariable(name: "offset", scope: !1313, file: !2, line: 220, type: !9)
!1313 = distinct !DILexicalBlock(scope: !1308, file: !2, line: 219, column: 61)
!1314 = !DILocation(line: 220, column: 7, scope: !1313)
!1315 = !DILocation(line: 220, column: 16, scope: !1313)
!1316 = !DILocation(line: 220, column: 29, scope: !1313)
!1317 = !DILocation(line: 221, column: 8, scope: !1313)
!1318 = !DILocation(line: 221, column: 20, scope: !1313)
!1319 = !DILocation(line: 221, column: 18, scope: !1313)
!1320 = !DILocation(line: 221, column: 30, scope: !1313)
!1321 = !DILocation(line: 221, column: 28, scope: !1313)
!1322 = !DILocation(line: 221, column: 5, scope: !1313)
!1323 = !DILocation(line: 222, column: 8, scope: !1313)
!1324 = !DILocation(line: 222, column: 20, scope: !1313)
!1325 = !DILocation(line: 222, column: 18, scope: !1313)
!1326 = !DILocation(line: 222, column: 30, scope: !1313)
!1327 = !DILocation(line: 222, column: 28, scope: !1313)
!1328 = !DILocation(line: 222, column: 5, scope: !1313)
!1329 = !DILocation(line: 223, column: 7, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1313, file: !2, line: 223, column: 7)
!1331 = !DILocation(line: 223, column: 11, scope: !1330)
!1332 = !DILocation(line: 223, column: 9, scope: !1330)
!1333 = !DILocation(line: 223, column: 7, scope: !1313)
!1334 = !DILocation(line: 223, column: 49, scope: !1335)
!1335 = !DILexicalBlockFile(scope: !1330, file: !2, discriminator: 1)
!1336 = !DILocation(line: 223, column: 53, scope: !1335)
!1337 = !DILocation(line: 223, column: 51, scope: !1335)
!1338 = !DILocation(line: 223, column: 58, scope: !1335)
!1339 = !DILocation(line: 223, column: 56, scope: !1335)
!1340 = !DILocation(line: 223, column: 42, scope: !1335)
!1341 = !DILocation(line: 223, column: 14, scope: !1335)
!1342 = !DILocation(line: 223, column: 28, scope: !1335)
!1343 = !DILocation(line: 223, column: 32, scope: !1335)
!1344 = !DILocation(line: 223, column: 30, scope: !1335)
!1345 = !DILocation(line: 223, column: 37, scope: !1335)
!1346 = !DILocation(line: 223, column: 35, scope: !1335)
!1347 = !DILocation(line: 223, column: 40, scope: !1335)
!1348 = !DILocation(line: 224, column: 2, scope: !1313)
!1349 = !DILocation(line: 219, column: 57, scope: !1350)
!1350 = !DILexicalBlockFile(scope: !1308, file: !2, discriminator: 2)
!1351 = !DILocation(line: 219, column: 2, scope: !1350)
!1352 = distinct !{!1352, !1353}
!1353 = !DILocation(line: 219, column: 2, scope: !1)
!1354 = !DILocation(line: 225, column: 1, scope: !1)
