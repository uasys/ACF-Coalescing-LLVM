; ModuleID = './kernel/kernel_gpu_cuda_wrapper.cu'
source_filename = "./kernel/kernel_gpu_cuda_wrapper.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.FOUR_VECTOR = type { double, double, double, double }
%struct.par_str = type { double }
%struct.dim_str = type { i32, i32, i32, i32, i64, i64, i64, i64, i64 }
%struct.box_str = type { i32, i32, i32, i32, i64, i32, [26 x %struct.nei_str] }
%struct.nei_str = type { i32, i32, i32, i32, i64 }
%struct.THREE_VECTOR = type { double, double, double }

@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared = internal addrspace(3) global [100 x %struct.FOUR_VECTOR] zeroinitializer, align 8, !dbg !0
@_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared = internal addrspace(3) global [100 x %struct.FOUR_VECTOR] zeroinitializer, align 8, !dbg !61
@_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9qB_shared = internal addrspace(3) global [100 x double] zeroinitializer, align 8, !dbg !65
@"$str" = private addrspace(1) constant [11 x i8] c"__CUDA_FTZ\00"

; Function Attrs: convergent nounwind
define void @_Z15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_(%struct.par_str* byval align 8 %d_par_gpu, %struct.dim_str* byval align 8 %d_dim_gpu, %struct.box_str* %d_box_gpu, %struct.FOUR_VECTOR* %d_rv_gpu, double* %d_qv_gpu, %struct.FOUR_VECTOR* %d_fv_gpu) #0 !dbg !1 {
entry:
  %a.addr.i = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr.i, metadata !631, metadata !634), !dbg !635
  %d_box_gpu.addr = alloca %struct.box_str*, align 8
  %d_rv_gpu.addr = alloca %struct.FOUR_VECTOR*, align 8
  %d_qv_gpu.addr = alloca double*, align 8
  %d_fv_gpu.addr = alloca %struct.FOUR_VECTOR*, align 8
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %wtx = alloca i32, align 4
  %a2 = alloca double, align 8
  %first_i = alloca i32, align 4
  %rA = alloca %struct.FOUR_VECTOR*, align 8
  %fA = alloca %struct.FOUR_VECTOR*, align 8
  %pointer = alloca i32, align 4
  %k = alloca i32, align 4
  %first_j = alloca i32, align 4
  %rB = alloca %struct.FOUR_VECTOR*, align 8
  %qB = alloca double*, align 8
  %j = alloca i32, align 4
  %r2 = alloca double, align 8
  %u2 = alloca double, align 8
  %vij = alloca double, align 8
  %fs = alloca double, align 8
  %fxij = alloca double, align 8
  %fyij = alloca double, align 8
  %fzij = alloca double, align 8
  %d = alloca %struct.THREE_VECTOR, align 8
  call void @llvm.dbg.declare(metadata %struct.par_str* %d_par_gpu, metadata !646, metadata !634), !dbg !647
  call void @llvm.dbg.declare(metadata %struct.dim_str* %d_dim_gpu, metadata !648, metadata !634), !dbg !649
  store %struct.box_str* %d_box_gpu, %struct.box_str** %d_box_gpu.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.box_str** %d_box_gpu.addr, metadata !650, metadata !634), !dbg !651
  store %struct.FOUR_VECTOR* %d_rv_gpu, %struct.FOUR_VECTOR** %d_rv_gpu.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.FOUR_VECTOR** %d_rv_gpu.addr, metadata !652, metadata !634), !dbg !653
  store double* %d_qv_gpu, double** %d_qv_gpu.addr, align 8
  call void @llvm.dbg.declare(metadata double** %d_qv_gpu.addr, metadata !654, metadata !634), !dbg !655
  store %struct.FOUR_VECTOR* %d_fv_gpu, %struct.FOUR_VECTOR** %d_fv_gpu.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.FOUR_VECTOR** %d_fv_gpu.addr, metadata !656, metadata !634), !dbg !657
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !658, metadata !634), !dbg !659
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #4, !dbg !660, !range !697
  store i32 %0, i32* %bx, align 4, !dbg !659
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !698, metadata !634), !dbg !699
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4, !dbg !700, !range !728
  store i32 %1, i32* %tx, align 4, !dbg !699
  call void @llvm.dbg.declare(metadata i32* %wtx, metadata !729, metadata !634), !dbg !730
  %2 = load i32, i32* %tx, align 4, !dbg !731
  store i32 %2, i32* %wtx, align 4, !dbg !730
  %3 = load i32, i32* %bx, align 4, !dbg !732
  %conv = sext i32 %3 to i64, !dbg !732
  %number_boxes = getelementptr inbounds %struct.dim_str, %struct.dim_str* %d_dim_gpu, i32 0, i32 4, !dbg !733
  %4 = load i64, i64* %number_boxes, align 8, !dbg !733
  %cmp = icmp slt i64 %conv, %4, !dbg !734
  br i1 %cmp, label %if.then, label %if.end145, !dbg !735

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata double* %a2, metadata !736, metadata !634), !dbg !737
  %alpha = getelementptr inbounds %struct.par_str, %struct.par_str* %d_par_gpu, i32 0, i32 0, !dbg !738
  %5 = load double, double* %alpha, align 8, !dbg !738
  %mul = fmul double 2.000000e+00, %5, !dbg !739
  %alpha2 = getelementptr inbounds %struct.par_str, %struct.par_str* %d_par_gpu, i32 0, i32 0, !dbg !740
  %6 = load double, double* %alpha2, align 8, !dbg !740
  %mul3 = fmul double %mul, %6, !dbg !741
  store double %mul3, double* %a2, align 8, !dbg !737
  call void @llvm.dbg.declare(metadata i32* %first_i, metadata !742, metadata !634), !dbg !743
  call void @llvm.dbg.declare(metadata %struct.FOUR_VECTOR** %rA, metadata !744, metadata !634), !dbg !745
  call void @llvm.dbg.declare(metadata %struct.FOUR_VECTOR** %fA, metadata !746, metadata !634), !dbg !747
  call void @llvm.dbg.declare(metadata i32* %pointer, metadata !748, metadata !634), !dbg !749
  call void @llvm.dbg.declare(metadata i32* %k, metadata !750, metadata !634), !dbg !751
  store i32 0, i32* %k, align 4, !dbg !751
  call void @llvm.dbg.declare(metadata i32* %first_j, metadata !752, metadata !634), !dbg !753
  call void @llvm.dbg.declare(metadata %struct.FOUR_VECTOR** %rB, metadata !754, metadata !634), !dbg !755
  call void @llvm.dbg.declare(metadata double** %qB, metadata !756, metadata !634), !dbg !757
  call void @llvm.dbg.declare(metadata i32* %j, metadata !758, metadata !634), !dbg !759
  store i32 0, i32* %j, align 4, !dbg !759
  call void @llvm.dbg.declare(metadata double* %r2, metadata !760, metadata !634), !dbg !761
  call void @llvm.dbg.declare(metadata double* %u2, metadata !762, metadata !634), !dbg !763
  call void @llvm.dbg.declare(metadata double* %vij, metadata !764, metadata !634), !dbg !765
  call void @llvm.dbg.declare(metadata double* %fs, metadata !766, metadata !634), !dbg !767
  call void @llvm.dbg.declare(metadata double* %fxij, metadata !768, metadata !634), !dbg !769
  call void @llvm.dbg.declare(metadata double* %fyij, metadata !770, metadata !634), !dbg !771
  call void @llvm.dbg.declare(metadata double* %fzij, metadata !772, metadata !634), !dbg !773
  call void @llvm.dbg.declare(metadata %struct.THREE_VECTOR* %d, metadata !774, metadata !634), !dbg !781
  %7 = load %struct.box_str*, %struct.box_str** %d_box_gpu.addr, align 8, !dbg !782
  %8 = load i32, i32* %bx, align 4, !dbg !783
  %idxprom = sext i32 %8 to i64, !dbg !782
  %arrayidx = getelementptr inbounds %struct.box_str, %struct.box_str* %7, i64 %idxprom, !dbg !782
  %offset = getelementptr inbounds %struct.box_str, %struct.box_str* %arrayidx, i32 0, i32 4, !dbg !784
  %9 = load i64, i64* %offset, align 8, !dbg !784
  %conv4 = trunc i64 %9 to i32, !dbg !782
  store i32 %conv4, i32* %first_i, align 4, !dbg !785
  %10 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %d_rv_gpu.addr, align 8, !dbg !786
  %11 = load i32, i32* %first_i, align 4, !dbg !787
  %idxprom5 = sext i32 %11 to i64, !dbg !786
  %arrayidx6 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %10, i64 %idxprom5, !dbg !786
  store %struct.FOUR_VECTOR* %arrayidx6, %struct.FOUR_VECTOR** %rA, align 8, !dbg !788
  %12 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %d_fv_gpu.addr, align 8, !dbg !789
  %13 = load i32, i32* %first_i, align 4, !dbg !790
  %idxprom7 = sext i32 %13 to i64, !dbg !789
  %arrayidx8 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %12, i64 %idxprom7, !dbg !789
  store %struct.FOUR_VECTOR* %arrayidx8, %struct.FOUR_VECTOR** %fA, align 8, !dbg !791
  br label %while.cond, !dbg !792

while.cond:                                       ; preds = %while.body, %if.then
  %14 = load i32, i32* %wtx, align 4, !dbg !793
  %cmp9 = icmp slt i32 %14, 100, !dbg !795
  br i1 %cmp9, label %while.body, label %while.end, !dbg !796

while.body:                                       ; preds = %while.cond
  %15 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %rA, align 8, !dbg !797
  %16 = load i32, i32* %wtx, align 4, !dbg !799
  %idxprom10 = sext i32 %16 to i64, !dbg !797
  %arrayidx11 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %15, i64 %idxprom10, !dbg !797
  %17 = load i32, i32* %wtx, align 4, !dbg !800
  %idxprom12 = sext i32 %17 to i64, !dbg !801
  %arrayidx13 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom12, !dbg !801
  %18 = bitcast %struct.FOUR_VECTOR* %arrayidx13 to i8*, !dbg !802
  %19 = bitcast %struct.FOUR_VECTOR* %arrayidx11 to i8*, !dbg !802
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 32, i32 8, i1 false), !dbg !802
  %20 = load i32, i32* %wtx, align 4, !dbg !803
  %add = add nsw i32 %20, 128, !dbg !804
  store i32 %add, i32* %wtx, align 4, !dbg !805
  br label %while.cond, !dbg !806, !llvm.loop !808

while.end:                                        ; preds = %while.cond
  %21 = load i32, i32* %tx, align 4, !dbg !809
  store i32 %21, i32* %wtx, align 4, !dbg !810
  call void @llvm.nvvm.barrier0(), !dbg !811
  store i32 0, i32* %k, align 4, !dbg !812
  br label %for.cond, !dbg !813

