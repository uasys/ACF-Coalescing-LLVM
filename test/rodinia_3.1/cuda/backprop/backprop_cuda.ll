; ModuleID = 'backprop_cuda.cu'
source_filename = "backprop_cuda.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.BPNN = type { i32, i32, i32, float*, float*, float*, float*, float*, float*, float**, float**, float**, float** }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@num_threads = global i32 0, align 4, !dbg !0
@num_blocks = global i32 0, align 4, !dbg !101
@.str = private unnamed_addr constant [28 x i8] c"Performing GPU computation\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"bpnn kernel error: %s\0A\00", align 1

; Function Attrs: uwtable
define void @_Z22bpnn_layerforward_CUDAPfS_S_S_ii(float* %input_cuda, float* %output_hidden_cuda, float* %input_hidden_cuda, float* %hidden_partial_sum, i32 %in, i32 %hid) #0 !dbg !660 {
entry:
  %input_cuda.addr = alloca float*, align 8
  %output_hidden_cuda.addr = alloca float*, align 8
  %input_hidden_cuda.addr = alloca float*, align 8
  %hidden_partial_sum.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %hid.addr = alloca i32, align 4
  store float* %input_cuda, float** %input_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %input_cuda.addr, metadata !665, metadata !666), !dbg !667
  store float* %output_hidden_cuda, float** %output_hidden_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %output_hidden_cuda.addr, metadata !668, metadata !666), !dbg !669
  store float* %input_hidden_cuda, float** %input_hidden_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %input_hidden_cuda.addr, metadata !670, metadata !666), !dbg !671
  store float* %hidden_partial_sum, float** %hidden_partial_sum.addr, align 8
  call void @llvm.dbg.declare(metadata float** %hidden_partial_sum.addr, metadata !672, metadata !666), !dbg !673
  store i32 %in, i32* %in.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %in.addr, metadata !674, metadata !666), !dbg !675
  store i32 %hid, i32* %hid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %hid.addr, metadata !676, metadata !666), !dbg !677
  %0 = bitcast float** %input_cuda.addr to i8*, !dbg !678
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !678
  %2 = icmp eq i32 %1, 0, !dbg !678
  br i1 %2, label %setup.next, label %setup.end, !dbg !678

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %output_hidden_cuda.addr to i8*, !dbg !679
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !679
  %5 = icmp eq i32 %4, 0, !dbg !679
  br i1 %5, label %setup.next1, label %setup.end, !dbg !679

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %input_hidden_cuda.addr to i8*, !dbg !681
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !681
  %8 = icmp eq i32 %7, 0, !dbg !681
  br i1 %8, label %setup.next2, label %setup.end, !dbg !681

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %hidden_partial_sum.addr to i8*, !dbg !683
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !683
  %11 = icmp eq i32 %10, 0, !dbg !683
  br i1 %11, label %setup.next3, label %setup.end, !dbg !683

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %in.addr to i8*, !dbg !685
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 32), !dbg !685
  %14 = icmp eq i32 %13, 0, !dbg !685
  br i1 %14, label %setup.next4, label %setup.end, !dbg !685

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %hid.addr to i8*, !dbg !687
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 36), !dbg !687
  %17 = icmp eq i32 %16, 0, !dbg !687
  br i1 %17, label %setup.next5, label %setup.end, !dbg !687

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, float*, i32, i32)* @_Z22bpnn_layerforward_CUDAPfS_S_S_ii to i8*)), !dbg !689
  br label %setup.end, !dbg !689

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !691
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_(float* %delta, i32 %hid, float* %ly, i32 %in, float* %w, float* %oldw) #0 !dbg !692 {
entry:
  %delta.addr = alloca float*, align 8
  %hid.addr = alloca i32, align 4
  %ly.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %w.addr = alloca float*, align 8
  %oldw.addr = alloca float*, align 8
  store float* %delta, float** %delta.addr, align 8
  call void @llvm.dbg.declare(metadata float** %delta.addr, metadata !695, metadata !666), !dbg !696
  store i32 %hid, i32* %hid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %hid.addr, metadata !697, metadata !666), !dbg !698
  store float* %ly, float** %ly.addr, align 8
  call void @llvm.dbg.declare(metadata float** %ly.addr, metadata !699, metadata !666), !dbg !700
  store i32 %in, i32* %in.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %in.addr, metadata !701, metadata !666), !dbg !702
  store float* %w, float** %w.addr, align 8
  call void @llvm.dbg.declare(metadata float** %w.addr, metadata !703, metadata !666), !dbg !704
  store float* %oldw, float** %oldw.addr, align 8
  call void @llvm.dbg.declare(metadata float** %oldw.addr, metadata !705, metadata !666), !dbg !706
  %0 = bitcast float** %delta.addr to i8*, !dbg !707
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !707
  %2 = icmp eq i32 %1, 0, !dbg !707
  br i1 %2, label %setup.next, label %setup.end, !dbg !707

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %hid.addr to i8*, !dbg !708
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 8), !dbg !708
  %5 = icmp eq i32 %4, 0, !dbg !708
  br i1 %5, label %setup.next1, label %setup.end, !dbg !708

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %ly.addr to i8*, !dbg !710
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !710
  %8 = icmp eq i32 %7, 0, !dbg !710
  br i1 %8, label %setup.next2, label %setup.end, !dbg !710

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %in.addr to i8*, !dbg !712
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 24), !dbg !712
  %11 = icmp eq i32 %10, 0, !dbg !712
  br i1 %11, label %setup.next3, label %setup.end, !dbg !712

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float** %w.addr to i8*, !dbg !714
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !714
  %14 = icmp eq i32 %13, 0, !dbg !714
  br i1 %14, label %setup.next4, label %setup.end, !dbg !714

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float** %oldw.addr to i8*, !dbg !716
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !716
  %17 = icmp eq i32 %16, 0, !dbg !716
  br i1 %17, label %setup.next5, label %setup.end, !dbg !716

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (float*, i32, float*, i32, float*, float*)* @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_ to i8*)), !dbg !718
  br label %setup.end, !dbg !718

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !720
}

; Function Attrs: nounwind uwtable
define double @_Z7gettimev() #2 !dbg !721 {
entry:
  %t = alloca %struct.timeval, align 8
  call void @llvm.dbg.declare(metadata %struct.timeval* %t, metadata !724, metadata !666), !dbg !733
  %call = call i32 @gettimeofday(%struct.timeval* %t, %struct.timezone* null) #8, !dbg !734
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i32 0, i32 0, !dbg !735
  %0 = load i64, i64* %tv_sec, align 8, !dbg !735
  %conv = sitofp i64 %0 to double, !dbg !736
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i32 0, i32 1, !dbg !737
  %1 = load i64, i64* %tv_usec, align 8, !dbg !737
  %conv1 = sitofp i64 %1 to double, !dbg !738
  %mul = fmul double %conv1, 1.000000e-06, !dbg !739
  %add = fadd double %conv, %mul, !dbg !740
  ret double %add, !dbg !741
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #3

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #4 !dbg !742 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !745, metadata !666), !dbg !746
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !747, metadata !666), !dbg !748
  %0 = load i32, i32* %argc.addr, align 4, !dbg !749
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !750
  %call = call i32 @setup(i32 %0, i8** %1), !dbg !751
  ret i32 0, !dbg !752
}

declare i32 @setup(i32, i8**) #5

; Function Attrs: uwtable
define void @bpnn_train_cuda(%struct.BPNN* %net, float* %eo, float* %eh) #0 !dbg !753 {
entry:
  %net.addr = alloca %struct.BPNN*, align 8
  %eo.addr = alloca float*, align 8
  %eh.addr = alloca float*, align 8
  %in = alloca i32, align 4
  %hid = alloca i32, align 4
  %out = alloca i32, align 4
  %out_err = alloca float, align 4
  %hid_err = alloca float, align 4
  %m = alloca i32, align 4
  %input_hidden_cuda = alloca float*, align 8
  %input_cuda = alloca float*, align 8
  %output_hidden_cuda = alloca float*, align 8
  %partial_sum = alloca float*, align 8
  %hidden_partial_sum = alloca float*, align 8
  %hidden_delta_cuda = alloca float*, align 8
  %input_prev_weights_cuda = alloca float*, align 8
  %sum = alloca float, align 4
  %input_weights_one_dim = alloca float*, align 8
  %input_weights_prev_one_dim = alloca float*, align 8
  %grid = alloca %struct.dim3, align 4
  %threads = alloca %struct.dim3, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp59 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp59.coerce = alloca { i64, i32 }, align 4
  %error = alloca i32, align 4
  %j70 = alloca i32, align 4
  %k74 = alloca i32, align 4
  %agg.tmp137 = alloca %struct.dim3, align 4
  %agg.tmp138 = alloca %struct.dim3, align 4
  %agg.tmp137.coerce = alloca { i64, i32 }, align 4
  %agg.tmp138.coerce = alloca { i64, i32 }, align 4
  store %struct.BPNN* %net, %struct.BPNN** %net.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.BPNN** %net.addr, metadata !775, metadata !666), !dbg !776
  store float* %eo, float** %eo.addr, align 8
  call void @llvm.dbg.declare(metadata float** %eo.addr, metadata !777, metadata !666), !dbg !778
  store float* %eh, float** %eh.addr, align 8
  call void @llvm.dbg.declare(metadata float** %eh.addr, metadata !779, metadata !666), !dbg !780
  call void @llvm.dbg.declare(metadata i32* %in, metadata !781, metadata !666), !dbg !782
  call void @llvm.dbg.declare(metadata i32* %hid, metadata !783, metadata !666), !dbg !784
  call void @llvm.dbg.declare(metadata i32* %out, metadata !785, metadata !666), !dbg !786
  call void @llvm.dbg.declare(metadata float* %out_err, metadata !787, metadata !666), !dbg !788
  call void @llvm.dbg.declare(metadata float* %hid_err, metadata !789, metadata !666), !dbg !790
  %0 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !791
  %input_n = getelementptr inbounds %struct.BPNN, %struct.BPNN* %0, i32 0, i32 0, !dbg !792
  %1 = load i32, i32* %input_n, align 8, !dbg !792
  store i32 %1, i32* %in, align 4, !dbg !793
  %2 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !794
  %hidden_n = getelementptr inbounds %struct.BPNN, %struct.BPNN* %2, i32 0, i32 1, !dbg !795
  %3 = load i32, i32* %hidden_n, align 4, !dbg !795
  store i32 %3, i32* %hid, align 4, !dbg !796
  %4 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !797
  %output_n = getelementptr inbounds %struct.BPNN, %struct.BPNN* %4, i32 0, i32 2, !dbg !798
  %5 = load i32, i32* %output_n, align 8, !dbg !798
  store i32 %5, i32* %out, align 4, !dbg !799
  call void @llvm.dbg.declare(metadata i32* %m, metadata !800, metadata !666), !dbg !801
  store i32 0, i32* %m, align 4, !dbg !801
  call void @llvm.dbg.declare(metadata float** %input_hidden_cuda, metadata !802, metadata !666), !dbg !803
  call void @llvm.dbg.declare(metadata float** %input_cuda, metadata !804, metadata !666), !dbg !805
  call void @llvm.dbg.declare(metadata float** %output_hidden_cuda, metadata !806, metadata !666), !dbg !807
  call void @llvm.dbg.declare(metadata float** %partial_sum, metadata !808, metadata !666), !dbg !809
  call void @llvm.dbg.declare(metadata float** %hidden_partial_sum, metadata !810, metadata !666), !dbg !811
  call void @llvm.dbg.declare(metadata float** %hidden_delta_cuda, metadata !812, metadata !666), !dbg !813
  call void @llvm.dbg.declare(metadata float** %input_prev_weights_cuda, metadata !814, metadata !666), !dbg !815
  call void @llvm.dbg.declare(metadata float* %sum, metadata !816, metadata !666), !dbg !817
  call void @llvm.dbg.declare(metadata float** %input_weights_one_dim, metadata !818, metadata !666), !dbg !819
  call void @llvm.dbg.declare(metadata float** %input_weights_prev_one_dim, metadata !820, metadata !666), !dbg !821
  %6 = load i32, i32* %in, align 4, !dbg !822
  %div = sdiv i32 %6, 16, !dbg !823
  store i32 %div, i32* @num_blocks, align 4, !dbg !824
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !825, metadata !666), !dbg !849
  %7 = load i32, i32* @num_blocks, align 4, !dbg !850
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 1, i32 %7, i32 1), !dbg !849
  call void @llvm.dbg.declare(metadata %struct.dim3* %threads, metadata !851, metadata !666), !dbg !852
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %threads, i32 16, i32 16, i32 1), !dbg !852
  %8 = load i32, i32* %in, align 4, !dbg !853
  %add = add nsw i32 %8, 1, !dbg !854
  %9 = load i32, i32* %hid, align 4, !dbg !855
  %add1 = add nsw i32 %9, 1, !dbg !856
  %mul = mul nsw i32 %add, %add1, !dbg !857
  %conv = sext i32 %mul to i64, !dbg !858
  %mul2 = mul i64 %conv, 4, !dbg !859
  %call = call noalias i8* @malloc(i64 %mul2) #8, !dbg !860
  %10 = bitcast i8* %call to float*, !dbg !861
  store float* %10, float** %input_weights_one_dim, align 8, !dbg !862
  %11 = load i32, i32* %in, align 4, !dbg !863
  %add3 = add nsw i32 %11, 1, !dbg !864
  %12 = load i32, i32* %hid, align 4, !dbg !865
  %add4 = add nsw i32 %12, 1, !dbg !866
  %mul5 = mul nsw i32 %add3, %add4, !dbg !867
  %conv6 = sext i32 %mul5 to i64, !dbg !868
  %mul7 = mul i64 %conv6, 4, !dbg !869
  %call8 = call noalias i8* @malloc(i64 %mul7) #8, !dbg !870
  %13 = bitcast i8* %call8 to float*, !dbg !871
  store float* %13, float** %input_weights_prev_one_dim, align 8, !dbg !872
  %14 = load i32, i32* @num_blocks, align 4, !dbg !873
  %mul9 = mul i32 %14, 16, !dbg !874
  %conv10 = zext i32 %mul9 to i64, !dbg !873
  %mul11 = mul i64 %conv10, 4, !dbg !875
  %call12 = call noalias i8* @malloc(i64 %mul11) #8, !dbg !876
  %15 = bitcast i8* %call12 to float*, !dbg !877
  store float* %15, float** %partial_sum, align 8, !dbg !878
  call void @llvm.dbg.declare(metadata i32* %k, metadata !879, metadata !666), !dbg !881
  store i32 0, i32* %k, align 4, !dbg !881
  br label %for.cond, !dbg !882

