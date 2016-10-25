; ModuleID = 'vlc_kernel_sm64huff.cu'
source_filename = "vlc_kernel_sm64huff.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

$_ZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_ = comdat any

@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E5kcmax = internal addrspace(3) global i32 0, align 4, !dbg !0
@sm = external addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent nounwind
define void @_ZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_(i32* %data, i32* %gm_codewords, i32* %gm_codewordlens, i32* %cw32, i32* %cw32len, i32* %cw32idx, i32* %out, i32* %outidx) #0 comdat !dbg !1 {
entry:
  %data.addr = alloca i32*, align 8
  %gm_codewords.addr = alloca i32*, align 8
  %gm_codewordlens.addr = alloca i32*, align 8
  %cw32.addr = alloca i32*, align 8
  %cw32len.addr = alloca i32*, align 8
  %cw32idx.addr = alloca i32*, align 8
  %out.addr = alloca i32*, align 8
  %outidx.addr = alloca i32*, align 8
  %kn = alloca i32, align 4
  %k = alloca i32, align 4
  %kc = alloca i32, align 4
  %startbit = alloca i32, align 4
  %wrbits = alloca i32, align 4
  %cw64 = alloca i64, align 8
  %val32 = alloca i32, align 4
  %codewordlen = alloca i32, align 4
  %tmpbyte = alloca i8, align 1
  %tmpcwlen = alloca i8, align 1
  %tmpcw32 = alloca i32, align 4
  %codewords = alloca i32*, align 8
  %codewordlens = alloca i32*, align 8
  %as = alloca i32*, align 8
  %i = alloca i32, align 4
  %offset = alloca i32, align 4
  %d = alloca i32, align 4
  %ai = alloca i8, align 1
  %bi = alloca i8, align 1
  %d56 = alloca i32, align 4
  %ai64 = alloca i8, align 1
  %bi70 = alloca i8, align 1
  %t = alloca i32, align 4
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !583, metadata !584), !dbg !585
  store i32* %gm_codewords, i32** %gm_codewords.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gm_codewords.addr, metadata !586, metadata !584), !dbg !587
  store i32* %gm_codewordlens, i32** %gm_codewordlens.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %gm_codewordlens.addr, metadata !588, metadata !584), !dbg !589
  store i32* %cw32, i32** %cw32.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %cw32.addr, metadata !590, metadata !584), !dbg !591
  store i32* %cw32len, i32** %cw32len.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %cw32len.addr, metadata !592, metadata !584), !dbg !593
  store i32* %cw32idx, i32** %cw32idx.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %cw32idx.addr, metadata !594, metadata !584), !dbg !595
  store i32* %out, i32** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %out.addr, metadata !596, metadata !584), !dbg !597
  store i32* %outidx, i32** %outidx.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %outidx.addr, metadata !598, metadata !584), !dbg !599
  call void @llvm.dbg.declare(metadata i32* %kn, metadata !600, metadata !584), !dbg !601
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #4, !dbg !602, !range !639
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4, !dbg !640, !range !685
  %mul = mul i32 %0, %1, !dbg !686
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4, !dbg !687, !range !716
  %add = add i32 %mul, %2, !dbg !717
  store i32 %add, i32* %kn, align 4, !dbg !601
  call void @llvm.dbg.declare(metadata i32* %k, metadata !718, metadata !584), !dbg !719
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4, !dbg !720, !range !716
  store i32 %3, i32* %k, align 4, !dbg !719
  call void @llvm.dbg.declare(metadata i32* %kc, metadata !722, metadata !584), !dbg !723
  call void @llvm.dbg.declare(metadata i32* %startbit, metadata !724, metadata !584), !dbg !725
  call void @llvm.dbg.declare(metadata i32* %wrbits, metadata !726, metadata !584), !dbg !727
  call void @llvm.dbg.declare(metadata i64* %cw64, metadata !728, metadata !584), !dbg !729
  store i64 0, i64* %cw64, align 8, !dbg !729
  call void @llvm.dbg.declare(metadata i32* %val32, metadata !730, metadata !584), !dbg !731
  call void @llvm.dbg.declare(metadata i32* %codewordlen, metadata !732, metadata !584), !dbg !733
  store i32 0, i32* %codewordlen, align 4, !dbg !733
  call void @llvm.dbg.declare(metadata i8* %tmpbyte, metadata !734, metadata !584), !dbg !735
  call void @llvm.dbg.declare(metadata i8* %tmpcwlen, metadata !736, metadata !584), !dbg !737
  call void @llvm.dbg.declare(metadata i32* %tmpcw32, metadata !738, metadata !584), !dbg !739
  call void @llvm.dbg.declare(metadata i32** %codewords, metadata !740, metadata !584), !dbg !741
  store i32* getelementptr inbounds ([0 x i32], [0 x i32]* addrspacecast ([0 x i32] addrspace(3)* @sm to [0 x i32]*), i32 0, i32 0), i32** %codewords, align 8, !dbg !741
  call void @llvm.dbg.declare(metadata i32** %codewordlens, metadata !742, metadata !584), !dbg !743
  store i32* getelementptr inbounds ([0 x i32], [0 x i32]* addrspacecast ([0 x i32] addrspace(3)* @sm to [0 x i32]*), i32 0, i64 256), i32** %codewordlens, align 8, !dbg !743
  call void @llvm.dbg.declare(metadata i32** %as, metadata !744, metadata !584), !dbg !745
  store i32* getelementptr inbounds ([0 x i32], [0 x i32]* addrspacecast ([0 x i32] addrspace(3)* @sm to [0 x i32]*), i32 0, i64 512), i32** %as, align 8, !dbg !745
  %4 = load i32*, i32** %gm_codewords.addr, align 8, !dbg !746
  %5 = load i32, i32* %k, align 4, !dbg !747
  %idxprom = zext i32 %5 to i64, !dbg !746
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !746
  %6 = load i32, i32* %arrayidx, align 4, !dbg !746
  %7 = load i32*, i32** %codewords, align 8, !dbg !748
  %8 = load i32, i32* %k, align 4, !dbg !749
  %idxprom4 = zext i32 %8 to i64, !dbg !748
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !748
  store i32 %6, i32* %arrayidx5, align 4, !dbg !750
  %9 = load i32*, i32** %gm_codewordlens.addr, align 8, !dbg !751
  %10 = load i32, i32* %k, align 4, !dbg !752
  %idxprom6 = zext i32 %10 to i64, !dbg !751
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !751
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !751
  %12 = load i32*, i32** %codewordlens, align 8, !dbg !753
  %13 = load i32, i32* %k, align 4, !dbg !754
  %idxprom8 = zext i32 %13 to i64, !dbg !753
  %arrayidx9 = getelementptr inbounds i32, i32* %12, i64 %idxprom8, !dbg !753
  store i32 %11, i32* %arrayidx9, align 4, !dbg !755
  %14 = load i32*, i32** %data.addr, align 8, !dbg !756
  %15 = load i32, i32* %kn, align 4, !dbg !757
  %idxprom10 = zext i32 %15 to i64, !dbg !756
  %arrayidx11 = getelementptr inbounds i32, i32* %14, i64 %idxprom10, !dbg !756
  %16 = load i32, i32* %arrayidx11, align 4, !dbg !756
  store i32 %16, i32* %val32, align 4, !dbg !758
  call void @llvm.nvvm.barrier0(), !dbg !759
  call void @llvm.dbg.declare(metadata i32* %i, metadata !760, metadata !584), !dbg !762
  store i32 0, i32* %i, align 4, !dbg !762
  br label %for.cond, !dbg !763

for.cond:                                         ; preds = %for.inc, %entry
  %17 = load i32, i32* %i, align 4, !dbg !764
  %cmp = icmp ult i32 %17, 4, !dbg !767
  br i1 %cmp, label %for.body, label %for.end, !dbg !768

for.body:                                         ; preds = %for.cond
  %18 = load i32, i32* %val32, align 4, !dbg !769
  %19 = load i32, i32* %i, align 4, !dbg !771
  %sub = sub i32 3, %19, !dbg !772
  %mul12 = mul i32 %sub, 8, !dbg !773
  %shr = lshr i32 %18, %mul12, !dbg !774
  %conv = trunc i32 %shr to i8, !dbg !775
  store i8 %conv, i8* %tmpbyte, align 1, !dbg !776
  %20 = load i32*, i32** %codewords, align 8, !dbg !777
  %21 = load i8, i8* %tmpbyte, align 1, !dbg !778
  %idxprom13 = zext i8 %21 to i64, !dbg !777
  %arrayidx14 = getelementptr inbounds i32, i32* %20, i64 %idxprom13, !dbg !777
  %22 = load i32, i32* %arrayidx14, align 4, !dbg !777
  store i32 %22, i32* %tmpcw32, align 4, !dbg !779
  %23 = load i32*, i32** %codewordlens, align 8, !dbg !780
  %24 = load i8, i8* %tmpbyte, align 1, !dbg !781
  %idxprom15 = zext i8 %24 to i64, !dbg !780
  %arrayidx16 = getelementptr inbounds i32, i32* %23, i64 %idxprom15, !dbg !780
  %25 = load i32, i32* %arrayidx16, align 4, !dbg !780
  %conv17 = trunc i32 %25 to i8, !dbg !780
  store i8 %conv17, i8* %tmpcwlen, align 1, !dbg !782
  %26 = load i64, i64* %cw64, align 8, !dbg !783
  %27 = load i8, i8* %tmpcwlen, align 1, !dbg !784
  %conv18 = zext i8 %27 to i32, !dbg !784
  %sh_prom = zext i32 %conv18 to i64, !dbg !785
  %shl = shl i64 %26, %sh_prom, !dbg !785
  %28 = load i32, i32* %tmpcw32, align 4, !dbg !786
  %conv19 = zext i32 %28 to i64, !dbg !786
  %or = or i64 %shl, %conv19, !dbg !787
  store i64 %or, i64* %cw64, align 8, !dbg !788
  %29 = load i8, i8* %tmpcwlen, align 1, !dbg !789
  %conv20 = zext i8 %29 to i32, !dbg !789
  %30 = load i32, i32* %codewordlen, align 4, !dbg !790
  %add21 = add i32 %30, %conv20, !dbg !790
  store i32 %add21, i32* %codewordlen, align 4, !dbg !790
  br label %for.inc, !dbg !791

for.inc:                                          ; preds = %for.body
  %31 = load i32, i32* %i, align 4, !dbg !792
  %inc = add i32 %31, 1, !dbg !792
  store i32 %inc, i32* %i, align 4, !dbg !792
  br label %for.cond, !dbg !794, !llvm.loop !795

for.end:                                          ; preds = %for.cond
  %32 = load i32, i32* %codewordlen, align 4, !dbg !797
  %33 = load i32*, i32** %as, align 8, !dbg !798
  %34 = load i32, i32* %k, align 4, !dbg !799
  %idxprom22 = zext i32 %34 to i64, !dbg !798
  %arrayidx23 = getelementptr inbounds i32, i32* %33, i64 %idxprom22, !dbg !798
  store i32 %32, i32* %arrayidx23, align 4, !dbg !800
  call void @llvm.nvvm.barrier0(), !dbg !801
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !802, metadata !584), !dbg !803
  store i32 1, i32* %offset, align 4, !dbg !803
  call void @llvm.dbg.declare(metadata i32* %d, metadata !804, metadata !584), !dbg !806
  %35 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4, !dbg !807, !range !685
  %shr25 = lshr i32 %35, 1, !dbg !809
  store i32 %shr25, i32* %d, align 4, !dbg !806
  br label %for.cond26, !dbg !810