for.cond:                                         ; preds = %for.inc142, %while.end
  %22 = load i32, i32* %k, align 4, !dbg !814
  %23 = load %struct.box_str*, %struct.box_str** %d_box_gpu.addr, align 8, !dbg !816
  %24 = load i32, i32* %bx, align 4, !dbg !817
  %idxprom14 = sext i32 %24 to i64, !dbg !816
  %arrayidx15 = getelementptr inbounds %struct.box_str, %struct.box_str* %23, i64 %idxprom14, !dbg !816
  %nn = getelementptr inbounds %struct.box_str, %struct.box_str* %arrayidx15, i32 0, i32 5, !dbg !818
  %25 = load i32, i32* %nn, align 8, !dbg !818
  %add16 = add nsw i32 1, %25, !dbg !819
  %cmp17 = icmp slt i32 %22, %add16, !dbg !820
  br i1 %cmp17, label %for.body, label %for.end144, !dbg !821

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %k, align 4, !dbg !822
  %cmp18 = icmp eq i32 %26, 0, !dbg !824
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !825

if.then19:                                        ; preds = %for.body
  %27 = load i32, i32* %bx, align 4, !dbg !826
  store i32 %27, i32* %pointer, align 4, !dbg !828
  br label %if.end, !dbg !829

if.else:                                          ; preds = %for.body
  %28 = load %struct.box_str*, %struct.box_str** %d_box_gpu.addr, align 8, !dbg !830
  %29 = load i32, i32* %bx, align 4, !dbg !832
  %idxprom20 = sext i32 %29 to i64, !dbg !830
  %arrayidx21 = getelementptr inbounds %struct.box_str, %struct.box_str* %28, i64 %idxprom20, !dbg !830
  %nei = getelementptr inbounds %struct.box_str, %struct.box_str* %arrayidx21, i32 0, i32 6, !dbg !833
  %30 = load i32, i32* %k, align 4, !dbg !834
  %sub = sub nsw i32 %30, 1, !dbg !835
  %idxprom22 = sext i32 %sub to i64, !dbg !830
  %arrayidx23 = getelementptr inbounds [26 x %struct.nei_str], [26 x %struct.nei_str]* %nei, i64 0, i64 %idxprom22, !dbg !830
  %number = getelementptr inbounds %struct.nei_str, %struct.nei_str* %arrayidx23, i32 0, i32 3, !dbg !836
  %31 = load i32, i32* %number, align 4, !dbg !836
  store i32 %31, i32* %pointer, align 4, !dbg !837
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then19
  %32 = load %struct.box_str*, %struct.box_str** %d_box_gpu.addr, align 8, !dbg !838
  %33 = load i32, i32* %pointer, align 4, !dbg !839
  %idxprom24 = sext i32 %33 to i64, !dbg !838
  %arrayidx25 = getelementptr inbounds %struct.box_str, %struct.box_str* %32, i64 %idxprom24, !dbg !838
  %offset26 = getelementptr inbounds %struct.box_str, %struct.box_str* %arrayidx25, i32 0, i32 4, !dbg !840
  %34 = load i64, i64* %offset26, align 8, !dbg !840
  %conv27 = trunc i64 %34 to i32, !dbg !838
  store i32 %conv27, i32* %first_j, align 4, !dbg !841
  %35 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %d_rv_gpu.addr, align 8, !dbg !842
  %36 = load i32, i32* %first_j, align 4, !dbg !843
  %idxprom28 = sext i32 %36 to i64, !dbg !842
  %arrayidx29 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %35, i64 %idxprom28, !dbg !842
  store %struct.FOUR_VECTOR* %arrayidx29, %struct.FOUR_VECTOR** %rB, align 8, !dbg !844
  %37 = load double*, double** %d_qv_gpu.addr, align 8, !dbg !845
  %38 = load i32, i32* %first_j, align 4, !dbg !846
  %idxprom30 = sext i32 %38 to i64, !dbg !845
  %arrayidx31 = getelementptr inbounds double, double* %37, i64 %idxprom30, !dbg !845
  store double* %arrayidx31, double** %qB, align 8, !dbg !847
  br label %while.cond32, !dbg !848

while.cond32:                                     ; preds = %while.body34, %if.end
  %39 = load i32, i32* %wtx, align 4, !dbg !849
  %cmp33 = icmp slt i32 %39, 100, !dbg !851
  br i1 %cmp33, label %while.body34, label %while.end44, !dbg !852

while.body34:                                     ; preds = %while.cond32
  %40 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %rB, align 8, !dbg !853
  %41 = load i32, i32* %wtx, align 4, !dbg !855
  %idxprom35 = sext i32 %41 to i64, !dbg !853
  %arrayidx36 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %40, i64 %idxprom35, !dbg !853
  %42 = load i32, i32* %wtx, align 4, !dbg !856
  %idxprom37 = sext i32 %42 to i64, !dbg !857
  %arrayidx38 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom37, !dbg !857
  %43 = bitcast %struct.FOUR_VECTOR* %arrayidx38 to i8*, !dbg !858
  %44 = bitcast %struct.FOUR_VECTOR* %arrayidx36 to i8*, !dbg !858
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 32, i32 8, i1 false), !dbg !858
  %45 = load double*, double** %qB, align 8, !dbg !859
  %46 = load i32, i32* %wtx, align 4, !dbg !860
  %idxprom39 = sext i32 %46 to i64, !dbg !859
  %arrayidx40 = getelementptr inbounds double, double* %45, i64 %idxprom39, !dbg !859
  %47 = load double, double* %arrayidx40, align 8, !dbg !859
  %48 = load i32, i32* %wtx, align 4, !dbg !861
  %idxprom41 = sext i32 %48 to i64, !dbg !862
  %arrayidx42 = getelementptr inbounds [100 x double], [100 x double]* addrspacecast ([100 x double] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9qB_shared to [100 x double]*), i64 0, i64 %idxprom41, !dbg !862
  store double %47, double* %arrayidx42, align 8, !dbg !863
  %49 = load i32, i32* %wtx, align 4, !dbg !864
  %add43 = add nsw i32 %49, 128, !dbg !865
  store i32 %add43, i32* %wtx, align 4, !dbg !866
  br label %while.cond32, !dbg !867, !llvm.loop !869

while.end44:                                      ; preds = %while.cond32
  %50 = load i32, i32* %tx, align 4, !dbg !870
  store i32 %50, i32* %wtx, align 4, !dbg !871
  call void @llvm.nvvm.barrier0(), !dbg !872
  br label %while.cond45, !dbg !873

while.cond45:                                     ; preds = %for.end, %while.end44
  %51 = load i32, i32* %wtx, align 4, !dbg !874
  %cmp46 = icmp slt i32 %51, 100, !dbg !875
  br i1 %cmp46, label %while.body47, label %while.end141, !dbg !876

while.body47:                                     ; preds = %while.cond45
  store i32 0, i32* %j, align 4, !dbg !877
  br label %for.cond48, !dbg !878

for.cond48:                                       ; preds = %for.inc, %while.body47
  %52 = load i32, i32* %j, align 4, !dbg !879
  %cmp49 = icmp slt i32 %52, 100, !dbg !881
  br i1 %cmp49, label %for.body50, label %for.end, !dbg !882

for.body50:                                       ; preds = %for.cond48
  %53 = load i32, i32* %wtx, align 4, !dbg !883
  %idxprom51 = sext i32 %53 to i64, !dbg !884
  %arrayidx52 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom51, !dbg !884
  %v = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx52, i32 0, i32 0, !dbg !885
  %54 = load double, double* %v, align 8, !dbg !885
  %55 = load i32, i32* %j, align 4, !dbg !886
  %idxprom53 = sext i32 %55 to i64, !dbg !887
  %arrayidx54 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom53, !dbg !887
  %v55 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx54, i32 0, i32 0, !dbg !888
  %56 = load double, double* %v55, align 8, !dbg !888
  %add56 = fadd double %54, %56, !dbg !889
  %57 = load i32, i32* %wtx, align 4, !dbg !890
  %idxprom57 = sext i32 %57 to i64, !dbg !890
  %arrayidx58 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom57, !dbg !890
  %x = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx58, i32 0, i32 1, !dbg !890
  %58 = load double, double* %x, align 8, !dbg !890
  %59 = load i32, i32* %j, align 4, !dbg !890
  %idxprom59 = sext i32 %59 to i64, !dbg !890
  %arrayidx60 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom59, !dbg !890
  %x61 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx60, i32 0, i32 1, !dbg !890
  %60 = load double, double* %x61, align 8, !dbg !890
  %mul62 = fmul double %58, %60, !dbg !890
  %61 = load i32, i32* %wtx, align 4, !dbg !890
  %idxprom63 = sext i32 %61 to i64, !dbg !890
  %arrayidx64 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom63, !dbg !890
  %y = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx64, i32 0, i32 2, !dbg !890
  %62 = load double, double* %y, align 8, !dbg !890
  %63 = load i32, i32* %j, align 4, !dbg !890
  %idxprom65 = sext i32 %63 to i64, !dbg !890
  %arrayidx66 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom65, !dbg !890
  %y67 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx66, i32 0, i32 2, !dbg !890
  %64 = load double, double* %y67, align 8, !dbg !890
  %mul68 = fmul double %62, %64, !dbg !890
  %add69 = fadd double %mul62, %mul68, !dbg !890
  %65 = load i32, i32* %wtx, align 4, !dbg !890
  %idxprom70 = sext i32 %65 to i64, !dbg !890
  %arrayidx71 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom70, !dbg !890
  %z = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx71, i32 0, i32 3, !dbg !890
  %66 = load double, double* %z, align 8, !dbg !890
  %67 = load i32, i32* %j, align 4, !dbg !890
  %idxprom72 = sext i32 %67 to i64, !dbg !890
  %arrayidx73 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom72, !dbg !890
  %z74 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx73, i32 0, i32 3, !dbg !890
  %68 = load double, double* %z74, align 8, !dbg !890
  %mul75 = fmul double %66, %68, !dbg !890
  %add76 = fadd double %add69, %mul75, !dbg !890
  %sub77 = fsub double %add56, %add76, !dbg !891
  store double %sub77, double* %r2, align 8, !dbg !892
  %69 = load double, double* %a2, align 8, !dbg !893
  %70 = load double, double* %r2, align 8, !dbg !894
  %mul78 = fmul double %69, %70, !dbg !895
  store double %mul78, double* %u2, align 8, !dbg !896
  %71 = load double, double* %u2, align 8, !dbg !897
  %sub79 = fsub double -0.000000e+00, %71, !dbg !898
  store double %sub79, double* %a.addr.i, align 8, !dbg !899
  %72 = load double, double* %a.addr.i, align 8, !dbg !900
  %73 = call double @llvm.nvvm.fma.rn.d(double %72, double 0x3FF71547652B82FE, double 0x4338000000000000) #4, !dbg !901
  %74 = call i32 @llvm.nvvm.d2i.lo(double %73) #4, !dbg !901
  %75 = call double @llvm.nvvm.fma.rn.d(double %72, double 0x3FF71547652B82FE, double 0x4338000000000000) #4, !dbg !901
  %76 = call double @llvm.nvvm.add.rn.d(double %75, double 0xC338000000000000) #4, !dbg !901
  %77 = call double @llvm.nvvm.fma.rn.d(double %76, double 0xBFE62E42FEFA39EF, double %72) #4, !dbg !901
  %78 = call double @llvm.nvvm.fma.rn.d(double %76, double 0xBC7ABC9E3B39803F, double %77) #4, !dbg !901
  %79 = call double @llvm.nvvm.fma.rn.d(double 0x3E5ADE1569CE2BDF, double %78, double 0x3E928AF3FCA213EA) #4, !dbg !901
  %80 = call double @llvm.nvvm.fma.rn.d(double %79, double %78, double 0x3EC71DEE62401315) #4, !dbg !901
  %81 = call double @llvm.nvvm.fma.rn.d(double %80, double %78, double 0x3EFA01997C89EB71) #4, !dbg !901
  %82 = call double @llvm.nvvm.fma.rn.d(double %81, double %78, double 0x3F2A01A014761F65) #4, !dbg !901
  %83 = call double @llvm.nvvm.fma.rn.d(double %82, double %78, double 0x3F56C16C1852B7AF) #4, !dbg !901
  %84 = call double @llvm.nvvm.fma.rn.d(double %83, double %78, double 0x3F81111111122322) #4, !dbg !901
  %85 = call double @llvm.nvvm.fma.rn.d(double %84, double %78, double 0x3FA55555555502A1) #4, !dbg !901
  %86 = call double @llvm.nvvm.fma.rn.d(double %85, double %78, double 0x3FC5555555555511) #4, !dbg !901
  %87 = call double @llvm.nvvm.fma.rn.d(double %86, double %78, double 0x3FE000000000000B) #4, !dbg !901
  %88 = call double @llvm.nvvm.fma.rn.d(double %87, double %78, double 1.000000e+00) #4, !dbg !901
  %89 = call double @llvm.nvvm.fma.rn.d(double %88, double %78, double 1.000000e+00) #4, !dbg !901
  %90 = call i32 @llvm.nvvm.d2i.lo(double %89) #4, !dbg !901
  %91 = call i32 @llvm.nvvm.d2i.hi(double %89) #4, !dbg !901
  %92 = shl i32 %74, 20, !dbg !901
  %93 = add i32 %92, %91, !dbg !901
  %94 = call double @llvm.nvvm.lohi.i2d(i32 %90, i32 %93) #4, !dbg !901
  %95 = call i32 @llvm.nvvm.d2i.hi(double %72) #4, !dbg !901
  %96 = bitcast i32 %95 to float, !dbg !901
  %97 = call float @llvm.nvvm.fabs.f(float %96) #4, !dbg !901
  %98 = fcmp olt float %97, 0x4010C46560000000, !dbg !901
  %99 = zext i1 %98 to i32, !dbg !901
  %100 = xor i1 %98, true, !dbg !901
  br i1 %100, label %101, label %_ZL3expd.exit, !dbg !901