for.cond:                                         ; preds = %for.inc27, %entry
  %16 = load i32, i32* %k, align 4, !dbg !883
  %17 = load i32, i32* %in, align 4, !dbg !886
  %cmp = icmp sle i32 %16, %17, !dbg !887
  br i1 %cmp, label %for.body, label %for.end29, !dbg !888

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !889, metadata !666), !dbg !892
  store i32 0, i32* %j, align 4, !dbg !892
  br label %for.cond13, !dbg !893

for.cond13:                                       ; preds = %for.inc, %for.body
  %18 = load i32, i32* %j, align 4, !dbg !894
  %19 = load i32, i32* %hid, align 4, !dbg !897
  %cmp14 = icmp sle i32 %18, %19, !dbg !898
  br i1 %cmp14, label %for.body15, label %for.end, !dbg !899

for.body15:                                       ; preds = %for.cond13
  %20 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !900
  %input_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %20, i32 0, i32 9, !dbg !902
  %21 = load float**, float*** %input_weights, align 8, !dbg !902
  %22 = load i32, i32* %k, align 4, !dbg !903
  %idxprom = sext i32 %22 to i64, !dbg !900
  %arrayidx = getelementptr inbounds float*, float** %21, i64 %idxprom, !dbg !900
  %23 = load float*, float** %arrayidx, align 8, !dbg !900
  %24 = load i32, i32* %j, align 4, !dbg !904
  %idxprom16 = sext i32 %24 to i64, !dbg !900
  %arrayidx17 = getelementptr inbounds float, float* %23, i64 %idxprom16, !dbg !900
  %25 = load float, float* %arrayidx17, align 4, !dbg !900
  %26 = load float*, float** %input_weights_one_dim, align 8, !dbg !905
  %27 = load i32, i32* %m, align 4, !dbg !906
  %idxprom18 = sext i32 %27 to i64, !dbg !905
  %arrayidx19 = getelementptr inbounds float, float* %26, i64 %idxprom18, !dbg !905
  store float %25, float* %arrayidx19, align 4, !dbg !907
  %28 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !908
  %input_prev_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %28, i32 0, i32 11, !dbg !909
  %29 = load float**, float*** %input_prev_weights, align 8, !dbg !909
  %30 = load i32, i32* %k, align 4, !dbg !910
  %idxprom20 = sext i32 %30 to i64, !dbg !908
  %arrayidx21 = getelementptr inbounds float*, float** %29, i64 %idxprom20, !dbg !908
  %31 = load float*, float** %arrayidx21, align 8, !dbg !908
  %32 = load i32, i32* %j, align 4, !dbg !911
  %idxprom22 = sext i32 %32 to i64, !dbg !908
  %arrayidx23 = getelementptr inbounds float, float* %31, i64 %idxprom22, !dbg !908
  %33 = load float, float* %arrayidx23, align 4, !dbg !908
  %34 = load float*, float** %input_weights_prev_one_dim, align 8, !dbg !912
  %35 = load i32, i32* %m, align 4, !dbg !913
  %idxprom24 = sext i32 %35 to i64, !dbg !912
  %arrayidx25 = getelementptr inbounds float, float* %34, i64 %idxprom24, !dbg !912
  store float %33, float* %arrayidx25, align 4, !dbg !914
  %36 = load i32, i32* %m, align 4, !dbg !915
  %inc = add nsw i32 %36, 1, !dbg !915
  store i32 %inc, i32* %m, align 4, !dbg !915
  br label %for.inc, !dbg !916

for.inc:                                          ; preds = %for.body15
  %37 = load i32, i32* %j, align 4, !dbg !917
  %inc26 = add nsw i32 %37, 1, !dbg !917
  store i32 %inc26, i32* %j, align 4, !dbg !917
  br label %for.cond13, !dbg !919, !llvm.loop !920

for.end:                                          ; preds = %for.cond13
  br label %for.inc27, !dbg !922

for.inc27:                                        ; preds = %for.end
  %38 = load i32, i32* %k, align 4, !dbg !923
  %inc28 = add nsw i32 %38, 1, !dbg !923
  store i32 %inc28, i32* %k, align 4, !dbg !923
  br label %for.cond, !dbg !925, !llvm.loop !926

for.end29:                                        ; preds = %for.cond
  %39 = bitcast float** %input_cuda to i8**, !dbg !928
  %40 = load i32, i32* %in, align 4, !dbg !929
  %add30 = add nsw i32 %40, 1, !dbg !930
  %conv31 = sext i32 %add30 to i64, !dbg !931
  %mul32 = mul i64 %conv31, 4, !dbg !932
  %call33 = call i32 @cudaMalloc(i8** %39, i64 %mul32), !dbg !933
  %41 = bitcast float** %output_hidden_cuda to i8**, !dbg !934
  %42 = load i32, i32* %hid, align 4, !dbg !935
  %add34 = add nsw i32 %42, 1, !dbg !936
  %conv35 = sext i32 %add34 to i64, !dbg !937
  %mul36 = mul i64 %conv35, 4, !dbg !938
  %call37 = call i32 @cudaMalloc(i8** %41, i64 %mul36), !dbg !939
  %43 = bitcast float** %input_hidden_cuda to i8**, !dbg !940
  %44 = load i32, i32* %in, align 4, !dbg !941
  %add38 = add nsw i32 %44, 1, !dbg !942
  %45 = load i32, i32* %hid, align 4, !dbg !943
  %add39 = add nsw i32 %45, 1, !dbg !944
  %mul40 = mul nsw i32 %add38, %add39, !dbg !945
  %conv41 = sext i32 %mul40 to i64, !dbg !946
  %mul42 = mul i64 %conv41, 4, !dbg !947
  %call43 = call i32 @cudaMalloc(i8** %43, i64 %mul42), !dbg !948
  %46 = bitcast float** %hidden_partial_sum to i8**, !dbg !949
  %47 = load i32, i32* @num_blocks, align 4, !dbg !950
  %mul44 = mul i32 %47, 16, !dbg !951
  %conv45 = zext i32 %mul44 to i64, !dbg !950
  %mul46 = mul i64 %conv45, 4, !dbg !952
  %call47 = call i32 @cudaMalloc(i8** %46, i64 %mul46), !dbg !953
  %call48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0)), !dbg !954
  %48 = load float*, float** %input_cuda, align 8, !dbg !955
  %49 = bitcast float* %48 to i8*, !dbg !955
  %50 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !956
  %input_units = getelementptr inbounds %struct.BPNN, %struct.BPNN* %50, i32 0, i32 3, !dbg !957
  %51 = load float*, float** %input_units, align 8, !dbg !957
  %52 = bitcast float* %51 to i8*, !dbg !956
  %53 = load i32, i32* %in, align 4, !dbg !958
  %add49 = add nsw i32 %53, 1, !dbg !959
  %conv50 = sext i32 %add49 to i64, !dbg !960
  %mul51 = mul i64 %conv50, 4, !dbg !961
  %call52 = call i32 @cudaMemcpy(i8* %49, i8* %52, i64 %mul51, i32 1), !dbg !962
  %54 = load float*, float** %input_hidden_cuda, align 8, !dbg !963
  %55 = bitcast float* %54 to i8*, !dbg !963
  %56 = load float*, float** %input_weights_one_dim, align 8, !dbg !964
  %57 = bitcast float* %56 to i8*, !dbg !964
  %58 = load i32, i32* %in, align 4, !dbg !965
  %add53 = add nsw i32 %58, 1, !dbg !966
  %59 = load i32, i32* %hid, align 4, !dbg !967
  %add54 = add nsw i32 %59, 1, !dbg !968
  %mul55 = mul nsw i32 %add53, %add54, !dbg !969
  %conv56 = sext i32 %mul55 to i64, !dbg !970
  %mul57 = mul i64 %conv56, 4, !dbg !971
  %call58 = call i32 @cudaMemcpy(i8* %55, i8* %57, i64 %mul57, i32 1), !dbg !972
  %60 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !973
  %61 = bitcast %struct.dim3* %grid to i8*, !dbg !973
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %60, i8* %61, i64 12, i32 4, i1 false), !dbg !973
  %62 = bitcast %struct.dim3* %agg.tmp59 to i8*, !dbg !974
  %63 = bitcast %struct.dim3* %threads to i8*, !dbg !974
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %62, i8* %63, i64 12, i32 4, i1 false), !dbg !974
  %64 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !975
  %65 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !975
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %64, i8* %65, i64 12, i32 4, i1 false), !dbg !975
  %66 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !975
  %67 = load i64, i64* %66, align 4, !dbg !975
  %68 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !975
  %69 = load i32, i32* %68, align 4, !dbg !975
  %70 = bitcast { i64, i32 }* %agg.tmp59.coerce to i8*, !dbg !975
  %71 = bitcast %struct.dim3* %agg.tmp59 to i8*, !dbg !975
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %70, i8* %71, i64 12, i32 4, i1 false), !dbg !975
  %72 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp59.coerce, i32 0, i32 0, !dbg !975
  %73 = load i64, i64* %72, align 4, !dbg !975
  %74 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp59.coerce, i32 0, i32 1, !dbg !975
  %75 = load i32, i32* %74, align 4, !dbg !975
  %call60 = call i32 @cudaConfigureCall(i64 %67, i32 %69, i64 %73, i32 %75, i64 0, %struct.CUstream_st* null), !dbg !975
  %tobool = icmp ne i32 %call60, 0, !dbg !975
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !976

kcall.configok:                                   ; preds = %for.end29
  %76 = load float*, float** %input_cuda, align 8, !dbg !977
  %77 = load float*, float** %output_hidden_cuda, align 8, !dbg !979
  %78 = load float*, float** %input_hidden_cuda, align 8, !dbg !980
  %79 = load float*, float** %hidden_partial_sum, align 8, !dbg !981
  %80 = load i32, i32* %in, align 4, !dbg !982
  %81 = load i32, i32* %hid, align 4, !dbg !983
  call void @_Z22bpnn_layerforward_CUDAPfS_S_S_ii(float* %76, float* %77, float* %78, float* %79, i32 %80, i32 %81), !dbg !984
  br label %kcall.end, !dbg !984

kcall.end:                                        ; preds = %kcall.configok, %for.end29
  %call61 = call i32 @cudaThreadSynchronize(), !dbg !985
  call void @llvm.dbg.declare(metadata i32* %error, metadata !986, metadata !666), !dbg !988
  %call62 = call i32 @cudaGetLastError(), !dbg !989
  store i32 %call62, i32* %error, align 4, !dbg !988
  %82 = load i32, i32* %error, align 4, !dbg !990
  %cmp63 = icmp ne i32 %82, 0, !dbg !992
  br i1 %cmp63, label %if.then, label %if.end, !dbg !993

if.then:                                          ; preds = %kcall.end
  %83 = load i32, i32* %error, align 4, !dbg !994
  %call64 = call i8* @cudaGetErrorString(i32 %83), !dbg !996
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i8* %call64), !dbg !997
  call void @exit(i32 1) #9, !dbg !999
  unreachable, !dbg !999

if.end:                                           ; preds = %kcall.end
  %84 = load float*, float** %partial_sum, align 8, !dbg !1000
  %85 = bitcast float* %84 to i8*, !dbg !1000
  %86 = load float*, float** %hidden_partial_sum, align 8, !dbg !1001
  %87 = bitcast float* %86 to i8*, !dbg !1001
  %88 = load i32, i32* @num_blocks, align 4, !dbg !1002
  %mul66 = mul i32 %88, 16, !dbg !1003
  %conv67 = zext i32 %mul66 to i64, !dbg !1002
  %mul68 = mul i64 %conv67, 4, !dbg !1004
  %call69 = call i32 @cudaMemcpy(i8* %85, i8* %87, i64 %mul68, i32 2), !dbg !1005
  call void @llvm.dbg.declare(metadata i32* %j70, metadata !1006, metadata !666), !dbg !1008
  store i32 1, i32* %j70, align 4, !dbg !1008
  br label %for.cond71, !dbg !1009

for.cond71:                                       ; preds = %for.inc99, %if.end
  %89 = load i32, i32* %j70, align 4, !dbg !1010
  %90 = load i32, i32* %hid, align 4, !dbg !1013
  %cmp72 = icmp sle i32 %89, %90, !dbg !1014
  br i1 %cmp72, label %for.body73, label %for.end101, !dbg !1015

for.body73:                                       ; preds = %for.cond71
  store float 0.000000e+00, float* %sum, align 4, !dbg !1016
  call void @llvm.dbg.declare(metadata i32* %k74, metadata !1018, metadata !666), !dbg !1020
  store i32 0, i32* %k74, align 4, !dbg !1020
  br label %for.cond75, !dbg !1021

for.cond75:                                       ; preds = %for.inc83, %for.body73
  %91 = load i32, i32* %k74, align 4, !dbg !1022
  %92 = load i32, i32* @num_blocks, align 4, !dbg !1025
  %cmp76 = icmp ult i32 %91, %92, !dbg !1026
  br i1 %cmp76, label %for.body77, label %for.end85, !dbg !1027