for.cond26:                                       ; preds = %for.inc46, %for.end
  %36 = load i32, i32* %d, align 4, !dbg !811
  %cmp27 = icmp ugt i32 %36, 0, !dbg !814
  br i1 %cmp27, label %for.body28, label %for.end48, !dbg !815

for.body28:                                       ; preds = %for.cond26
  call void @llvm.nvvm.barrier0(), !dbg !816
  %37 = load i32, i32* %k, align 4, !dbg !818
  %38 = load i32, i32* %d, align 4, !dbg !820
  %cmp29 = icmp ult i32 %37, %38, !dbg !821
  br i1 %cmp29, label %if.then, label %if.end, !dbg !822

if.then:                                          ; preds = %for.body28
  call void @llvm.dbg.declare(metadata i8* %ai, metadata !823, metadata !584), !dbg !825
  %39 = load i32, i32* %offset, align 4, !dbg !826
  %40 = load i32, i32* %k, align 4, !dbg !827
  %mul30 = mul i32 2, %40, !dbg !828
  %add31 = add i32 %mul30, 1, !dbg !829
  %mul32 = mul i32 %39, %add31, !dbg !830
  %sub33 = sub i32 %mul32, 1, !dbg !831
  %conv34 = trunc i32 %sub33 to i8, !dbg !826
  store i8 %conv34, i8* %ai, align 1, !dbg !825
  call void @llvm.dbg.declare(metadata i8* %bi, metadata !832, metadata !584), !dbg !833
  %41 = load i32, i32* %offset, align 4, !dbg !834
  %42 = load i32, i32* %k, align 4, !dbg !835
  %mul35 = mul i32 2, %42, !dbg !836
  %add36 = add i32 %mul35, 2, !dbg !837
  %mul37 = mul i32 %41, %add36, !dbg !838
  %sub38 = sub i32 %mul37, 1, !dbg !839
  %conv39 = trunc i32 %sub38 to i8, !dbg !834
  store i8 %conv39, i8* %bi, align 1, !dbg !833
  %43 = load i32*, i32** %as, align 8, !dbg !840
  %44 = load i8, i8* %ai, align 1, !dbg !841
  %idxprom40 = zext i8 %44 to i64, !dbg !840
  %arrayidx41 = getelementptr inbounds i32, i32* %43, i64 %idxprom40, !dbg !840
  %45 = load i32, i32* %arrayidx41, align 4, !dbg !840
  %46 = load i32*, i32** %as, align 8, !dbg !842
  %47 = load i8, i8* %bi, align 1, !dbg !843
  %idxprom42 = zext i8 %47 to i64, !dbg !842
  %arrayidx43 = getelementptr inbounds i32, i32* %46, i64 %idxprom42, !dbg !842
  %48 = load i32, i32* %arrayidx43, align 4, !dbg !844
  %add44 = add i32 %48, %45, !dbg !844
  store i32 %add44, i32* %arrayidx43, align 4, !dbg !844
  br label %if.end, !dbg !845

if.end:                                           ; preds = %if.then, %for.body28
  %49 = load i32, i32* %offset, align 4, !dbg !846
  %mul45 = mul i32 %49, 2, !dbg !846
  store i32 %mul45, i32* %offset, align 4, !dbg !846
  br label %for.inc46, !dbg !847

for.inc46:                                        ; preds = %if.end
  %50 = load i32, i32* %d, align 4, !dbg !848
  %shr47 = lshr i32 %50, 1, !dbg !848
  store i32 %shr47, i32* %d, align 4, !dbg !848
  br label %for.cond26, !dbg !850, !llvm.loop !851

for.end48:                                        ; preds = %for.cond26
  %51 = load i32, i32* %k, align 4, !dbg !853
  %cmp49 = icmp eq i32 %51, 0, !dbg !855
  br i1 %cmp49, label %if.then50, label %if.end55, !dbg !856

if.then50:                                        ; preds = %for.end48
  %52 = load i32*, i32** %as, align 8, !dbg !857
  %53 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4, !dbg !859, !range !685
  %sub52 = sub i32 %53, 1, !dbg !861
  %idxprom53 = zext i32 %sub52 to i64, !dbg !857
  %arrayidx54 = getelementptr inbounds i32, i32* %52, i64 %idxprom53, !dbg !857
  store i32 0, i32* %arrayidx54, align 4, !dbg !862
  br label %if.end55, !dbg !857

if.end55:                                         ; preds = %if.then50, %for.end48
  call void @llvm.dbg.declare(metadata i32* %d56, metadata !863, metadata !584), !dbg !865
  store i32 1, i32* %d56, align 4, !dbg !865
  br label %for.cond57, !dbg !866

for.cond57:                                       ; preds = %for.inc86, %if.end55
  %54 = load i32, i32* %d56, align 4, !dbg !867
  %55 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4, !dbg !870, !range !685
  %cmp59 = icmp ult i32 %54, %55, !dbg !872
  br i1 %cmp59, label %for.body60, label %for.end88, !dbg !873

for.body60:                                       ; preds = %for.cond57
  %56 = load i32, i32* %offset, align 4, !dbg !874
  %shr61 = lshr i32 %56, 1, !dbg !874
  store i32 %shr61, i32* %offset, align 4, !dbg !874
  call void @llvm.nvvm.barrier0(), !dbg !876
  %57 = load i32, i32* %k, align 4, !dbg !877
  %58 = load i32, i32* %d56, align 4, !dbg !879
  %cmp62 = icmp ult i32 %57, %58, !dbg !880
  br i1 %cmp62, label %if.then63, label %if.end85, !dbg !881

if.then63:                                        ; preds = %for.body60
  call void @llvm.dbg.declare(metadata i8* %ai64, metadata !882, metadata !584), !dbg !884
  %59 = load i32, i32* %offset, align 4, !dbg !885
  %60 = load i32, i32* %k, align 4, !dbg !886
  %mul65 = mul i32 2, %60, !dbg !887
  %add66 = add i32 %mul65, 1, !dbg !888
  %mul67 = mul i32 %59, %add66, !dbg !889
  %sub68 = sub i32 %mul67, 1, !dbg !890
  %conv69 = trunc i32 %sub68 to i8, !dbg !885
  store i8 %conv69, i8* %ai64, align 1, !dbg !884
  call void @llvm.dbg.declare(metadata i8* %bi70, metadata !891, metadata !584), !dbg !892
  %61 = load i32, i32* %offset, align 4, !dbg !893
  %62 = load i32, i32* %k, align 4, !dbg !894
  %mul71 = mul i32 2, %62, !dbg !895
  %add72 = add i32 %mul71, 2, !dbg !896
  %mul73 = mul i32 %61, %add72, !dbg !897
  %sub74 = sub i32 %mul73, 1, !dbg !898
  %conv75 = trunc i32 %sub74 to i8, !dbg !893
  store i8 %conv75, i8* %bi70, align 1, !dbg !892
  call void @llvm.dbg.declare(metadata i32* %t, metadata !899, metadata !584), !dbg !900
  %63 = load i32*, i32** %as, align 8, !dbg !901
  %64 = load i8, i8* %ai64, align 1, !dbg !902
  %idxprom76 = zext i8 %64 to i64, !dbg !901
  %arrayidx77 = getelementptr inbounds i32, i32* %63, i64 %idxprom76, !dbg !901
  %65 = load i32, i32* %arrayidx77, align 4, !dbg !901
  store i32 %65, i32* %t, align 4, !dbg !900
  %66 = load i32*, i32** %as, align 8, !dbg !903
  %67 = load i8, i8* %bi70, align 1, !dbg !904
  %idxprom78 = zext i8 %67 to i64, !dbg !903
  %arrayidx79 = getelementptr inbounds i32, i32* %66, i64 %idxprom78, !dbg !903
  %68 = load i32, i32* %arrayidx79, align 4, !dbg !903
  %69 = load i32*, i32** %as, align 8, !dbg !905
  %70 = load i8, i8* %ai64, align 1, !dbg !906
  %idxprom80 = zext i8 %70 to i64, !dbg !905
  %arrayidx81 = getelementptr inbounds i32, i32* %69, i64 %idxprom80, !dbg !905
  store i32 %68, i32* %arrayidx81, align 4, !dbg !907
  %71 = load i32, i32* %t, align 4, !dbg !908
  %72 = load i32*, i32** %as, align 8, !dbg !909
  %73 = load i8, i8* %bi70, align 1, !dbg !910
  %idxprom82 = zext i8 %73 to i64, !dbg !909
  %arrayidx83 = getelementptr inbounds i32, i32* %72, i64 %idxprom82, !dbg !909
  %74 = load i32, i32* %arrayidx83, align 4, !dbg !911
  %add84 = add i32 %74, %71, !dbg !911
  store i32 %add84, i32* %arrayidx83, align 4, !dbg !911
  br label %if.end85, !dbg !912

if.end85:                                         ; preds = %if.then63, %for.body60
  br label %for.inc86, !dbg !913

for.inc86:                                        ; preds = %if.end85
  %75 = load i32, i32* %d56, align 4, !dbg !914
  %mul87 = mul i32 %75, 2, !dbg !914
  store i32 %mul87, i32* %d56, align 4, !dbg !914
  br label %for.cond57, !dbg !916, !llvm.loop !917

for.end88:                                        ; preds = %for.cond57
  call void @llvm.nvvm.barrier0(), !dbg !919
  %76 = load i32, i32* %k, align 4, !dbg !920
  %77 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4, !dbg !922, !range !685
  %sub90 = sub i32 %77, 1, !dbg !924
  %cmp91 = icmp eq i32 %76, %sub90, !dbg !925
  br i1 %cmp91, label %if.then92, label %if.end102, !dbg !926

if.then92:                                        ; preds = %for.end88
  %78 = load i32*, i32** %as, align 8, !dbg !927
  %79 = load i32, i32* %k, align 4, !dbg !929
  %idxprom93 = zext i32 %79 to i64, !dbg !927
  %arrayidx94 = getelementptr inbounds i32, i32* %78, i64 %idxprom93, !dbg !927
  %80 = load i32, i32* %arrayidx94, align 4, !dbg !927
  %81 = load i32, i32* %codewordlen, align 4, !dbg !930
  %add95 = add i32 %80, %81, !dbg !931
  %82 = load i32*, i32** %outidx.addr, align 8, !dbg !932
  %83 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #4, !dbg !933, !range !639
  %idxprom97 = zext i32 %83 to i64, !dbg !932
  %arrayidx98 = getelementptr inbounds i32, i32* %82, i64 %idxprom97, !dbg !932
  store i32 %add95, i32* %arrayidx98, align 4, !dbg !935
  %84 = load i32*, i32** %as, align 8, !dbg !936
  %85 = load i32, i32* %k, align 4, !dbg !937
  %idxprom99 = zext i32 %85 to i64, !dbg !936
  %arrayidx100 = getelementptr inbounds i32, i32* %84, i64 %idxprom99, !dbg !936
  %86 = load i32, i32* %arrayidx100, align 4, !dbg !936
  %87 = load i32, i32* %codewordlen, align 4, !dbg !938
  %add101 = add i32 %86, %87, !dbg !939
  %div = udiv i32 %add101, 32, !dbg !940
  store i32 %div, i32* addrspacecast (i32 addrspace(3)* @_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E5kcmax to i32*), align 4, !dbg !941
  br label %if.end102, !dbg !942