; <label>:101:                                    ; preds = %for.body50
  %102 = fcmp olt double %72, 0.000000e+00, !dbg !901
  br i1 %102, label %103, label %104, !dbg !901

; <label>:103:                                    ; preds = %101
  br label %106, !dbg !901

; <label>:104:                                    ; preds = %101
  %105 = fadd double %72, 0x7FF0000000000000, !dbg !901
  br label %106, !dbg !901

; <label>:106:                                    ; preds = %104, %103
  %z.0.i.i = phi double [ 0.000000e+00, %103 ], [ %105, %104 ], !dbg !901
  %107 = call i32 @llvm.nvvm.d2i.hi(double %72) #4, !dbg !901
  %108 = bitcast i32 %107 to float, !dbg !901
  %109 = call float @llvm.nvvm.fabs.f(float %108) #4, !dbg !901
  %110 = fcmp olt float %109, 0x4010E90000000000, !dbg !901
  %111 = zext i1 %110 to i32, !dbg !901
  br i1 %110, label %112, label %124, !dbg !901

; <label>:112:                                    ; preds = %106
  %113 = sdiv i32 %74, 2, !dbg !901
  %114 = call i32 @llvm.nvvm.d2i.lo(double %89) #4, !dbg !901
  %115 = call i32 @llvm.nvvm.d2i.hi(double %89) #4, !dbg !901
  %116 = shl i32 %113, 20, !dbg !901
  %117 = add i32 %115, %116, !dbg !901
  %118 = call double @llvm.nvvm.lohi.i2d(i32 %114, i32 %117) #4, !dbg !901
  %119 = sub nsw i32 %74, %113, !dbg !901
  %120 = shl i32 %119, 20, !dbg !901
  %121 = add nsw i32 1072693248, %120, !dbg !901
  %122 = call double @llvm.nvvm.lohi.i2d(i32 0, i32 %121) #4, !dbg !901
  %123 = fmul double %118, %122, !dbg !901
  br label %124, !dbg !901

; <label>:124:                                    ; preds = %112, %106
  %z.1.i.i = phi double [ %123, %112 ], [ %z.0.i.i, %106 ], !dbg !901
  br label %_ZL3expd.exit, !dbg !901

_ZL3expd.exit:                                    ; preds = %for.body50, %124
  %z.2.i.i = phi double [ %z.1.i.i, %124 ], [ %94, %for.body50 ], !dbg !901
  store double %z.2.i.i, double* %vij, align 8, !dbg !902
  %125 = load double, double* %vij, align 8, !dbg !903
  %mul81 = fmul double 2.000000e+00, %125, !dbg !904
  store double %mul81, double* %fs, align 8, !dbg !905
  %126 = load i32, i32* %wtx, align 4, !dbg !906
  %idxprom82 = sext i32 %126 to i64, !dbg !907
  %arrayidx83 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom82, !dbg !907
  %x84 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx83, i32 0, i32 1, !dbg !908
  %127 = load double, double* %x84, align 8, !dbg !908
  %128 = load i32, i32* %j, align 4, !dbg !909
  %idxprom85 = sext i32 %128 to i64, !dbg !910
  %arrayidx86 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom85, !dbg !910
  %x87 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx86, i32 0, i32 1, !dbg !911
  %129 = load double, double* %x87, align 8, !dbg !911
  %sub88 = fsub double %127, %129, !dbg !912
  %x89 = getelementptr inbounds %struct.THREE_VECTOR, %struct.THREE_VECTOR* %d, i32 0, i32 0, !dbg !913
  store double %sub88, double* %x89, align 8, !dbg !914
  %130 = load double, double* %fs, align 8, !dbg !915
  %x90 = getelementptr inbounds %struct.THREE_VECTOR, %struct.THREE_VECTOR* %d, i32 0, i32 0, !dbg !916
  %131 = load double, double* %x90, align 8, !dbg !916
  %mul91 = fmul double %130, %131, !dbg !917
  store double %mul91, double* %fxij, align 8, !dbg !918
  %132 = load i32, i32* %wtx, align 4, !dbg !919
  %idxprom92 = sext i32 %132 to i64, !dbg !920
  %arrayidx93 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom92, !dbg !920
  %y94 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx93, i32 0, i32 2, !dbg !921
  %133 = load double, double* %y94, align 8, !dbg !921
  %134 = load i32, i32* %j, align 4, !dbg !922
  %idxprom95 = sext i32 %134 to i64, !dbg !923
  %arrayidx96 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom95, !dbg !923
  %y97 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx96, i32 0, i32 2, !dbg !924
  %135 = load double, double* %y97, align 8, !dbg !924
  %sub98 = fsub double %133, %135, !dbg !925
  %y99 = getelementptr inbounds %struct.THREE_VECTOR, %struct.THREE_VECTOR* %d, i32 0, i32 1, !dbg !926
  store double %sub98, double* %y99, align 8, !dbg !927
  %136 = load double, double* %fs, align 8, !dbg !928
  %y100 = getelementptr inbounds %struct.THREE_VECTOR, %struct.THREE_VECTOR* %d, i32 0, i32 1, !dbg !929
  %137 = load double, double* %y100, align 8, !dbg !929
  %mul101 = fmul double %136, %137, !dbg !930
  store double %mul101, double* %fyij, align 8, !dbg !931
  %138 = load i32, i32* %wtx, align 4, !dbg !932
  %idxprom102 = sext i32 %138 to i64, !dbg !933
  %arrayidx103 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rA_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom102, !dbg !933
  %z104 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx103, i32 0, i32 3, !dbg !934
  %139 = load double, double* %z104, align 8, !dbg !934
  %140 = load i32, i32* %j, align 4, !dbg !935
  %idxprom105 = sext i32 %140 to i64, !dbg !936
  %arrayidx106 = getelementptr inbounds [100 x %struct.FOUR_VECTOR], [100 x %struct.FOUR_VECTOR]* addrspacecast ([100 x %struct.FOUR_VECTOR] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9rB_shared to [100 x %struct.FOUR_VECTOR]*), i64 0, i64 %idxprom105, !dbg !936
  %z107 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx106, i32 0, i32 3, !dbg !937
  %141 = load double, double* %z107, align 8, !dbg !937
  %sub108 = fsub double %139, %141, !dbg !938
  %z109 = getelementptr inbounds %struct.THREE_VECTOR, %struct.THREE_VECTOR* %d, i32 0, i32 2, !dbg !939
  store double %sub108, double* %z109, align 8, !dbg !940
  %142 = load double, double* %fs, align 8, !dbg !941
  %z110 = getelementptr inbounds %struct.THREE_VECTOR, %struct.THREE_VECTOR* %d, i32 0, i32 2, !dbg !942
  %143 = load double, double* %z110, align 8, !dbg !942
  %mul111 = fmul double %142, %143, !dbg !943
  store double %mul111, double* %fzij, align 8, !dbg !944
  %144 = load i32, i32* %j, align 4, !dbg !945
  %idxprom112 = sext i32 %144 to i64, !dbg !946
  %arrayidx113 = getelementptr inbounds [100 x double], [100 x double]* addrspacecast ([100 x double] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9qB_shared to [100 x double]*), i64 0, i64 %idxprom112, !dbg !946
  %145 = load double, double* %arrayidx113, align 8, !dbg !946
  %146 = load double, double* %vij, align 8, !dbg !947
  %mul114 = fmul double %145, %146, !dbg !948
  %147 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %fA, align 8, !dbg !949
  %148 = load i32, i32* %wtx, align 4, !dbg !950
  %idxprom115 = sext i32 %148 to i64, !dbg !949
  %arrayidx116 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %147, i64 %idxprom115, !dbg !949
  %v117 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx116, i32 0, i32 0, !dbg !951
  %149 = load double, double* %v117, align 8, !dbg !952
  %add118 = fadd double %149, %mul114, !dbg !952
  store double %add118, double* %v117, align 8, !dbg !952
  %150 = load i32, i32* %j, align 4, !dbg !953
  %idxprom119 = sext i32 %150 to i64, !dbg !954
  %arrayidx120 = getelementptr inbounds [100 x double], [100 x double]* addrspacecast ([100 x double] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9qB_shared to [100 x double]*), i64 0, i64 %idxprom119, !dbg !954
  %151 = load double, double* %arrayidx120, align 8, !dbg !954
  %152 = load double, double* %fxij, align 8, !dbg !955
  %mul121 = fmul double %151, %152, !dbg !956
  %153 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %fA, align 8, !dbg !957
  %154 = load i32, i32* %wtx, align 4, !dbg !958
  %idxprom122 = sext i32 %154 to i64, !dbg !957
  %arrayidx123 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %153, i64 %idxprom122, !dbg !957
  %x124 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx123, i32 0, i32 1, !dbg !959
  %155 = load double, double* %x124, align 8, !dbg !960
  %add125 = fadd double %155, %mul121, !dbg !960
  store double %add125, double* %x124, align 8, !dbg !960
  %156 = load i32, i32* %j, align 4, !dbg !961
  %idxprom126 = sext i32 %156 to i64, !dbg !962
  %arrayidx127 = getelementptr inbounds [100 x double], [100 x double]* addrspacecast ([100 x double] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9qB_shared to [100 x double]*), i64 0, i64 %idxprom126, !dbg !962
  %157 = load double, double* %arrayidx127, align 8, !dbg !962
  %158 = load double, double* %fyij, align 8, !dbg !963
  %mul128 = fmul double %157, %158, !dbg !964
  %159 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %fA, align 8, !dbg !965
  %160 = load i32, i32* %wtx, align 4, !dbg !966
  %idxprom129 = sext i32 %160 to i64, !dbg !965
  %arrayidx130 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %159, i64 %idxprom129, !dbg !965
  %y131 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx130, i32 0, i32 2, !dbg !967
  %161 = load double, double* %y131, align 8, !dbg !968
  %add132 = fadd double %161, %mul128, !dbg !968
  store double %add132, double* %y131, align 8, !dbg !968
  %162 = load i32, i32* %j, align 4, !dbg !969
  %idxprom133 = sext i32 %162 to i64, !dbg !970
  %arrayidx134 = getelementptr inbounds [100 x double], [100 x double]* addrspacecast ([100 x double] addrspace(3)* @_ZZ15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_E9qB_shared to [100 x double]*), i64 0, i64 %idxprom133, !dbg !970
  %163 = load double, double* %arrayidx134, align 8, !dbg !970
  %164 = load double, double* %fzij, align 8, !dbg !971
  %mul135 = fmul double %163, %164, !dbg !972
  %165 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %fA, align 8, !dbg !973
  %166 = load i32, i32* %wtx, align 4, !dbg !974
  %idxprom136 = sext i32 %166 to i64, !dbg !973
  %arrayidx137 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %165, i64 %idxprom136, !dbg !973
  %z138 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %arrayidx137, i32 0, i32 3, !dbg !975
  %167 = load double, double* %z138, align 8, !dbg !976
  %add139 = fadd double %167, %mul135, !dbg !976
  store double %add139, double* %z138, align 8, !dbg !976
  br label %for.inc, !dbg !977