for.body77:                                       ; preds = %for.cond75
  %93 = load float*, float** %partial_sum, align 8, !dbg !1028
  %94 = load i32, i32* %k74, align 4, !dbg !1030
  %95 = load i32, i32* %hid, align 4, !dbg !1031
  %mul78 = mul nsw i32 %94, %95, !dbg !1032
  %96 = load i32, i32* %j70, align 4, !dbg !1033
  %add79 = add nsw i32 %mul78, %96, !dbg !1034
  %sub = sub nsw i32 %add79, 1, !dbg !1035
  %idxprom80 = sext i32 %sub to i64, !dbg !1028
  %arrayidx81 = getelementptr inbounds float, float* %93, i64 %idxprom80, !dbg !1028
  %97 = load float, float* %arrayidx81, align 4, !dbg !1028
  %98 = load float, float* %sum, align 4, !dbg !1036
  %add82 = fadd float %98, %97, !dbg !1036
  store float %add82, float* %sum, align 4, !dbg !1036
  br label %for.inc83, !dbg !1037

for.inc83:                                        ; preds = %for.body77
  %99 = load i32, i32* %k74, align 4, !dbg !1038
  %inc84 = add nsw i32 %99, 1, !dbg !1038
  store i32 %inc84, i32* %k74, align 4, !dbg !1038
  br label %for.cond75, !dbg !1040, !llvm.loop !1041

for.end85:                                        ; preds = %for.cond75
  %100 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1043
  %input_weights86 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %100, i32 0, i32 9, !dbg !1044
  %101 = load float**, float*** %input_weights86, align 8, !dbg !1044
  %arrayidx87 = getelementptr inbounds float*, float** %101, i64 0, !dbg !1043
  %102 = load float*, float** %arrayidx87, align 8, !dbg !1043
  %103 = load i32, i32* %j70, align 4, !dbg !1045
  %idxprom88 = sext i32 %103 to i64, !dbg !1043
  %arrayidx89 = getelementptr inbounds float, float* %102, i64 %idxprom88, !dbg !1043
  %104 = load float, float* %arrayidx89, align 4, !dbg !1043
  %105 = load float, float* %sum, align 4, !dbg !1046
  %add90 = fadd float %105, %104, !dbg !1046
  store float %add90, float* %sum, align 4, !dbg !1046
  %106 = load float, float* %sum, align 4, !dbg !1047
  %sub91 = fsub float -0.000000e+00, %106, !dbg !1048
  %conv92 = fpext float %sub91 to double, !dbg !1048
  %call93 = call double @exp(double %conv92) #8, !dbg !1049
  %add94 = fadd double 1.000000e+00, %call93, !dbg !1050
  %div95 = fdiv double 1.000000e+00, %add94, !dbg !1051
  %conv96 = fptrunc double %div95 to float, !dbg !1052
  %107 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1053
  %hidden_units = getelementptr inbounds %struct.BPNN, %struct.BPNN* %107, i32 0, i32 4, !dbg !1054
  %108 = load float*, float** %hidden_units, align 8, !dbg !1054
  %109 = load i32, i32* %j70, align 4, !dbg !1055
  %idxprom97 = sext i32 %109 to i64, !dbg !1053
  %arrayidx98 = getelementptr inbounds float, float* %108, i64 %idxprom97, !dbg !1053
  store float %conv96, float* %arrayidx98, align 4, !dbg !1056
  br label %for.inc99, !dbg !1057

for.inc99:                                        ; preds = %for.end85
  %110 = load i32, i32* %j70, align 4, !dbg !1058
  %inc100 = add nsw i32 %110, 1, !dbg !1058
  store i32 %inc100, i32* %j70, align 4, !dbg !1058
  br label %for.cond71, !dbg !1060, !llvm.loop !1061

for.end101:                                       ; preds = %for.cond71
  %111 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1063
  %hidden_units102 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %111, i32 0, i32 4, !dbg !1064
  %112 = load float*, float** %hidden_units102, align 8, !dbg !1064
  %113 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1065
  %output_units = getelementptr inbounds %struct.BPNN, %struct.BPNN* %113, i32 0, i32 5, !dbg !1066
  %114 = load float*, float** %output_units, align 8, !dbg !1066
  %115 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1067
  %hidden_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %115, i32 0, i32 10, !dbg !1068
  %116 = load float**, float*** %hidden_weights, align 8, !dbg !1068
  %117 = load i32, i32* %hid, align 4, !dbg !1069
  %118 = load i32, i32* %out, align 4, !dbg !1070
  call void @bpnn_layerforward(float* %112, float* %114, float** %116, i32 %117, i32 %118), !dbg !1071
  %119 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1072
  %output_delta = getelementptr inbounds %struct.BPNN, %struct.BPNN* %119, i32 0, i32 7, !dbg !1073
  %120 = load float*, float** %output_delta, align 8, !dbg !1073
  %121 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1074
  %target = getelementptr inbounds %struct.BPNN, %struct.BPNN* %121, i32 0, i32 8, !dbg !1075
  %122 = load float*, float** %target, align 8, !dbg !1075
  %123 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1076
  %output_units103 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %123, i32 0, i32 5, !dbg !1077
  %124 = load float*, float** %output_units103, align 8, !dbg !1077
  %125 = load i32, i32* %out, align 4, !dbg !1078
  call void @bpnn_output_error(float* %120, float* %122, float* %124, i32 %125, float* %out_err), !dbg !1079
  %126 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1080
  %hidden_delta = getelementptr inbounds %struct.BPNN, %struct.BPNN* %126, i32 0, i32 6, !dbg !1081
  %127 = load float*, float** %hidden_delta, align 8, !dbg !1081
  %128 = load i32, i32* %hid, align 4, !dbg !1082
  %129 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1083
  %output_delta104 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %129, i32 0, i32 7, !dbg !1084
  %130 = load float*, float** %output_delta104, align 8, !dbg !1084
  %131 = load i32, i32* %out, align 4, !dbg !1085
  %132 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1086
  %hidden_weights105 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %132, i32 0, i32 10, !dbg !1087
  %133 = load float**, float*** %hidden_weights105, align 8, !dbg !1087
  %134 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1088
  %hidden_units106 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %134, i32 0, i32 4, !dbg !1089
  %135 = load float*, float** %hidden_units106, align 8, !dbg !1089
  call void @bpnn_hidden_error(float* %127, i32 %128, float* %130, i32 %131, float** %133, float* %135, float* %hid_err), !dbg !1090
  %136 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1091
  %output_delta107 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %136, i32 0, i32 7, !dbg !1092
  %137 = load float*, float** %output_delta107, align 8, !dbg !1092
  %138 = load i32, i32* %out, align 4, !dbg !1093
  %139 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1094
  %hidden_units108 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %139, i32 0, i32 4, !dbg !1095
  %140 = load float*, float** %hidden_units108, align 8, !dbg !1095
  %141 = load i32, i32* %hid, align 4, !dbg !1096
  %142 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1097
  %hidden_weights109 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %142, i32 0, i32 10, !dbg !1098
  %143 = load float**, float*** %hidden_weights109, align 8, !dbg !1098
  %144 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1099
  %hidden_prev_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %144, i32 0, i32 12, !dbg !1100
  %145 = load float**, float*** %hidden_prev_weights, align 8, !dbg !1100
  call void @bpnn_adjust_weights(float* %137, i32 %138, float* %140, i32 %141, float** %143, float** %145), !dbg !1101
  %146 = bitcast float** %hidden_delta_cuda to i8**, !dbg !1102
  %147 = load i32, i32* %hid, align 4, !dbg !1103
  %add110 = add nsw i32 %147, 1, !dbg !1104
  %conv111 = sext i32 %add110 to i64, !dbg !1105
  %mul112 = mul i64 %conv111, 4, !dbg !1106
  %call113 = call i32 @cudaMalloc(i8** %146, i64 %mul112), !dbg !1107
  %148 = bitcast float** %input_prev_weights_cuda to i8**, !dbg !1108
  %149 = load i32, i32* %in, align 4, !dbg !1109
  %add114 = add nsw i32 %149, 1, !dbg !1110
  %150 = load i32, i32* %hid, align 4, !dbg !1111
  %add115 = add nsw i32 %150, 1, !dbg !1112
  %mul116 = mul nsw i32 %add114, %add115, !dbg !1113
  %conv117 = sext i32 %mul116 to i64, !dbg !1114
  %mul118 = mul i64 %conv117, 4, !dbg !1115
  %call119 = call i32 @cudaMalloc(i8** %148, i64 %mul118), !dbg !1116
  %151 = load float*, float** %hidden_delta_cuda, align 8, !dbg !1117
  %152 = bitcast float* %151 to i8*, !dbg !1117
  %153 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1118
  %hidden_delta120 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %153, i32 0, i32 6, !dbg !1119
  %154 = load float*, float** %hidden_delta120, align 8, !dbg !1119
  %155 = bitcast float* %154 to i8*, !dbg !1118
  %156 = load i32, i32* %hid, align 4, !dbg !1120
  %add121 = add nsw i32 %156, 1, !dbg !1121
  %conv122 = sext i32 %add121 to i64, !dbg !1122
  %mul123 = mul i64 %conv122, 4, !dbg !1123
  %call124 = call i32 @cudaMemcpy(i8* %152, i8* %155, i64 %mul123, i32 1), !dbg !1124
  %157 = load float*, float** %input_prev_weights_cuda, align 8, !dbg !1125
  %158 = bitcast float* %157 to i8*, !dbg !1125
  %159 = load float*, float** %input_weights_prev_one_dim, align 8, !dbg !1126
  %160 = bitcast float* %159 to i8*, !dbg !1126
  %161 = load i32, i32* %in, align 4, !dbg !1127
  %add125 = add nsw i32 %161, 1, !dbg !1128
  %162 = load i32, i32* %hid, align 4, !dbg !1129
  %add126 = add nsw i32 %162, 1, !dbg !1130
  %mul127 = mul nsw i32 %add125, %add126, !dbg !1131
  %conv128 = sext i32 %mul127 to i64, !dbg !1132
  %mul129 = mul i64 %conv128, 4, !dbg !1133
  %call130 = call i32 @cudaMemcpy(i8* %158, i8* %160, i64 %mul129, i32 1), !dbg !1134
  %163 = load float*, float** %input_hidden_cuda, align 8, !dbg !1135
  %164 = bitcast float* %163 to i8*, !dbg !1135
  %165 = load float*, float** %input_weights_one_dim, align 8, !dbg !1136
  %166 = bitcast float* %165 to i8*, !dbg !1136
  %167 = load i32, i32* %in, align 4, !dbg !1137
  %add131 = add nsw i32 %167, 1, !dbg !1138
  %168 = load i32, i32* %hid, align 4, !dbg !1139
  %add132 = add nsw i32 %168, 1, !dbg !1140
  %mul133 = mul nsw i32 %add131, %add132, !dbg !1141
  %conv134 = sext i32 %mul133 to i64, !dbg !1142
  %mul135 = mul i64 %conv134, 4, !dbg !1143
  %call136 = call i32 @cudaMemcpy(i8* %164, i8* %166, i64 %mul135, i32 1), !dbg !1144
  %169 = bitcast %struct.dim3* %agg.tmp137 to i8*, !dbg !1145
  %170 = bitcast %struct.dim3* %grid to i8*, !dbg !1145
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 12, i32 4, i1 false), !dbg !1145
  %171 = bitcast %struct.dim3* %agg.tmp138 to i8*, !dbg !1146
  %172 = bitcast %struct.dim3* %threads to i8*, !dbg !1146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %171, i8* %172, i64 12, i32 4, i1 false), !dbg !1146
  %173 = bitcast { i64, i32 }* %agg.tmp137.coerce to i8*, !dbg !1147
  %174 = bitcast %struct.dim3* %agg.tmp137 to i8*, !dbg !1147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %173, i8* %174, i64 12, i32 4, i1 false), !dbg !1147
  %175 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp137.coerce, i32 0, i32 0, !dbg !1147
  %176 = load i64, i64* %175, align 4, !dbg !1147
  %177 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp137.coerce, i32 0, i32 1, !dbg !1147
  %178 = load i32, i32* %177, align 4, !dbg !1147
  %179 = bitcast { i64, i32 }* %agg.tmp138.coerce to i8*, !dbg !1147
  %180 = bitcast %struct.dim3* %agg.tmp138 to i8*, !dbg !1147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %179, i8* %180, i64 12, i32 4, i1 false), !dbg !1147
  %181 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp138.coerce, i32 0, i32 0, !dbg !1147
  %182 = load i64, i64* %181, align 4, !dbg !1147
  %183 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp138.coerce, i32 0, i32 1, !dbg !1147
  %184 = load i32, i32* %183, align 4, !dbg !1147
  %call139 = call i32 @cudaConfigureCall(i64 %176, i32 %178, i64 %182, i32 %184, i64 0, %struct.CUstream_st* null), !dbg !1147
  %tobool140 = icmp ne i32 %call139, 0, !dbg !1147
  br i1 %tobool140, label %kcall.end142, label %kcall.configok141, !dbg !1148

kcall.configok141:                                ; preds = %for.end101
  %185 = load float*, float** %hidden_delta_cuda, align 8, !dbg !1149
  %186 = load i32, i32* %hid, align 4, !dbg !1150
  %187 = load float*, float** %input_cuda, align 8, !dbg !1151
  %188 = load i32, i32* %in, align 4, !dbg !1152
  %189 = load float*, float** %input_hidden_cuda, align 8, !dbg !1153
  %190 = load float*, float** %input_prev_weights_cuda, align 8, !dbg !1154
  call void @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_(float* %185, i32 %186, float* %187, i32 %188, float* %189, float* %190), !dbg !1155
  br label %kcall.end142, !dbg !1155