if.end102:                                        ; preds = %if.then92, %for.end88
  %88 = load i32*, i32** %as, align 8, !dbg !943
  %89 = load i32, i32* %k, align 4, !dbg !944
  %idxprom103 = zext i32 %89 to i64, !dbg !943
  %arrayidx104 = getelementptr inbounds i32, i32* %88, i64 %idxprom103, !dbg !943
  %90 = load i32, i32* %arrayidx104, align 4, !dbg !943
  %div105 = udiv i32 %90, 32, !dbg !945
  store i32 %div105, i32* %kc, align 4, !dbg !946
  %91 = load i32*, i32** %as, align 8, !dbg !947
  %92 = load i32, i32* %k, align 4, !dbg !948
  %idxprom106 = zext i32 %92 to i64, !dbg !947
  %arrayidx107 = getelementptr inbounds i32, i32* %91, i64 %idxprom106, !dbg !947
  %93 = load i32, i32* %arrayidx107, align 4, !dbg !947
  %rem = urem i32 %93, 32, !dbg !949
  store i32 %rem, i32* %startbit, align 4, !dbg !950
  %94 = load i32*, i32** %as, align 8, !dbg !951
  %95 = load i32, i32* %k, align 4, !dbg !952
  %idxprom108 = zext i32 %95 to i64, !dbg !951
  %arrayidx109 = getelementptr inbounds i32, i32* %94, i64 %idxprom108, !dbg !951
  store i32 0, i32* %arrayidx109, align 4, !dbg !953
  call void @llvm.nvvm.barrier0(), !dbg !954
  %96 = load i32, i32* %codewordlen, align 4, !dbg !955
  %97 = load i32, i32* %startbit, align 4, !dbg !956
  %sub110 = sub i32 32, %97, !dbg !957
  %cmp111 = icmp ugt i32 %96, %sub110, !dbg !958
  br i1 %cmp111, label %cond.true, label %cond.false, !dbg !955

cond.true:                                        ; preds = %if.end102
  %98 = load i32, i32* %startbit, align 4, !dbg !959
  %sub112 = sub i32 32, %98, !dbg !960
  br label %cond.end, !dbg !961

cond.false:                                       ; preds = %if.end102
  %99 = load i32, i32* %codewordlen, align 4, !dbg !962
  br label %cond.end, !dbg !963

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub112, %cond.true ], [ %99, %cond.false ], !dbg !964
  store i32 %cond, i32* %wrbits, align 4, !dbg !966
  %100 = load i64, i64* %cw64, align 8, !dbg !967
  %101 = load i32, i32* %codewordlen, align 4, !dbg !968
  %102 = load i32, i32* %wrbits, align 4, !dbg !969
  %sub113 = sub i32 %101, %102, !dbg !970
  %sh_prom114 = zext i32 %sub113 to i64, !dbg !971
  %shr115 = lshr i64 %100, %sh_prom114, !dbg !971
  %conv116 = trunc i64 %shr115 to i32, !dbg !972
  store i32 %conv116, i32* %tmpcw32, align 4, !dbg !973
  %103 = load i32*, i32** %as, align 8, !dbg !974
  %104 = load i32, i32* %kc, align 4, !dbg !975
  %idxprom117 = zext i32 %104 to i64, !dbg !974
  %arrayidx118 = getelementptr inbounds i32, i32* %103, i64 %idxprom117, !dbg !974
  %105 = load i32, i32* %tmpcw32, align 4, !dbg !976
  %106 = load i32, i32* %startbit, align 4, !dbg !977
  %sub119 = sub i32 32, %106, !dbg !978
  %107 = load i32, i32* %wrbits, align 4, !dbg !979
  %sub120 = sub i32 %sub119, %107, !dbg !980
  %shl121 = shl i32 %105, %sub120, !dbg !981
  %call122 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx118, i32 %shl121) #2, !dbg !982
  %108 = load i32, i32* %wrbits, align 4, !dbg !983
  %109 = load i32, i32* %codewordlen, align 4, !dbg !984
  %sub123 = sub i32 %109, %108, !dbg !984
  store i32 %sub123, i32* %codewordlen, align 4, !dbg !984
  %110 = load i32, i32* %codewordlen, align 4, !dbg !985
  %tobool = icmp ne i32 %110, 0, !dbg !985
  br i1 %tobool, label %if.then124, label %if.end143, !dbg !987

if.then124:                                       ; preds = %cond.end
  %111 = load i32, i32* %codewordlen, align 4, !dbg !988
  %cmp125 = icmp ugt i32 %111, 32, !dbg !990
  br i1 %cmp125, label %cond.true126, label %cond.false127, !dbg !988

cond.true126:                                     ; preds = %if.then124
  br label %cond.end128, !dbg !991

cond.false127:                                    ; preds = %if.then124
  %112 = load i32, i32* %codewordlen, align 4, !dbg !993
  br label %cond.end128, !dbg !995

cond.end128:                                      ; preds = %cond.false127, %cond.true126
  %cond129 = phi i32 [ 32, %cond.true126 ], [ %112, %cond.false127 ], !dbg !996
  store i32 %cond129, i32* %wrbits, align 4, !dbg !998
  %113 = load i64, i64* %cw64, align 8, !dbg !999
  %114 = load i32, i32* %codewordlen, align 4, !dbg !1000
  %115 = load i32, i32* %wrbits, align 4, !dbg !1001
  %sub130 = sub i32 %114, %115, !dbg !1002
  %sh_prom131 = zext i32 %sub130 to i64, !dbg !1003
  %shr132 = lshr i64 %113, %sh_prom131, !dbg !1003
  %conv133 = trunc i64 %shr132 to i32, !dbg !1004
  %116 = load i32, i32* %wrbits, align 4, !dbg !1005
  %shl134 = shl i32 1, %116, !dbg !1006
  %sub135 = sub nsw i32 %shl134, 1, !dbg !1007
  %and = and i32 %conv133, %sub135, !dbg !1008
  store i32 %and, i32* %tmpcw32, align 4, !dbg !1009
  %117 = load i32*, i32** %as, align 8, !dbg !1010
  %118 = load i32, i32* %kc, align 4, !dbg !1011
  %add136 = add i32 %118, 1, !dbg !1012
  %idxprom137 = zext i32 %add136 to i64, !dbg !1010
  %arrayidx138 = getelementptr inbounds i32, i32* %117, i64 %idxprom137, !dbg !1010
  %119 = load i32, i32* %tmpcw32, align 4, !dbg !1013
  %120 = load i32, i32* %wrbits, align 4, !dbg !1014
  %sub139 = sub i32 32, %120, !dbg !1015
  %shl140 = shl i32 %119, %sub139, !dbg !1016
  %call141 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx138, i32 %shl140) #2, !dbg !1017
  %121 = load i32, i32* %wrbits, align 4, !dbg !1018
  %122 = load i32, i32* %codewordlen, align 4, !dbg !1019
  %sub142 = sub i32 %122, %121, !dbg !1019
  store i32 %sub142, i32* %codewordlen, align 4, !dbg !1019
  br label %if.end143, !dbg !1020

if.end143:                                        ; preds = %cond.end128, %cond.end
  %123 = load i32, i32* %codewordlen, align 4, !dbg !1021
  %tobool144 = icmp ne i32 %123, 0, !dbg !1021
  br i1 %tobool144, label %if.then145, label %if.end157, !dbg !1023

if.then145:                                       ; preds = %if.end143
  %124 = load i64, i64* %cw64, align 8, !dbg !1024
  %125 = load i32, i32* %codewordlen, align 4, !dbg !1026
  %shl146 = shl i32 1, %125, !dbg !1027
  %sub147 = sub nsw i32 %shl146, 1, !dbg !1028
  %conv148 = sext i32 %sub147 to i64, !dbg !1029
  %and149 = and i64 %124, %conv148, !dbg !1030
  %conv150 = trunc i64 %and149 to i32, !dbg !1031
  store i32 %conv150, i32* %tmpcw32, align 4, !dbg !1032
  %126 = load i32*, i32** %as, align 8, !dbg !1033
  %127 = load i32, i32* %kc, align 4, !dbg !1034
  %add151 = add i32 %127, 2, !dbg !1035
  %idxprom152 = zext i32 %add151 to i64, !dbg !1033
  %arrayidx153 = getelementptr inbounds i32, i32* %126, i64 %idxprom152, !dbg !1033
  %128 = load i32, i32* %tmpcw32, align 4, !dbg !1036
  %129 = load i32, i32* %codewordlen, align 4, !dbg !1037
  %sub154 = sub i32 32, %129, !dbg !1038
  %shl155 = shl i32 %128, %sub154, !dbg !1039
  %call156 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx153, i32 %shl155) #2, !dbg !1040
  br label %if.end157, !dbg !1041

if.end157:                                        ; preds = %if.then145, %if.end143
  call void @llvm.nvvm.barrier0(), !dbg !1042
  %130 = load i32, i32* %k, align 4, !dbg !1043
  %131 = load i32, i32* addrspacecast (i32 addrspace(3)* @_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E5kcmax to i32*), align 4, !dbg !1045
  %cmp158 = icmp ule i32 %130, %131, !dbg !1046
  br i1 %cmp158, label %if.then159, label %if.end164, !dbg !1047

if.then159:                                       ; preds = %if.end157
  %132 = load i32*, i32** %as, align 8, !dbg !1048
  %133 = load i32, i32* %k, align 4, !dbg !1050
  %idxprom160 = zext i32 %133 to i64, !dbg !1048
  %arrayidx161 = getelementptr inbounds i32, i32* %132, i64 %idxprom160, !dbg !1048
  %134 = load i32, i32* %arrayidx161, align 4, !dbg !1048
  %135 = load i32*, i32** %out.addr, align 8, !dbg !1051
  %136 = load i32, i32* %kn, align 4, !dbg !1052
  %idxprom162 = zext i32 %136 to i64, !dbg !1051
  %arrayidx163 = getelementptr inbounds i32, i32* %135, i64 %idxprom162, !dbg !1051
  store i32 %134, i32* %arrayidx163, align 4, !dbg !1053
  br label %if.end164, !dbg !1051

if.end164:                                        ; preds = %if.then159, %if.end157
  ret void, !dbg !1054
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: convergent inlinehint nounwind
define internal i32 @_ZL8atomicOrPjj(i32* %address, i32 %val) #3 !dbg !1055 {
entry:
  %p.addr.i = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr.i, metadata !1059, metadata !584), !dbg !1061
  %val.addr.i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %val.addr.i, metadata !1063, metadata !584), !dbg !1064
  %address.addr = alloca i32*, align 8
  %val.addr = alloca i32, align 4
  store i32* %address, i32** %address.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %address.addr, metadata !1065, metadata !584), !dbg !1066
  store i32 %val, i32* %val.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val.addr, metadata !1067, metadata !584), !dbg !1068
  %0 = load i32*, i32** %address.addr, align 8, !dbg !1069
  %1 = load i32, i32* %val.addr, align 4, !dbg !1070
  store i32* %0, i32** %p.addr.i, align 8, !dbg !1071
  store i32 %1, i32* %val.addr.i, align 4, !dbg !1071
  %2 = load i32*, i32** %p.addr.i, align 8, !dbg !1072
  %3 = load i32, i32* %val.addr.i, align 4, !dbg !1073
  %4 = atomicrmw or i32* %2, i32 %3 seq_cst, !dbg !1074
  ret i32 %4, !dbg !1075
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { convergent inlinehint nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!9}
!nvvm.annotations = !{!573, !574, !575, !574, !576, !576, !576, !576, !577, !577, !576}
!llvm.module.flags = !{!578, !579, !580}
!llvm.ident = !{!581}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!582}