for.inc:                                          ; preds = %_ZL3expd.exit
  %168 = load i32, i32* %j, align 4, !dbg !978
  %inc = add nsw i32 %168, 1, !dbg !978
  store i32 %inc, i32* %j, align 4, !dbg !978
  br label %for.cond48, !dbg !980, !llvm.loop !981

for.end:                                          ; preds = %for.cond48
  %169 = load i32, i32* %wtx, align 4, !dbg !983
  %add140 = add nsw i32 %169, 128, !dbg !984
  store i32 %add140, i32* %wtx, align 4, !dbg !985
  br label %while.cond45, !dbg !986, !llvm.loop !987

while.end141:                                     ; preds = %while.cond45
  %170 = load i32, i32* %tx, align 4, !dbg !988
  store i32 %170, i32* %wtx, align 4, !dbg !989
  call void @llvm.nvvm.barrier0(), !dbg !990
  br label %for.inc142, !dbg !991

for.inc142:                                       ; preds = %while.end141
  %171 = load i32, i32* %k, align 4, !dbg !992
  %inc143 = add nsw i32 %171, 1, !dbg !992
  store i32 %inc143, i32* %k, align 4, !dbg !992
  br label %for.cond, !dbg !994, !llvm.loop !995

for.end144:                                       ; preds = %for.cond
  br label %if.end145, !dbg !997

if.end145:                                        ; preds = %for.end144, %entry
  ret void, !dbg !998
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.fma.rn.d(double, double, double) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.d2i.lo(double) #1

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.add.rn.d(double, double) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.d2i.hi(double) #1

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.lohi.i2d(i32, i32) #1

declare i32 @__nvvm_reflect(i8*)

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fabs.ftz.f(float) #1

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fabs.f(float) #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }
attributes #3 = { convergent nounwind }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!56}
!nvvm.annotations = !{!621, !622, !623, !622, !624, !624, !624, !624, !625, !625, !624}
!llvm.module.flags = !{!626, !627, !628}
!llvm.ident = !{!629}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!630}