kcall.end142:                                     ; preds = %kcall.configok141, %for.end101
  %191 = load %struct.BPNN*, %struct.BPNN** %net.addr, align 8, !dbg !1156
  %input_units143 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %191, i32 0, i32 3, !dbg !1157
  %192 = load float*, float** %input_units143, align 8, !dbg !1157
  %193 = bitcast float* %192 to i8*, !dbg !1156
  %194 = load float*, float** %input_cuda, align 8, !dbg !1158
  %195 = bitcast float* %194 to i8*, !dbg !1158
  %196 = load i32, i32* %in, align 4, !dbg !1159
  %add144 = add nsw i32 %196, 1, !dbg !1160
  %conv145 = sext i32 %add144 to i64, !dbg !1161
  %mul146 = mul i64 %conv145, 4, !dbg !1162
  %call147 = call i32 @cudaMemcpy(i8* %193, i8* %195, i64 %mul146, i32 2), !dbg !1163
  %197 = load float*, float** %input_weights_one_dim, align 8, !dbg !1164
  %198 = bitcast float* %197 to i8*, !dbg !1164
  %199 = load float*, float** %input_hidden_cuda, align 8, !dbg !1165
  %200 = bitcast float* %199 to i8*, !dbg !1165
  %201 = load i32, i32* %in, align 4, !dbg !1166
  %add148 = add nsw i32 %201, 1, !dbg !1167
  %202 = load i32, i32* %hid, align 4, !dbg !1168
  %add149 = add nsw i32 %202, 1, !dbg !1169
  %mul150 = mul nsw i32 %add148, %add149, !dbg !1170
  %conv151 = sext i32 %mul150 to i64, !dbg !1171
  %mul152 = mul i64 %conv151, 4, !dbg !1172
  %call153 = call i32 @cudaMemcpy(i8* %198, i8* %200, i64 %mul152, i32 2), !dbg !1173
  %203 = load float*, float** %input_cuda, align 8, !dbg !1174
  %204 = bitcast float* %203 to i8*, !dbg !1174
  %call154 = call i32 @cudaFree(i8* %204), !dbg !1175
  %205 = load float*, float** %output_hidden_cuda, align 8, !dbg !1176
  %206 = bitcast float* %205 to i8*, !dbg !1176
  %call155 = call i32 @cudaFree(i8* %206), !dbg !1177
  %207 = load float*, float** %input_hidden_cuda, align 8, !dbg !1178
  %208 = bitcast float* %207 to i8*, !dbg !1178
  %call156 = call i32 @cudaFree(i8* %208), !dbg !1179
  %209 = load float*, float** %hidden_partial_sum, align 8, !dbg !1180
  %210 = bitcast float* %209 to i8*, !dbg !1180
  %call157 = call i32 @cudaFree(i8* %210), !dbg !1181
  %211 = load float*, float** %input_prev_weights_cuda, align 8, !dbg !1182
  %212 = bitcast float* %211 to i8*, !dbg !1182
  %call158 = call i32 @cudaFree(i8* %212), !dbg !1183
  %213 = load float*, float** %hidden_delta_cuda, align 8, !dbg !1184
  %214 = bitcast float* %213 to i8*, !dbg !1184
  %call159 = call i32 @cudaFree(i8* %214), !dbg !1185
  %215 = load float*, float** %partial_sum, align 8, !dbg !1186
  %216 = bitcast float* %215 to i8*, !dbg !1186
  call void @free(i8* %216) #8, !dbg !1187
  %217 = load float*, float** %input_weights_one_dim, align 8, !dbg !1188
  %218 = bitcast float* %217 to i8*, !dbg !1188
  call void @free(i8* %218) #8, !dbg !1189
  %219 = load float*, float** %input_weights_prev_one_dim, align 8, !dbg !1190
  %220 = bitcast float* %219 to i8*, !dbg !1190
  call void @free(i8* %220) #8, !dbg !1191
  ret void, !dbg !1192
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #2 comdat align 2 !dbg !1193 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1194, metadata !666), !dbg !1196
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1197, metadata !666), !dbg !1198
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1199, metadata !666), !dbg !1200
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1201, metadata !666), !dbg !1202
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1203
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1204
  store i32 %0, i32* %x, align 4, !dbg !1203
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1205
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1206
  store i32 %1, i32* %y, align 4, !dbg !1205
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1207
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1208
  store i32 %2, i32* %z, align 4, !dbg !1207
  ret void, !dbg !1209
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare i32 @cudaMalloc(i8**, i64) #5

declare i32 @printf(i8*, ...) #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #6

declare i32 @cudaThreadSynchronize() #5

declare i32 @cudaGetLastError() #5

declare i8* @cudaGetErrorString(i32) #5

; Function Attrs: noreturn nounwind
declare void @exit(i32) #7

; Function Attrs: nounwind
declare double @exp(double) #3

declare void @bpnn_layerforward(float*, float*, float**, i32, i32) #5

declare void @bpnn_output_error(float*, float*, float*, i32, float*) #5

declare void @bpnn_hidden_error(float*, i32, float*, i32, float**, float*, float*) #5

declare void @bpnn_adjust_weights(float*, i32, float*, i32, float**, float**) #5

declare i32 @cudaFree(i8*) #5

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!657, !658}
!llvm.ident = !{!659}