!0 = distinct !DIGlobalVariable(name: "kcmax", scope: !1, file: !2, line: 54, type: !6, isLocal: true, isDefinition: true)
!1 = distinct !DISubprogram(name: "vlc_encode_kernel_sm64huff", linkageName: "_ZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_", scope: !2, file: !2, line: 37, type: !3, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !9, variables: !10)
!2 = !DIFile(filename: "vlc_kernel_sm64huff.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!3 = !DISubroutineType(types: !4)
!4 = !{null, !5, !7, !7, !5, !5, !5, !5, !5}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64, align: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!9 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, retainedTypes: !11, globals: !16, imports: !17)
!10 = !{}
!11 = !{!5, !12, !6, !13, !15}
!12 = !DIBasicType(name: "unsigned char", size: 8, align: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!15 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!16 = !{!0}
!17 = !{!18, !25, !30, !32, !34, !36, !38, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !74, !76, !78, !80, !84, !89, !91, !93, !98, !102, !104, !106, !108, !110, !112, !114, !116, !118, !123, !127, !129, !131, !135, !137, !139, !141, !143, !145, !149, !151, !153, !158, !166, !170, !172, !174, !178, !180, !182, !186, !188, !190, !194, !196, !198, !200, !202, !204, !206, !208, !210, !212, !217, !219, !221, !225, !227, !229, !231, !233, !235, !237, !239, !243, !247, !249, !251, !256, !258, !260, !262, !264, !266, !268, !272, !278, !282, !286, !291, !293, !297, !301, !315, !319, !323, !327, !331, !336, !338, !342, !346, !350, !358, !362, !366, !370, !374, !378, !384, !388, !392, !394, !402, !406, !414, !416, !418, !422, !426, !430, !435, !439, !444, !445, !446, !447, !450, !451, !452, !453, !454, !455, !456, !459, !461, !463, !465, !467, !469, !471, !473, !476, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !544, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571}
!18 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !21, line: 189)
!19 = !DINamespace(name: "std", scope: null, file: !20, line: 188)
!20 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!21 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !20, file: !20, line: 44, type: !22, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!22 = !DISubroutineType(types: !23)
!23 = !{!24, !24}
!24 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!25 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !26, line: 190)
!26 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !20, file: !20, line: 46, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!27 = !DISubroutineType(types: !28)
!28 = !{!29, !29}
!29 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !31, line: 191)
!31 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !20, file: !20, line: 48, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !33, line: 192)
!33 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !20, file: !20, line: 50, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !35, line: 193)
!35 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !20, file: !20, line: 52, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !37, line: 194)
!37 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !20, file: !20, line: 56, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !39, line: 195)
!39 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !20, file: !20, line: 54, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DISubroutineType(types: !41)
!41 = !{!29, !29, !29}
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !43, line: 196)
!43 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !20, file: !20, line: 58, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !45, line: 197)
!45 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !20, file: !20, line: 60, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !47, line: 198)
!47 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !20, file: !20, line: 62, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !49, line: 199)
!49 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !20, file: !20, line: 64, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !51, line: 200)
!51 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !20, file: !20, line: 66, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !53, line: 201)
!53 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !20, file: !20, line: 68, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !55, line: 202)
!55 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !20, file: !20, line: 72, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !57, line: 203)
!57 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !20, file: !20, line: 70, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !59, line: 204)
!59 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !20, file: !20, line: 76, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !61, line: 205)
!61 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !20, file: !20, line: 74, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !63, line: 206)
!63 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !20, file: !20, line: 78, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !65, line: 207)
!65 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !20, file: !20, line: 80, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !67, line: 208)
!67 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !20, file: !20, line: 82, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !69, line: 209)
!69 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !20, file: !20, line: 84, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !71, line: 210)
!71 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !20, file: !20, line: 86, type: !72, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{!29, !29, !29, !29}
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !75, line: 211)
!75 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !20, file: !20, line: 88, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !77, line: 212)
!77 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !20, file: !20, line: 90, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !79, line: 213)
!79 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !20, file: !20, line: 92, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !81, line: 214)
!81 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !20, file: !20, line: 94, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DISubroutineType(types: !83)
!83 = !{!15, !29}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !85, line: 215)
!85 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !20, file: !20, line: 96, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DISubroutineType(types: !87)
!87 = !{!29, !29, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !90, line: 216)
!90 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !20, file: !20, line: 98, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !92, line: 217)
!92 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !20, file: !20, line: 100, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !94, line: 218)
!94 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !20, file: !20, line: 102, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{!97, !29}
!97 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !99, line: 219)
!99 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !20, file: !20, line: 106, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!100 = !DISubroutineType(types: !101)
!101 = !{!97, !29, !29}
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !103, line: 220)
!103 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !20, file: !20, line: 105, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !105, line: 221)
!105 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !20, file: !20, line: 108, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !107, line: 222)
!107 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !20, file: !20, line: 112, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !109, line: 223)
!109 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !20, file: !20, line: 111, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !111, line: 224)
!111 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !20, file: !20, line: 114, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !113, line: 225)
!113 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !20, file: !20, line: 116, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !115, line: 226)
!115 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !20, file: !20, line: 118, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !117, line: 227)
!117 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !20, file: !20, line: 120, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !119, line: 228)
!119 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !20, file: !20, line: 121, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DISubroutineType(types: !121)
!121 = !{!122, !122}
!122 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !124, line: 229)
!124 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !20, file: !20, line: 123, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!29, !29, !15}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !128, line: 230)
!128 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !20, file: !20, line: 125, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !130, line: 231)
!130 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !20, file: !20, line: 126, type: !22, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !132, line: 232)
!132 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !20, file: !20, line: 128, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DISubroutineType(types: !134)
!134 = !{!24, !29}
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !136, line: 233)
!136 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !20, file: !20, line: 138, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !138, line: 234)
!138 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !20, file: !20, line: 130, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !140, line: 235)
!140 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !20, file: !20, line: 132, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !142, line: 236)
!142 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !20, file: !20, line: 134, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !144, line: 237)
!144 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !20, file: !20, line: 136, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !146, line: 238)
!146 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !20, file: !20, line: 140, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!122, !29}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !150, line: 239)
!150 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !20, file: !20, line: 142, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !152, line: 240)
!152 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !20, file: !20, line: 143, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !154, line: 241)
!154 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !20, file: !20, line: 145, type: !155, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DISubroutineType(types: !156)
!156 = !{!29, !29, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64, align: 64)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !159, line: 242)
!159 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !20, file: !20, line: 146, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{!162, !163}
!162 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64, align: 64)
!164 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !165)
!165 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !167, line: 243)
!167 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !20, file: !20, line: 147, type: !168, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DISubroutineType(types: !169)
!169 = !{!29, !163}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !171, line: 244)
!171 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !20, file: !20, line: 149, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !173, line: 245)
!173 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !20, file: !20, line: 151, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !175, line: 246)
!175 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !20, file: !20, line: 153, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!29, !29, !162}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !179, line: 247)
!179 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !20, file: !20, line: 158, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !181, line: 248)
!181 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !20, file: !20, line: 160, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !183, line: 249)
!183 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !20, file: !20, line: 162, type: !184, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DISubroutineType(types: !185)
!185 = !{!29, !29, !29, !88}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !187, line: 250)
!187 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !20, file: !20, line: 164, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !189, line: 251)
!189 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !20, file: !20, line: 166, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !191, line: 252)
!191 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !20, file: !20, line: 168, type: !192, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DISubroutineType(types: !193)
!193 = !{!29, !29, !122}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !195, line: 253)
!195 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !20, file: !20, line: 170, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !197, line: 254)
!197 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !20, file: !20, line: 172, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !199, line: 255)
!199 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !20, file: !20, line: 174, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !201, line: 256)
!201 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !20, file: !20, line: 176, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !203, line: 257)
!203 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !20, file: !20, line: 178, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !205, line: 258)
!205 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !20, file: !20, line: 180, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !207, line: 259)
!207 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !20, file: !20, line: 182, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !209, line: 260)
!209 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !20, file: !20, line: 184, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !211, line: 261)
!211 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !20, file: !20, line: 186, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !213, line: 102)
!213 = !DISubprogram(name: "acos", scope: !214, file: !214, line: 54, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!215 = !DISubroutineType(types: !216)
!216 = !{!162, !162}
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !218, line: 121)
!218 = !DISubprogram(name: "asin", scope: !214, file: !214, line: 56, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !220, line: 140)
!220 = !DISubprogram(name: "atan", scope: !214, file: !214, line: 58, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !222, line: 159)
!222 = !DISubprogram(name: "atan2", scope: !214, file: !214, line: 60, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!162, !162, !162}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !226, line: 180)
!226 = !DISubprogram(name: "ceil", scope: !214, file: !214, line: 178, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !228, line: 199)
!228 = !DISubprogram(name: "cos", scope: !214, file: !214, line: 63, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !230, line: 218)
!230 = !DISubprogram(name: "cosh", scope: !214, file: !214, line: 72, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !232, line: 237)
!232 = !DISubprogram(name: "exp", scope: !214, file: !214, line: 100, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !234, line: 256)
!234 = !DISubprogram(name: "fabs", scope: !214, file: !214, line: 181, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !236, line: 275)
!236 = !DISubprogram(name: "floor", scope: !214, file: !214, line: 184, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !238, line: 294)
!238 = !DISubprogram(name: "fmod", scope: !214, file: !214, line: 187, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !240, line: 315)
!240 = !DISubprogram(name: "frexp", scope: !214, file: !214, line: 103, type: !241, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!162, !162, !88}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !244, line: 334)
!244 = !DISubprogram(name: "ldexp", scope: !214, file: !214, line: 106, type: !245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DISubroutineType(types: !246)
!246 = !{!162, !162, !15}
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !248, line: 353)
!248 = !DISubprogram(name: "log", scope: !214, file: !214, line: 109, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !250, line: 372)
!250 = !DISubprogram(name: "log10", scope: !214, file: !214, line: 112, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !252, line: 391)
!252 = !DISubprogram(name: "modf", scope: !214, file: !214, line: 115, type: !253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DISubroutineType(types: !254)
!254 = !{!162, !162, !255}
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64, align: 64)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !257, line: 403)
!257 = !DISubprogram(name: "pow", scope: !214, file: !214, line: 153, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !259, line: 440)
!259 = !DISubprogram(name: "sin", scope: !214, file: !214, line: 65, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !261, line: 459)
!261 = !DISubprogram(name: "sinh", scope: !214, file: !214, line: 74, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !263, line: 478)
!263 = !DISubprogram(name: "sqrt", scope: !214, file: !214, line: 156, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !265, line: 497)
!265 = !DISubprogram(name: "tan", scope: !214, file: !214, line: 67, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !267, line: 516)
!267 = !DISubprogram(name: "tanh", scope: !214, file: !214, line: 76, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !269, line: 118)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !270, line: 101, baseType: !271)
!270 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!271 = !DICompositeType(tag: DW_TAG_structure_type, file: !270, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !273, line: 119)
!273 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !270, line: 109, baseType: !274)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !270, line: 105, size: 128, align: 64, elements: !275, identifier: "_ZTS6ldiv_t")
!275 = !{!276, !277}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !274, file: !270, line: 107, baseType: !122, size: 64, align: 64)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !274, file: !270, line: 108, baseType: !122, size: 64, align: 64, offset: 64)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !279, line: 121)
!279 = !DISubprogram(name: "abort", scope: !270, file: !270, line: 515, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{null}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !283, line: 122)
!283 = !DISubprogram(name: "abs", scope: !270, file: !270, line: 774, type: !284, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DISubroutineType(types: !285)
!285 = !{!15, !15}
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !287, line: 123)
!287 = !DISubprogram(name: "atexit", scope: !270, file: !270, line: 519, type: !288, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DISubroutineType(types: !289)
!289 = !{!15, !290}
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64, align: 64)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !292, line: 129)
!292 = !DISubprogram(name: "atof", scope: !270, file: !270, line: 144, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !294, line: 130)
!294 = !DISubprogram(name: "atoi", scope: !270, file: !270, line: 147, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DISubroutineType(types: !296)
!296 = !{!15, !163}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !298, line: 131)
!298 = !DISubprogram(name: "atol", scope: !270, file: !270, line: 150, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DISubroutineType(types: !300)
!300 = !{!122, !163}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !302, line: 132)
!302 = !DISubprogram(name: "bsearch", scope: !270, file: !270, line: 754, type: !303, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DISubroutineType(types: !304)
!304 = !{!305, !306, !306, !308, !308, !311}
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !307, size: 64, align: 64)
!307 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !309, line: 62, baseType: !310)
!309 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!310 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!311 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !270, line: 741, baseType: !312)
!312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !313, size: 64, align: 64)
!313 = !DISubroutineType(types: !314)
!314 = !{!15, !306, !306}
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !316, line: 133)
!316 = !DISubprogram(name: "calloc", scope: !270, file: !270, line: 468, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!305, !308, !308}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !320, line: 134)
!320 = !DISubprogram(name: "div", scope: !270, file: !270, line: 788, type: !321, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DISubroutineType(types: !322)
!322 = !{!269, !15, !15}
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !324, line: 135)
!324 = !DISubprogram(name: "exit", scope: !270, file: !270, line: 543, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!325 = !DISubroutineType(types: !326)
!326 = !{null, !15}
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !328, line: 136)
!328 = !DISubprogram(name: "free", scope: !270, file: !270, line: 483, type: !329, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DISubroutineType(types: !330)
!330 = !{null, !305}
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !332, line: 137)
!332 = !DISubprogram(name: "getenv", scope: !270, file: !270, line: 564, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DISubroutineType(types: !334)
!334 = !{!335, !163}
!335 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64, align: 64)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !337, line: 138)
!337 = !DISubprogram(name: "labs", scope: !270, file: !270, line: 775, type: !120, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !339, line: 139)
!339 = !DISubprogram(name: "ldiv", scope: !270, file: !270, line: 790, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DISubroutineType(types: !341)
!341 = !{!273, !122, !122}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !343, line: 140)
!343 = !DISubprogram(name: "malloc", scope: !270, file: !270, line: 466, type: !344, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DISubroutineType(types: !345)
!345 = !{!305, !308}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !347, line: 142)
!347 = !DISubprogram(name: "mblen", scope: !270, file: !270, line: 862, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!15, !163, !308}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !351, line: 143)
!351 = !DISubprogram(name: "mbstowcs", scope: !270, file: !270, line: 873, type: !352, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DISubroutineType(types: !353)
!353 = !{!308, !354, !357, !308}
!354 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !355)
!355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !356, size: 64, align: 64)
!356 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!357 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !163)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !359, line: 144)
!359 = !DISubprogram(name: "mbtowc", scope: !270, file: !270, line: 865, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!15, !354, !357, !308}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !363, line: 146)
!363 = !DISubprogram(name: "qsort", scope: !270, file: !270, line: 764, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{null, !305, !308, !308, !311}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !367, line: 152)
!367 = !DISubprogram(name: "rand", scope: !270, file: !270, line: 374, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DISubroutineType(types: !369)
!369 = !{!15}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !371, line: 153)
!371 = !DISubprogram(name: "realloc", scope: !270, file: !270, line: 480, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!372 = !DISubroutineType(types: !373)
!373 = !{!305, !305, !308}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !375, line: 154)
!375 = !DISubprogram(name: "srand", scope: !270, file: !270, line: 376, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !6}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !379, line: 155)
!379 = !DISubprogram(name: "strtod", scope: !270, file: !270, line: 164, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!162, !357, !382}
!382 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !383)
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !335, size: 64, align: 64)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !385, line: 156)
!385 = !DISubprogram(name: "strtol", scope: !270, file: !270, line: 183, type: !386, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!386 = !DISubroutineType(types: !387)
!387 = !{!122, !357, !382, !15}
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !389, line: 157)
!389 = !DISubprogram(name: "strtoul", scope: !270, file: !270, line: 187, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !DISubroutineType(types: !391)
!391 = !{!310, !357, !382, !15}
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !393, line: 158)
!393 = !DISubprogram(name: "system", scope: !270, file: !270, line: 716, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !395, line: 160)
!395 = !DISubprogram(name: "wcstombs", scope: !270, file: !270, line: 876, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!308, !398, !399, !308}
!398 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !335)
!399 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !400)
!400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !401, size: 64, align: 64)
!401 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !356)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !403, line: 161)
!403 = !DISubprogram(name: "wctomb", scope: !270, file: !270, line: 869, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DISubroutineType(types: !405)
!405 = !{!15, !335, !356}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !409, line: 214)
!407 = !DINamespace(name: "__gnu_cxx", scope: null, file: !408, line: 220)
!408 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !270, line: 121, baseType: !410)
!410 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !270, line: 117, size: 128, align: 64, elements: !411, identifier: "_ZTS7lldiv_t")
!411 = !{!412, !413}
!412 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !410, file: !270, line: 119, baseType: !24, size: 64, align: 64)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !410, file: !270, line: 120, baseType: !24, size: 64, align: 64, offset: 64)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !415, line: 220)
!415 = !DISubprogram(name: "_Exit", scope: !270, file: !270, line: 557, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !417, line: 224)
!417 = !DISubprogram(name: "llabs", scope: !270, file: !270, line: 779, type: !22, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !419, line: 230)
!419 = !DISubprogram(name: "lldiv", scope: !270, file: !270, line: 796, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{!409, !24, !24}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !423, line: 241)
!423 = !DISubprogram(name: "atoll", scope: !270, file: !270, line: 157, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{!24, !163}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !427, line: 242)
!427 = !DISubprogram(name: "strtoll", scope: !270, file: !270, line: 209, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{!24, !357, !382, !15}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !431, line: 243)
!431 = !DISubprogram(name: "strtoull", scope: !270, file: !270, line: 214, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DISubroutineType(types: !433)
!433 = !{!434, !357, !382, !15}
!434 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !436, line: 245)
!436 = !DISubprogram(name: "strtof", scope: !270, file: !270, line: 172, type: !437, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!437 = !DISubroutineType(types: !438)
!438 = !{!29, !357, !382}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !440, line: 246)
!440 = !DISubprogram(name: "strtold", scope: !270, file: !270, line: 175, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!441 = !DISubroutineType(types: !442)
!442 = !{!443, !357, !382}
!443 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !409, line: 254)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !415, line: 256)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !417, line: 258)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !448, line: 259)
!448 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !407, file: !449, line: 227, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!449 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !419, line: 260)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !423, line: 262)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !436, line: 263)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !427, line: 264)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !431, line: 265)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !440, line: 266)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !457, line: 397)
!457 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !458, file: !458, line: 1342, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !460, line: 398)
!460 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !458, file: !458, line: 1370, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !462, line: 399)
!462 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !458, file: !458, line: 1337, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !464, line: 400)
!464 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !458, file: !458, line: 1375, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !466, line: 401)
!466 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !458, file: !458, line: 1327, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !468, line: 402)
!468 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !458, file: !458, line: 1332, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !470, line: 403)
!470 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !458, file: !458, line: 1380, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !472, line: 404)
!472 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !458, file: !458, line: 1430, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !474, line: 405)
!474 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !475, file: !475, line: 667, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !477, line: 406)
!477 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !458, file: !458, line: 1189, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !479, line: 407)
!479 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !458, file: !458, line: 1243, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !481, line: 408)
!481 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !458, file: !458, line: 1312, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !483, line: 409)
!483 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !458, file: !458, line: 1490, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !485, line: 410)
!485 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !458, file: !458, line: 1480, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !487, line: 411)
!487 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !475, file: !475, line: 657, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !489, line: 412)
!489 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !458, file: !458, line: 1294, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !491, line: 413)
!491 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !458, file: !458, line: 1385, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !493, line: 414)
!493 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !475, file: !475, line: 607, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !495, line: 415)
!495 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !458, file: !458, line: 1616, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !497, line: 416)
!497 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !475, file: !475, line: 597, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !499, line: 417)
!499 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !458, file: !458, line: 1568, type: !72, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !501, line: 418)
!501 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !475, file: !475, line: 622, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !503, line: 419)
!503 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !475, file: !475, line: 617, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !505, line: 420)
!505 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !458, file: !458, line: 1553, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !507, line: 421)
!507 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !458, file: !458, line: 1543, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !509, line: 422)
!509 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !458, file: !458, line: 1390, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !511, line: 423)
!511 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !458, file: !458, line: 1621, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !513, line: 424)
!513 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !458, file: !458, line: 1520, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !515, line: 425)
!515 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !458, file: !458, line: 1515, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !517, line: 426)
!517 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !458, file: !458, line: 1149, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !519, line: 427)
!519 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !458, file: !458, line: 1602, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !521, line: 428)
!521 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !458, file: !458, line: 1356, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !523, line: 429)
!523 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !458, file: !458, line: 1365, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !525, line: 430)
!525 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !458, file: !458, line: 1285, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !527, line: 431)
!527 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !458, file: !458, line: 1626, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !529, line: 432)
!529 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !458, file: !458, line: 1347, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !531, line: 433)
!531 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !458, file: !458, line: 1140, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !533, line: 434)
!533 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !458, file: !458, line: 1607, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !535, line: 435)
!535 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !458, file: !458, line: 1548, type: !155, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !537, line: 436)
!537 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !458, file: !458, line: 1154, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !539, line: 437)
!539 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !458, file: !458, line: 1218, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !541, line: 438)
!541 = !DISubprogram(name: "nexttowardf", scope: !214, file: !214, line: 294, type: !542, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DISubroutineType(types: !543)
!543 = !{!29, !29, !443}
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !541, line: 439)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !546, line: 440)
!546 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !458, file: !458, line: 1583, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !548, line: 441)
!548 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !458, file: !458, line: 1558, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !550, line: 442)
!550 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !458, file: !458, line: 1563, type: !184, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !552, line: 443)
!552 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !458, file: !458, line: 1135, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !554, line: 444)
!554 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !458, file: !458, line: 1597, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !556, line: 445)
!556 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !458, file: !458, line: 1530, type: !192, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !558, line: 446)
!558 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !458, file: !458, line: 1525, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !560, line: 447)
!560 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !458, file: !458, line: 1234, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !562, line: 448)
!562 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !458, file: !458, line: 1317, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !564, line: 449)
!564 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !475, file: !475, line: 907, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !566, line: 450)
!566 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !458, file: !458, line: 1276, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !568, line: 451)
!568 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !458, file: !458, line: 1322, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !570, line: 452)
!570 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !458, file: !458, line: 1592, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !19, entity: !572, line: 453)
!572 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !475, file: !475, line: 662, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !{void (i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)* @_ZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_, !"kernel", i32 1}
!574 = !{null, !"align", i32 8}
!575 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!576 = !{null, !"align", i32 16}
!577 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!578 = !{i32 2, !"Dwarf Version", i32 4}
!579 = !{i32 2, !"Debug Info Version", i32 3}
!580 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!581 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!582 = !{i32 1, i32 2}
!583 = !DILocalVariable(name: "data", arg: 1, scope: !1, file: !2, line: 37, type: !5)
!584 = !DIExpression()
!585 = !DILocation(line: 37, column: 65, scope: !1)
!586 = !DILocalVariable(name: "gm_codewords", arg: 2, scope: !1, file: !2, line: 38, type: !7)
!587 = !DILocation(line: 38, column: 31, scope: !1)
!588 = !DILocalVariable(name: "gm_codewordlens", arg: 3, scope: !1, file: !2, line: 38, type: !7)
!589 = !DILocation(line: 38, column: 65, scope: !1)
!590 = !DILocalVariable(name: "cw32", arg: 4, scope: !1, file: !2, line: 40, type: !5)
!591 = !DILocation(line: 40, column: 25, scope: !1)
!592 = !DILocalVariable(name: "cw32len", arg: 5, scope: !1, file: !2, line: 40, type: !5)
!593 = !DILocation(line: 40, column: 45, scope: !1)
!594 = !DILocalVariable(name: "cw32idx", arg: 6, scope: !1, file: !2, line: 40, type: !5)
!595 = !DILocation(line: 40, column: 68, scope: !1)
!596 = !DILocalVariable(name: "out", arg: 7, scope: !1, file: !2, line: 42, type: !5)
!597 = !DILocation(line: 42, column: 25, scope: !1)
!598 = !DILocalVariable(name: "outidx", arg: 8, scope: !1, file: !2, line: 42, type: !5)
!599 = !DILocation(line: 42, column: 44, scope: !1)
!600 = !DILocalVariable(name: "kn", scope: !1, file: !2, line: 44, type: !6)
!601 = !DILocation(line: 44, column: 15, scope: !1)
!602 = !DILocation(line: 78, column: 3, scope: !603, inlinedAt: !638)
!603 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !605, file: !604, line: 78, type: !608, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !9, declaration: !607, variables: !10)
!604 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!605 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !604, line: 77, size: 8, align: 8, elements: !606, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!606 = !{!607, !610, !611, !612, !623, !627, !631, !634}
!607 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !605, file: !604, line: 78, type: !608, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DISubroutineType(types: !609)
!609 = !{!6}
!610 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !605, file: !604, line: 79, type: !608, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!611 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !605, file: !604, line: 80, type: !608, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !605, file: !604, line: 83, type: !613, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DISubroutineType(types: !614)
!614 = !{!615, !621}
!615 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !616, line: 190, size: 96, align: 32, elements: !617, identifier: "_ZTS5uint3")
!616 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!617 = !{!618, !619, !620}
!618 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !615, file: !616, line: 192, baseType: !6, size: 32, align: 32)
!619 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !615, file: !616, line: 192, baseType: !6, size: 32, align: 32, offset: 32)
!620 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !615, file: !616, line: 192, baseType: !6, size: 32, align: 32, offset: 64)
!621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !622, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!622 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !605)
!623 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !605, file: !604, line: 85, type: !624, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!624 = !DISubroutineType(types: !625)
!625 = !{null, !626}
!626 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !605, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!627 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !605, file: !604, line: 85, type: !628, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!628 = !DISubroutineType(types: !629)
!629 = !{null, !626, !630}
!630 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !622, size: 64, align: 64)
!631 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !605, file: !604, line: 85, type: !632, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!632 = !DISubroutineType(types: !633)
!633 = !{null, !621, !630}
!634 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !605, file: !604, line: 85, type: !635, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!635 = !DISubroutineType(types: !636)
!636 = !{!637, !621}
!637 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !605, size: 64, align: 64)
!638 = distinct !DILocation(line: 44, column: 20, scope: !1)
!639 = !{i32 0, i32 65535}
!640 = !DILocation(line: 89, column: 3, scope: !641, inlinedAt: !683)
!641 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !642, file: !604, line: 89, type: !608, isLocal: false, isDefinition: true, scopeLine: 89, flags: DIFlagPrototyped, isOptimized: false, unit: !9, declaration: !644, variables: !10)
!642 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockDim_t", file: !604, line: 88, size: 8, align: 8, elements: !643, identifier: "_ZTS25__cuda_builtin_blockDim_t")
!643 = !{!644, !645, !646, !647, !668, !672, !676, !679}
!644 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !642, file: !604, line: 89, type: !608, isLocal: false, isDefinition: false, scopeLine: 89, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !642, file: !604, line: 90, type: !608, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: false)
!646 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_zEv", scope: !642, file: !604, line: 91, type: !608, isLocal: false, isDefinition: false, scopeLine: 91, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv4dim3Ev", scope: !642, file: !604, line: 94, type: !648, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagPrototyped, isOptimized: false)
!648 = !DISubroutineType(types: !649)
!649 = !{!650, !666}
!650 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !616, line: 417, size: 96, align: 32, elements: !651, identifier: "_ZTS4dim3")
!651 = !{!652, !653, !654, !655, !659, !663}
!652 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !650, file: !616, line: 419, baseType: !6, size: 32, align: 32)
!653 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !650, file: !616, line: 419, baseType: !6, size: 32, align: 32, offset: 32)
!654 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !650, file: !616, line: 419, baseType: !6, size: 32, align: 32, offset: 64)
!655 = !DISubprogram(name: "dim3", scope: !650, file: !616, line: 421, type: !656, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!656 = !DISubroutineType(types: !657)
!657 = !{null, !658, !6, !6, !6}
!658 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !650, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!659 = !DISubprogram(name: "dim3", scope: !650, file: !616, line: 422, type: !660, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!660 = !DISubroutineType(types: !661)
!661 = !{null, !658, !662}
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !616, line: 383, baseType: !615)
!663 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !650, file: !616, line: 423, type: !664, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{!662, !658}
!666 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !667, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!667 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !642)
!668 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !642, file: !604, line: 96, type: !669, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!669 = !DISubroutineType(types: !670)
!670 = !{null, !671}
!671 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !642, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!672 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !642, file: !604, line: 96, type: !673, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!673 = !DISubroutineType(types: !674)
!674 = !{null, !671, !675}
!675 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !667, size: 64, align: 64)
!676 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockDim_taSERKS_", scope: !642, file: !604, line: 96, type: !677, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !666, !675}
!679 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockDim_tadEv", scope: !642, file: !604, line: 96, type: !680, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!680 = !DISubroutineType(types: !681)
!681 = !{!682, !666}
!682 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !642, size: 64, align: 64)
!683 = distinct !DILocation(line: 44, column: 31, scope: !684)
!684 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 1)
!685 = !{i32 1, i32 1025}
!686 = !DILocation(line: 44, column: 30, scope: !1)
!687 = !DILocation(line: 67, column: 3, scope: !688, inlinedAt: !714)
!688 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !689, file: !604, line: 67, type: !608, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !9, declaration: !691, variables: !10)
!689 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !604, line: 66, size: 8, align: 8, elements: !690, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!690 = !{!691, !692, !693, !694, !699, !703, !707, !710}
!691 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !689, file: !604, line: 67, type: !608, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!692 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !689, file: !604, line: 68, type: !608, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!693 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !689, file: !604, line: 69, type: !608, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!694 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !689, file: !604, line: 72, type: !695, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!695 = !DISubroutineType(types: !696)
!696 = !{!615, !697}
!697 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !698, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!698 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !689)
!699 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !689, file: !604, line: 74, type: !700, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!700 = !DISubroutineType(types: !701)
!701 = !{null, !702}
!702 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !689, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!703 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !689, file: !604, line: 74, type: !704, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!704 = !DISubroutineType(types: !705)
!705 = !{null, !702, !706}
!706 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !698, size: 64, align: 64)
!707 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !689, file: !604, line: 74, type: !708, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!708 = !DISubroutineType(types: !709)
!709 = !{null, !697, !706}
!710 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !689, file: !604, line: 74, type: !711, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!711 = !DISubroutineType(types: !712)
!712 = !{!713, !697}
!713 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !689, size: 64, align: 64)
!714 = distinct !DILocation(line: 44, column: 44, scope: !715)
!715 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 2)
!716 = !{i32 0, i32 1024}
!717 = !DILocation(line: 44, column: 42, scope: !1)
!718 = !DILocalVariable(name: "k", scope: !1, file: !2, line: 45, type: !6)
!719 = !DILocation(line: 45, column: 15, scope: !1)
!720 = !DILocation(line: 67, column: 3, scope: !688, inlinedAt: !721)
!721 = distinct !DILocation(line: 45, column: 19, scope: !1)
!722 = !DILocalVariable(name: "kc", scope: !1, file: !2, line: 46, type: !6)
!723 = !DILocation(line: 46, column: 15, scope: !1)
!724 = !DILocalVariable(name: "startbit", scope: !1, file: !2, line: 46, type: !6)
!725 = !DILocation(line: 46, column: 19, scope: !1)
!726 = !DILocalVariable(name: "wrbits", scope: !1, file: !2, line: 46, type: !6)
!727 = !DILocation(line: 46, column: 29, scope: !1)
!728 = !DILocalVariable(name: "cw64", scope: !1, file: !2, line: 48, type: !434)
!729 = !DILocation(line: 48, column: 21, scope: !1)
!730 = !DILocalVariable(name: "val32", scope: !1, file: !2, line: 49, type: !6)
!731 = !DILocation(line: 49, column: 15, scope: !1)
!732 = !DILocalVariable(name: "codewordlen", scope: !1, file: !2, line: 49, type: !6)
!733 = !DILocation(line: 49, column: 22, scope: !1)
!734 = !DILocalVariable(name: "tmpbyte", scope: !1, file: !2, line: 50, type: !12)
!735 = !DILocation(line: 50, column: 16, scope: !1)
!736 = !DILocalVariable(name: "tmpcwlen", scope: !1, file: !2, line: 50, type: !12)
!737 = !DILocation(line: 50, column: 25, scope: !1)
!738 = !DILocalVariable(name: "tmpcw32", scope: !1, file: !2, line: 51, type: !6)
!739 = !DILocation(line: 51, column: 15, scope: !1)
!740 = !DILocalVariable(name: "codewords", scope: !1, file: !2, line: 57, type: !5)
!741 = !DILocation(line: 57, column: 16, scope: !1)
!742 = !DILocalVariable(name: "codewordlens", scope: !1, file: !2, line: 58, type: !5)
!743 = !DILocation(line: 58, column: 16, scope: !1)
!744 = !DILocalVariable(name: "as", scope: !1, file: !2, line: 59, type: !5)
!745 = !DILocation(line: 59, column: 16, scope: !1)
!746 = !DILocation(line: 62, column: 17, scope: !1)
!747 = !DILocation(line: 62, column: 30, scope: !1)
!748 = !DILocation(line: 62, column: 2, scope: !1)
!749 = !DILocation(line: 62, column: 12, scope: !1)
!750 = !DILocation(line: 62, column: 15, scope: !1)
!751 = !DILocation(line: 63, column: 20, scope: !1)
!752 = !DILocation(line: 63, column: 36, scope: !1)
!753 = !DILocation(line: 63, column: 2, scope: !1)
!754 = !DILocation(line: 63, column: 15, scope: !1)
!755 = !DILocation(line: 63, column: 18, scope: !1)
!756 = !DILocation(line: 64, column: 12, scope: !1)
!757 = !DILocation(line: 64, column: 17, scope: !1)
!758 = !DILocation(line: 64, column: 10, scope: !1)
!759 = !DILocation(line: 65, column: 2, scope: !1)
!760 = !DILocalVariable(name: "i", scope: !761, file: !2, line: 66, type: !6)
!761 = distinct !DILexicalBlock(scope: !1, file: !2, line: 66, column: 2)
!762 = !DILocation(line: 66, column: 19, scope: !761)
!763 = !DILocation(line: 66, column: 6, scope: !761)
!764 = !DILocation(line: 66, column: 24, scope: !765)
!765 = !DILexicalBlockFile(scope: !766, file: !2, discriminator: 1)
!766 = distinct !DILexicalBlock(scope: !761, file: !2, line: 66, column: 2)
!767 = !DILocation(line: 66, column: 25, scope: !765)
!768 = !DILocation(line: 66, column: 2, scope: !765)
!769 = !DILocation(line: 67, column: 29, scope: !770)
!770 = distinct !DILexicalBlock(scope: !766, file: !2, line: 66, column: 33)
!771 = !DILocation(line: 67, column: 40, scope: !770)
!772 = !DILocation(line: 67, column: 39, scope: !770)
!773 = !DILocation(line: 67, column: 42, scope: !770)
!774 = !DILocation(line: 67, column: 34, scope: !770)
!775 = !DILocation(line: 67, column: 28, scope: !770)
!776 = !DILocation(line: 67, column: 11, scope: !770)
!777 = !DILocation(line: 68, column: 13, scope: !770)
!778 = !DILocation(line: 68, column: 23, scope: !770)
!779 = !DILocation(line: 68, column: 11, scope: !770)
!780 = !DILocation(line: 69, column: 14, scope: !770)
!781 = !DILocation(line: 69, column: 27, scope: !770)
!782 = !DILocation(line: 69, column: 12, scope: !770)
!783 = !DILocation(line: 70, column: 11, scope: !770)
!784 = !DILocation(line: 70, column: 17, scope: !770)
!785 = !DILocation(line: 70, column: 15, scope: !770)
!786 = !DILocation(line: 70, column: 29, scope: !770)
!787 = !DILocation(line: 70, column: 27, scope: !770)
!788 = !DILocation(line: 70, column: 8, scope: !770)
!789 = !DILocation(line: 71, column: 16, scope: !770)
!790 = !DILocation(line: 71, column: 14, scope: !770)
!791 = !DILocation(line: 72, column: 2, scope: !770)
!792 = !DILocation(line: 66, column: 29, scope: !793)
!793 = !DILexicalBlockFile(scope: !766, file: !2, discriminator: 2)
!794 = !DILocation(line: 66, column: 2, scope: !793)
!795 = distinct !{!795, !796}
!796 = !DILocation(line: 66, column: 2, scope: !1)
!797 = !DILocation(line: 84, column: 10, scope: !1)
!798 = !DILocation(line: 84, column: 2, scope: !1)
!799 = !DILocation(line: 84, column: 5, scope: !1)
!800 = !DILocation(line: 84, column: 8, scope: !1)
!801 = !DILocation(line: 85, column: 2, scope: !1)
!802 = !DILocalVariable(name: "offset", scope: !1, file: !2, line: 88, type: !6)
!803 = !DILocation(line: 88, column: 15, scope: !1)
!804 = !DILocalVariable(name: "d", scope: !805, file: !2, line: 91, type: !6)
!805 = distinct !DILexicalBlock(scope: !1, file: !2, line: 91, column: 5)
!806 = !DILocation(line: 91, column: 23, scope: !805)
!807 = !DILocation(line: 89, column: 3, scope: !641, inlinedAt: !808)
!808 = distinct !DILocation(line: 91, column: 28, scope: !805)
!809 = !DILocation(line: 91, column: 39, scope: !805)
!810 = !DILocation(line: 91, column: 10, scope: !805)
!811 = !DILocation(line: 91, column: 44, scope: !812)
!812 = !DILexicalBlockFile(scope: !813, file: !2, discriminator: 1)
!813 = distinct !DILexicalBlock(scope: !805, file: !2, line: 91, column: 5)
!814 = !DILocation(line: 91, column: 46, scope: !812)
!815 = !DILocation(line: 91, column: 5, scope: !812)
!816 = !DILocation(line: 92, column: 9, scope: !817)
!817 = distinct !DILexicalBlock(scope: !813, file: !2, line: 91, column: 61)
!818 = !DILocation(line: 93, column: 13, scope: !819)
!819 = distinct !DILexicalBlock(scope: !817, file: !2, line: 93, column: 13)
!820 = !DILocation(line: 93, column: 17, scope: !819)
!821 = !DILocation(line: 93, column: 15, scope: !819)
!822 = !DILocation(line: 93, column: 13, scope: !817)
!823 = !DILocalVariable(name: "ai", scope: !824, file: !2, line: 94, type: !12)
!824 = distinct !DILexicalBlock(scope: !819, file: !2, line: 93, column: 22)
!825 = !DILocation(line: 94, column: 27, scope: !824)
!826 = !DILocation(line: 94, column: 32, scope: !824)
!827 = !DILocation(line: 94, column: 42, scope: !824)
!828 = !DILocation(line: 94, column: 41, scope: !824)
!829 = !DILocation(line: 94, column: 43, scope: !824)
!830 = !DILocation(line: 94, column: 38, scope: !824)
!831 = !DILocation(line: 94, column: 46, scope: !824)
!832 = !DILocalVariable(name: "bi", scope: !824, file: !2, line: 95, type: !12)
!833 = !DILocation(line: 95, column: 27, scope: !824)
!834 = !DILocation(line: 95, column: 32, scope: !824)
!835 = !DILocation(line: 95, column: 42, scope: !824)
!836 = !DILocation(line: 95, column: 41, scope: !824)
!837 = !DILocation(line: 95, column: 43, scope: !824)
!838 = !DILocation(line: 95, column: 38, scope: !824)
!839 = !DILocation(line: 95, column: 46, scope: !824)
!840 = !DILocation(line: 96, column: 23, scope: !824)
!841 = !DILocation(line: 96, column: 26, scope: !824)
!842 = !DILocation(line: 96, column: 13, scope: !824)
!843 = !DILocation(line: 96, column: 16, scope: !824)
!844 = !DILocation(line: 96, column: 20, scope: !824)
!845 = !DILocation(line: 97, column: 9, scope: !824)
!846 = !DILocation(line: 98, column: 16, scope: !817)
!847 = !DILocation(line: 99, column: 5, scope: !817)
!848 = !DILocation(line: 91, column: 53, scope: !849)
!849 = !DILexicalBlockFile(scope: !813, file: !2, discriminator: 2)
!850 = !DILocation(line: 91, column: 5, scope: !849)
!851 = distinct !{!851, !852}
!852 = !DILocation(line: 91, column: 5, scope: !1)
!853 = !DILocation(line: 103, column: 9, scope: !854)
!854 = distinct !DILexicalBlock(scope: !1, file: !2, line: 103, column: 9)
!855 = !DILocation(line: 103, column: 11, scope: !854)
!856 = !DILocation(line: 103, column: 9, scope: !1)
!857 = !DILocation(line: 103, column: 17, scope: !858)
!858 = !DILexicalBlockFile(scope: !854, file: !2, discriminator: 1)
!859 = !DILocation(line: 89, column: 3, scope: !641, inlinedAt: !860)
!860 = distinct !DILocation(line: 103, column: 20, scope: !858)
!861 = !DILocation(line: 103, column: 31, scope: !858)
!862 = !DILocation(line: 103, column: 36, scope: !858)
!863 = !DILocalVariable(name: "d", scope: !864, file: !2, line: 106, type: !6)
!864 = distinct !DILexicalBlock(scope: !1, file: !2, line: 106, column: 5)
!865 = !DILocation(line: 106, column: 23, scope: !864)
!866 = !DILocation(line: 106, column: 10, scope: !864)
!867 = !DILocation(line: 106, column: 30, scope: !868)
!868 = !DILexicalBlockFile(scope: !869, file: !2, discriminator: 1)
!869 = distinct !DILexicalBlock(scope: !864, file: !2, line: 106, column: 5)
!870 = !DILocation(line: 89, column: 3, scope: !641, inlinedAt: !871)
!871 = distinct !DILocation(line: 106, column: 34, scope: !868)
!872 = !DILocation(line: 106, column: 32, scope: !868)
!873 = !DILocation(line: 106, column: 5, scope: !868)
!874 = !DILocation(line: 107, column: 16, scope: !875)
!875 = distinct !DILexicalBlock(scope: !869, file: !2, line: 106, column: 57)
!876 = !DILocation(line: 108, column: 9, scope: !875)
!877 = !DILocation(line: 109, column: 13, scope: !878)
!878 = distinct !DILexicalBlock(scope: !875, file: !2, line: 109, column: 13)
!879 = !DILocation(line: 109, column: 17, scope: !878)
!880 = !DILocation(line: 109, column: 15, scope: !878)
!881 = !DILocation(line: 109, column: 13, scope: !875)
!882 = !DILocalVariable(name: "ai", scope: !883, file: !2, line: 110, type: !12)
!883 = distinct !DILexicalBlock(scope: !878, file: !2, line: 109, column: 22)
!884 = !DILocation(line: 110, column: 27, scope: !883)
!885 = !DILocation(line: 110, column: 32, scope: !883)
!886 = !DILocation(line: 110, column: 42, scope: !883)
!887 = !DILocation(line: 110, column: 41, scope: !883)
!888 = !DILocation(line: 110, column: 43, scope: !883)
!889 = !DILocation(line: 110, column: 38, scope: !883)
!890 = !DILocation(line: 110, column: 46, scope: !883)
!891 = !DILocalVariable(name: "bi", scope: !883, file: !2, line: 111, type: !12)
!892 = !DILocation(line: 111, column: 27, scope: !883)
!893 = !DILocation(line: 111, column: 32, scope: !883)
!894 = !DILocation(line: 111, column: 42, scope: !883)
!895 = !DILocation(line: 111, column: 41, scope: !883)
!896 = !DILocation(line: 111, column: 43, scope: !883)
!897 = !DILocation(line: 111, column: 38, scope: !883)
!898 = !DILocation(line: 111, column: 46, scope: !883)
!899 = !DILocalVariable(name: "t", scope: !883, file: !2, line: 112, type: !6)
!900 = !DILocation(line: 112, column: 26, scope: !883)
!901 = !DILocation(line: 112, column: 32, scope: !883)
!902 = !DILocation(line: 112, column: 35, scope: !883)
!903 = !DILocation(line: 113, column: 23, scope: !883)
!904 = !DILocation(line: 113, column: 26, scope: !883)
!905 = !DILocation(line: 113, column: 13, scope: !883)
!906 = !DILocation(line: 113, column: 16, scope: !883)
!907 = !DILocation(line: 113, column: 21, scope: !883)
!908 = !DILocation(line: 114, column: 23, scope: !883)
!909 = !DILocation(line: 114, column: 13, scope: !883)
!910 = !DILocation(line: 114, column: 16, scope: !883)
!911 = !DILocation(line: 114, column: 20, scope: !883)
!912 = !DILocation(line: 115, column: 9, scope: !883)
!913 = !DILocation(line: 116, column: 5, scope: !875)
!914 = !DILocation(line: 106, column: 48, scope: !915)
!915 = !DILexicalBlockFile(scope: !869, file: !2, discriminator: 2)
!916 = !DILocation(line: 106, column: 5, scope: !915)
!917 = distinct !{!917, !918}
!918 = !DILocation(line: 106, column: 5, scope: !1)
!919 = !DILocation(line: 117, column: 2, scope: !1)
!920 = !DILocation(line: 119, column: 6, scope: !921)
!921 = distinct !DILexicalBlock(scope: !1, file: !2, line: 119, column: 6)
!922 = !DILocation(line: 89, column: 3, scope: !641, inlinedAt: !923)
!923 = distinct !DILocation(line: 119, column: 11, scope: !921)
!924 = !DILocation(line: 119, column: 21, scope: !921)
!925 = !DILocation(line: 119, column: 8, scope: !921)
!926 = !DILocation(line: 119, column: 6, scope: !1)
!927 = !DILocation(line: 120, column: 24, scope: !928)
!928 = distinct !DILexicalBlock(scope: !921, file: !2, line: 119, column: 25)
!929 = !DILocation(line: 120, column: 27, scope: !928)
!930 = !DILocation(line: 120, column: 32, scope: !928)
!931 = !DILocation(line: 120, column: 30, scope: !928)
!932 = !DILocation(line: 120, column: 3, scope: !928)
!933 = !DILocation(line: 78, column: 3, scope: !603, inlinedAt: !934)
!934 = distinct !DILocation(line: 120, column: 10, scope: !928)
!935 = !DILocation(line: 120, column: 22, scope: !928)
!936 = !DILocation(line: 121, column: 12, scope: !928)
!937 = !DILocation(line: 121, column: 15, scope: !928)
!938 = !DILocation(line: 121, column: 20, scope: !928)
!939 = !DILocation(line: 121, column: 18, scope: !928)
!940 = !DILocation(line: 121, column: 32, scope: !928)
!941 = !DILocation(line: 121, column: 9, scope: !928)
!942 = !DILocation(line: 122, column: 2, scope: !928)
!943 = !DILocation(line: 125, column: 7, scope: !1)
!944 = !DILocation(line: 125, column: 10, scope: !1)
!945 = !DILocation(line: 125, column: 12, scope: !1)
!946 = !DILocation(line: 125, column: 5, scope: !1)
!947 = !DILocation(line: 126, column: 13, scope: !1)
!948 = !DILocation(line: 126, column: 16, scope: !1)
!949 = !DILocation(line: 126, column: 18, scope: !1)
!950 = !DILocation(line: 126, column: 11, scope: !1)
!951 = !DILocation(line: 127, column: 2, scope: !1)
!952 = !DILocation(line: 127, column: 5, scope: !1)
!953 = !DILocation(line: 127, column: 8, scope: !1)
!954 = !DILocation(line: 128, column: 2, scope: !1)
!955 = !DILocation(line: 131, column: 12, scope: !1)
!956 = !DILocation(line: 131, column: 30, scope: !1)
!957 = !DILocation(line: 131, column: 29, scope: !1)
!958 = !DILocation(line: 131, column: 24, scope: !1)
!959 = !DILocation(line: 131, column: 45, scope: !684)
!960 = !DILocation(line: 131, column: 44, scope: !684)
!961 = !DILocation(line: 131, column: 12, scope: !684)
!962 = !DILocation(line: 131, column: 56, scope: !715)
!963 = !DILocation(line: 131, column: 12, scope: !715)
!964 = !DILocation(line: 131, column: 12, scope: !965)
!965 = !DILexicalBlockFile(scope: !1, file: !2, discriminator: 3)
!966 = !DILocation(line: 131, column: 10, scope: !965)
!967 = !DILocation(line: 132, column: 28, scope: !1)
!968 = !DILocation(line: 132, column: 35, scope: !1)
!969 = !DILocation(line: 132, column: 49, scope: !1)
!970 = !DILocation(line: 132, column: 47, scope: !1)
!971 = !DILocation(line: 132, column: 32, scope: !1)
!972 = !DILocation(line: 132, column: 27, scope: !1)
!973 = !DILocation(line: 132, column: 11, scope: !1)
!974 = !DILocation(line: 135, column: 12, scope: !1)
!975 = !DILocation(line: 135, column: 15, scope: !1)
!976 = !DILocation(line: 135, column: 20, scope: !1)
!977 = !DILocation(line: 135, column: 33, scope: !1)
!978 = !DILocation(line: 135, column: 32, scope: !1)
!979 = !DILocation(line: 135, column: 42, scope: !1)
!980 = !DILocation(line: 135, column: 41, scope: !1)
!981 = !DILocation(line: 135, column: 27, scope: !1)
!982 = !DILocation(line: 135, column: 2, scope: !1)
!983 = !DILocation(line: 136, column: 18, scope: !1)
!984 = !DILocation(line: 136, column: 15, scope: !1)
!985 = !DILocation(line: 139, column: 6, scope: !986)
!986 = distinct !DILexicalBlock(scope: !1, file: !2, line: 139, column: 6)
!987 = !DILocation(line: 139, column: 6, scope: !1)
!988 = !DILocation(line: 140, column: 12, scope: !989)
!989 = distinct !DILexicalBlock(scope: !986, file: !2, line: 139, column: 19)
!990 = !DILocation(line: 140, column: 24, scope: !989)
!991 = !DILocation(line: 140, column: 12, scope: !992)
!992 = !DILexicalBlockFile(scope: !989, file: !2, discriminator: 1)
!993 = !DILocation(line: 140, column: 35, scope: !994)
!994 = !DILexicalBlockFile(scope: !989, file: !2, discriminator: 2)
!995 = !DILocation(line: 140, column: 12, scope: !994)
!996 = !DILocation(line: 140, column: 12, scope: !997)
!997 = !DILexicalBlockFile(scope: !989, file: !2, discriminator: 3)
!998 = !DILocation(line: 140, column: 10, scope: !997)
!999 = !DILocation(line: 141, column: 28, scope: !989)
!1000 = !DILocation(line: 141, column: 35, scope: !989)
!1001 = !DILocation(line: 141, column: 49, scope: !989)
!1002 = !DILocation(line: 141, column: 47, scope: !989)
!1003 = !DILocation(line: 141, column: 32, scope: !989)
!1004 = !DILocation(line: 141, column: 27, scope: !989)
!1005 = !DILocation(line: 141, column: 65, scope: !989)
!1006 = !DILocation(line: 141, column: 63, scope: !989)
!1007 = !DILocation(line: 141, column: 72, scope: !989)
!1008 = !DILocation(line: 141, column: 58, scope: !989)
!1009 = !DILocation(line: 141, column: 11, scope: !989)
!1010 = !DILocation(line: 144, column: 12, scope: !989)
!1011 = !DILocation(line: 144, column: 15, scope: !989)
!1012 = !DILocation(line: 144, column: 17, scope: !989)
!1013 = !DILocation(line: 144, column: 22, scope: !989)
!1014 = !DILocation(line: 144, column: 35, scope: !989)
!1015 = !DILocation(line: 144, column: 34, scope: !989)
!1016 = !DILocation(line: 144, column: 29, scope: !989)
!1017 = !DILocation(line: 144, column: 2, scope: !989)
!1018 = !DILocation(line: 145, column: 17, scope: !989)
!1019 = !DILocation(line: 145, column: 14, scope: !989)
!1020 = !DILocation(line: 146, column: 2, scope: !989)
!1021 = !DILocation(line: 149, column: 6, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1, file: !2, line: 149, column: 6)
!1023 = !DILocation(line: 149, column: 6, scope: !1)
!1024 = !DILocation(line: 150, column: 28, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1022, file: !2, line: 149, column: 19)
!1026 = !DILocation(line: 150, column: 40, scope: !1025)
!1027 = !DILocation(line: 150, column: 38, scope: !1025)
!1028 = !DILocation(line: 150, column: 52, scope: !1025)
!1029 = !DILocation(line: 150, column: 35, scope: !1025)
!1030 = !DILocation(line: 150, column: 33, scope: !1025)
!1031 = !DILocation(line: 150, column: 27, scope: !1025)
!1032 = !DILocation(line: 150, column: 11, scope: !1025)
!1033 = !DILocation(line: 153, column: 12, scope: !1025)
!1034 = !DILocation(line: 153, column: 15, scope: !1025)
!1035 = !DILocation(line: 153, column: 17, scope: !1025)
!1036 = !DILocation(line: 153, column: 22, scope: !1025)
!1037 = !DILocation(line: 153, column: 35, scope: !1025)
!1038 = !DILocation(line: 153, column: 34, scope: !1025)
!1039 = !DILocation(line: 153, column: 29, scope: !1025)
!1040 = !DILocation(line: 153, column: 2, scope: !1025)
!1041 = !DILocation(line: 154, column: 2, scope: !1025)
!1042 = !DILocation(line: 156, column: 2, scope: !1)
!1043 = !DILocation(line: 158, column: 6, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1, file: !2, line: 158, column: 6)
!1045 = !DILocation(line: 158, column: 9, scope: !1044)
!1046 = !DILocation(line: 158, column: 7, scope: !1044)
!1047 = !DILocation(line: 158, column: 6, scope: !1)
!1048 = !DILocation(line: 158, column: 26, scope: !1049)
!1049 = !DILexicalBlockFile(scope: !1044, file: !2, discriminator: 1)
!1050 = !DILocation(line: 158, column: 29, scope: !1049)
!1051 = !DILocation(line: 158, column: 16, scope: !1049)
!1052 = !DILocation(line: 158, column: 20, scope: !1049)
!1053 = !DILocation(line: 158, column: 24, scope: !1049)
!1054 = !DILocation(line: 160, column: 1, scope: !1)
!1055 = distinct !DISubprogram(name: "atomicOr", linkageName: "_ZL8atomicOrPjj", scope: !1056, file: !1056, line: 156, type: !1057, isLocal: true, isDefinition: true, scopeLine: 157, flags: DIFlagPrototyped, isOptimized: false, unit: !9, variables: !10)
!1056 = !DIFile(filename: "/usr/local/cuda/include/device_atomic_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/huffman")
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!6, !5, !6}
!1059 = !DILocalVariable(name: "p", arg: 1, scope: !1060, file: !475, line: 2144, type: !5)
!1060 = distinct !DISubprogram(name: "__uAtomicOr", linkageName: "_ZL11__uAtomicOrPjj", scope: !475, file: !475, line: 2144, type: !1057, isLocal: true, isDefinition: true, scopeLine: 2145, flags: DIFlagPrototyped, isOptimized: false, unit: !9, variables: !10)
!1061 = !DILocation(line: 2144, column: 40, scope: !1060, inlinedAt: !1062)
!1062 = distinct !DILocation(line: 158, column: 10, scope: !1055)
!1063 = !DILocalVariable(name: "val", arg: 2, scope: !1060, file: !475, line: 2144, type: !6)
!1064 = !DILocation(line: 2144, column: 56, scope: !1060, inlinedAt: !1062)
!1065 = !DILocalVariable(name: "address", arg: 1, scope: !1055, file: !1056, line: 156, type: !5)
!1066 = !DILocation(line: 156, column: 70, scope: !1055)
!1067 = !DILocalVariable(name: "val", arg: 2, scope: !1055, file: !1056, line: 156, type: !6)
!1068 = !DILocation(line: 156, column: 92, scope: !1055)
!1069 = !DILocation(line: 158, column: 22, scope: !1055)
!1070 = !DILocation(line: 158, column: 31, scope: !1055)
!1071 = !DILocation(line: 158, column: 10, scope: !1055)
!1072 = !DILocation(line: 2146, column: 61, scope: !1060, inlinedAt: !1062)
!1073 = !DILocation(line: 2146, column: 69, scope: !1060, inlinedAt: !1062)
!1074 = !DILocation(line: 2146, column: 24, scope: !1060, inlinedAt: !1062)
!1075 = !DILocation(line: 158, column: 3, scope: !1055)