!0 = distinct !DIGlobalVariable(name: "rA_shared", scope: !1, file: !2, line: 41, type: !62, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "kernel_gpu_cuda", linkageName: "_Z15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_", scope: !2, file: !2, line: 5, type: !3, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !56, variables: !58)
!2 = !DIFile(filename: "./kernel/./kernel_gpu_cuda.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !11, !25, !47, !55, !47}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "par_str", file: !6, line: 70, baseType: !7)
!6 = !DIFile(filename: "./kernel/./../main.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "par_str", file: !6, line: 65, size: 64, align: 64, elements: !8, identifier: "_ZTS7par_str")
!8 = !{!9}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "alpha", scope: !7, file: !6, line: 68, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim_str", file: !6, line: 88, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim_str", file: !6, line: 72, size: 448, align: 64, elements: !13, identifier: "_ZTS7dim_str")
!13 = !{!14, !16, !17, !18, !19, !21, !22, !23, !24}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "cur_arg", scope: !12, file: !6, line: 76, baseType: !15, size: 32, align: 32)
!15 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "arch_arg", scope: !12, file: !6, line: 77, baseType: !15, size: 32, align: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "cores_arg", scope: !12, file: !6, line: 78, baseType: !15, size: 32, align: 32, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "boxes1d_arg", scope: !12, file: !6, line: 79, baseType: !15, size: 32, align: 32, offset: 96)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "number_boxes", scope: !12, file: !6, line: 82, baseType: !20, size: 64, align: 64, offset: 128)
!20 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "box_mem", scope: !12, file: !6, line: 83, baseType: !20, size: 64, align: 64, offset: 192)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "space_elem", scope: !12, file: !6, line: 84, baseType: !20, size: 64, align: 64, offset: 256)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "space_mem", scope: !12, file: !6, line: 85, baseType: !20, size: 64, align: 64, offset: 320)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "space_mem2", scope: !12, file: !6, line: 86, baseType: !20, size: 64, align: 64, offset: 384)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "box_str", file: !6, line: 63, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "box_str", file: !6, line: 51, size: 5248, align: 64, elements: !28, identifier: "_ZTS7box_str")
!28 = !{!29, !30, !31, !32, !33, !34, !35}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !27, file: !6, line: 55, baseType: !15, size: 32, align: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !27, file: !6, line: 55, baseType: !15, size: 32, align: 32, offset: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !27, file: !6, line: 55, baseType: !15, size: 32, align: 32, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !27, file: !6, line: 56, baseType: !15, size: 32, align: 32, offset: 96)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !27, file: !6, line: 57, baseType: !20, size: 64, align: 64, offset: 128)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "nn", scope: !27, file: !6, line: 60, baseType: !15, size: 32, align: 32, offset: 192)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "nei", scope: !27, file: !6, line: 61, baseType: !36, size: 4992, align: 64, offset: 256)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 4992, align: 64, elements: !45)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "nei_str", file: !6, line: 49, baseType: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nei_str", file: !6, line: 41, size: 192, align: 64, elements: !39, identifier: "_ZTS7nei_str")
!39 = !{!40, !41, !42, !43, !44}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !38, file: !6, line: 45, baseType: !15, size: 32, align: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !38, file: !6, line: 45, baseType: !15, size: 32, align: 32, offset: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !38, file: !6, line: 45, baseType: !15, size: 32, align: 32, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !38, file: !6, line: 46, baseType: !15, size: 32, align: 32, offset: 96)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !38, file: !6, line: 47, baseType: !20, size: 64, align: 64, offset: 128)
!45 = !{!46}
!46 = !DISubrange(count: 26)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64, align: 64)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "FOUR_VECTOR", file: !6, line: 39, baseType: !49)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 35, size: 256, align: 64, elements: !50, identifier: "_ZTS11FOUR_VECTOR")
!50 = !{!51, !52, !53, !54}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !49, file: !6, line: 37, baseType: !10, size: 64, align: 64)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !49, file: !6, line: 37, baseType: !10, size: 64, align: 64, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !49, file: !6, line: 37, baseType: !10, size: 64, align: 64, offset: 128)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !49, file: !6, line: 37, baseType: !10, size: 64, align: 64, offset: 192)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!56 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !57, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !58, retainedTypes: !59, globals: !60, imports: !67)
!57 = !DIFile(filename: "./kernel/kernel_gpu_cuda_wrapper.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!58 = !{}
!59 = !{!10}
!60 = !{!0, !61, !65}
!61 = distinct !DIGlobalVariable(name: "rB_shared", scope: !1, file: !2, line: 50, type: !62, isLocal: true, isDefinition: true)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 25600, align: 64, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 100)
!65 = distinct !DIGlobalVariable(name: "qB_shared", scope: !1, file: !2, line: 51, type: !66, isLocal: true, isDefinition: true)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 6400, align: 64, elements: !63)
!67 = !{!68, !75, !80, !82, !84, !86, !88, !92, !94, !96, !98, !100, !102, !104, !106, !108, !110, !112, !114, !116, !118, !120, !124, !126, !128, !130, !134, !139, !141, !143, !148, !152, !154, !156, !158, !160, !162, !164, !166, !168, !172, !176, !178, !180, !184, !186, !188, !190, !192, !194, !198, !200, !202, !207, !214, !218, !220, !222, !226, !228, !230, !234, !236, !238, !242, !244, !246, !248, !250, !252, !254, !256, !258, !260, !265, !267, !269, !273, !275, !277, !279, !281, !283, !285, !287, !291, !295, !297, !299, !303, !305, !307, !309, !311, !313, !315, !319, !325, !329, !333, !338, !340, !344, !348, !362, !366, !370, !374, !378, !383, !385, !389, !393, !397, !405, !409, !413, !417, !421, !426, !432, !436, !440, !442, !450, !454, !462, !464, !466, !470, !474, !478, !483, !487, !492, !493, !494, !495, !498, !499, !500, !501, !502, !503, !504, !507, !509, !511, !513, !515, !517, !519, !521, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !548, !550, !552, !554, !556, !558, !560, !562, !564, !566, !568, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !592, !593, !595, !597, !599, !601, !603, !605, !607, !609, !611, !613, !615, !617, !619}
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !71, line: 189)
!69 = !DINamespace(name: "std", scope: null, file: !70, line: 188)
!70 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!71 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !70, file: !70, line: 44, type: !72, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74}
!74 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !76, line: 190)
!76 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !70, file: !70, line: 46, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79}
!79 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !81, line: 191)
!81 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !70, file: !70, line: 48, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !83, line: 192)
!83 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !70, file: !70, line: 50, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !85, line: 193)
!85 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !70, file: !70, line: 52, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !87, line: 194)
!87 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !70, file: !70, line: 56, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !89, line: 195)
!89 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !70, file: !70, line: 54, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DISubroutineType(types: !91)
!91 = !{!79, !79, !79}
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !93, line: 196)
!93 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !70, file: !70, line: 58, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !95, line: 197)
!95 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !70, file: !70, line: 60, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !97, line: 198)
!97 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !70, file: !70, line: 62, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !99, line: 199)
!99 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !70, file: !70, line: 64, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !101, line: 200)
!101 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !70, file: !70, line: 66, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !103, line: 201)
!103 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !70, file: !70, line: 68, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !105, line: 202)
!105 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !70, file: !70, line: 72, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !107, line: 203)
!107 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !70, file: !70, line: 70, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !109, line: 204)
!109 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !70, file: !70, line: 76, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !111, line: 205)
!111 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !70, file: !70, line: 74, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !113, line: 206)
!113 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !70, file: !70, line: 78, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !115, line: 207)
!115 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !70, file: !70, line: 80, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !117, line: 208)
!117 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !70, file: !70, line: 82, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !119, line: 209)
!119 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !70, file: !70, line: 84, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !121, line: 210)
!121 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !70, file: !70, line: 86, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DISubroutineType(types: !123)
!123 = !{!79, !79, !79, !79}
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !125, line: 211)
!125 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !70, file: !70, line: 88, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !127, line: 212)
!127 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !70, file: !70, line: 90, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !129, line: 213)
!129 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !70, file: !70, line: 92, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !131, line: 214)
!131 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !70, file: !70, line: 94, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DISubroutineType(types: !133)
!133 = !{!15, !79}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !135, line: 215)
!135 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !70, file: !70, line: 96, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DISubroutineType(types: !137)
!137 = !{!79, !79, !138}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !140, line: 216)
!140 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !70, file: !70, line: 98, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !142, line: 217)
!142 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !70, file: !70, line: 100, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !144, line: 218)
!144 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !70, file: !70, line: 102, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DISubroutineType(types: !146)
!146 = !{!147, !79}
!147 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !149, line: 219)
!149 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !70, file: !70, line: 106, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DISubroutineType(types: !151)
!151 = !{!147, !79, !79}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !153, line: 220)
!153 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !70, file: !70, line: 105, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !155, line: 221)
!155 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !70, file: !70, line: 108, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !157, line: 222)
!157 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !70, file: !70, line: 112, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !159, line: 223)
!159 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !70, file: !70, line: 111, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !161, line: 224)
!161 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !70, file: !70, line: 114, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !163, line: 225)
!163 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !70, file: !70, line: 116, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !165, line: 226)
!165 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !70, file: !70, line: 118, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !167, line: 227)
!167 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !70, file: !70, line: 120, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !169, line: 228)
!169 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !70, file: !70, line: 121, type: !170, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DISubroutineType(types: !171)
!171 = !{!20, !20}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !173, line: 229)
!173 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !70, file: !70, line: 123, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{!79, !79, !15}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !177, line: 230)
!177 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !70, file: !70, line: 125, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !179, line: 231)
!179 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !70, file: !70, line: 126, type: !72, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !181, line: 232)
!181 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !70, file: !70, line: 128, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DISubroutineType(types: !183)
!183 = !{!74, !79}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !185, line: 233)
!185 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !70, file: !70, line: 138, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !187, line: 234)
!187 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !70, file: !70, line: 130, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !189, line: 235)
!189 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !70, file: !70, line: 132, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !191, line: 236)
!191 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !70, file: !70, line: 134, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !193, line: 237)
!193 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !70, file: !70, line: 136, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !195, line: 238)
!195 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !70, file: !70, line: 140, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DISubroutineType(types: !197)
!197 = !{!20, !79}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !199, line: 239)
!199 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !70, file: !70, line: 142, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !201, line: 240)
!201 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !70, file: !70, line: 143, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !203, line: 241)
!203 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !70, file: !70, line: 145, type: !204, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DISubroutineType(types: !205)
!205 = !{!79, !79, !206}
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64, align: 64)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !208, line: 242)
!208 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !70, file: !70, line: 146, type: !209, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DISubroutineType(types: !210)
!210 = !{!10, !211}
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64, align: 64)
!212 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !213)
!213 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !215, line: 243)
!215 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !70, file: !70, line: 147, type: !216, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DISubroutineType(types: !217)
!217 = !{!79, !211}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !219, line: 244)
!219 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !70, file: !70, line: 149, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !221, line: 245)
!221 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !70, file: !70, line: 151, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !223, line: 246)
!223 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !70, file: !70, line: 153, type: !224, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DISubroutineType(types: !225)
!225 = !{!79, !79, !10}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !227, line: 247)
!227 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !70, file: !70, line: 158, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !229, line: 248)
!229 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !70, file: !70, line: 160, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !231, line: 249)
!231 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !70, file: !70, line: 162, type: !232, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{!79, !79, !79, !138}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !235, line: 250)
!235 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !70, file: !70, line: 164, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !237, line: 251)
!237 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !70, file: !70, line: 166, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !239, line: 252)
!239 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !70, file: !70, line: 168, type: !240, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DISubroutineType(types: !241)
!241 = !{!79, !79, !20}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !243, line: 253)
!243 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !70, file: !70, line: 170, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !245, line: 254)
!245 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !70, file: !70, line: 172, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !247, line: 255)
!247 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !70, file: !70, line: 174, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !249, line: 256)
!249 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !70, file: !70, line: 176, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !251, line: 257)
!251 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !70, file: !70, line: 178, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !253, line: 258)
!253 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !70, file: !70, line: 180, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !255, line: 259)
!255 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !70, file: !70, line: 182, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !257, line: 260)
!257 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !70, file: !70, line: 184, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !259, line: 261)
!259 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !70, file: !70, line: 186, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !261, line: 102)
!261 = !DISubprogram(name: "acos", scope: !262, file: !262, line: 54, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!263 = !DISubroutineType(types: !264)
!264 = !{!10, !10}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !266, line: 121)
!266 = !DISubprogram(name: "asin", scope: !262, file: !262, line: 56, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !268, line: 140)
!268 = !DISubprogram(name: "atan", scope: !262, file: !262, line: 58, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !270, line: 159)
!270 = !DISubprogram(name: "atan2", scope: !262, file: !262, line: 60, type: !271, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DISubroutineType(types: !272)
!272 = !{!10, !10, !10}
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !274, line: 180)
!274 = !DISubprogram(name: "ceil", scope: !262, file: !262, line: 178, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !276, line: 199)
!276 = !DISubprogram(name: "cos", scope: !262, file: !262, line: 63, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !278, line: 218)
!278 = !DISubprogram(name: "cosh", scope: !262, file: !262, line: 72, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !280, line: 237)
!280 = !DISubprogram(name: "exp", scope: !262, file: !262, line: 100, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !282, line: 256)
!282 = !DISubprogram(name: "fabs", scope: !262, file: !262, line: 181, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !284, line: 275)
!284 = !DISubprogram(name: "floor", scope: !262, file: !262, line: 184, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !286, line: 294)
!286 = !DISubprogram(name: "fmod", scope: !262, file: !262, line: 187, type: !271, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !288, line: 315)
!288 = !DISubprogram(name: "frexp", scope: !262, file: !262, line: 103, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DISubroutineType(types: !290)
!290 = !{!10, !10, !138}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !292, line: 334)
!292 = !DISubprogram(name: "ldexp", scope: !262, file: !262, line: 106, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!10, !10, !15}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !296, line: 353)
!296 = !DISubprogram(name: "log", scope: !262, file: !262, line: 109, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !298, line: 372)
!298 = !DISubprogram(name: "log10", scope: !262, file: !262, line: 112, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !300, line: 391)
!300 = !DISubprogram(name: "modf", scope: !262, file: !262, line: 115, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!10, !10, !55}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !304, line: 403)
!304 = !DISubprogram(name: "pow", scope: !262, file: !262, line: 153, type: !271, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !306, line: 440)
!306 = !DISubprogram(name: "sin", scope: !262, file: !262, line: 65, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !308, line: 459)
!308 = !DISubprogram(name: "sinh", scope: !262, file: !262, line: 74, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !310, line: 478)
!310 = !DISubprogram(name: "sqrt", scope: !262, file: !262, line: 156, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !312, line: 497)
!312 = !DISubprogram(name: "tan", scope: !262, file: !262, line: 67, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !314, line: 516)
!314 = !DISubprogram(name: "tanh", scope: !262, file: !262, line: 76, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !316, line: 118)
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !317, line: 101, baseType: !318)
!317 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!318 = !DICompositeType(tag: DW_TAG_structure_type, file: !317, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !320, line: 119)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !317, line: 109, baseType: !321)
!321 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !317, line: 105, size: 128, align: 64, elements: !322, identifier: "_ZTS6ldiv_t")
!322 = !{!323, !324}
!323 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !321, file: !317, line: 107, baseType: !20, size: 64, align: 64)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !321, file: !317, line: 108, baseType: !20, size: 64, align: 64, offset: 64)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !326, line: 121)
!326 = !DISubprogram(name: "abort", scope: !317, file: !317, line: 515, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{null}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !330, line: 122)
!330 = !DISubprogram(name: "abs", scope: !317, file: !317, line: 774, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{!15, !15}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !334, line: 123)
!334 = !DISubprogram(name: "atexit", scope: !317, file: !317, line: 519, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!15, !337}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 64, align: 64)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !339, line: 129)
!339 = !DISubprogram(name: "atof", scope: !317, file: !317, line: 144, type: !209, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !341, line: 130)
!341 = !DISubprogram(name: "atoi", scope: !317, file: !317, line: 147, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{!15, !211}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !345, line: 131)
!345 = !DISubprogram(name: "atol", scope: !317, file: !317, line: 150, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!20, !211}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !349, line: 132)
!349 = !DISubprogram(name: "bsearch", scope: !317, file: !317, line: 754, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DISubroutineType(types: !351)
!351 = !{!352, !353, !353, !355, !355, !358}
!352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64, align: 64)
!354 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!355 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !356, line: 62, baseType: !357)
!356 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!357 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !317, line: 741, baseType: !359)
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !360, size: 64, align: 64)
!360 = !DISubroutineType(types: !361)
!361 = !{!15, !353, !353}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !363, line: 133)
!363 = !DISubprogram(name: "calloc", scope: !317, file: !317, line: 468, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!352, !355, !355}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !367, line: 134)
!367 = !DISubprogram(name: "div", scope: !317, file: !317, line: 788, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DISubroutineType(types: !369)
!369 = !{!316, !15, !15}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !371, line: 135)
!371 = !DISubprogram(name: "exit", scope: !317, file: !317, line: 543, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!372 = !DISubroutineType(types: !373)
!373 = !{null, !15}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !375, line: 136)
!375 = !DISubprogram(name: "free", scope: !317, file: !317, line: 483, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !352}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !379, line: 137)
!379 = !DISubprogram(name: "getenv", scope: !317, file: !317, line: 564, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!382, !211}
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64, align: 64)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !384, line: 138)
!384 = !DISubprogram(name: "labs", scope: !317, file: !317, line: 775, type: !170, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !386, line: 139)
!386 = !DISubprogram(name: "ldiv", scope: !317, file: !317, line: 790, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!387 = !DISubroutineType(types: !388)
!388 = !{!320, !20, !20}
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !390, line: 140)
!390 = !DISubprogram(name: "malloc", scope: !317, file: !317, line: 466, type: !391, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!391 = !DISubroutineType(types: !392)
!392 = !{!352, !355}
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !394, line: 142)
!394 = !DISubprogram(name: "mblen", scope: !317, file: !317, line: 862, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{!15, !211, !355}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !398, line: 143)
!398 = !DISubprogram(name: "mbstowcs", scope: !317, file: !317, line: 873, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!355, !401, !404, !355}
!401 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !402)
!402 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !403, size: 64, align: 64)
!403 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!404 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !211)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !406, line: 144)
!406 = !DISubprogram(name: "mbtowc", scope: !317, file: !317, line: 865, type: !407, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!407 = !DISubroutineType(types: !408)
!408 = !{!15, !401, !404, !355}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !410, line: 146)
!410 = !DISubprogram(name: "qsort", scope: !317, file: !317, line: 764, type: !411, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!411 = !DISubroutineType(types: !412)
!412 = !{null, !352, !355, !355, !358}
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !414, line: 152)
!414 = !DISubprogram(name: "rand", scope: !317, file: !317, line: 374, type: !415, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!415 = !DISubroutineType(types: !416)
!416 = !{!15}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !418, line: 153)
!418 = !DISubprogram(name: "realloc", scope: !317, file: !317, line: 480, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!419 = !DISubroutineType(types: !420)
!420 = !{!352, !352, !355}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !422, line: 154)
!422 = !DISubprogram(name: "srand", scope: !317, file: !317, line: 376, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !425}
!425 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !427, line: 155)
!427 = !DISubprogram(name: "strtod", scope: !317, file: !317, line: 164, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{!10, !404, !430}
!430 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !431)
!431 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64, align: 64)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !433, line: 156)
!433 = !DISubprogram(name: "strtol", scope: !317, file: !317, line: 183, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!20, !404, !430, !15}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !437, line: 157)
!437 = !DISubprogram(name: "strtoul", scope: !317, file: !317, line: 187, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!357, !404, !430, !15}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !441, line: 158)
!441 = !DISubprogram(name: "system", scope: !317, file: !317, line: 716, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !443, line: 160)
!443 = !DISubprogram(name: "wcstombs", scope: !317, file: !317, line: 876, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{!355, !446, !447, !355}
!446 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !382)
!447 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !448)
!448 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !449, size: 64, align: 64)
!449 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !403)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !451, line: 161)
!451 = !DISubprogram(name: "wctomb", scope: !317, file: !317, line: 869, type: !452, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DISubroutineType(types: !453)
!453 = !{!15, !382, !403}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !457, line: 214)
!455 = !DINamespace(name: "__gnu_cxx", scope: null, file: !456, line: 220)
!456 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !317, line: 121, baseType: !458)
!458 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !317, line: 117, size: 128, align: 64, elements: !459, identifier: "_ZTS7lldiv_t")
!459 = !{!460, !461}
!460 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !458, file: !317, line: 119, baseType: !74, size: 64, align: 64)
!461 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !458, file: !317, line: 120, baseType: !74, size: 64, align: 64, offset: 64)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !463, line: 220)
!463 = !DISubprogram(name: "_Exit", scope: !317, file: !317, line: 557, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !465, line: 224)
!465 = !DISubprogram(name: "llabs", scope: !317, file: !317, line: 779, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !467, line: 230)
!467 = !DISubprogram(name: "lldiv", scope: !317, file: !317, line: 796, type: !468, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DISubroutineType(types: !469)
!469 = !{!457, !74, !74}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !471, line: 241)
!471 = !DISubprogram(name: "atoll", scope: !317, file: !317, line: 157, type: !472, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DISubroutineType(types: !473)
!473 = !{!74, !211}
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !475, line: 242)
!475 = !DISubprogram(name: "strtoll", scope: !317, file: !317, line: 209, type: !476, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DISubroutineType(types: !477)
!477 = !{!74, !404, !430, !15}
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !479, line: 243)
!479 = !DISubprogram(name: "strtoull", scope: !317, file: !317, line: 214, type: !480, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DISubroutineType(types: !481)
!481 = !{!482, !404, !430, !15}
!482 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !484, line: 245)
!484 = !DISubprogram(name: "strtof", scope: !317, file: !317, line: 172, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DISubroutineType(types: !486)
!486 = !{!79, !404, !430}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !455, entity: !488, line: 246)
!488 = !DISubprogram(name: "strtold", scope: !317, file: !317, line: 175, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DISubroutineType(types: !490)
!490 = !{!491, !404, !430}
!491 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !457, line: 254)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !463, line: 256)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !465, line: 258)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !496, line: 259)
!496 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !455, file: !497, line: 227, type: !468, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!497 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !467, line: 260)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !471, line: 262)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !484, line: 263)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !475, line: 264)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !479, line: 265)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !488, line: 266)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !505, line: 397)
!505 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !506, file: !506, line: 1342, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !508, line: 398)
!508 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !506, file: !506, line: 1370, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !510, line: 399)
!510 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !506, file: !506, line: 1337, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !512, line: 400)
!512 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !506, file: !506, line: 1375, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !514, line: 401)
!514 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !506, file: !506, line: 1327, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !516, line: 402)
!516 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !506, file: !506, line: 1332, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !518, line: 403)
!518 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !506, file: !506, line: 1380, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !520, line: 404)
!520 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !506, file: !506, line: 1430, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !522, line: 405)
!522 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !523, file: !523, line: 667, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !525, line: 406)
!525 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !506, file: !506, line: 1189, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !527, line: 407)
!527 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !506, file: !506, line: 1243, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !529, line: 408)
!529 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !506, file: !506, line: 1312, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !531, line: 409)
!531 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !506, file: !506, line: 1490, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !533, line: 410)
!533 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !506, file: !506, line: 1480, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !535, line: 411)
!535 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !523, file: !523, line: 657, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !537, line: 412)
!537 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !506, file: !506, line: 1294, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !539, line: 413)
!539 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !506, file: !506, line: 1385, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !541, line: 414)
!541 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !523, file: !523, line: 607, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !543, line: 415)
!543 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !506, file: !506, line: 1616, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !545, line: 416)
!545 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !523, file: !523, line: 597, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !547, line: 417)
!547 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !506, file: !506, line: 1568, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !549, line: 418)
!549 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !523, file: !523, line: 622, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !551, line: 419)
!551 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !523, file: !523, line: 617, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !553, line: 420)
!553 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !506, file: !506, line: 1553, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !555, line: 421)
!555 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !506, file: !506, line: 1543, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !557, line: 422)
!557 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !506, file: !506, line: 1390, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !559, line: 423)
!559 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !506, file: !506, line: 1621, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !561, line: 424)
!561 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !506, file: !506, line: 1520, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !563, line: 425)
!563 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !506, file: !506, line: 1515, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !565, line: 426)
!565 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !506, file: !506, line: 1149, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !567, line: 427)
!567 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !506, file: !506, line: 1602, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !569, line: 428)
!569 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !506, file: !506, line: 1356, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !571, line: 429)
!571 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !506, file: !506, line: 1365, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !573, line: 430)
!573 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !506, file: !506, line: 1285, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !575, line: 431)
!575 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !506, file: !506, line: 1626, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !577, line: 432)
!577 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !506, file: !506, line: 1347, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !579, line: 433)
!579 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !506, file: !506, line: 1140, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !581, line: 434)
!581 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !506, file: !506, line: 1607, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !583, line: 435)
!583 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !506, file: !506, line: 1548, type: !204, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !585, line: 436)
!585 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !506, file: !506, line: 1154, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !587, line: 437)
!587 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !506, file: !506, line: 1218, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !589, line: 438)
!589 = !DISubprogram(name: "nexttowardf", scope: !262, file: !262, line: 294, type: !590, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DISubroutineType(types: !591)
!591 = !{!79, !79, !491}
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !589, line: 439)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !594, line: 440)
!594 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !506, file: !506, line: 1583, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !596, line: 441)
!596 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !506, file: !506, line: 1558, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !598, line: 442)
!598 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !506, file: !506, line: 1563, type: !232, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !600, line: 443)
!600 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !506, file: !506, line: 1135, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !602, line: 444)
!602 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !506, file: !506, line: 1597, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !604, line: 445)
!604 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !506, file: !506, line: 1530, type: !240, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !606, line: 446)
!606 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !506, file: !506, line: 1525, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !608, line: 447)
!608 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !506, file: !506, line: 1234, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !610, line: 448)
!610 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !506, file: !506, line: 1317, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !612, line: 449)
!612 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !523, file: !523, line: 907, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !614, line: 450)
!614 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !506, file: !506, line: 1276, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !616, line: 451)
!616 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !506, file: !506, line: 1322, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !618, line: 452)
!618 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !506, file: !506, line: 1592, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !69, entity: !620, line: 453)
!620 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !523, file: !523, line: 662, type: !77, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !{void (%struct.par_str*, %struct.dim_str*, %struct.box_str*, %struct.FOUR_VECTOR*, double*, %struct.FOUR_VECTOR*)* @_Z15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_, !"kernel", i32 1}
!622 = !{null, !"align", i32 8}
!623 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!624 = !{null, !"align", i32 16}
!625 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!626 = !{i32 2, !"Dwarf Version", i32 4}
!627 = !{i32 2, !"Debug Info Version", i32 3}
!628 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!629 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!630 = !{i32 1, i32 2}
!631 = !DILocalVariable(name: "a", arg: 1, scope: !632, file: !633, line: 247, type: !10)
!632 = distinct !DISubprogram(name: "exp", linkageName: "_ZL3expd", scope: !633, file: !633, line: 247, type: !263, isLocal: true, isDefinition: true, scopeLine: 248, flags: DIFlagPrototyped, isOptimized: false, unit: !56, variables: !58)
!633 = !DIFile(filename: "/usr/local/cuda/include/math_functions_dbl_ptx3.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!634 = !DIExpression()
!635 = !DILocation(line: 247, column: 52, scope: !632, inlinedAt: !636)
!636 = distinct !DILocation(line: 168, column: 11, scope: !637)
!637 = distinct !DILexicalBlock(scope: !638, file: !2, line: 145, column: 41)
!638 = distinct !DILexicalBlock(scope: !639, file: !2, line: 145, column: 5)
!639 = distinct !DILexicalBlock(scope: !640, file: !2, line: 145, column: 5)
!640 = distinct !DILexicalBlock(scope: !641, file: !2, line: 142, column: 33)
!641 = distinct !DILexicalBlock(scope: !642, file: !2, line: 97, column: 41)
!642 = distinct !DILexicalBlock(scope: !643, file: !2, line: 97, column: 3)
!643 = distinct !DILexicalBlock(scope: !644, file: !2, line: 97, column: 3)
!644 = distinct !DILexicalBlock(scope: !645, file: !2, line: 27, column: 31)
!645 = distinct !DILexicalBlock(scope: !1, file: !2, line: 27, column: 5)
!646 = !DILocalVariable(name: "d_par_gpu", arg: 1, scope: !1, file: !2, line: 5, type: !5)
!647 = !DILocation(line: 5, column: 41, scope: !1)
!648 = !DILocalVariable(name: "d_dim_gpu", arg: 2, scope: !1, file: !2, line: 6, type: !11)
!649 = !DILocation(line: 6, column: 17, scope: !1)
!650 = !DILocalVariable(name: "d_box_gpu", arg: 3, scope: !1, file: !2, line: 7, type: !25)
!651 = !DILocation(line: 7, column: 18, scope: !1)
!652 = !DILocalVariable(name: "d_rv_gpu", arg: 4, scope: !1, file: !2, line: 8, type: !47)
!653 = !DILocation(line: 8, column: 22, scope: !1)
!654 = !DILocalVariable(name: "d_qv_gpu", arg: 5, scope: !1, file: !2, line: 9, type: !55)
!655 = !DILocation(line: 9, column: 13, scope: !1)
!656 = !DILocalVariable(name: "d_fv_gpu", arg: 6, scope: !1, file: !2, line: 10, type: !47)
!657 = !DILocation(line: 10, column: 22, scope: !1)
!658 = !DILocalVariable(name: "bx", scope: !1, file: !2, line: 17, type: !15)
!659 = !DILocation(line: 17, column: 6, scope: !1)
!660 = !DILocation(line: 78, column: 3, scope: !661, inlinedAt: !696)
!661 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !663, file: !662, line: 78, type: !666, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !56, declaration: !665, variables: !58)
!662 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!663 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !662, line: 77, size: 8, align: 8, elements: !664, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!664 = !{!665, !668, !669, !670, !681, !685, !689, !692}
!665 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !663, file: !662, line: 78, type: !666, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!666 = !DISubroutineType(types: !667)
!667 = !{!425}
!668 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !663, file: !662, line: 79, type: !666, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!669 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !663, file: !662, line: 80, type: !666, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!670 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !663, file: !662, line: 83, type: !671, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!671 = !DISubroutineType(types: !672)
!672 = !{!673, !679}
!673 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !674, line: 190, size: 96, align: 32, elements: !675, identifier: "_ZTS5uint3")
!674 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lavaMD")
!675 = !{!676, !677, !678}
!676 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !673, file: !674, line: 192, baseType: !425, size: 32, align: 32)
!677 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !673, file: !674, line: 192, baseType: !425, size: 32, align: 32, offset: 32)
!678 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !673, file: !674, line: 192, baseType: !425, size: 32, align: 32, offset: 64)
!679 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !680, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!680 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !663)
!681 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !663, file: !662, line: 85, type: !682, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!682 = !DISubroutineType(types: !683)
!683 = !{null, !684}
!684 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !663, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!685 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !663, file: !662, line: 85, type: !686, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!686 = !DISubroutineType(types: !687)
!687 = !{null, !684, !688}
!688 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !680, size: 64, align: 64)
!689 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !663, file: !662, line: 85, type: !690, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!690 = !DISubroutineType(types: !691)
!691 = !{null, !679, !688}
!692 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !663, file: !662, line: 85, type: !693, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!693 = !DISubroutineType(types: !694)
!694 = !{!695, !679}
!695 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !663, size: 64, align: 64)
!696 = distinct !DILocation(line: 17, column: 11, scope: !1)
!697 = !{i32 0, i32 65535}
!698 = !DILocalVariable(name: "tx", scope: !1, file: !2, line: 18, type: !15)
!699 = !DILocation(line: 18, column: 6, scope: !1)
!700 = !DILocation(line: 67, column: 3, scope: !701, inlinedAt: !727)
!701 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !702, file: !662, line: 67, type: !666, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !56, declaration: !704, variables: !58)
!702 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !662, line: 66, size: 8, align: 8, elements: !703, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!703 = !{!704, !705, !706, !707, !712, !716, !720, !723}
!704 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !702, file: !662, line: 67, type: !666, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!705 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !702, file: !662, line: 68, type: !666, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!706 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !702, file: !662, line: 69, type: !666, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!707 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !702, file: !662, line: 72, type: !708, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!708 = !DISubroutineType(types: !709)
!709 = !{!673, !710}
!710 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !711, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!711 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !702)
!712 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !702, file: !662, line: 74, type: !713, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!713 = !DISubroutineType(types: !714)
!714 = !{null, !715}
!715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !702, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!716 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !702, file: !662, line: 74, type: !717, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!717 = !DISubroutineType(types: !718)
!718 = !{null, !715, !719}
!719 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !711, size: 64, align: 64)
!720 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !702, file: !662, line: 74, type: !721, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!721 = !DISubroutineType(types: !722)
!722 = !{null, !710, !719}
!723 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !702, file: !662, line: 74, type: !724, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!724 = !DISubroutineType(types: !725)
!725 = !{!726, !710}
!726 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !702, size: 64, align: 64)
!727 = distinct !DILocation(line: 18, column: 11, scope: !1)
!728 = !{i32 0, i32 1024}
!729 = !DILocalVariable(name: "wtx", scope: !1, file: !2, line: 21, type: !15)
!730 = !DILocation(line: 21, column: 6, scope: !1)
!731 = !DILocation(line: 21, column: 12, scope: !1)
!732 = !DILocation(line: 27, column: 5, scope: !645)
!733 = !DILocation(line: 27, column: 18, scope: !645)
!734 = !DILocation(line: 27, column: 7, scope: !645)
!735 = !DILocation(line: 27, column: 5, scope: !1)
!736 = !DILocalVariable(name: "a2", scope: !644, file: !2, line: 35, type: !10)
!737 = !DILocation(line: 35, column: 6, scope: !644)
!738 = !DILocation(line: 35, column: 25, scope: !644)
!739 = !DILocation(line: 35, column: 14, scope: !644)
!740 = !DILocation(line: 35, column: 41, scope: !644)
!741 = !DILocation(line: 35, column: 30, scope: !644)
!742 = !DILocalVariable(name: "first_i", scope: !644, file: !2, line: 38, type: !15)
!743 = !DILocation(line: 38, column: 7, scope: !644)
!744 = !DILocalVariable(name: "rA", scope: !644, file: !2, line: 39, type: !47)
!745 = !DILocation(line: 39, column: 16, scope: !644)
!746 = !DILocalVariable(name: "fA", scope: !644, file: !2, line: 40, type: !47)
!747 = !DILocation(line: 40, column: 16, scope: !644)
!748 = !DILocalVariable(name: "pointer", scope: !644, file: !2, line: 44, type: !15)
!749 = !DILocation(line: 44, column: 7, scope: !644)
!750 = !DILocalVariable(name: "k", scope: !644, file: !2, line: 45, type: !15)
!751 = !DILocation(line: 45, column: 7, scope: !644)
!752 = !DILocalVariable(name: "first_j", scope: !644, file: !2, line: 46, type: !15)
!753 = !DILocation(line: 46, column: 7, scope: !644)
!754 = !DILocalVariable(name: "rB", scope: !644, file: !2, line: 47, type: !47)
!755 = !DILocation(line: 47, column: 16, scope: !644)
!756 = !DILocalVariable(name: "qB", scope: !644, file: !2, line: 48, type: !55)
!757 = !DILocation(line: 48, column: 7, scope: !644)
!758 = !DILocalVariable(name: "j", scope: !644, file: !2, line: 49, type: !15)
!759 = !DILocation(line: 49, column: 7, scope: !644)
!760 = !DILocalVariable(name: "r2", scope: !644, file: !2, line: 54, type: !10)
!761 = !DILocation(line: 54, column: 6, scope: !644)
!762 = !DILocalVariable(name: "u2", scope: !644, file: !2, line: 55, type: !10)
!763 = !DILocation(line: 55, column: 6, scope: !644)
!764 = !DILocalVariable(name: "vij", scope: !644, file: !2, line: 56, type: !10)
!765 = !DILocation(line: 56, column: 6, scope: !644)
!766 = !DILocalVariable(name: "fs", scope: !644, file: !2, line: 57, type: !10)
!767 = !DILocation(line: 57, column: 6, scope: !644)
!768 = !DILocalVariable(name: "fxij", scope: !644, file: !2, line: 58, type: !10)
!769 = !DILocation(line: 58, column: 6, scope: !644)
!770 = !DILocalVariable(name: "fyij", scope: !644, file: !2, line: 59, type: !10)
!771 = !DILocation(line: 59, column: 6, scope: !644)
!772 = !DILocalVariable(name: "fzij", scope: !644, file: !2, line: 60, type: !10)
!773 = !DILocation(line: 60, column: 6, scope: !644)
!774 = !DILocalVariable(name: "d", scope: !644, file: !2, line: 61, type: !775)
!775 = !DIDerivedType(tag: DW_TAG_typedef, name: "THREE_VECTOR", file: !6, line: 33, baseType: !776)
!776 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 29, size: 192, align: 64, elements: !777, identifier: "_ZTS12THREE_VECTOR")
!777 = !{!778, !779, !780}
!778 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !776, file: !6, line: 31, baseType: !10, size: 64, align: 64)
!779 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !776, file: !6, line: 31, baseType: !10, size: 64, align: 64, offset: 64)
!780 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !776, file: !6, line: 31, baseType: !10, size: 64, align: 64, offset: 128)
!781 = !DILocation(line: 61, column: 16, scope: !644)
!782 = !DILocation(line: 72, column: 13, scope: !644)
!783 = !DILocation(line: 72, column: 23, scope: !644)
!784 = !DILocation(line: 72, column: 27, scope: !644)
!785 = !DILocation(line: 72, column: 11, scope: !644)
!786 = !DILocation(line: 75, column: 9, scope: !644)
!787 = !DILocation(line: 75, column: 18, scope: !644)
!788 = !DILocation(line: 75, column: 6, scope: !644)
!789 = !DILocation(line: 76, column: 9, scope: !644)
!790 = !DILocation(line: 76, column: 18, scope: !644)
!791 = !DILocation(line: 76, column: 6, scope: !644)
!792 = !DILocation(line: 83, column: 3, scope: !644)
!793 = !DILocation(line: 83, column: 9, scope: !794)
!794 = !DILexicalBlockFile(scope: !644, file: !2, discriminator: 1)
!795 = !DILocation(line: 83, column: 12, scope: !794)
!796 = !DILocation(line: 83, column: 3, scope: !794)
!797 = !DILocation(line: 84, column: 21, scope: !798)
!798 = distinct !DILexicalBlock(scope: !644, file: !2, line: 83, column: 32)
!799 = !DILocation(line: 84, column: 24, scope: !798)
!800 = !DILocation(line: 84, column: 14, scope: !798)
!801 = !DILocation(line: 84, column: 4, scope: !798)
!802 = !DILocation(line: 84, column: 19, scope: !798)
!803 = !DILocation(line: 85, column: 10, scope: !798)
!804 = !DILocation(line: 85, column: 14, scope: !798)
!805 = !DILocation(line: 85, column: 8, scope: !798)
!806 = !DILocation(line: 83, column: 3, scope: !807)
!807 = !DILexicalBlockFile(scope: !644, file: !2, discriminator: 2)
!808 = distinct !{!808, !792}
!809 = !DILocation(line: 87, column: 9, scope: !644)
!810 = !DILocation(line: 87, column: 7, scope: !644)
!811 = !DILocation(line: 90, column: 3, scope: !644)
!812 = !DILocation(line: 97, column: 9, scope: !643)
!813 = !DILocation(line: 97, column: 8, scope: !643)
!814 = !DILocation(line: 97, column: 13, scope: !815)
!815 = !DILexicalBlockFile(scope: !642, file: !2, discriminator: 1)
!816 = !DILocation(line: 97, column: 18, scope: !815)
!817 = !DILocation(line: 97, column: 28, scope: !815)
!818 = !DILocation(line: 97, column: 32, scope: !815)
!819 = !DILocation(line: 97, column: 17, scope: !815)
!820 = !DILocation(line: 97, column: 14, scope: !815)
!821 = !DILocation(line: 97, column: 3, scope: !815)
!822 = !DILocation(line: 103, column: 7, scope: !823)
!823 = distinct !DILexicalBlock(scope: !641, file: !2, line: 103, column: 7)
!824 = !DILocation(line: 103, column: 8, scope: !823)
!825 = !DILocation(line: 103, column: 7, scope: !641)
!826 = !DILocation(line: 104, column: 15, scope: !827)
!827 = distinct !DILexicalBlock(scope: !823, file: !2, line: 103, column: 12)
!828 = !DILocation(line: 104, column: 13, scope: !827)
!829 = !DILocation(line: 105, column: 4, scope: !827)
!830 = !DILocation(line: 107, column: 15, scope: !831)
!831 = distinct !DILexicalBlock(scope: !823, file: !2, line: 106, column: 8)
!832 = !DILocation(line: 107, column: 25, scope: !831)
!833 = !DILocation(line: 107, column: 29, scope: !831)
!834 = !DILocation(line: 107, column: 33, scope: !831)
!835 = !DILocation(line: 107, column: 34, scope: !831)
!836 = !DILocation(line: 107, column: 38, scope: !831)
!837 = !DILocation(line: 107, column: 13, scope: !831)
!838 = !DILocation(line: 115, column: 14, scope: !641)
!839 = !DILocation(line: 115, column: 24, scope: !641)
!840 = !DILocation(line: 115, column: 33, scope: !641)
!841 = !DILocation(line: 115, column: 12, scope: !641)
!842 = !DILocation(line: 118, column: 10, scope: !641)
!843 = !DILocation(line: 118, column: 19, scope: !641)
!844 = !DILocation(line: 118, column: 7, scope: !641)
!845 = !DILocation(line: 119, column: 10, scope: !641)
!846 = !DILocation(line: 119, column: 19, scope: !641)
!847 = !DILocation(line: 119, column: 7, scope: !641)
!848 = !DILocation(line: 126, column: 4, scope: !641)
!849 = !DILocation(line: 126, column: 10, scope: !850)
!850 = !DILexicalBlockFile(scope: !641, file: !2, discriminator: 1)
!851 = !DILocation(line: 126, column: 13, scope: !850)
!852 = !DILocation(line: 126, column: 4, scope: !850)
!853 = !DILocation(line: 127, column: 22, scope: !854)
!854 = distinct !DILexicalBlock(scope: !641, file: !2, line: 126, column: 33)
!855 = !DILocation(line: 127, column: 25, scope: !854)
!856 = !DILocation(line: 127, column: 15, scope: !854)
!857 = !DILocation(line: 127, column: 5, scope: !854)
!858 = !DILocation(line: 127, column: 20, scope: !854)
!859 = !DILocation(line: 128, column: 22, scope: !854)
!860 = !DILocation(line: 128, column: 25, scope: !854)
!861 = !DILocation(line: 128, column: 15, scope: !854)
!862 = !DILocation(line: 128, column: 5, scope: !854)
!863 = !DILocation(line: 128, column: 20, scope: !854)
!864 = !DILocation(line: 129, column: 11, scope: !854)
!865 = !DILocation(line: 129, column: 15, scope: !854)
!866 = !DILocation(line: 129, column: 9, scope: !854)
!867 = !DILocation(line: 126, column: 4, scope: !868)
!868 = !DILexicalBlockFile(scope: !641, file: !2, discriminator: 2)
!869 = distinct !{!869, !848}
!870 = !DILocation(line: 131, column: 10, scope: !641)
!871 = !DILocation(line: 131, column: 8, scope: !641)
!872 = !DILocation(line: 134, column: 4, scope: !641)
!873 = !DILocation(line: 142, column: 4, scope: !641)
!874 = !DILocation(line: 142, column: 10, scope: !850)
!875 = !DILocation(line: 142, column: 13, scope: !850)
!876 = !DILocation(line: 142, column: 4, scope: !850)
!877 = !DILocation(line: 145, column: 11, scope: !639)
!878 = !DILocation(line: 145, column: 10, scope: !639)
!879 = !DILocation(line: 145, column: 15, scope: !880)
!880 = !DILexicalBlockFile(scope: !638, file: !2, discriminator: 1)
!881 = !DILocation(line: 145, column: 16, scope: !880)
!882 = !DILocation(line: 145, column: 5, scope: !880)
!883 = !DILocation(line: 166, column: 25, scope: !637)
!884 = !DILocation(line: 166, column: 15, scope: !637)
!885 = !DILocation(line: 166, column: 30, scope: !637)
!886 = !DILocation(line: 166, column: 48, scope: !637)
!887 = !DILocation(line: 166, column: 38, scope: !637)
!888 = !DILocation(line: 166, column: 51, scope: !637)
!889 = !DILocation(line: 166, column: 32, scope: !637)
!890 = !DILocation(line: 166, column: 55, scope: !637)
!891 = !DILocation(line: 166, column: 53, scope: !637)
!892 = !DILocation(line: 166, column: 9, scope: !637)
!893 = !DILocation(line: 167, column: 11, scope: !637)
!894 = !DILocation(line: 167, column: 14, scope: !637)
!895 = !DILocation(line: 167, column: 13, scope: !637)
!896 = !DILocation(line: 167, column: 9, scope: !637)
!897 = !DILocation(line: 168, column: 16, scope: !637)
!898 = !DILocation(line: 168, column: 15, scope: !637)
!899 = !DILocation(line: 168, column: 11, scope: !637)
!900 = !DILocation(line: 249, column: 19, scope: !632, inlinedAt: !636)
!901 = !DILocation(line: 249, column: 10, scope: !632, inlinedAt: !636)
!902 = !DILocation(line: 168, column: 9, scope: !637)
!903 = !DILocation(line: 169, column: 13, scope: !637)
!904 = !DILocation(line: 169, column: 12, scope: !637)
!905 = !DILocation(line: 169, column: 9, scope: !637)
!906 = !DILocation(line: 171, column: 26, scope: !637)
!907 = !DILocation(line: 171, column: 16, scope: !637)
!908 = !DILocation(line: 171, column: 31, scope: !637)
!909 = !DILocation(line: 171, column: 50, scope: !637)
!910 = !DILocation(line: 171, column: 40, scope: !637)
!911 = !DILocation(line: 171, column: 53, scope: !637)
!912 = !DILocation(line: 171, column: 34, scope: !637)
!913 = !DILocation(line: 171, column: 8, scope: !637)
!914 = !DILocation(line: 171, column: 10, scope: !637)
!915 = !DILocation(line: 172, column: 11, scope: !637)
!916 = !DILocation(line: 172, column: 16, scope: !637)
!917 = !DILocation(line: 172, column: 13, scope: !637)
!918 = !DILocation(line: 172, column: 10, scope: !637)
!919 = !DILocation(line: 173, column: 26, scope: !637)
!920 = !DILocation(line: 173, column: 16, scope: !637)
!921 = !DILocation(line: 173, column: 31, scope: !637)
!922 = !DILocation(line: 173, column: 50, scope: !637)
!923 = !DILocation(line: 173, column: 40, scope: !637)
!924 = !DILocation(line: 173, column: 53, scope: !637)
!925 = !DILocation(line: 173, column: 34, scope: !637)
!926 = !DILocation(line: 173, column: 8, scope: !637)
!927 = !DILocation(line: 173, column: 10, scope: !637)
!928 = !DILocation(line: 174, column: 11, scope: !637)
!929 = !DILocation(line: 174, column: 16, scope: !637)
!930 = !DILocation(line: 174, column: 13, scope: !637)
!931 = !DILocation(line: 174, column: 10, scope: !637)
!932 = !DILocation(line: 175, column: 26, scope: !637)
!933 = !DILocation(line: 175, column: 16, scope: !637)
!934 = !DILocation(line: 175, column: 31, scope: !637)
!935 = !DILocation(line: 175, column: 50, scope: !637)
!936 = !DILocation(line: 175, column: 40, scope: !637)
!937 = !DILocation(line: 175, column: 53, scope: !637)
!938 = !DILocation(line: 175, column: 34, scope: !637)
!939 = !DILocation(line: 175, column: 8, scope: !637)
!940 = !DILocation(line: 175, column: 10, scope: !637)
!941 = !DILocation(line: 176, column: 11, scope: !637)
!942 = !DILocation(line: 176, column: 16, scope: !637)
!943 = !DILocation(line: 176, column: 13, scope: !637)
!944 = !DILocation(line: 176, column: 10, scope: !637)
!945 = !DILocation(line: 178, column: 43, scope: !637)
!946 = !DILocation(line: 178, column: 33, scope: !637)
!947 = !DILocation(line: 178, column: 46, scope: !637)
!948 = !DILocation(line: 178, column: 45, scope: !637)
!949 = !DILocation(line: 178, column: 6, scope: !637)
!950 = !DILocation(line: 178, column: 9, scope: !637)
!951 = !DILocation(line: 178, column: 14, scope: !637)
!952 = !DILocation(line: 178, column: 16, scope: !637)
!953 = !DILocation(line: 179, column: 43, scope: !637)
!954 = !DILocation(line: 179, column: 33, scope: !637)
!955 = !DILocation(line: 179, column: 46, scope: !637)
!956 = !DILocation(line: 179, column: 45, scope: !637)
!957 = !DILocation(line: 179, column: 6, scope: !637)
!958 = !DILocation(line: 179, column: 9, scope: !637)
!959 = !DILocation(line: 179, column: 14, scope: !637)
!960 = !DILocation(line: 179, column: 16, scope: !637)
!961 = !DILocation(line: 180, column: 43, scope: !637)
!962 = !DILocation(line: 180, column: 33, scope: !637)
!963 = !DILocation(line: 180, column: 46, scope: !637)
!964 = !DILocation(line: 180, column: 45, scope: !637)
!965 = !DILocation(line: 180, column: 6, scope: !637)
!966 = !DILocation(line: 180, column: 9, scope: !637)
!967 = !DILocation(line: 180, column: 14, scope: !637)
!968 = !DILocation(line: 180, column: 16, scope: !637)
!969 = !DILocation(line: 181, column: 43, scope: !637)
!970 = !DILocation(line: 181, column: 33, scope: !637)
!971 = !DILocation(line: 181, column: 46, scope: !637)
!972 = !DILocation(line: 181, column: 45, scope: !637)
!973 = !DILocation(line: 181, column: 6, scope: !637)
!974 = !DILocation(line: 181, column: 9, scope: !637)
!975 = !DILocation(line: 181, column: 14, scope: !637)
!976 = !DILocation(line: 181, column: 16, scope: !637)
!977 = !DILocation(line: 183, column: 5, scope: !637)
!978 = !DILocation(line: 145, column: 38, scope: !979)
!979 = !DILexicalBlockFile(scope: !638, file: !2, discriminator: 2)
!980 = !DILocation(line: 145, column: 5, scope: !979)
!981 = distinct !{!981, !982}
!982 = !DILocation(line: 145, column: 5, scope: !640)
!983 = !DILocation(line: 186, column: 11, scope: !640)
!984 = !DILocation(line: 186, column: 15, scope: !640)
!985 = !DILocation(line: 186, column: 9, scope: !640)
!986 = !DILocation(line: 142, column: 4, scope: !868)
!987 = distinct !{!987, !873}
!988 = !DILocation(line: 191, column: 10, scope: !641)
!989 = !DILocation(line: 191, column: 8, scope: !641)
!990 = !DILocation(line: 194, column: 4, scope: !641)
!991 = !DILocation(line: 200, column: 3, scope: !641)
!992 = !DILocation(line: 97, column: 38, scope: !993)
!993 = !DILexicalBlockFile(scope: !642, file: !2, discriminator: 2)
!994 = !DILocation(line: 97, column: 3, scope: !993)
!995 = distinct !{!995, !996}
!996 = !DILocation(line: 97, column: 3, scope: !644)
!997 = !DILocation(line: 212, column: 2, scope: !644)
!998 = !DILocation(line: 214, column: 1, scope: !1)