!0 = distinct !DIGlobalVariable(name: "num_threads", scope: !1, file: !2, line: 45, type: !102, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !95, globals: !100, imports: !103)
!2 = !DIFile(filename: "backprop_cuda.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!3 = !{!4, !12}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !5, line: 807, size: 32, align: 32, elements: !6, identifier: "_ZTS14cudaMemcpyKind")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!8 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!11 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !5, line: 156, size: 32, align: 32, elements: !13, identifier: "_ZTS9cudaError")
!13 = !{!14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94}
!14 = !DIEnumerator(name: "cudaSuccess", value: 0)
!15 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1)
!16 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2)
!17 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3)
!18 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4)
!19 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5)
!20 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6)
!21 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7)
!22 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8)
!23 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9)
!24 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10)
!25 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11)
!26 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12)
!27 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13)
!28 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14)
!29 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15)
!30 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16)
!31 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17)
!32 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18)
!33 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19)
!34 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20)
!35 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21)
!36 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22)
!37 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23)
!38 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24)
!39 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25)
!40 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26)
!41 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27)
!42 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28)
!43 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29)
!44 = !DIEnumerator(name: "cudaErrorUnknown", value: 30)
!45 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31)
!46 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32)
!47 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33)
!48 = !DIEnumerator(name: "cudaErrorNotReady", value: 34)
!49 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35)
!50 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36)
!51 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37)
!52 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38)
!53 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39)
!54 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40)
!55 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41)
!56 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42)
!57 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43)
!58 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44)
!59 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45)
!60 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46)
!61 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47)
!62 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48)
!63 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49)
!64 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50)
!65 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51)
!66 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54)
!67 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55)
!68 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56)
!69 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57)
!70 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58)
!71 = !DIEnumerator(name: "cudaErrorAssert", value: 59)
!72 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60)
!73 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61)
!74 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62)
!75 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63)
!76 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64)
!77 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65)
!78 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66)
!79 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67)
!80 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68)
!81 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69)
!82 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70)
!83 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71)
!84 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72)
!85 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73)
!86 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74)
!87 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75)
!88 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76)
!89 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77)
!90 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78)
!91 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79)
!92 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 80)
!93 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!94 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!95 = !{!96, !98, !97}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64, align: 64)
!97 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64, align: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!100 = !{!0, !101}
!101 = distinct !DIGlobalVariable(name: "num_blocks", scope: !1, file: !2, line: 46, type: !102, isLocal: false, isDefinition: true)
!102 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!103 = !{!104, !111, !115, !117, !119, !121, !123, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !159, !161, !163, !165, !170, !175, !177, !179, !184, !188, !190, !192, !194, !196, !198, !200, !202, !204, !209, !213, !215, !217, !221, !223, !225, !227, !229, !231, !235, !237, !239, !243, !251, !255, !257, !259, !263, !265, !267, !271, !273, !275, !279, !281, !283, !285, !287, !289, !291, !293, !295, !297, !302, !304, !306, !310, !312, !314, !316, !318, !320, !322, !324, !328, !332, !334, !336, !341, !343, !345, !347, !349, !351, !353, !357, !363, !367, !371, !376, !378, !382, !386, !399, !403, !407, !411, !415, !420, !422, !426, !430, !434, !442, !446, !450, !454, !458, !462, !468, !472, !476, !478, !486, !490, !498, !500, !502, !506, !510, !514, !519, !523, !528, !529, !530, !531, !534, !535, !536, !537, !538, !539, !540, !543, !545, !547, !549, !551, !553, !555, !557, !560, !562, !564, !566, !568, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !628, !629, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !107, line: 189)
!105 = !DINamespace(name: "std", scope: null, file: !106, line: 188)
!106 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!107 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !106, file: !106, line: 44, type: !108, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DISubroutineType(types: !109)
!109 = !{!110, !110}
!110 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !112, line: 190)
!112 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !106, file: !106, line: 46, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DISubroutineType(types: !114)
!114 = !{!97, !97}
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !116, line: 191)
!116 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !106, file: !106, line: 48, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !118, line: 192)
!118 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !106, file: !106, line: 50, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !120, line: 193)
!120 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !106, file: !106, line: 52, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !122, line: 194)
!122 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !106, file: !106, line: 56, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !124, line: 195)
!124 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !106, file: !106, line: 54, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!97, !97, !97}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !128, line: 196)
!128 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !106, file: !106, line: 58, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !130, line: 197)
!130 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !106, file: !106, line: 60, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !132, line: 198)
!132 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !106, file: !106, line: 62, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !134, line: 199)
!134 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !106, file: !106, line: 64, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !136, line: 200)
!136 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !106, file: !106, line: 66, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !138, line: 201)
!138 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !106, file: !106, line: 68, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !140, line: 202)
!140 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !106, file: !106, line: 72, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !142, line: 203)
!142 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !106, file: !106, line: 70, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !144, line: 204)
!144 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !106, file: !106, line: 76, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !146, line: 205)
!146 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !106, file: !106, line: 74, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !148, line: 206)
!148 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !106, file: !106, line: 78, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !150, line: 207)
!150 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !106, file: !106, line: 80, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !152, line: 208)
!152 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !106, file: !106, line: 82, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !154, line: 209)
!154 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !106, file: !106, line: 84, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !156, line: 210)
!156 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !106, file: !106, line: 86, type: !157, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!97, !97, !97, !97}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !160, line: 211)
!160 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !106, file: !106, line: 88, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !162, line: 212)
!162 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !106, file: !106, line: 90, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !164, line: 213)
!164 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !106, file: !106, line: 92, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !166, line: 214)
!166 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !106, file: !106, line: 94, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!169, !97}
!169 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !171, line: 215)
!171 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !106, file: !106, line: 96, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{!97, !97, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64, align: 64)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !176, line: 216)
!176 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !106, file: !106, line: 98, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !178, line: 217)
!178 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !106, file: !106, line: 100, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !180, line: 218)
!180 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !106, file: !106, line: 102, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!183, !97}
!183 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !185, line: 219)
!185 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !106, file: !106, line: 106, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DISubroutineType(types: !187)
!187 = !{!183, !97, !97}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !189, line: 220)
!189 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !106, file: !106, line: 105, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !191, line: 221)
!191 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !106, file: !106, line: 108, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !193, line: 222)
!193 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !106, file: !106, line: 112, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !195, line: 223)
!195 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !106, file: !106, line: 111, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !197, line: 224)
!197 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !106, file: !106, line: 114, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !199, line: 225)
!199 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !106, file: !106, line: 116, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !201, line: 226)
!201 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !106, file: !106, line: 118, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !203, line: 227)
!203 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !106, file: !106, line: 120, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !205, line: 228)
!205 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !106, file: !106, line: 121, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!208, !208}
!208 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !210, line: 229)
!210 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !106, file: !106, line: 123, type: !211, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DISubroutineType(types: !212)
!212 = !{!97, !97, !169}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !214, line: 230)
!214 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !106, file: !106, line: 125, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !216, line: 231)
!216 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !106, file: !106, line: 126, type: !108, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !218, line: 232)
!218 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !106, file: !106, line: 128, type: !219, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DISubroutineType(types: !220)
!220 = !{!110, !97}
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !222, line: 233)
!222 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !106, file: !106, line: 138, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !224, line: 234)
!224 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !106, file: !106, line: 130, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !226, line: 235)
!226 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !106, file: !106, line: 132, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !228, line: 236)
!228 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !106, file: !106, line: 134, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !230, line: 237)
!230 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !106, file: !106, line: 136, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !232, line: 238)
!232 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !106, file: !106, line: 140, type: !233, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DISubroutineType(types: !234)
!234 = !{!208, !97}
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !236, line: 239)
!236 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !106, file: !106, line: 142, type: !233, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !238, line: 240)
!238 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !106, file: !106, line: 143, type: !219, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !240, line: 241)
!240 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !106, file: !106, line: 145, type: !241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!97, !97, !96}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !244, line: 242)
!244 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !106, file: !106, line: 146, type: !245, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DISubroutineType(types: !246)
!246 = !{!247, !248}
!247 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !249, size: 64, align: 64)
!249 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !250)
!250 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !252, line: 243)
!252 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !106, file: !106, line: 147, type: !253, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DISubroutineType(types: !254)
!254 = !{!97, !248}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !256, line: 244)
!256 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !106, file: !106, line: 149, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !258, line: 245)
!258 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !106, file: !106, line: 151, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !260, line: 246)
!260 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !106, file: !106, line: 153, type: !261, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DISubroutineType(types: !262)
!262 = !{!97, !97, !247}
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !264, line: 247)
!264 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !106, file: !106, line: 158, type: !211, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !266, line: 248)
!266 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !106, file: !106, line: 160, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !268, line: 249)
!268 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !106, file: !106, line: 162, type: !269, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DISubroutineType(types: !270)
!270 = !{!97, !97, !97, !174}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !272, line: 250)
!272 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !106, file: !106, line: 164, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !274, line: 251)
!274 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !106, file: !106, line: 166, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !276, line: 252)
!276 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !106, file: !106, line: 168, type: !277, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DISubroutineType(types: !278)
!278 = !{!97, !97, !208}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !280, line: 253)
!280 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !106, file: !106, line: 170, type: !211, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !282, line: 254)
!282 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !106, file: !106, line: 172, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !284, line: 255)
!284 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !106, file: !106, line: 174, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !286, line: 256)
!286 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !106, file: !106, line: 176, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !288, line: 257)
!288 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !106, file: !106, line: 178, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !290, line: 258)
!290 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !106, file: !106, line: 180, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !292, line: 259)
!292 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !106, file: !106, line: 182, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !294, line: 260)
!294 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !106, file: !106, line: 184, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !296, line: 261)
!296 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !106, file: !106, line: 186, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !298, line: 102)
!298 = !DISubprogram(name: "acos", scope: !299, file: !299, line: 54, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!300 = !DISubroutineType(types: !301)
!301 = !{!247, !247}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !303, line: 121)
!303 = !DISubprogram(name: "asin", scope: !299, file: !299, line: 56, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !305, line: 140)
!305 = !DISubprogram(name: "atan", scope: !299, file: !299, line: 58, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !307, line: 159)
!307 = !DISubprogram(name: "atan2", scope: !299, file: !299, line: 60, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!247, !247, !247}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !311, line: 180)
!311 = !DISubprogram(name: "ceil", scope: !299, file: !299, line: 178, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !313, line: 199)
!313 = !DISubprogram(name: "cos", scope: !299, file: !299, line: 63, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !315, line: 218)
!315 = !DISubprogram(name: "cosh", scope: !299, file: !299, line: 72, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !317, line: 237)
!317 = !DISubprogram(name: "exp", scope: !299, file: !299, line: 100, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !319, line: 256)
!319 = !DISubprogram(name: "fabs", scope: !299, file: !299, line: 181, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !321, line: 275)
!321 = !DISubprogram(name: "floor", scope: !299, file: !299, line: 184, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !323, line: 294)
!323 = !DISubprogram(name: "fmod", scope: !299, file: !299, line: 187, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !325, line: 315)
!325 = !DISubprogram(name: "frexp", scope: !299, file: !299, line: 103, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!247, !247, !174}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !329, line: 334)
!329 = !DISubprogram(name: "ldexp", scope: !299, file: !299, line: 106, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!247, !247, !169}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !333, line: 353)
!333 = !DISubprogram(name: "log", scope: !299, file: !299, line: 109, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !335, line: 372)
!335 = !DISubprogram(name: "log10", scope: !299, file: !299, line: 112, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !337, line: 391)
!337 = !DISubprogram(name: "modf", scope: !299, file: !299, line: 115, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{!247, !247, !340}
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64, align: 64)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !342, line: 403)
!342 = !DISubprogram(name: "pow", scope: !299, file: !299, line: 153, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !344, line: 440)
!344 = !DISubprogram(name: "sin", scope: !299, file: !299, line: 65, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !346, line: 459)
!346 = !DISubprogram(name: "sinh", scope: !299, file: !299, line: 74, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !348, line: 478)
!348 = !DISubprogram(name: "sqrt", scope: !299, file: !299, line: 156, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !350, line: 497)
!350 = !DISubprogram(name: "tan", scope: !299, file: !299, line: 67, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !352, line: 516)
!352 = !DISubprogram(name: "tanh", scope: !299, file: !299, line: 76, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !354, line: 118)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !355, line: 101, baseType: !356)
!355 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!356 = !DICompositeType(tag: DW_TAG_structure_type, file: !355, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !358, line: 119)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !355, line: 109, baseType: !359)
!359 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !355, line: 105, size: 128, align: 64, elements: !360, identifier: "_ZTS6ldiv_t")
!360 = !{!361, !362}
!361 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !359, file: !355, line: 107, baseType: !208, size: 64, align: 64)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !359, file: !355, line: 108, baseType: !208, size: 64, align: 64, offset: 64)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !364, line: 121)
!364 = !DISubprogram(name: "abort", scope: !355, file: !355, line: 515, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{null}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !368, line: 122)
!368 = !DISubprogram(name: "abs", scope: !355, file: !355, line: 774, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!169, !169}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !372, line: 123)
!372 = !DISubprogram(name: "atexit", scope: !355, file: !355, line: 519, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{!169, !375}
!375 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64, align: 64)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !377, line: 129)
!377 = !DISubprogram(name: "atof", scope: !355, file: !355, line: 144, type: !245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !379, line: 130)
!379 = !DISubprogram(name: "atoi", scope: !355, file: !355, line: 147, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!169, !248}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !383, line: 131)
!383 = !DISubprogram(name: "atol", scope: !355, file: !355, line: 150, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!208, !248}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !387, line: 132)
!387 = !DISubprogram(name: "bsearch", scope: !355, file: !355, line: 754, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!99, !390, !390, !392, !392, !395}
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !391, size: 64, align: 64)
!391 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !393, line: 62, baseType: !394)
!393 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!394 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !355, line: 741, baseType: !396)
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !397, size: 64, align: 64)
!397 = !DISubroutineType(types: !398)
!398 = !{!169, !390, !390}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !400, line: 133)
!400 = !DISubprogram(name: "calloc", scope: !355, file: !355, line: 468, type: !401, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!401 = !DISubroutineType(types: !402)
!402 = !{!99, !392, !392}
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !404, line: 134)
!404 = !DISubprogram(name: "div", scope: !355, file: !355, line: 788, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!405 = !DISubroutineType(types: !406)
!406 = !{!354, !169, !169}
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !408, line: 135)
!408 = !DISubprogram(name: "exit", scope: !355, file: !355, line: 543, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!409 = !DISubroutineType(types: !410)
!410 = !{null, !169}
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !412, line: 136)
!412 = !DISubprogram(name: "free", scope: !355, file: !355, line: 483, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DISubroutineType(types: !414)
!414 = !{null, !99}
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !416, line: 137)
!416 = !DISubprogram(name: "getenv", scope: !355, file: !355, line: 564, type: !417, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!417 = !DISubroutineType(types: !418)
!418 = !{!419, !248}
!419 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 64, align: 64)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !421, line: 138)
!421 = !DISubprogram(name: "labs", scope: !355, file: !355, line: 775, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !423, line: 139)
!423 = !DISubprogram(name: "ldiv", scope: !355, file: !355, line: 790, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{!358, !208, !208}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !427, line: 140)
!427 = !DISubprogram(name: "malloc", scope: !355, file: !355, line: 466, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{!99, !392}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !431, line: 142)
!431 = !DISubprogram(name: "mblen", scope: !355, file: !355, line: 862, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DISubroutineType(types: !433)
!433 = !{!169, !248, !392}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !435, line: 143)
!435 = !DISubprogram(name: "mbstowcs", scope: !355, file: !355, line: 873, type: !436, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!436 = !DISubroutineType(types: !437)
!437 = !{!392, !438, !441, !392}
!438 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !439)
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64, align: 64)
!440 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!441 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !248)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !443, line: 144)
!443 = !DISubprogram(name: "mbtowc", scope: !355, file: !355, line: 865, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{!169, !438, !441, !392}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !447, line: 146)
!447 = !DISubprogram(name: "qsort", scope: !355, file: !355, line: 764, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!448 = !DISubroutineType(types: !449)
!449 = !{null, !99, !392, !392, !395}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !451, line: 152)
!451 = !DISubprogram(name: "rand", scope: !355, file: !355, line: 374, type: !452, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DISubroutineType(types: !453)
!453 = !{!169}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !455, line: 153)
!455 = !DISubprogram(name: "realloc", scope: !355, file: !355, line: 480, type: !456, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DISubroutineType(types: !457)
!457 = !{!99, !99, !392}
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !459, line: 154)
!459 = !DISubprogram(name: "srand", scope: !355, file: !355, line: 376, type: !460, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!460 = !DISubroutineType(types: !461)
!461 = !{null, !102}
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !463, line: 155)
!463 = !DISubprogram(name: "strtod", scope: !355, file: !355, line: 164, type: !464, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DISubroutineType(types: !465)
!465 = !{!247, !441, !466}
!466 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !467)
!467 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !419, size: 64, align: 64)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !469, line: 156)
!469 = !DISubprogram(name: "strtol", scope: !355, file: !355, line: 183, type: !470, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DISubroutineType(types: !471)
!471 = !{!208, !441, !466, !169}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !473, line: 157)
!473 = !DISubprogram(name: "strtoul", scope: !355, file: !355, line: 187, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!394, !441, !466, !169}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !477, line: 158)
!477 = !DISubprogram(name: "system", scope: !355, file: !355, line: 716, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !479, line: 160)
!479 = !DISubprogram(name: "wcstombs", scope: !355, file: !355, line: 876, type: !480, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DISubroutineType(types: !481)
!481 = !{!392, !482, !483, !392}
!482 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !419)
!483 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !484)
!484 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !485, size: 64, align: 64)
!485 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !440)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !487, line: 161)
!487 = !DISubprogram(name: "wctomb", scope: !355, file: !355, line: 869, type: !488, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DISubroutineType(types: !489)
!489 = !{!169, !419, !440}
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !493, line: 214)
!491 = !DINamespace(name: "__gnu_cxx", scope: null, file: !492, line: 220)
!492 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!493 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !355, line: 121, baseType: !494)
!494 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !355, line: 117, size: 128, align: 64, elements: !495, identifier: "_ZTS7lldiv_t")
!495 = !{!496, !497}
!496 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !494, file: !355, line: 119, baseType: !110, size: 64, align: 64)
!497 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !494, file: !355, line: 120, baseType: !110, size: 64, align: 64, offset: 64)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !499, line: 220)
!499 = !DISubprogram(name: "_Exit", scope: !355, file: !355, line: 557, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !501, line: 224)
!501 = !DISubprogram(name: "llabs", scope: !355, file: !355, line: 779, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !503, line: 230)
!503 = !DISubprogram(name: "lldiv", scope: !355, file: !355, line: 796, type: !504, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DISubroutineType(types: !505)
!505 = !{!493, !110, !110}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !507, line: 241)
!507 = !DISubprogram(name: "atoll", scope: !355, file: !355, line: 157, type: !508, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DISubroutineType(types: !509)
!509 = !{!110, !248}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !511, line: 242)
!511 = !DISubprogram(name: "strtoll", scope: !355, file: !355, line: 209, type: !512, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DISubroutineType(types: !513)
!513 = !{!110, !441, !466, !169}
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !515, line: 243)
!515 = !DISubprogram(name: "strtoull", scope: !355, file: !355, line: 214, type: !516, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DISubroutineType(types: !517)
!517 = !{!518, !441, !466, !169}
!518 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !520, line: 245)
!520 = !DISubprogram(name: "strtof", scope: !355, file: !355, line: 172, type: !521, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DISubroutineType(types: !522)
!522 = !{!97, !441, !466}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !491, entity: !524, line: 246)
!524 = !DISubprogram(name: "strtold", scope: !355, file: !355, line: 175, type: !525, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DISubroutineType(types: !526)
!526 = !{!527, !441, !466}
!527 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !493, line: 254)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !499, line: 256)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !501, line: 258)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !532, line: 259)
!532 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !491, file: !533, line: 227, type: !504, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !503, line: 260)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !507, line: 262)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !520, line: 263)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !511, line: 264)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !515, line: 265)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !524, line: 266)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !541, line: 397)
!541 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !542, file: !542, line: 1342, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !544, line: 398)
!544 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !542, file: !542, line: 1370, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !546, line: 399)
!546 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !542, file: !542, line: 1337, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !548, line: 400)
!548 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !542, file: !542, line: 1375, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !550, line: 401)
!550 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !542, file: !542, line: 1327, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !552, line: 402)
!552 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !542, file: !542, line: 1332, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !554, line: 403)
!554 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !542, file: !542, line: 1380, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !556, line: 404)
!556 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !542, file: !542, line: 1430, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !558, line: 405)
!558 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !559, file: !559, line: 667, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !561, line: 406)
!561 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !542, file: !542, line: 1189, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !563, line: 407)
!563 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !542, file: !542, line: 1243, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !565, line: 408)
!565 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !542, file: !542, line: 1312, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !567, line: 409)
!567 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !542, file: !542, line: 1490, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !569, line: 410)
!569 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !542, file: !542, line: 1480, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !571, line: 411)
!571 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !559, file: !559, line: 657, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !573, line: 412)
!573 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !542, file: !542, line: 1294, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !575, line: 413)
!575 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !542, file: !542, line: 1385, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !577, line: 414)
!577 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !559, file: !559, line: 607, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !579, line: 415)
!579 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !542, file: !542, line: 1616, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !581, line: 416)
!581 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !559, file: !559, line: 597, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !583, line: 417)
!583 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !542, file: !542, line: 1568, type: !157, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !585, line: 418)
!585 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !559, file: !559, line: 622, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !587, line: 419)
!587 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !559, file: !559, line: 617, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !589, line: 420)
!589 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !542, file: !542, line: 1553, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !591, line: 421)
!591 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !542, file: !542, line: 1543, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !593, line: 422)
!593 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !542, file: !542, line: 1390, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !595, line: 423)
!595 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !542, file: !542, line: 1621, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !597, line: 424)
!597 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !542, file: !542, line: 1520, type: !211, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !599, line: 425)
!599 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !542, file: !542, line: 1515, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !601, line: 426)
!601 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !542, file: !542, line: 1149, type: !219, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !603, line: 427)
!603 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !542, file: !542, line: 1602, type: !219, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !605, line: 428)
!605 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !542, file: !542, line: 1356, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !607, line: 429)
!607 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !542, file: !542, line: 1365, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !609, line: 430)
!609 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !542, file: !542, line: 1285, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !611, line: 431)
!611 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !542, file: !542, line: 1626, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !613, line: 432)
!613 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !542, file: !542, line: 1347, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !615, line: 433)
!615 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !542, file: !542, line: 1140, type: !233, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !617, line: 434)
!617 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !542, file: !542, line: 1607, type: !233, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !619, line: 435)
!619 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !542, file: !542, line: 1548, type: !241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !621, line: 436)
!621 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !542, file: !542, line: 1154, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !623, line: 437)
!623 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !542, file: !542, line: 1218, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !625, line: 438)
!625 = !DISubprogram(name: "nexttowardf", scope: !299, file: !299, line: 294, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DISubroutineType(types: !627)
!627 = !{!97, !97, !527}
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !625, line: 439)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !630, line: 440)
!630 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !542, file: !542, line: 1583, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !632, line: 441)
!632 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !542, file: !542, line: 1558, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !634, line: 442)
!634 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !542, file: !542, line: 1563, type: !269, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !636, line: 443)
!636 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !542, file: !542, line: 1135, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !638, line: 444)
!638 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !542, file: !542, line: 1597, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !640, line: 445)
!640 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !542, file: !542, line: 1530, type: !277, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !642, line: 446)
!642 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !542, file: !542, line: 1525, type: !211, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !644, line: 447)
!644 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !542, file: !542, line: 1234, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !646, line: 448)
!646 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !542, file: !542, line: 1317, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !648, line: 449)
!648 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !559, file: !559, line: 907, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !650, line: 450)
!650 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !542, file: !542, line: 1276, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !652, line: 451)
!652 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !542, file: !542, line: 1322, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !654, line: 452)
!654 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !542, file: !542, line: 1592, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !656, line: 453)
!656 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !559, file: !559, line: 662, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!657 = !{i32 2, !"Dwarf Version", i32 4}
!658 = !{i32 2, !"Debug Info Version", i32 3}
!659 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!660 = distinct !DISubprogram(name: "bpnn_layerforward_CUDA", linkageName: "_Z22bpnn_layerforward_CUDAPfS_S_S_ii", scope: !661, file: !661, line: 13, type: !662, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !664)
!661 = !DIFile(filename: "./backprop_cuda_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!662 = !DISubroutineType(types: !663)
!663 = !{null, !96, !96, !96, !96, !169, !169}
!664 = !{}
!665 = !DILocalVariable(name: "input_cuda", arg: 1, scope: !660, file: !661, line: 13, type: !96)
!666 = !DIExpression()
!667 = !DILocation(line: 13, column: 31, scope: !660)
!668 = !DILocalVariable(name: "output_hidden_cuda", arg: 2, scope: !660, file: !661, line: 14, type: !96)
!669 = !DILocation(line: 14, column: 28, scope: !660)
!670 = !DILocalVariable(name: "input_hidden_cuda", arg: 3, scope: !660, file: !661, line: 15, type: !96)
!671 = !DILocation(line: 15, column: 16, scope: !660)
!672 = !DILocalVariable(name: "hidden_partial_sum", arg: 4, scope: !660, file: !661, line: 16, type: !96)
!673 = !DILocation(line: 16, column: 16, scope: !660)
!674 = !DILocalVariable(name: "in", arg: 5, scope: !660, file: !661, line: 17, type: !169)
!675 = !DILocation(line: 17, column: 13, scope: !660)
!676 = !DILocalVariable(name: "hid", arg: 6, scope: !660, file: !661, line: 18, type: !169)
!677 = !DILocation(line: 18, column: 13, scope: !660)
!678 = !DILocation(line: 19, column: 1, scope: !660)
!679 = !DILocation(line: 19, column: 1, scope: !680)
!680 = !DILexicalBlockFile(scope: !660, file: !661, discriminator: 1)
!681 = !DILocation(line: 19, column: 1, scope: !682)
!682 = !DILexicalBlockFile(scope: !660, file: !661, discriminator: 2)
!683 = !DILocation(line: 19, column: 1, scope: !684)
!684 = !DILexicalBlockFile(scope: !660, file: !661, discriminator: 3)
!685 = !DILocation(line: 19, column: 1, scope: !686)
!686 = !DILexicalBlockFile(scope: !660, file: !661, discriminator: 4)
!687 = !DILocation(line: 19, column: 1, scope: !688)
!688 = !DILexicalBlockFile(scope: !660, file: !661, discriminator: 5)
!689 = !DILocation(line: 19, column: 1, scope: !690)
!690 = !DILexicalBlockFile(scope: !660, file: !661, discriminator: 6)
!691 = !DILocation(line: 78, column: 1, scope: !660)
!692 = distinct !DISubprogram(name: "bpnn_adjust_weights_cuda", linkageName: "_Z24bpnn_adjust_weights_cudaPfiS_iS_S_", scope: !661, file: !661, line: 81, type: !693, isLocal: false, isDefinition: true, scopeLine: 87, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !664)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !96, !169, !96, !169, !96, !96}
!695 = !DILocalVariable(name: "delta", arg: 1, scope: !692, file: !661, line: 81, type: !96)
!696 = !DILocation(line: 81, column: 50, scope: !692)
!697 = !DILocalVariable(name: "hid", arg: 2, scope: !692, file: !661, line: 82, type: !169)
!698 = !DILocation(line: 82, column: 16, scope: !692)
!699 = !DILocalVariable(name: "ly", arg: 3, scope: !692, file: !661, line: 83, type: !96)
!700 = !DILocation(line: 83, column: 20, scope: !692)
!701 = !DILocalVariable(name: "in", arg: 4, scope: !692, file: !661, line: 84, type: !169)
!702 = !DILocation(line: 84, column: 16, scope: !692)
!703 = !DILocalVariable(name: "w", arg: 5, scope: !692, file: !661, line: 85, type: !96)
!704 = !DILocation(line: 85, column: 20, scope: !692)
!705 = !DILocalVariable(name: "oldw", arg: 6, scope: !692, file: !661, line: 86, type: !96)
!706 = !DILocation(line: 86, column: 20, scope: !692)
!707 = !DILocation(line: 87, column: 1, scope: !692)
!708 = !DILocation(line: 87, column: 1, scope: !709)
!709 = !DILexicalBlockFile(scope: !692, file: !661, discriminator: 1)
!710 = !DILocation(line: 87, column: 1, scope: !711)
!711 = !DILexicalBlockFile(scope: !692, file: !661, discriminator: 2)
!712 = !DILocation(line: 87, column: 1, scope: !713)
!713 = !DILexicalBlockFile(scope: !692, file: !661, discriminator: 3)
!714 = !DILocation(line: 87, column: 1, scope: !715)
!715 = !DILexicalBlockFile(scope: !692, file: !661, discriminator: 4)
!716 = !DILocation(line: 87, column: 1, scope: !717)
!717 = !DILexicalBlockFile(scope: !692, file: !661, discriminator: 5)
!718 = !DILocation(line: 87, column: 1, scope: !719)
!719 = !DILexicalBlockFile(scope: !692, file: !661, discriminator: 6)
!720 = !DILocation(line: 113, column: 1, scope: !692)
!721 = distinct !DISubprogram(name: "gettime", linkageName: "_Z7gettimev", scope: !2, file: !2, line: 39, type: !722, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !664)
!722 = !DISubroutineType(types: !723)
!723 = !{!247}
!724 = !DILocalVariable(name: "t", scope: !721, file: !2, line: 40, type: !725)
!725 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !726, line: 30, size: 128, align: 64, elements: !727, identifier: "_ZTS7timeval")
!726 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!727 = !{!728, !731}
!728 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !725, file: !726, line: 32, baseType: !729, size: 64, align: 64)
!729 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !730, line: 139, baseType: !208)
!730 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!731 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !725, file: !726, line: 33, baseType: !732, size: 64, align: 64, offset: 64)
!732 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !730, line: 141, baseType: !208)
!733 = !DILocation(line: 40, column: 18, scope: !721)
!734 = !DILocation(line: 41, column: 3, scope: !721)
!735 = !DILocation(line: 42, column: 12, scope: !721)
!736 = !DILocation(line: 42, column: 10, scope: !721)
!737 = !DILocation(line: 42, column: 21, scope: !721)
!738 = !DILocation(line: 42, column: 19, scope: !721)
!739 = !DILocation(line: 42, column: 28, scope: !721)
!740 = !DILocation(line: 42, column: 18, scope: !721)
!741 = !DILocation(line: 42, column: 3, scope: !721)
!742 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 52, type: !743, isLocal: false, isDefinition: true, scopeLine: 53, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !664)
!743 = !DISubroutineType(types: !744)
!744 = !{!169, !169, !467}
!745 = !DILocalVariable(name: "argc", arg: 1, scope: !742, file: !2, line: 52, type: !169)
!746 = !DILocation(line: 52, column: 11, scope: !742)
!747 = !DILocalVariable(name: "argv", arg: 2, scope: !742, file: !2, line: 52, type: !467)
!748 = !DILocation(line: 52, column: 24, scope: !742)
!749 = !DILocation(line: 54, column: 8, scope: !742)
!750 = !DILocation(line: 54, column: 14, scope: !742)
!751 = !DILocation(line: 54, column: 2, scope: !742)
!752 = !DILocation(line: 55, column: 1, scope: !742)
!753 = distinct !DISubprogram(name: "bpnn_train_cuda", scope: !2, file: !2, line: 59, type: !754, isLocal: false, isDefinition: true, scopeLine: 60, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !664)
!754 = !DISubroutineType(types: !755)
!755 = !{null, !756, !96, !96}
!756 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !757, size: 64, align: 64)
!757 = !DIDerivedType(tag: DW_TAG_typedef, name: "BPNN", file: !758, line: 36, baseType: !759)
!758 = !DIFile(filename: "./backprop.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!759 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !758, line: 16, size: 768, align: 64, elements: !760, identifier: "_ZTS4BPNN")
!760 = !{!761, !762, !763, !764, !765, !766, !767, !768, !769, !770, !772, !773, !774}
!761 = !DIDerivedType(tag: DW_TAG_member, name: "input_n", scope: !759, file: !758, line: 17, baseType: !169, size: 32, align: 32)
!762 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_n", scope: !759, file: !758, line: 18, baseType: !169, size: 32, align: 32, offset: 32)
!763 = !DIDerivedType(tag: DW_TAG_member, name: "output_n", scope: !759, file: !758, line: 19, baseType: !169, size: 32, align: 32, offset: 64)
!764 = !DIDerivedType(tag: DW_TAG_member, name: "input_units", scope: !759, file: !758, line: 21, baseType: !96, size: 64, align: 64, offset: 128)
!765 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_units", scope: !759, file: !758, line: 22, baseType: !96, size: 64, align: 64, offset: 192)
!766 = !DIDerivedType(tag: DW_TAG_member, name: "output_units", scope: !759, file: !758, line: 23, baseType: !96, size: 64, align: 64, offset: 256)
!767 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_delta", scope: !759, file: !758, line: 25, baseType: !96, size: 64, align: 64, offset: 320)
!768 = !DIDerivedType(tag: DW_TAG_member, name: "output_delta", scope: !759, file: !758, line: 26, baseType: !96, size: 64, align: 64, offset: 384)
!769 = !DIDerivedType(tag: DW_TAG_member, name: "target", scope: !759, file: !758, line: 28, baseType: !96, size: 64, align: 64, offset: 448)
!770 = !DIDerivedType(tag: DW_TAG_member, name: "input_weights", scope: !759, file: !758, line: 30, baseType: !771, size: 64, align: 64, offset: 512)
!771 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64, align: 64)
!772 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_weights", scope: !759, file: !758, line: 31, baseType: !771, size: 64, align: 64, offset: 576)
!773 = !DIDerivedType(tag: DW_TAG_member, name: "input_prev_weights", scope: !759, file: !758, line: 34, baseType: !771, size: 64, align: 64, offset: 640)
!774 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_prev_weights", scope: !759, file: !758, line: 35, baseType: !771, size: 64, align: 64, offset: 704)
!775 = !DILocalVariable(name: "net", arg: 1, scope: !753, file: !2, line: 59, type: !756)
!776 = !DILocation(line: 59, column: 28, scope: !753)
!777 = !DILocalVariable(name: "eo", arg: 2, scope: !753, file: !2, line: 59, type: !96)
!778 = !DILocation(line: 59, column: 40, scope: !753)
!779 = !DILocalVariable(name: "eh", arg: 3, scope: !753, file: !2, line: 59, type: !96)
!780 = !DILocation(line: 59, column: 51, scope: !753)
!781 = !DILocalVariable(name: "in", scope: !753, file: !2, line: 61, type: !169)
!782 = !DILocation(line: 61, column: 7, scope: !753)
!783 = !DILocalVariable(name: "hid", scope: !753, file: !2, line: 61, type: !169)
!784 = !DILocation(line: 61, column: 11, scope: !753)
!785 = !DILocalVariable(name: "out", scope: !753, file: !2, line: 61, type: !169)
!786 = !DILocation(line: 61, column: 16, scope: !753)
!787 = !DILocalVariable(name: "out_err", scope: !753, file: !2, line: 62, type: !97)
!788 = !DILocation(line: 62, column: 9, scope: !753)
!789 = !DILocalVariable(name: "hid_err", scope: !753, file: !2, line: 62, type: !97)
!790 = !DILocation(line: 62, column: 18, scope: !753)
!791 = !DILocation(line: 64, column: 8, scope: !753)
!792 = !DILocation(line: 64, column: 13, scope: !753)
!793 = !DILocation(line: 64, column: 6, scope: !753)
!794 = !DILocation(line: 65, column: 9, scope: !753)
!795 = !DILocation(line: 65, column: 14, scope: !753)
!796 = !DILocation(line: 65, column: 7, scope: !753)
!797 = !DILocation(line: 66, column: 9, scope: !753)
!798 = !DILocation(line: 66, column: 14, scope: !753)
!799 = !DILocation(line: 66, column: 7, scope: !753)
!800 = !DILocalVariable(name: "m", scope: !753, file: !2, line: 69, type: !169)
!801 = !DILocation(line: 69, column: 7, scope: !753)
!802 = !DILocalVariable(name: "input_hidden_cuda", scope: !753, file: !2, line: 70, type: !96)
!803 = !DILocation(line: 70, column: 10, scope: !753)
!804 = !DILocalVariable(name: "input_cuda", scope: !753, file: !2, line: 71, type: !96)
!805 = !DILocation(line: 71, column: 10, scope: !753)
!806 = !DILocalVariable(name: "output_hidden_cuda", scope: !753, file: !2, line: 72, type: !96)
!807 = !DILocation(line: 72, column: 10, scope: !753)
!808 = !DILocalVariable(name: "partial_sum", scope: !753, file: !2, line: 73, type: !96)
!809 = !DILocation(line: 73, column: 10, scope: !753)
!810 = !DILocalVariable(name: "hidden_partial_sum", scope: !753, file: !2, line: 74, type: !96)
!811 = !DILocation(line: 74, column: 10, scope: !753)
!812 = !DILocalVariable(name: "hidden_delta_cuda", scope: !753, file: !2, line: 75, type: !96)
!813 = !DILocation(line: 75, column: 10, scope: !753)
!814 = !DILocalVariable(name: "input_prev_weights_cuda", scope: !753, file: !2, line: 76, type: !96)
!815 = !DILocation(line: 76, column: 10, scope: !753)
!816 = !DILocalVariable(name: "sum", scope: !753, file: !2, line: 77, type: !97)
!817 = !DILocation(line: 77, column: 9, scope: !753)
!818 = !DILocalVariable(name: "input_weights_one_dim", scope: !753, file: !2, line: 78, type: !96)
!819 = !DILocation(line: 78, column: 10, scope: !753)
!820 = !DILocalVariable(name: "input_weights_prev_one_dim", scope: !753, file: !2, line: 79, type: !96)
!821 = !DILocation(line: 79, column: 10, scope: !753)
!822 = !DILocation(line: 80, column: 16, scope: !753)
!823 = !DILocation(line: 80, column: 19, scope: !753)
!824 = !DILocation(line: 80, column: 14, scope: !753)
!825 = !DILocalVariable(name: "grid", scope: !753, file: !2, line: 81, type: !826)
!826 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !827, line: 427, baseType: !828)
!827 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/backprop")
!828 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !827, line: 417, size: 96, align: 32, elements: !829, identifier: "_ZTS4dim3")
!829 = !{!830, !831, !832, !833, !837, !846}
!830 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !828, file: !827, line: 419, baseType: !102, size: 32, align: 32)
!831 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !828, file: !827, line: 419, baseType: !102, size: 32, align: 32, offset: 32)
!832 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !828, file: !827, line: 419, baseType: !102, size: 32, align: 32, offset: 64)
!833 = !DISubprogram(name: "dim3", scope: !828, file: !827, line: 421, type: !834, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!834 = !DISubroutineType(types: !835)
!835 = !{null, !836, !102, !102, !102}
!836 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !828, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!837 = !DISubprogram(name: "dim3", scope: !828, file: !827, line: 422, type: !838, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!838 = !DISubroutineType(types: !839)
!839 = !{null, !836, !840}
!840 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !827, line: 383, baseType: !841)
!841 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !827, line: 190, size: 96, align: 32, elements: !842, identifier: "_ZTS5uint3")
!842 = !{!843, !844, !845}
!843 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !841, file: !827, line: 192, baseType: !102, size: 32, align: 32)
!844 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !841, file: !827, line: 192, baseType: !102, size: 32, align: 32, offset: 32)
!845 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !841, file: !827, line: 192, baseType: !102, size: 32, align: 32, offset: 64)
!846 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !828, file: !827, line: 423, type: !847, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!847 = !DISubroutineType(types: !848)
!848 = !{!840, !836}
!849 = !DILocation(line: 81, column: 9, scope: !753)
!850 = !DILocation(line: 81, column: 19, scope: !753)
!851 = !DILocalVariable(name: "threads", scope: !753, file: !2, line: 82, type: !826)
!852 = !DILocation(line: 82, column: 9, scope: !753)
!853 = !DILocation(line: 84, column: 45, scope: !753)
!854 = !DILocation(line: 84, column: 48, scope: !753)
!855 = !DILocation(line: 84, column: 55, scope: !753)
!856 = !DILocation(line: 84, column: 59, scope: !753)
!857 = !DILocation(line: 84, column: 52, scope: !753)
!858 = !DILocation(line: 84, column: 44, scope: !753)
!859 = !DILocation(line: 84, column: 64, scope: !753)
!860 = !DILocation(line: 84, column: 37, scope: !753)
!861 = !DILocation(line: 84, column: 27, scope: !753)
!862 = !DILocation(line: 84, column: 25, scope: !753)
!863 = !DILocation(line: 85, column: 50, scope: !753)
!864 = !DILocation(line: 85, column: 53, scope: !753)
!865 = !DILocation(line: 85, column: 60, scope: !753)
!866 = !DILocation(line: 85, column: 64, scope: !753)
!867 = !DILocation(line: 85, column: 57, scope: !753)
!868 = !DILocation(line: 85, column: 49, scope: !753)
!869 = !DILocation(line: 85, column: 69, scope: !753)
!870 = !DILocation(line: 85, column: 42, scope: !753)
!871 = !DILocation(line: 85, column: 32, scope: !753)
!872 = !DILocation(line: 85, column: 30, scope: !753)
!873 = !DILocation(line: 86, column: 34, scope: !753)
!874 = !DILocation(line: 86, column: 45, scope: !753)
!875 = !DILocation(line: 86, column: 53, scope: !753)
!876 = !DILocation(line: 86, column: 27, scope: !753)
!877 = !DILocation(line: 86, column: 17, scope: !753)
!878 = !DILocation(line: 86, column: 15, scope: !753)
!879 = !DILocalVariable(name: "k", scope: !880, file: !2, line: 89, type: !169)
!880 = distinct !DILexicalBlock(scope: !753, file: !2, line: 89, column: 3)
!881 = !DILocation(line: 89, column: 12, scope: !880)
!882 = !DILocation(line: 89, column: 8, scope: !880)
!883 = !DILocation(line: 89, column: 19, scope: !884)
!884 = !DILexicalBlockFile(scope: !885, file: !2, discriminator: 1)
!885 = distinct !DILexicalBlock(scope: !880, file: !2, line: 89, column: 3)
!886 = !DILocation(line: 89, column: 24, scope: !884)
!887 = !DILocation(line: 89, column: 21, scope: !884)
!888 = !DILocation(line: 89, column: 3, scope: !884)
!889 = !DILocalVariable(name: "j", scope: !890, file: !2, line: 90, type: !169)
!890 = distinct !DILexicalBlock(scope: !891, file: !2, line: 90, column: 4)
!891 = distinct !DILexicalBlock(scope: !885, file: !2, line: 89, column: 33)
!892 = !DILocation(line: 90, column: 13, scope: !890)
!893 = !DILocation(line: 90, column: 9, scope: !890)
!894 = !DILocation(line: 90, column: 20, scope: !895)
!895 = !DILexicalBlockFile(scope: !896, file: !2, discriminator: 1)
!896 = distinct !DILexicalBlock(scope: !890, file: !2, line: 90, column: 4)
!897 = !DILocation(line: 90, column: 25, scope: !895)
!898 = !DILocation(line: 90, column: 22, scope: !895)
!899 = !DILocation(line: 90, column: 4, scope: !895)
!900 = !DILocation(line: 91, column: 31, scope: !901)
!901 = distinct !DILexicalBlock(scope: !896, file: !2, line: 90, column: 35)
!902 = !DILocation(line: 91, column: 36, scope: !901)
!903 = !DILocation(line: 91, column: 50, scope: !901)
!904 = !DILocation(line: 91, column: 53, scope: !901)
!905 = !DILocation(line: 91, column: 4, scope: !901)
!906 = !DILocation(line: 91, column: 26, scope: !901)
!907 = !DILocation(line: 91, column: 29, scope: !901)
!908 = !DILocation(line: 92, column: 36, scope: !901)
!909 = !DILocation(line: 92, column: 42, scope: !901)
!910 = !DILocation(line: 92, column: 61, scope: !901)
!911 = !DILocation(line: 92, column: 64, scope: !901)
!912 = !DILocation(line: 92, column: 4, scope: !901)
!913 = !DILocation(line: 92, column: 31, scope: !901)
!914 = !DILocation(line: 92, column: 34, scope: !901)
!915 = !DILocation(line: 93, column: 5, scope: !901)
!916 = !DILocation(line: 94, column: 5, scope: !901)
!917 = !DILocation(line: 90, column: 31, scope: !918)
!918 = !DILexicalBlockFile(scope: !896, file: !2, discriminator: 2)
!919 = !DILocation(line: 90, column: 4, scope: !918)
!920 = distinct !{!920, !921}
!921 = !DILocation(line: 90, column: 4, scope: !891)
!922 = !DILocation(line: 95, column: 3, scope: !891)
!923 = !DILocation(line: 89, column: 29, scope: !924)
!924 = !DILexicalBlockFile(scope: !885, file: !2, discriminator: 2)
!925 = !DILocation(line: 89, column: 3, scope: !924)
!926 = distinct !{!926, !927}
!927 = !DILocation(line: 89, column: 3, scope: !753)
!928 = !DILocation(line: 97, column: 14, scope: !753)
!929 = !DILocation(line: 97, column: 37, scope: !753)
!930 = !DILocation(line: 97, column: 40, scope: !753)
!931 = !DILocation(line: 97, column: 36, scope: !753)
!932 = !DILocation(line: 97, column: 45, scope: !753)
!933 = !DILocation(line: 97, column: 3, scope: !753)
!934 = !DILocation(line: 98, column: 14, scope: !753)
!935 = !DILocation(line: 98, column: 45, scope: !753)
!936 = !DILocation(line: 98, column: 49, scope: !753)
!937 = !DILocation(line: 98, column: 44, scope: !753)
!938 = !DILocation(line: 98, column: 54, scope: !753)
!939 = !DILocation(line: 98, column: 3, scope: !753)
!940 = !DILocation(line: 99, column: 14, scope: !753)
!941 = !DILocation(line: 99, column: 44, scope: !753)
!942 = !DILocation(line: 99, column: 47, scope: !753)
!943 = !DILocation(line: 99, column: 55, scope: !753)
!944 = !DILocation(line: 99, column: 59, scope: !753)
!945 = !DILocation(line: 99, column: 52, scope: !753)
!946 = !DILocation(line: 99, column: 43, scope: !753)
!947 = !DILocation(line: 99, column: 64, scope: !753)
!948 = !DILocation(line: 99, column: 3, scope: !753)
!949 = !DILocation(line: 100, column: 14, scope: !753)
!950 = !DILocation(line: 100, column: 44, scope: !753)
!951 = !DILocation(line: 100, column: 55, scope: !753)
!952 = !DILocation(line: 100, column: 63, scope: !753)
!953 = !DILocation(line: 100, column: 3, scope: !753)
!954 = !DILocation(line: 114, column: 3, scope: !753)
!955 = !DILocation(line: 118, column: 14, scope: !753)
!956 = !DILocation(line: 118, column: 26, scope: !753)
!957 = !DILocation(line: 118, column: 31, scope: !753)
!958 = !DILocation(line: 118, column: 45, scope: !753)
!959 = !DILocation(line: 118, column: 48, scope: !753)
!960 = !DILocation(line: 118, column: 44, scope: !753)
!961 = !DILocation(line: 118, column: 53, scope: !753)
!962 = !DILocation(line: 118, column: 3, scope: !753)
!963 = !DILocation(line: 119, column: 14, scope: !753)
!964 = !DILocation(line: 119, column: 33, scope: !753)
!965 = !DILocation(line: 119, column: 57, scope: !753)
!966 = !DILocation(line: 119, column: 60, scope: !753)
!967 = !DILocation(line: 119, column: 68, scope: !753)
!968 = !DILocation(line: 119, column: 72, scope: !753)
!969 = !DILocation(line: 119, column: 65, scope: !753)
!970 = !DILocation(line: 119, column: 56, scope: !753)
!971 = !DILocation(line: 119, column: 77, scope: !753)
!972 = !DILocation(line: 119, column: 3, scope: !753)
!973 = !DILocation(line: 123, column: 29, scope: !753)
!974 = !DILocation(line: 123, column: 35, scope: !753)
!975 = !DILocation(line: 123, column: 25, scope: !753)
!976 = !DILocation(line: 123, column: 3, scope: !753)
!977 = !DILocation(line: 123, column: 47, scope: !978)
!978 = !DILexicalBlockFile(scope: !753, file: !2, discriminator: 1)
!979 = !DILocation(line: 124, column: 44, scope: !753)
!980 = !DILocation(line: 125, column: 14, scope: !753)
!981 = !DILocation(line: 126, column: 14, scope: !753)
!982 = !DILocation(line: 127, column: 14, scope: !753)
!983 = !DILocation(line: 128, column: 14, scope: !753)
!984 = !DILocation(line: 123, column: 3, scope: !978)
!985 = !DILocation(line: 130, column: 3, scope: !753)
!986 = !DILocalVariable(name: "error", scope: !753, file: !2, line: 132, type: !987)
!987 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !5, line: 1477, baseType: !12)
!988 = !DILocation(line: 132, column: 15, scope: !753)
!989 = !DILocation(line: 132, column: 23, scope: !753)
!990 = !DILocation(line: 133, column: 6, scope: !991)
!991 = distinct !DILexicalBlock(scope: !753, file: !2, line: 133, column: 6)
!992 = !DILocation(line: 133, column: 12, scope: !991)
!993 = !DILocation(line: 133, column: 6, scope: !753)
!994 = !DILocation(line: 134, column: 56, scope: !995)
!995 = distinct !DILexicalBlock(scope: !991, file: !2, line: 133, column: 28)
!996 = !DILocation(line: 134, column: 37, scope: !995)
!997 = !DILocation(line: 134, column: 3, scope: !998)
!998 = !DILexicalBlockFile(scope: !995, file: !2, discriminator: 1)
!999 = !DILocation(line: 135, column: 3, scope: !995)
!1000 = !DILocation(line: 138, column: 14, scope: !753)
!1001 = !DILocation(line: 138, column: 27, scope: !753)
!1002 = !DILocation(line: 138, column: 47, scope: !753)
!1003 = !DILocation(line: 138, column: 58, scope: !753)
!1004 = !DILocation(line: 138, column: 66, scope: !753)
!1005 = !DILocation(line: 138, column: 3, scope: !753)
!1006 = !DILocalVariable(name: "j", scope: !1007, file: !2, line: 140, type: !169)
!1007 = distinct !DILexicalBlock(scope: !753, file: !2, line: 140, column: 3)
!1008 = !DILocation(line: 140, column: 12, scope: !1007)
!1009 = !DILocation(line: 140, column: 8, scope: !1007)
!1010 = !DILocation(line: 140, column: 19, scope: !1011)
!1011 = !DILexicalBlockFile(scope: !1012, file: !2, discriminator: 1)
!1012 = distinct !DILexicalBlock(scope: !1007, file: !2, line: 140, column: 3)
!1013 = !DILocation(line: 140, column: 24, scope: !1011)
!1014 = !DILocation(line: 140, column: 21, scope: !1011)
!1015 = !DILocation(line: 140, column: 3, scope: !1011)
!1016 = !DILocation(line: 141, column: 9, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1012, file: !2, line: 140, column: 34)
!1018 = !DILocalVariable(name: "k", scope: !1019, file: !2, line: 142, type: !169)
!1019 = distinct !DILexicalBlock(scope: !1017, file: !2, line: 142, column: 5)
!1020 = !DILocation(line: 142, column: 14, scope: !1019)
!1021 = !DILocation(line: 142, column: 10, scope: !1019)
!1022 = !DILocation(line: 142, column: 21, scope: !1023)
!1023 = !DILexicalBlockFile(scope: !1024, file: !2, discriminator: 1)
!1024 = distinct !DILexicalBlock(scope: !1019, file: !2, line: 142, column: 5)
!1025 = !DILocation(line: 142, column: 25, scope: !1023)
!1026 = !DILocation(line: 142, column: 23, scope: !1023)
!1027 = !DILocation(line: 142, column: 5, scope: !1023)
!1028 = !DILocation(line: 143, column: 14, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1024, file: !2, line: 142, column: 42)
!1030 = !DILocation(line: 143, column: 26, scope: !1029)
!1031 = !DILocation(line: 143, column: 30, scope: !1029)
!1032 = !DILocation(line: 143, column: 28, scope: !1029)
!1033 = !DILocation(line: 143, column: 36, scope: !1029)
!1034 = !DILocation(line: 143, column: 34, scope: !1029)
!1035 = !DILocation(line: 143, column: 37, scope: !1029)
!1036 = !DILocation(line: 143, column: 11, scope: !1029)
!1037 = !DILocation(line: 144, column: 5, scope: !1029)
!1038 = !DILocation(line: 142, column: 38, scope: !1039)
!1039 = !DILexicalBlockFile(scope: !1024, file: !2, discriminator: 2)
!1040 = !DILocation(line: 142, column: 5, scope: !1039)
!1041 = distinct !{!1041, !1042}
!1042 = !DILocation(line: 142, column: 5, scope: !1017)
!1043 = !DILocation(line: 145, column: 9, scope: !1017)
!1044 = !DILocation(line: 145, column: 14, scope: !1017)
!1045 = !DILocation(line: 145, column: 31, scope: !1017)
!1046 = !DILocation(line: 145, column: 6, scope: !1017)
!1047 = !DILocation(line: 146, column: 50, scope: !1017)
!1048 = !DILocation(line: 146, column: 49, scope: !1017)
!1049 = !DILocation(line: 146, column: 45, scope: !1017)
!1050 = !DILocation(line: 146, column: 43, scope: !1017)
!1051 = !DILocation(line: 146, column: 36, scope: !1017)
!1052 = !DILocation(line: 146, column: 32, scope: !1017)
!1053 = !DILocation(line: 146, column: 2, scope: !1017)
!1054 = !DILocation(line: 146, column: 8, scope: !1017)
!1055 = !DILocation(line: 146, column: 21, scope: !1017)
!1056 = !DILocation(line: 146, column: 24, scope: !1017)
!1057 = !DILocation(line: 147, column: 3, scope: !1017)
!1058 = !DILocation(line: 140, column: 30, scope: !1059)
!1059 = !DILexicalBlockFile(scope: !1012, file: !2, discriminator: 2)
!1060 = !DILocation(line: 140, column: 3, scope: !1059)
!1061 = distinct !{!1061, !1062}
!1062 = !DILocation(line: 140, column: 3, scope: !753)
!1063 = !DILocation(line: 150, column: 21, scope: !753)
!1064 = !DILocation(line: 150, column: 26, scope: !753)
!1065 = !DILocation(line: 150, column: 40, scope: !753)
!1066 = !DILocation(line: 150, column: 45, scope: !753)
!1067 = !DILocation(line: 150, column: 59, scope: !753)
!1068 = !DILocation(line: 150, column: 64, scope: !753)
!1069 = !DILocation(line: 150, column: 80, scope: !753)
!1070 = !DILocation(line: 150, column: 85, scope: !753)
!1071 = !DILocation(line: 150, column: 3, scope: !753)
!1072 = !DILocation(line: 151, column: 21, scope: !753)
!1073 = !DILocation(line: 151, column: 26, scope: !753)
!1074 = !DILocation(line: 151, column: 40, scope: !753)
!1075 = !DILocation(line: 151, column: 45, scope: !753)
!1076 = !DILocation(line: 151, column: 53, scope: !753)
!1077 = !DILocation(line: 151, column: 58, scope: !753)
!1078 = !DILocation(line: 151, column: 72, scope: !753)
!1079 = !DILocation(line: 151, column: 3, scope: !753)
!1080 = !DILocation(line: 152, column: 21, scope: !753)
!1081 = !DILocation(line: 152, column: 26, scope: !753)
!1082 = !DILocation(line: 152, column: 40, scope: !753)
!1083 = !DILocation(line: 152, column: 45, scope: !753)
!1084 = !DILocation(line: 152, column: 50, scope: !753)
!1085 = !DILocation(line: 152, column: 64, scope: !753)
!1086 = !DILocation(line: 152, column: 69, scope: !753)
!1087 = !DILocation(line: 152, column: 74, scope: !753)
!1088 = !DILocation(line: 152, column: 90, scope: !753)
!1089 = !DILocation(line: 152, column: 95, scope: !753)
!1090 = !DILocation(line: 152, column: 3, scope: !753)
!1091 = !DILocation(line: 153, column: 23, scope: !753)
!1092 = !DILocation(line: 153, column: 28, scope: !753)
!1093 = !DILocation(line: 153, column: 42, scope: !753)
!1094 = !DILocation(line: 153, column: 47, scope: !753)
!1095 = !DILocation(line: 153, column: 52, scope: !753)
!1096 = !DILocation(line: 153, column: 66, scope: !753)
!1097 = !DILocation(line: 153, column: 71, scope: !753)
!1098 = !DILocation(line: 153, column: 76, scope: !753)
!1099 = !DILocation(line: 153, column: 92, scope: !753)
!1100 = !DILocation(line: 153, column: 97, scope: !753)
!1101 = !DILocation(line: 153, column: 3, scope: !753)
!1102 = !DILocation(line: 164, column: 14, scope: !753)
!1103 = !DILocation(line: 164, column: 44, scope: !753)
!1104 = !DILocation(line: 164, column: 48, scope: !753)
!1105 = !DILocation(line: 164, column: 43, scope: !753)
!1106 = !DILocation(line: 164, column: 53, scope: !753)
!1107 = !DILocation(line: 164, column: 3, scope: !753)
!1108 = !DILocation(line: 165, column: 14, scope: !753)
!1109 = !DILocation(line: 165, column: 50, scope: !753)
!1110 = !DILocation(line: 165, column: 53, scope: !753)
!1111 = !DILocation(line: 165, column: 61, scope: !753)
!1112 = !DILocation(line: 165, column: 65, scope: !753)
!1113 = !DILocation(line: 165, column: 58, scope: !753)
!1114 = !DILocation(line: 165, column: 49, scope: !753)
!1115 = !DILocation(line: 165, column: 70, scope: !753)
!1116 = !DILocation(line: 165, column: 3, scope: !753)
!1117 = !DILocation(line: 167, column: 14, scope: !753)
!1118 = !DILocation(line: 167, column: 33, scope: !753)
!1119 = !DILocation(line: 167, column: 38, scope: !753)
!1120 = !DILocation(line: 167, column: 53, scope: !753)
!1121 = !DILocation(line: 167, column: 57, scope: !753)
!1122 = !DILocation(line: 167, column: 52, scope: !753)
!1123 = !DILocation(line: 167, column: 62, scope: !753)
!1124 = !DILocation(line: 167, column: 3, scope: !753)
!1125 = !DILocation(line: 168, column: 14, scope: !753)
!1126 = !DILocation(line: 168, column: 39, scope: !753)
!1127 = !DILocation(line: 168, column: 68, scope: !753)
!1128 = !DILocation(line: 168, column: 71, scope: !753)
!1129 = !DILocation(line: 168, column: 79, scope: !753)
!1130 = !DILocation(line: 168, column: 83, scope: !753)
!1131 = !DILocation(line: 168, column: 76, scope: !753)
!1132 = !DILocation(line: 168, column: 67, scope: !753)
!1133 = !DILocation(line: 168, column: 88, scope: !753)
!1134 = !DILocation(line: 168, column: 3, scope: !753)
!1135 = !DILocation(line: 169, column: 14, scope: !753)
!1136 = !DILocation(line: 169, column: 33, scope: !753)
!1137 = !DILocation(line: 169, column: 57, scope: !753)
!1138 = !DILocation(line: 169, column: 60, scope: !753)
!1139 = !DILocation(line: 169, column: 68, scope: !753)
!1140 = !DILocation(line: 169, column: 72, scope: !753)
!1141 = !DILocation(line: 169, column: 65, scope: !753)
!1142 = !DILocation(line: 169, column: 56, scope: !753)
!1143 = !DILocation(line: 169, column: 77, scope: !753)
!1144 = !DILocation(line: 169, column: 3, scope: !753)
!1145 = !DILocation(line: 172, column: 31, scope: !753)
!1146 = !DILocation(line: 172, column: 37, scope: !753)
!1147 = !DILocation(line: 172, column: 27, scope: !753)
!1148 = !DILocation(line: 172, column: 3, scope: !753)
!1149 = !DILocation(line: 172, column: 49, scope: !978)
!1150 = !DILocation(line: 173, column: 13, scope: !753)
!1151 = !DILocation(line: 174, column: 13, scope: !753)
!1152 = !DILocation(line: 175, column: 13, scope: !753)
!1153 = !DILocation(line: 176, column: 13, scope: !753)
!1154 = !DILocation(line: 177, column: 13, scope: !753)
!1155 = !DILocation(line: 172, column: 3, scope: !978)
!1156 = !DILocation(line: 180, column: 14, scope: !753)
!1157 = !DILocation(line: 180, column: 19, scope: !753)
!1158 = !DILocation(line: 180, column: 32, scope: !753)
!1159 = !DILocation(line: 180, column: 45, scope: !753)
!1160 = !DILocation(line: 180, column: 48, scope: !753)
!1161 = !DILocation(line: 180, column: 44, scope: !753)
!1162 = !DILocation(line: 180, column: 53, scope: !753)
!1163 = !DILocation(line: 180, column: 3, scope: !753)
!1164 = !DILocation(line: 181, column: 14, scope: !753)
!1165 = !DILocation(line: 181, column: 37, scope: !753)
!1166 = !DILocation(line: 181, column: 57, scope: !753)
!1167 = !DILocation(line: 181, column: 60, scope: !753)
!1168 = !DILocation(line: 181, column: 68, scope: !753)
!1169 = !DILocation(line: 181, column: 72, scope: !753)
!1170 = !DILocation(line: 181, column: 65, scope: !753)
!1171 = !DILocation(line: 181, column: 56, scope: !753)
!1172 = !DILocation(line: 181, column: 77, scope: !753)
!1173 = !DILocation(line: 181, column: 3, scope: !753)
!1174 = !DILocation(line: 183, column: 12, scope: !753)
!1175 = !DILocation(line: 183, column: 3, scope: !753)
!1176 = !DILocation(line: 184, column: 12, scope: !753)
!1177 = !DILocation(line: 184, column: 3, scope: !753)
!1178 = !DILocation(line: 185, column: 12, scope: !753)
!1179 = !DILocation(line: 185, column: 3, scope: !753)
!1180 = !DILocation(line: 186, column: 12, scope: !753)
!1181 = !DILocation(line: 186, column: 3, scope: !753)
!1182 = !DILocation(line: 187, column: 12, scope: !753)
!1183 = !DILocation(line: 187, column: 3, scope: !753)
!1184 = !DILocation(line: 188, column: 12, scope: !753)
!1185 = !DILocation(line: 188, column: 3, scope: !753)
!1186 = !DILocation(line: 190, column: 8, scope: !753)
!1187 = !DILocation(line: 190, column: 3, scope: !753)
!1188 = !DILocation(line: 191, column: 8, scope: !753)
!1189 = !DILocation(line: 191, column: 3, scope: !753)
!1190 = !DILocation(line: 192, column: 8, scope: !753)
!1191 = !DILocation(line: 192, column: 3, scope: !753)
!1192 = !DILocation(line: 199, column: 1, scope: !753)
!1193 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !828, file: !827, line: 421, type: !834, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !833, variables: !664)
!1194 = !DILocalVariable(name: "this", arg: 1, scope: !1193, type: !1195, flags: DIFlagArtificial | DIFlagObjectPointer)
!1195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !828, size: 64, align: 64)
!1196 = !DILocation(line: 0, scope: !1193)
!1197 = !DILocalVariable(name: "vx", arg: 2, scope: !1193, file: !827, line: 421, type: !102)
!1198 = !DILocation(line: 421, column: 43, scope: !1193)
!1199 = !DILocalVariable(name: "vy", arg: 3, scope: !1193, file: !827, line: 421, type: !102)
!1200 = !DILocation(line: 421, column: 64, scope: !1193)
!1201 = !DILocalVariable(name: "vz", arg: 4, scope: !1193, file: !827, line: 421, type: !102)
!1202 = !DILocation(line: 421, column: 85, scope: !1193)
!1203 = !DILocation(line: 421, column: 95, scope: !1193)
!1204 = !DILocation(line: 421, column: 97, scope: !1193)
!1205 = !DILocation(line: 421, column: 102, scope: !1193)
!1206 = !DILocation(line: 421, column: 104, scope: !1193)
!1207 = !DILocation(line: 421, column: 109, scope: !1193)
!1208 = !DILocation(line: 421, column: 111, scope: !1193)
!1209 = !DILocation(line: 421, column: 116, scope: !1193)
