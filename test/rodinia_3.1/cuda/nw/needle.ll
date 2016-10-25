; ModuleID = 'needle.cu'
source_filename = "needle.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@blosum62 = global [24 x [24 x i32]] [[24 x i32] [i32 4, i32 -1, i32 -2, i32 -2, i32 0, i32 -1, i32 -1, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 1, i32 0, i32 -3, i32 -2, i32 0, i32 -2, i32 -1, i32 0, i32 -4], [24 x i32] [i32 -1, i32 5, i32 0, i32 -2, i32 -3, i32 1, i32 0, i32 -2, i32 0, i32 -3, i32 -2, i32 2, i32 -1, i32 -3, i32 -2, i32 -1, i32 -1, i32 -3, i32 -2, i32 -3, i32 -1, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 0, i32 6, i32 1, i32 -3, i32 0, i32 0, i32 0, i32 1, i32 -3, i32 -3, i32 0, i32 -2, i32 -3, i32 -2, i32 1, i32 0, i32 -4, i32 -2, i32 -3, i32 3, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -2, i32 1, i32 6, i32 -3, i32 0, i32 2, i32 -1, i32 -1, i32 -3, i32 -4, i32 -1, i32 -3, i32 -3, i32 -1, i32 0, i32 -1, i32 -4, i32 -3, i32 -3, i32 4, i32 1, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -3, i32 -3, i32 -3, i32 9, i32 -3, i32 -4, i32 -3, i32 -3, i32 -1, i32 -1, i32 -3, i32 -1, i32 -2, i32 -3, i32 -1, i32 -1, i32 -2, i32 -2, i32 -1, i32 -3, i32 -3, i32 -2, i32 -4], [24 x i32] [i32 -1, i32 1, i32 0, i32 0, i32 -3, i32 5, i32 2, i32 -2, i32 0, i32 -3, i32 -2, i32 1, i32 0, i32 -3, i32 -1, i32 0, i32 -1, i32 -2, i32 -1, i32 -2, i32 0, i32 3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 0, i32 0, i32 2, i32 -4, i32 2, i32 5, i32 -2, i32 0, i32 -3, i32 -3, i32 1, i32 -2, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 1, i32 4, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -2, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 6, i32 -2, i32 -4, i32 -4, i32 -2, i32 -3, i32 -3, i32 -2, i32 0, i32 -2, i32 -2, i32 -3, i32 -3, i32 -1, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 0, i32 1, i32 -1, i32 -3, i32 0, i32 0, i32 -2, i32 8, i32 -3, i32 -3, i32 -1, i32 -2, i32 -1, i32 -2, i32 -1, i32 -2, i32 -2, i32 2, i32 -3, i32 0, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -3, i32 -3, i32 -3, i32 -1, i32 -3, i32 -3, i32 -4, i32 -3, i32 4, i32 2, i32 -3, i32 1, i32 0, i32 -3, i32 -2, i32 -1, i32 -3, i32 -1, i32 3, i32 -3, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -2, i32 -3, i32 -4, i32 -1, i32 -2, i32 -3, i32 -4, i32 -3, i32 2, i32 4, i32 -2, i32 2, i32 0, i32 -3, i32 -2, i32 -1, i32 -2, i32 -1, i32 1, i32 -4, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 2, i32 0, i32 -1, i32 -3, i32 1, i32 1, i32 -2, i32 -1, i32 -3, i32 -2, i32 5, i32 -1, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 0, i32 1, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -1, i32 -2, i32 -3, i32 -1, i32 0, i32 -2, i32 -3, i32 -2, i32 1, i32 2, i32 -1, i32 5, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 1, i32 -3, i32 -1, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -3, i32 -3, i32 -3, i32 -2, i32 -3, i32 -3, i32 -3, i32 -1, i32 0, i32 0, i32 -3, i32 0, i32 6, i32 -4, i32 -2, i32 -2, i32 1, i32 3, i32 -1, i32 -3, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -2, i32 -2, i32 -1, i32 -3, i32 -1, i32 -1, i32 -2, i32 -2, i32 -3, i32 -3, i32 -1, i32 -2, i32 -4, i32 7, i32 -1, i32 -1, i32 -4, i32 -3, i32 -2, i32 -2, i32 -1, i32 -2, i32 -4], [24 x i32] [i32 1, i32 -1, i32 1, i32 0, i32 -1, i32 0, i32 0, i32 0, i32 -1, i32 -2, i32 -2, i32 0, i32 -1, i32 -2, i32 -1, i32 4, i32 1, i32 -3, i32 -2, i32 -2, i32 0, i32 0, i32 0, i32 -4], [24 x i32] [i32 0, i32 -1, i32 0, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 1, i32 5, i32 -2, i32 -2, i32 0, i32 -1, i32 -1, i32 0, i32 -4], [24 x i32] [i32 -3, i32 -3, i32 -4, i32 -4, i32 -2, i32 -2, i32 -3, i32 -2, i32 -2, i32 -3, i32 -2, i32 -3, i32 -1, i32 1, i32 -4, i32 -3, i32 -2, i32 11, i32 2, i32 -3, i32 -4, i32 -3, i32 -2, i32 -4], [24 x i32] [i32 -2, i32 -2, i32 -2, i32 -3, i32 -2, i32 -1, i32 -2, i32 -3, i32 2, i32 -1, i32 -1, i32 -2, i32 -1, i32 3, i32 -3, i32 -2, i32 -2, i32 2, i32 7, i32 -1, i32 -3, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -3, i32 -3, i32 -3, i32 -1, i32 -2, i32 -2, i32 -3, i32 -3, i32 3, i32 1, i32 -2, i32 1, i32 -1, i32 -2, i32 -2, i32 0, i32 -3, i32 -1, i32 4, i32 -3, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -1, i32 3, i32 4, i32 -3, i32 0, i32 1, i32 -1, i32 0, i32 -3, i32 -4, i32 0, i32 -3, i32 -3, i32 -2, i32 0, i32 -1, i32 -4, i32 -3, i32 -3, i32 4, i32 1, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 0, i32 0, i32 1, i32 -3, i32 3, i32 4, i32 -2, i32 0, i32 -3, i32 -3, i32 1, i32 -1, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 1, i32 4, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 0, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -4], [24 x i32] [i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 1]], align 16, !dbg !0
@.str = private unnamed_addr constant [25 x i8] c"WG size of kernel = %d \0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [42 x i8] c"Usage: %s <max_rows/max_cols> <penalty> \0A\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"\09<dimension>  - x and y dimensions\0A\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"\09<penalty> - penalty(positive integer)\0A\00", align 1
@.str.4 = private unnamed_addr constant [47 x i8] c"The dimension values must be a multiple of 16\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"error: can not allocate memory\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"Start Needleman-Wunsch\0A\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"Processing top-left matrix\0A\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"Processing bottom-right matrix\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @_Z7maximumiii(i32 %a, i32 %b, i32 %c) #0 !dbg !579 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !584, metadata !585), !dbg !586
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !587, metadata !585), !dbg !588
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !589, metadata !585), !dbg !590
  call void @llvm.dbg.declare(metadata i32* %k, metadata !591, metadata !585), !dbg !592
  %0 = load i32, i32* %a.addr, align 4, !dbg !593
  %1 = load i32, i32* %b.addr, align 4, !dbg !595
  %cmp = icmp sle i32 %0, %1, !dbg !596
  br i1 %cmp, label %if.then, label %if.else, !dbg !597

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %b.addr, align 4, !dbg !598
  store i32 %2, i32* %k, align 4, !dbg !599
  br label %if.end, !dbg !600

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !601
  store i32 %3, i32* %k, align 4, !dbg !602
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %k, align 4, !dbg !603
  %5 = load i32, i32* %c.addr, align 4, !dbg !605
  %cmp1 = icmp sle i32 %4, %5, !dbg !606
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !607

if.then2:                                         ; preds = %if.end
  %6 = load i32, i32* %c.addr, align 4, !dbg !608
  store i32 %6, i32* %retval, align 4, !dbg !609
  br label %return, !dbg !609

if.else3:                                         ; preds = %if.end
  %7 = load i32, i32* %k, align 4, !dbg !610
  store i32 %7, i32* %retval, align 4, !dbg !611
  br label %return, !dbg !611

return:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %retval, align 4, !dbg !612
  ret i32 %8, !dbg !612
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: uwtable
define void @_Z20needle_cuda_shared_1PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #2 !dbg !613 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  store i32* %referrence, i32** %referrence.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %referrence.addr, metadata !616, metadata !585), !dbg !617
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %matrix_cuda.addr, metadata !618, metadata !585), !dbg !619
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !620, metadata !585), !dbg !621
  store i32 %penalty, i32* %penalty.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %penalty.addr, metadata !622, metadata !585), !dbg !623
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !624, metadata !585), !dbg !625
  store i32 %block_width, i32* %block_width.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %block_width.addr, metadata !626, metadata !585), !dbg !627
  %0 = bitcast i32** %referrence.addr to i8*, !dbg !628
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !628
  %2 = icmp eq i32 %1, 0, !dbg !628
  br i1 %2, label %setup.next, label %setup.end, !dbg !628

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %matrix_cuda.addr to i8*, !dbg !629
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !629
  %5 = icmp eq i32 %4, 0, !dbg !629
  br i1 %5, label %setup.next1, label %setup.end, !dbg !629

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %cols.addr to i8*, !dbg !631
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 16), !dbg !631
  %8 = icmp eq i32 %7, 0, !dbg !631
  br i1 %8, label %setup.next2, label %setup.end, !dbg !631

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %penalty.addr to i8*, !dbg !633
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 20), !dbg !633
  %11 = icmp eq i32 %10, 0, !dbg !633
  br i1 %11, label %setup.next3, label %setup.end, !dbg !633

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %i.addr to i8*, !dbg !635
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 24), !dbg !635
  %14 = icmp eq i32 %13, 0, !dbg !635
  br i1 %14, label %setup.next4, label %setup.end, !dbg !635

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %block_width.addr to i8*, !dbg !637
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 28), !dbg !637
  %17 = icmp eq i32 %16, 0, !dbg !637
  br i1 %17, label %setup.next5, label %setup.end, !dbg !637

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_1PiS_iiii to i8*)), !dbg !639
  br label %setup.end, !dbg !639

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !641
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z20needle_cuda_shared_2PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #2 !dbg !642 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  store i32* %referrence, i32** %referrence.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %referrence.addr, metadata !643, metadata !585), !dbg !644
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %matrix_cuda.addr, metadata !645, metadata !585), !dbg !646
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !647, metadata !585), !dbg !648
  store i32 %penalty, i32* %penalty.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %penalty.addr, metadata !649, metadata !585), !dbg !650
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !651, metadata !585), !dbg !652
  store i32 %block_width, i32* %block_width.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %block_width.addr, metadata !653, metadata !585), !dbg !654
  %0 = bitcast i32** %referrence.addr to i8*, !dbg !655
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !655
  %2 = icmp eq i32 %1, 0, !dbg !655
  br i1 %2, label %setup.next, label %setup.end, !dbg !655

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %matrix_cuda.addr to i8*, !dbg !656
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !656
  %5 = icmp eq i32 %4, 0, !dbg !656
  br i1 %5, label %setup.next1, label %setup.end, !dbg !656

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %cols.addr to i8*, !dbg !658
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 16), !dbg !658
  %8 = icmp eq i32 %7, 0, !dbg !658
  br i1 %8, label %setup.next2, label %setup.end, !dbg !658

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %penalty.addr to i8*, !dbg !660
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 20), !dbg !660
  %11 = icmp eq i32 %10, 0, !dbg !660
  br i1 %11, label %setup.next3, label %setup.end, !dbg !660

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %i.addr to i8*, !dbg !662
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 24), !dbg !662
  %14 = icmp eq i32 %13, 0, !dbg !662
  br i1 %14, label %setup.next4, label %setup.end, !dbg !662

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %block_width.addr to i8*, !dbg !664
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 28), !dbg !664
  %17 = icmp eq i32 %16, 0, !dbg !664
  br i1 %17, label %setup.next5, label %setup.end, !dbg !664

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_2PiS_iiii to i8*)), !dbg !666
  br label %setup.end, !dbg !666

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !668
}

; Function Attrs: nounwind uwtable
define double @_Z7gettimev() #0 !dbg !669 {
entry:
  %t = alloca %struct.timeval, align 8
  call void @llvm.dbg.declare(metadata %struct.timeval* %t, metadata !672, metadata !585), !dbg !681
  %call = call i32 @gettimeofday(%struct.timeval* %t, %struct.timezone* null) #9, !dbg !682
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i32 0, i32 0, !dbg !683
  %0 = load i64, i64* %tv_sec, align 8, !dbg !683
  %conv = sitofp i64 %0 to double, !dbg !684
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i32 0, i32 1, !dbg !685
  %1 = load i64, i64* %tv_usec, align 8, !dbg !685
  %conv1 = sitofp i64 %1 to double, !dbg !686
  %mul = fmul double %conv1, 1.000000e-06, !dbg !687
  %add = fadd double %conv, %mul, !dbg !688
  ret double %add, !dbg !689
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #3

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #4 !dbg !690 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !693, metadata !585), !dbg !694
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !695, metadata !585), !dbg !696
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0), i32 16), !dbg !697
  %0 = load i32, i32* %argc.addr, align 4, !dbg !698
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !699
  call void @_Z7runTestiPPc(i32 %0, i8** %1), !dbg !700
  ret i32 0, !dbg !701
}

declare i32 @printf(i8*, ...) #5

; Function Attrs: uwtable
define void @_Z7runTestiPPc(i32 %argc, i8** %argv) #2 !dbg !702 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %max_rows = alloca i32, align 4
  %max_cols = alloca i32, align 4
  %penalty = alloca i32, align 4
  %input_itemsets = alloca i32*, align 8
  %output_itemsets = alloca i32*, align 8
  %referrence = alloca i32*, align 8
  %matrix_cuda = alloca i32*, align 8
  %referrence_cuda = alloca i32*, align 8
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i36 = alloca i32, align 4
  %j49 = alloca i32, align 4
  %i61 = alloca i32, align 4
  %j65 = alloca i32, align 4
  %i88 = alloca i32, align 4
  %j99 = alloca i32, align 4
  %dimGrid = alloca %struct.dim3, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %block_width = alloca i32, align 4
  %i125 = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp129 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp129.coerce = alloca { i64, i32 }, align 4
  %i136 = alloca i32, align 4
  %agg.tmp143 = alloca %struct.dim3, align 4
  %agg.tmp144 = alloca %struct.dim3, align 4
  %agg.tmp143.coerce = alloca { i64, i32 }, align 4
  %agg.tmp144.coerce = alloca { i64, i32 }, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !705, metadata !585), !dbg !706
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !707, metadata !585), !dbg !708
  call void @llvm.dbg.declare(metadata i32* %max_rows, metadata !709, metadata !585), !dbg !710
  call void @llvm.dbg.declare(metadata i32* %max_cols, metadata !711, metadata !585), !dbg !712
  call void @llvm.dbg.declare(metadata i32* %penalty, metadata !713, metadata !585), !dbg !714
  call void @llvm.dbg.declare(metadata i32** %input_itemsets, metadata !715, metadata !585), !dbg !716
  call void @llvm.dbg.declare(metadata i32** %output_itemsets, metadata !717, metadata !585), !dbg !718
  call void @llvm.dbg.declare(metadata i32** %referrence, metadata !719, metadata !585), !dbg !720
  call void @llvm.dbg.declare(metadata i32** %matrix_cuda, metadata !721, metadata !585), !dbg !722
  call void @llvm.dbg.declare(metadata i32** %referrence_cuda, metadata !723, metadata !585), !dbg !724
  call void @llvm.dbg.declare(metadata i32* %size, metadata !725, metadata !585), !dbg !726
  %0 = load i32, i32* %argc.addr, align 4, !dbg !727
  %cmp = icmp eq i32 %0, 3, !dbg !729
  br i1 %cmp, label %if.then, label %if.else, !dbg !730

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !731
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !731
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !731
  %call = call i32 @atoi(i8* %2) #10, !dbg !733
  store i32 %call, i32* %max_rows, align 4, !dbg !734
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !735
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !735
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !735
  %call2 = call i32 @atoi(i8* %4) #10, !dbg !736
  store i32 %call2, i32* %max_cols, align 4, !dbg !737
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !738
  %arrayidx3 = getelementptr inbounds i8*, i8** %5, i64 2, !dbg !738
  %6 = load i8*, i8** %arrayidx3, align 8, !dbg !738
  %call4 = call i32 @atoi(i8* %6) #10, !dbg !739
  store i32 %call4, i32* %penalty, align 4, !dbg !740
  br label %if.end, !dbg !741

if.else:                                          ; preds = %entry
  %7 = load i32, i32* %argc.addr, align 4, !dbg !742
  %8 = load i8**, i8*** %argv.addr, align 8, !dbg !744
  call void @_Z5usageiPPc(i32 %7, i8** %8), !dbg !745
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load i8**, i8*** %argv.addr, align 8, !dbg !746
  %arrayidx5 = getelementptr inbounds i8*, i8** %9, i64 1, !dbg !746
  %10 = load i8*, i8** %arrayidx5, align 8, !dbg !746
  %call6 = call i32 @atoi(i8* %10) #10, !dbg !748
  %rem = srem i32 %call6, 16, !dbg !749
  %cmp7 = icmp ne i32 %rem, 0, !dbg !750
  br i1 %cmp7, label %if.then8, label %if.end10, !dbg !751

if.then8:                                         ; preds = %if.end
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !752
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.4, i32 0, i32 0)), !dbg !754
  call void @exit(i32 1) #11, !dbg !755
  unreachable, !dbg !755

if.end10:                                         ; preds = %if.end
  %12 = load i32, i32* %max_rows, align 4, !dbg !756
  %add = add nsw i32 %12, 1, !dbg !757
  store i32 %add, i32* %max_rows, align 4, !dbg !758
  %13 = load i32, i32* %max_cols, align 4, !dbg !759
  %add11 = add nsw i32 %13, 1, !dbg !760
  store i32 %add11, i32* %max_cols, align 4, !dbg !761
  %14 = load i32, i32* %max_rows, align 4, !dbg !762
  %15 = load i32, i32* %max_cols, align 4, !dbg !763
  %mul = mul nsw i32 %14, %15, !dbg !764
  %conv = sext i32 %mul to i64, !dbg !762
  %mul12 = mul i64 %conv, 4, !dbg !765
  %call13 = call noalias i8* @malloc(i64 %mul12) #9, !dbg !766
  %16 = bitcast i8* %call13 to i32*, !dbg !767
  store i32* %16, i32** %referrence, align 8, !dbg !768
  %17 = load i32, i32* %max_rows, align 4, !dbg !769
  %18 = load i32, i32* %max_cols, align 4, !dbg !770
  %mul14 = mul nsw i32 %17, %18, !dbg !771
  %conv15 = sext i32 %mul14 to i64, !dbg !769
  %mul16 = mul i64 %conv15, 4, !dbg !772
  %call17 = call noalias i8* @malloc(i64 %mul16) #9, !dbg !773
  %19 = bitcast i8* %call17 to i32*, !dbg !774
  store i32* %19, i32** %input_itemsets, align 8, !dbg !775
  %20 = load i32, i32* %max_rows, align 4, !dbg !776
  %21 = load i32, i32* %max_cols, align 4, !dbg !777
  %mul18 = mul nsw i32 %20, %21, !dbg !778
  %conv19 = sext i32 %mul18 to i64, !dbg !776
  %mul20 = mul i64 %conv19, 4, !dbg !779
  %call21 = call noalias i8* @malloc(i64 %mul20) #9, !dbg !780
  %22 = bitcast i8* %call21 to i32*, !dbg !781
  store i32* %22, i32** %output_itemsets, align 8, !dbg !782
  %23 = load i32*, i32** %input_itemsets, align 8, !dbg !783
  %tobool = icmp ne i32* %23, null, !dbg !783
  br i1 %tobool, label %if.end24, label %if.then22, !dbg !785

if.then22:                                        ; preds = %if.end10
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !786
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i32 0, i32 0)), !dbg !787
  br label %if.end24, !dbg !787

if.end24:                                         ; preds = %if.then22, %if.end10
  call void @srand(i32 7) #9, !dbg !788
  call void @llvm.dbg.declare(metadata i32* %i, metadata !789, metadata !585), !dbg !791
  store i32 0, i32* %i, align 4, !dbg !791
  br label %for.cond, !dbg !792

for.cond:                                         ; preds = %for.inc32, %if.end24
  %25 = load i32, i32* %i, align 4, !dbg !793
  %26 = load i32, i32* %max_cols, align 4, !dbg !796
  %cmp25 = icmp slt i32 %25, %26, !dbg !797
  br i1 %cmp25, label %for.body, label %for.end34, !dbg !798

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !799, metadata !585), !dbg !802
  store i32 0, i32* %j, align 4, !dbg !802
  br label %for.cond26, !dbg !803

for.cond26:                                       ; preds = %for.inc, %for.body
  %27 = load i32, i32* %j, align 4, !dbg !804
  %28 = load i32, i32* %max_rows, align 4, !dbg !807
  %cmp27 = icmp slt i32 %27, %28, !dbg !808
  br i1 %cmp27, label %for.body28, label %for.end, !dbg !809

for.body28:                                       ; preds = %for.cond26
  %29 = load i32*, i32** %input_itemsets, align 8, !dbg !810
  %30 = load i32, i32* %i, align 4, !dbg !812
  %31 = load i32, i32* %max_cols, align 4, !dbg !813
  %mul29 = mul nsw i32 %30, %31, !dbg !814
  %32 = load i32, i32* %j, align 4, !dbg !815
  %add30 = add nsw i32 %mul29, %32, !dbg !816
  %idxprom = sext i32 %add30 to i64, !dbg !810
  %arrayidx31 = getelementptr inbounds i32, i32* %29, i64 %idxprom, !dbg !810
  store i32 0, i32* %arrayidx31, align 4, !dbg !817
  br label %for.inc, !dbg !818

for.inc:                                          ; preds = %for.body28
  %33 = load i32, i32* %j, align 4, !dbg !819
  %inc = add nsw i32 %33, 1, !dbg !819
  store i32 %inc, i32* %j, align 4, !dbg !819
  br label %for.cond26, !dbg !821, !llvm.loop !822

for.end:                                          ; preds = %for.cond26
  br label %for.inc32, !dbg !824

for.inc32:                                        ; preds = %for.end
  %34 = load i32, i32* %i, align 4, !dbg !825
  %inc33 = add nsw i32 %34, 1, !dbg !825
  store i32 %inc33, i32* %i, align 4, !dbg !825
  br label %for.cond, !dbg !827, !llvm.loop !828

for.end34:                                        ; preds = %for.cond
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i32 0, i32 0)), !dbg !830
  call void @llvm.dbg.declare(metadata i32* %i36, metadata !831, metadata !585), !dbg !833
  store i32 1, i32* %i36, align 4, !dbg !833
  br label %for.cond37, !dbg !834

for.cond37:                                       ; preds = %for.inc46, %for.end34
  %35 = load i32, i32* %i36, align 4, !dbg !835
  %36 = load i32, i32* %max_rows, align 4, !dbg !838
  %cmp38 = icmp slt i32 %35, %36, !dbg !839
  br i1 %cmp38, label %for.body39, label %for.end48, !dbg !840

for.body39:                                       ; preds = %for.cond37
  %call40 = call i32 @rand() #9, !dbg !841
  %rem41 = srem i32 %call40, 10, !dbg !843
  %add42 = add nsw i32 %rem41, 1, !dbg !844
  %37 = load i32*, i32** %input_itemsets, align 8, !dbg !845
  %38 = load i32, i32* %i36, align 4, !dbg !846
  %39 = load i32, i32* %max_cols, align 4, !dbg !847
  %mul43 = mul nsw i32 %38, %39, !dbg !848
  %idxprom44 = sext i32 %mul43 to i64, !dbg !845
  %arrayidx45 = getelementptr inbounds i32, i32* %37, i64 %idxprom44, !dbg !845
  store i32 %add42, i32* %arrayidx45, align 4, !dbg !849
  br label %for.inc46, !dbg !850

for.inc46:                                        ; preds = %for.body39
  %40 = load i32, i32* %i36, align 4, !dbg !851
  %inc47 = add nsw i32 %40, 1, !dbg !851
  store i32 %inc47, i32* %i36, align 4, !dbg !851
  br label %for.cond37, !dbg !853, !llvm.loop !854

for.end48:                                        ; preds = %for.cond37
  call void @llvm.dbg.declare(metadata i32* %j49, metadata !856, metadata !585), !dbg !858
  store i32 1, i32* %j49, align 4, !dbg !858
  br label %for.cond50, !dbg !859

for.cond50:                                       ; preds = %for.inc58, %for.end48
  %41 = load i32, i32* %j49, align 4, !dbg !860
  %42 = load i32, i32* %max_cols, align 4, !dbg !863
  %cmp51 = icmp slt i32 %41, %42, !dbg !864
  br i1 %cmp51, label %for.body52, label %for.end60, !dbg !865

for.body52:                                       ; preds = %for.cond50
  %call53 = call i32 @rand() #9, !dbg !866
  %rem54 = srem i32 %call53, 10, !dbg !868
  %add55 = add nsw i32 %rem54, 1, !dbg !869
  %43 = load i32*, i32** %input_itemsets, align 8, !dbg !870
  %44 = load i32, i32* %j49, align 4, !dbg !871
  %idxprom56 = sext i32 %44 to i64, !dbg !870
  %arrayidx57 = getelementptr inbounds i32, i32* %43, i64 %idxprom56, !dbg !870
  store i32 %add55, i32* %arrayidx57, align 4, !dbg !872
  br label %for.inc58, !dbg !873

for.inc58:                                        ; preds = %for.body52
  %45 = load i32, i32* %j49, align 4, !dbg !874
  %inc59 = add nsw i32 %45, 1, !dbg !874
  store i32 %inc59, i32* %j49, align 4, !dbg !874
  br label %for.cond50, !dbg !876, !llvm.loop !877

for.end60:                                        ; preds = %for.cond50
  call void @llvm.dbg.declare(metadata i32* %i61, metadata !879, metadata !585), !dbg !881
  store i32 1, i32* %i61, align 4, !dbg !881
  br label %for.cond62, !dbg !882

for.cond62:                                       ; preds = %for.inc85, %for.end60
  %46 = load i32, i32* %i61, align 4, !dbg !883
  %47 = load i32, i32* %max_cols, align 4, !dbg !886
  %cmp63 = icmp slt i32 %46, %47, !dbg !887
  br i1 %cmp63, label %for.body64, label %for.end87, !dbg !888

for.body64:                                       ; preds = %for.cond62
  call void @llvm.dbg.declare(metadata i32* %j65, metadata !889, metadata !585), !dbg !892
  store i32 1, i32* %j65, align 4, !dbg !892
  br label %for.cond66, !dbg !893

for.cond66:                                       ; preds = %for.inc82, %for.body64
  %48 = load i32, i32* %j65, align 4, !dbg !894
  %49 = load i32, i32* %max_rows, align 4, !dbg !897
  %cmp67 = icmp slt i32 %48, %49, !dbg !898
  br i1 %cmp67, label %for.body68, label %for.end84, !dbg !899

for.body68:                                       ; preds = %for.cond66
  %50 = load i32*, i32** %input_itemsets, align 8, !dbg !900
  %51 = load i32, i32* %i61, align 4, !dbg !902
  %52 = load i32, i32* %max_cols, align 4, !dbg !903
  %mul69 = mul nsw i32 %51, %52, !dbg !904
  %idxprom70 = sext i32 %mul69 to i64, !dbg !900
  %arrayidx71 = getelementptr inbounds i32, i32* %50, i64 %idxprom70, !dbg !900
  %53 = load i32, i32* %arrayidx71, align 4, !dbg !900
  %idxprom72 = sext i32 %53 to i64, !dbg !905
  %arrayidx73 = getelementptr inbounds [24 x [24 x i32]], [24 x [24 x i32]]* @blosum62, i64 0, i64 %idxprom72, !dbg !905
  %54 = load i32*, i32** %input_itemsets, align 8, !dbg !906
  %55 = load i32, i32* %j65, align 4, !dbg !907
  %idxprom74 = sext i32 %55 to i64, !dbg !906
  %arrayidx75 = getelementptr inbounds i32, i32* %54, i64 %idxprom74, !dbg !906
  %56 = load i32, i32* %arrayidx75, align 4, !dbg !906
  %idxprom76 = sext i32 %56 to i64, !dbg !905
  %arrayidx77 = getelementptr inbounds [24 x i32], [24 x i32]* %arrayidx73, i64 0, i64 %idxprom76, !dbg !905
  %57 = load i32, i32* %arrayidx77, align 4, !dbg !905
  %58 = load i32*, i32** %referrence, align 8, !dbg !908
  %59 = load i32, i32* %i61, align 4, !dbg !909
  %60 = load i32, i32* %max_cols, align 4, !dbg !910
  %mul78 = mul nsw i32 %59, %60, !dbg !911
  %61 = load i32, i32* %j65, align 4, !dbg !912
  %add79 = add nsw i32 %mul78, %61, !dbg !913
  %idxprom80 = sext i32 %add79 to i64, !dbg !908
  %arrayidx81 = getelementptr inbounds i32, i32* %58, i64 %idxprom80, !dbg !908
  store i32 %57, i32* %arrayidx81, align 4, !dbg !914
  br label %for.inc82, !dbg !915

for.inc82:                                        ; preds = %for.body68
  %62 = load i32, i32* %j65, align 4, !dbg !916
  %inc83 = add nsw i32 %62, 1, !dbg !916
  store i32 %inc83, i32* %j65, align 4, !dbg !916
  br label %for.cond66, !dbg !918, !llvm.loop !919

for.end84:                                        ; preds = %for.cond66
  br label %for.inc85, !dbg !921

for.inc85:                                        ; preds = %for.end84
  %63 = load i32, i32* %i61, align 4, !dbg !922
  %inc86 = add nsw i32 %63, 1, !dbg !922
  store i32 %inc86, i32* %i61, align 4, !dbg !922
  br label %for.cond62, !dbg !924, !llvm.loop !925

for.end87:                                        ; preds = %for.cond62
  call void @llvm.dbg.declare(metadata i32* %i88, metadata !927, metadata !585), !dbg !929
  store i32 1, i32* %i88, align 4, !dbg !929
  br label %for.cond89, !dbg !930

for.cond89:                                       ; preds = %for.inc96, %for.end87
  %64 = load i32, i32* %i88, align 4, !dbg !931
  %65 = load i32, i32* %max_rows, align 4, !dbg !934
  %cmp90 = icmp slt i32 %64, %65, !dbg !935
  br i1 %cmp90, label %for.body91, label %for.end98, !dbg !936

for.body91:                                       ; preds = %for.cond89
  %66 = load i32, i32* %i88, align 4, !dbg !937
  %sub = sub nsw i32 0, %66, !dbg !938
  %67 = load i32, i32* %penalty, align 4, !dbg !939
  %mul92 = mul nsw i32 %sub, %67, !dbg !940
  %68 = load i32*, i32** %input_itemsets, align 8, !dbg !941
  %69 = load i32, i32* %i88, align 4, !dbg !942
  %70 = load i32, i32* %max_cols, align 4, !dbg !943
  %mul93 = mul nsw i32 %69, %70, !dbg !944
  %idxprom94 = sext i32 %mul93 to i64, !dbg !941
  %arrayidx95 = getelementptr inbounds i32, i32* %68, i64 %idxprom94, !dbg !941
  store i32 %mul92, i32* %arrayidx95, align 4, !dbg !945
  br label %for.inc96, !dbg !941

for.inc96:                                        ; preds = %for.body91
  %71 = load i32, i32* %i88, align 4, !dbg !946
  %inc97 = add nsw i32 %71, 1, !dbg !946
  store i32 %inc97, i32* %i88, align 4, !dbg !946
  br label %for.cond89, !dbg !948, !llvm.loop !949

for.end98:                                        ; preds = %for.cond89
  call void @llvm.dbg.declare(metadata i32* %j99, metadata !951, metadata !585), !dbg !953
  store i32 1, i32* %j99, align 4, !dbg !953
  br label %for.cond100, !dbg !954

for.cond100:                                      ; preds = %for.inc107, %for.end98
  %72 = load i32, i32* %j99, align 4, !dbg !955
  %73 = load i32, i32* %max_cols, align 4, !dbg !958
  %cmp101 = icmp slt i32 %72, %73, !dbg !959
  br i1 %cmp101, label %for.body102, label %for.end109, !dbg !960

for.body102:                                      ; preds = %for.cond100
  %74 = load i32, i32* %j99, align 4, !dbg !961
  %sub103 = sub nsw i32 0, %74, !dbg !962
  %75 = load i32, i32* %penalty, align 4, !dbg !963
  %mul104 = mul nsw i32 %sub103, %75, !dbg !964
  %76 = load i32*, i32** %input_itemsets, align 8, !dbg !965
  %77 = load i32, i32* %j99, align 4, !dbg !966
  %idxprom105 = sext i32 %77 to i64, !dbg !965
  %arrayidx106 = getelementptr inbounds i32, i32* %76, i64 %idxprom105, !dbg !965
  store i32 %mul104, i32* %arrayidx106, align 4, !dbg !967
  br label %for.inc107, !dbg !965

for.inc107:                                       ; preds = %for.body102
  %78 = load i32, i32* %j99, align 4, !dbg !968
  %inc108 = add nsw i32 %78, 1, !dbg !968
  store i32 %inc108, i32* %j99, align 4, !dbg !968
  br label %for.cond100, !dbg !970, !llvm.loop !971

for.end109:                                       ; preds = %for.cond100
  %79 = load i32, i32* %max_cols, align 4, !dbg !973
  %80 = load i32, i32* %max_rows, align 4, !dbg !974
  %mul110 = mul nsw i32 %79, %80, !dbg !975
  store i32 %mul110, i32* %size, align 4, !dbg !976
  %81 = bitcast i32** %referrence_cuda to i8**, !dbg !977
  %82 = load i32, i32* %size, align 4, !dbg !978
  %conv111 = sext i32 %82 to i64, !dbg !978
  %mul112 = mul i64 4, %conv111, !dbg !979
  %call113 = call i32 @cudaMalloc(i8** %81, i64 %mul112), !dbg !980
  %83 = bitcast i32** %matrix_cuda to i8**, !dbg !981
  %84 = load i32, i32* %size, align 4, !dbg !982
  %conv114 = sext i32 %84 to i64, !dbg !982
  %mul115 = mul i64 4, %conv114, !dbg !983
  %call116 = call i32 @cudaMalloc(i8** %83, i64 %mul115), !dbg !984
  %85 = load i32*, i32** %referrence_cuda, align 8, !dbg !985
  %86 = bitcast i32* %85 to i8*, !dbg !985
  %87 = load i32*, i32** %referrence, align 8, !dbg !986
  %88 = bitcast i32* %87 to i8*, !dbg !986
  %89 = load i32, i32* %size, align 4, !dbg !987
  %conv117 = sext i32 %89 to i64, !dbg !987
  %mul118 = mul i64 4, %conv117, !dbg !988
  %call119 = call i32 @cudaMemcpy(i8* %86, i8* %88, i64 %mul118, i32 1), !dbg !989
  %90 = load i32*, i32** %matrix_cuda, align 8, !dbg !990
  %91 = bitcast i32* %90 to i8*, !dbg !990
  %92 = load i32*, i32** %input_itemsets, align 8, !dbg !991
  %93 = bitcast i32* %92 to i8*, !dbg !991
  %94 = load i32, i32* %size, align 4, !dbg !992
  %conv120 = sext i32 %94 to i64, !dbg !992
  %mul121 = mul i64 4, %conv120, !dbg !993
  %call122 = call i32 @cudaMemcpy(i8* %91, i8* %93, i64 %mul121, i32 1), !dbg !994
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !995, metadata !585), !dbg !1019
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGrid, i32 1, i32 1, i32 1), !dbg !1019
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !1020, metadata !585), !dbg !1021
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlock, i32 16, i32 1, i32 1), !dbg !1021
  call void @llvm.dbg.declare(metadata i32* %block_width, metadata !1022, metadata !585), !dbg !1023
  %95 = load i32, i32* %max_cols, align 4, !dbg !1024
  %sub123 = sub nsw i32 %95, 1, !dbg !1025
  %div = sdiv i32 %sub123, 16, !dbg !1026
  store i32 %div, i32* %block_width, align 4, !dbg !1023
  %call124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0)), !dbg !1027
  call void @llvm.dbg.declare(metadata i32* %i125, metadata !1028, metadata !585), !dbg !1030
  store i32 1, i32* %i125, align 4, !dbg !1030
  br label %for.cond126, !dbg !1031

for.cond126:                                      ; preds = %for.inc132, %for.end109
  %96 = load i32, i32* %i125, align 4, !dbg !1032
  %97 = load i32, i32* %block_width, align 4, !dbg !1035
  %cmp127 = icmp sle i32 %96, %97, !dbg !1036
  br i1 %cmp127, label %for.body128, label %for.end134, !dbg !1037

for.body128:                                      ; preds = %for.cond126
  %98 = load i32, i32* %i125, align 4, !dbg !1038
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 0, !dbg !1040
  store i32 %98, i32* %x, align 4, !dbg !1041
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 1, !dbg !1042
  store i32 1, i32* %y, align 4, !dbg !1043
  %99 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1044
  %100 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !1044
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %100, i64 12, i32 4, i1 false), !dbg !1044
  %101 = bitcast %struct.dim3* %agg.tmp129 to i8*, !dbg !1045
  %102 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !1045
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %101, i8* %102, i64 12, i32 4, i1 false), !dbg !1045
  %103 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1046
  %104 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1046
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %103, i8* %104, i64 12, i32 4, i1 false), !dbg !1046
  %105 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1046
  %106 = load i64, i64* %105, align 4, !dbg !1046
  %107 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1046
  %108 = load i32, i32* %107, align 4, !dbg !1046
  %109 = bitcast { i64, i32 }* %agg.tmp129.coerce to i8*, !dbg !1046
  %110 = bitcast %struct.dim3* %agg.tmp129 to i8*, !dbg !1046
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %109, i8* %110, i64 12, i32 4, i1 false), !dbg !1046
  %111 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp129.coerce, i32 0, i32 0, !dbg !1046
  %112 = load i64, i64* %111, align 4, !dbg !1046
  %113 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp129.coerce, i32 0, i32 1, !dbg !1046
  %114 = load i32, i32* %113, align 4, !dbg !1046
  %call130 = call i32 @cudaConfigureCall(i64 %106, i32 %108, i64 %112, i32 %114, i64 0, %struct.CUstream_st* null), !dbg !1046
  %tobool131 = icmp ne i32 %call130, 0, !dbg !1046
  br i1 %tobool131, label %kcall.end, label %kcall.configok, !dbg !1047

kcall.configok:                                   ; preds = %for.body128
  %115 = load i32*, i32** %referrence_cuda, align 8, !dbg !1048
  %116 = load i32*, i32** %matrix_cuda, align 8, !dbg !1050
  %117 = load i32, i32* %max_cols, align 4, !dbg !1051
  %118 = load i32, i32* %penalty, align 4, !dbg !1052
  %119 = load i32, i32* %i125, align 4, !dbg !1053
  %120 = load i32, i32* %block_width, align 4, !dbg !1054
  call void @_Z20needle_cuda_shared_1PiS_iiii(i32* %115, i32* %116, i32 %117, i32 %118, i32 %119, i32 %120), !dbg !1055
  br label %kcall.end, !dbg !1055

kcall.end:                                        ; preds = %kcall.configok, %for.body128
  br label %for.inc132, !dbg !1056

for.inc132:                                       ; preds = %kcall.end
  %121 = load i32, i32* %i125, align 4, !dbg !1057
  %inc133 = add nsw i32 %121, 1, !dbg !1057
  store i32 %inc133, i32* %i125, align 4, !dbg !1057
  br label %for.cond126, !dbg !1059, !llvm.loop !1060

for.end134:                                       ; preds = %for.cond126
  %call135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i32 0, i32 0)), !dbg !1062
  call void @llvm.dbg.declare(metadata i32* %i136, metadata !1063, metadata !585), !dbg !1065
  %122 = load i32, i32* %block_width, align 4, !dbg !1066
  %sub137 = sub nsw i32 %122, 1, !dbg !1067
  store i32 %sub137, i32* %i136, align 4, !dbg !1065
  br label %for.cond138, !dbg !1068

for.cond138:                                      ; preds = %for.inc149, %for.end134
  %123 = load i32, i32* %i136, align 4, !dbg !1069
  %cmp139 = icmp sge i32 %123, 1, !dbg !1072
  br i1 %cmp139, label %for.body140, label %for.end150, !dbg !1073

for.body140:                                      ; preds = %for.cond138
  %124 = load i32, i32* %i136, align 4, !dbg !1074
  %x141 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 0, !dbg !1076
  store i32 %124, i32* %x141, align 4, !dbg !1077
  %y142 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 1, !dbg !1078
  store i32 1, i32* %y142, align 4, !dbg !1079
  %125 = bitcast %struct.dim3* %agg.tmp143 to i8*, !dbg !1080
  %126 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !1080
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %125, i8* %126, i64 12, i32 4, i1 false), !dbg !1080
  %127 = bitcast %struct.dim3* %agg.tmp144 to i8*, !dbg !1081
  %128 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !1081
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %127, i8* %128, i64 12, i32 4, i1 false), !dbg !1081
  %129 = bitcast { i64, i32 }* %agg.tmp143.coerce to i8*, !dbg !1082
  %130 = bitcast %struct.dim3* %agg.tmp143 to i8*, !dbg !1082
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %129, i8* %130, i64 12, i32 4, i1 false), !dbg !1082
  %131 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp143.coerce, i32 0, i32 0, !dbg !1082
  %132 = load i64, i64* %131, align 4, !dbg !1082
  %133 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp143.coerce, i32 0, i32 1, !dbg !1082
  %134 = load i32, i32* %133, align 4, !dbg !1082
  %135 = bitcast { i64, i32 }* %agg.tmp144.coerce to i8*, !dbg !1082
  %136 = bitcast %struct.dim3* %agg.tmp144 to i8*, !dbg !1082
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* %136, i64 12, i32 4, i1 false), !dbg !1082
  %137 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp144.coerce, i32 0, i32 0, !dbg !1082
  %138 = load i64, i64* %137, align 4, !dbg !1082
  %139 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp144.coerce, i32 0, i32 1, !dbg !1082
  %140 = load i32, i32* %139, align 4, !dbg !1082
  %call145 = call i32 @cudaConfigureCall(i64 %132, i32 %134, i64 %138, i32 %140, i64 0, %struct.CUstream_st* null), !dbg !1082
  %tobool146 = icmp ne i32 %call145, 0, !dbg !1082
  br i1 %tobool146, label %kcall.end148, label %kcall.configok147, !dbg !1083

kcall.configok147:                                ; preds = %for.body140
  %141 = load i32*, i32** %referrence_cuda, align 8, !dbg !1084
  %142 = load i32*, i32** %matrix_cuda, align 8, !dbg !1086
  %143 = load i32, i32* %max_cols, align 4, !dbg !1087
  %144 = load i32, i32* %penalty, align 4, !dbg !1088
  %145 = load i32, i32* %i136, align 4, !dbg !1089
  %146 = load i32, i32* %block_width, align 4, !dbg !1090
  call void @_Z20needle_cuda_shared_2PiS_iiii(i32* %141, i32* %142, i32 %143, i32 %144, i32 %145, i32 %146), !dbg !1091
  br label %kcall.end148, !dbg !1091

kcall.end148:                                     ; preds = %kcall.configok147, %for.body140
  br label %for.inc149, !dbg !1092

for.inc149:                                       ; preds = %kcall.end148
  %147 = load i32, i32* %i136, align 4, !dbg !1093
  %dec = add nsw i32 %147, -1, !dbg !1093
  store i32 %dec, i32* %i136, align 4, !dbg !1093
  br label %for.cond138, !dbg !1095, !llvm.loop !1096

for.end150:                                       ; preds = %for.cond138
  %148 = load i32*, i32** %output_itemsets, align 8, !dbg !1098
  %149 = bitcast i32* %148 to i8*, !dbg !1098
  %150 = load i32*, i32** %matrix_cuda, align 8, !dbg !1099
  %151 = bitcast i32* %150 to i8*, !dbg !1099
  %152 = load i32, i32* %size, align 4, !dbg !1100
  %conv151 = sext i32 %152 to i64, !dbg !1100
  %mul152 = mul i64 4, %conv151, !dbg !1101
  %call153 = call i32 @cudaMemcpy(i8* %149, i8* %151, i64 %mul152, i32 2), !dbg !1102
  %153 = load i32*, i32** %referrence_cuda, align 8, !dbg !1103
  %154 = bitcast i32* %153 to i8*, !dbg !1103
  %call154 = call i32 @cudaFree(i8* %154), !dbg !1104
  %155 = load i32*, i32** %matrix_cuda, align 8, !dbg !1105
  %156 = bitcast i32* %155 to i8*, !dbg !1105
  %call155 = call i32 @cudaFree(i8* %156), !dbg !1106
  %157 = load i32*, i32** %referrence, align 8, !dbg !1107
  %158 = bitcast i32* %157 to i8*, !dbg !1107
  call void @free(i8* %158) #9, !dbg !1108
  %159 = load i32*, i32** %input_itemsets, align 8, !dbg !1109
  %160 = bitcast i32* %159 to i8*, !dbg !1109
  call void @free(i8* %160) #9, !dbg !1110
  %161 = load i32*, i32** %output_itemsets, align 8, !dbg !1111
  %162 = bitcast i32* %161 to i8*, !dbg !1111
  call void @free(i8* %162) #9, !dbg !1112
  ret void, !dbg !1113
}

; Function Attrs: uwtable
define void @_Z5usageiPPc(i32 %argc, i8** %argv) #2 !dbg !1114 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1115, metadata !585), !dbg !1116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1117, metadata !585), !dbg !1118
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1119
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1120
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !1120
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !1120
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i32 0, i32 0), i8* %2), !dbg !1121
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1122
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0)), !dbg !1123
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1124
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i32 0, i32 0)), !dbg !1125
  call void @exit(i32 1) #11, !dbg !1126
  unreachable, !dbg !1126

return:                                           ; No predecessors!
  ret void, !dbg !1127
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #5

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #7

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare i32 @rand() #3

declare i32 @cudaMalloc(i8**, i64) #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #5

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #0 comdat align 2 !dbg !1128 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1129, metadata !585), !dbg !1131
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1132, metadata !585), !dbg !1133
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1134, metadata !585), !dbg !1135
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1136, metadata !585), !dbg !1137
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1138
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1139
  store i32 %0, i32* %x, align 4, !dbg !1138
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1140
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1141
  store i32 %1, i32* %y, align 4, !dbg !1140
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1142
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1143
  store i32 %2, i32* %z, align 4, !dbg !1142
  ret void, !dbg !1144
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #8

declare i32 @cudaFree(i8*) #5

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind }
attributes #9 = { nounwind }
attributes #10 = { nounwind readonly }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!576, !577}
!llvm.ident = !{!578}

!0 = distinct !DIGlobalVariable(name: "blosum62", scope: !1, file: !2, line: 18, type: !573, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !12, globals: !17, imports: !18)
!2 = !DIFile(filename: "needle.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!3 = !{!4}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !5, line: 807, size: 32, align: 32, elements: !6, identifier: "_ZTS14cudaMemcpyKind")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!8 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!11 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!17 = !{!0}
!18 = !{!19, !26, !31, !33, !35, !37, !39, !43, !45, !47, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !75, !77, !79, !81, !85, !89, !91, !93, !98, !102, !104, !106, !108, !110, !112, !114, !116, !118, !123, !127, !129, !131, !135, !137, !139, !141, !143, !145, !149, !151, !153, !158, !166, !170, !172, !174, !178, !180, !182, !186, !188, !190, !194, !196, !198, !200, !202, !204, !206, !208, !210, !212, !217, !219, !221, !225, !227, !229, !231, !233, !235, !237, !239, !243, !247, !249, !251, !256, !258, !260, !262, !264, !266, !268, !272, !278, !282, !286, !291, !293, !297, !301, !314, !318, !322, !326, !330, !335, !337, !341, !345, !349, !357, !361, !365, !369, !373, !378, !384, !388, !392, !394, !402, !406, !414, !416, !418, !422, !426, !430, !435, !439, !444, !445, !446, !447, !450, !451, !452, !453, !454, !455, !456, !459, !461, !463, !465, !467, !469, !471, !473, !476, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !544, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571}
!19 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !22, line: 189)
!20 = !DINamespace(name: "std", scope: null, file: !21, line: 188)
!21 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!22 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !21, file: !21, line: 44, type: !23, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !25}
!25 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!26 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !27, line: 190)
!27 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !21, file: !21, line: 46, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!28 = !DISubroutineType(types: !29)
!29 = !{!30, !30}
!30 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !32, line: 191)
!32 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !21, file: !21, line: 48, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !34, line: 192)
!34 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !21, file: !21, line: 50, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !36, line: 193)
!36 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !21, file: !21, line: 52, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !38, line: 194)
!38 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !21, file: !21, line: 56, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !40, line: 195)
!40 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !21, file: !21, line: 54, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!41 = !DISubroutineType(types: !42)
!42 = !{!30, !30, !30}
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !44, line: 196)
!44 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !21, file: !21, line: 58, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !46, line: 197)
!46 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !21, file: !21, line: 60, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !48, line: 198)
!48 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !21, file: !21, line: 62, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !50, line: 199)
!50 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !21, file: !21, line: 64, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !52, line: 200)
!52 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !21, file: !21, line: 66, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !54, line: 201)
!54 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !21, file: !21, line: 68, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !56, line: 202)
!56 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !21, file: !21, line: 72, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !58, line: 203)
!58 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !21, file: !21, line: 70, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !60, line: 204)
!60 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !21, file: !21, line: 76, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !62, line: 205)
!62 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !21, file: !21, line: 74, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !64, line: 206)
!64 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !21, file: !21, line: 78, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !66, line: 207)
!66 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !21, file: !21, line: 80, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !68, line: 208)
!68 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !21, file: !21, line: 82, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !70, line: 209)
!70 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !21, file: !21, line: 84, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !72, line: 210)
!72 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !21, file: !21, line: 86, type: !73, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DISubroutineType(types: !74)
!74 = !{!30, !30, !30, !30}
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !76, line: 211)
!76 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !21, file: !21, line: 88, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !78, line: 212)
!78 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !21, file: !21, line: 90, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !80, line: 213)
!80 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !21, file: !21, line: 92, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !82, line: 214)
!82 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !21, file: !21, line: 94, type: !83, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DISubroutineType(types: !84)
!84 = !{!14, !30}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !86, line: 215)
!86 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !21, file: !21, line: 96, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DISubroutineType(types: !88)
!88 = !{!30, !30, !13}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !90, line: 216)
!90 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !21, file: !21, line: 98, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !92, line: 217)
!92 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !21, file: !21, line: 100, type: !83, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !94, line: 218)
!94 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !21, file: !21, line: 102, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{!97, !30}
!97 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !99, line: 219)
!99 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !21, file: !21, line: 106, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!100 = !DISubroutineType(types: !101)
!101 = !{!97, !30, !30}
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !103, line: 220)
!103 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !21, file: !21, line: 105, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !105, line: 221)
!105 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !21, file: !21, line: 108, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !107, line: 222)
!107 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !21, file: !21, line: 112, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !109, line: 223)
!109 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !21, file: !21, line: 111, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !111, line: 224)
!111 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !21, file: !21, line: 114, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !113, line: 225)
!113 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !21, file: !21, line: 116, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !115, line: 226)
!115 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !21, file: !21, line: 118, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !117, line: 227)
!117 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !21, file: !21, line: 120, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !119, line: 228)
!119 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !21, file: !21, line: 121, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DISubroutineType(types: !121)
!121 = !{!122, !122}
!122 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !124, line: 229)
!124 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !21, file: !21, line: 123, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!30, !30, !14}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !128, line: 230)
!128 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !21, file: !21, line: 125, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !130, line: 231)
!130 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !21, file: !21, line: 126, type: !23, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !132, line: 232)
!132 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !21, file: !21, line: 128, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DISubroutineType(types: !134)
!134 = !{!25, !30}
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !136, line: 233)
!136 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !21, file: !21, line: 138, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !138, line: 234)
!138 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !21, file: !21, line: 130, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !140, line: 235)
!140 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !21, file: !21, line: 132, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !142, line: 236)
!142 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !21, file: !21, line: 134, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !144, line: 237)
!144 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !21, file: !21, line: 136, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !146, line: 238)
!146 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !21, file: !21, line: 140, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!122, !30}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !150, line: 239)
!150 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !21, file: !21, line: 142, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !152, line: 240)
!152 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !21, file: !21, line: 143, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !154, line: 241)
!154 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !21, file: !21, line: 145, type: !155, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DISubroutineType(types: !156)
!156 = !{!30, !30, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, align: 64)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !159, line: 242)
!159 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !21, file: !21, line: 146, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{!162, !163}
!162 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64, align: 64)
!164 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !165)
!165 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !167, line: 243)
!167 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !21, file: !21, line: 147, type: !168, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DISubroutineType(types: !169)
!169 = !{!30, !163}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !171, line: 244)
!171 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !21, file: !21, line: 149, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !173, line: 245)
!173 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !21, file: !21, line: 151, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !175, line: 246)
!175 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !21, file: !21, line: 153, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!30, !30, !162}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !179, line: 247)
!179 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !21, file: !21, line: 158, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !181, line: 248)
!181 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !21, file: !21, line: 160, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !183, line: 249)
!183 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !21, file: !21, line: 162, type: !184, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DISubroutineType(types: !185)
!185 = !{!30, !30, !30, !13}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !187, line: 250)
!187 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !21, file: !21, line: 164, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !189, line: 251)
!189 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !21, file: !21, line: 166, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !191, line: 252)
!191 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !21, file: !21, line: 168, type: !192, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DISubroutineType(types: !193)
!193 = !{!30, !30, !122}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !195, line: 253)
!195 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !21, file: !21, line: 170, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !197, line: 254)
!197 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !21, file: !21, line: 172, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !199, line: 255)
!199 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !21, file: !21, line: 174, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !201, line: 256)
!201 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !21, file: !21, line: 176, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !203, line: 257)
!203 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !21, file: !21, line: 178, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !205, line: 258)
!205 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !21, file: !21, line: 180, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !207, line: 259)
!207 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !21, file: !21, line: 182, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !209, line: 260)
!209 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !21, file: !21, line: 184, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !211, line: 261)
!211 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !21, file: !21, line: 186, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !213, line: 102)
!213 = !DISubprogram(name: "acos", scope: !214, file: !214, line: 54, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!215 = !DISubroutineType(types: !216)
!216 = !{!162, !162}
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !218, line: 121)
!218 = !DISubprogram(name: "asin", scope: !214, file: !214, line: 56, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !220, line: 140)
!220 = !DISubprogram(name: "atan", scope: !214, file: !214, line: 58, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !222, line: 159)
!222 = !DISubprogram(name: "atan2", scope: !214, file: !214, line: 60, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!162, !162, !162}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !226, line: 180)
!226 = !DISubprogram(name: "ceil", scope: !214, file: !214, line: 178, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !228, line: 199)
!228 = !DISubprogram(name: "cos", scope: !214, file: !214, line: 63, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !230, line: 218)
!230 = !DISubprogram(name: "cosh", scope: !214, file: !214, line: 72, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !232, line: 237)
!232 = !DISubprogram(name: "exp", scope: !214, file: !214, line: 100, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !234, line: 256)
!234 = !DISubprogram(name: "fabs", scope: !214, file: !214, line: 181, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !236, line: 275)
!236 = !DISubprogram(name: "floor", scope: !214, file: !214, line: 184, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !238, line: 294)
!238 = !DISubprogram(name: "fmod", scope: !214, file: !214, line: 187, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !240, line: 315)
!240 = !DISubprogram(name: "frexp", scope: !214, file: !214, line: 103, type: !241, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!162, !162, !13}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !244, line: 334)
!244 = !DISubprogram(name: "ldexp", scope: !214, file: !214, line: 106, type: !245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DISubroutineType(types: !246)
!246 = !{!162, !162, !14}
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !248, line: 353)
!248 = !DISubprogram(name: "log", scope: !214, file: !214, line: 109, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !250, line: 372)
!250 = !DISubprogram(name: "log10", scope: !214, file: !214, line: 112, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !252, line: 391)
!252 = !DISubprogram(name: "modf", scope: !214, file: !214, line: 115, type: !253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DISubroutineType(types: !254)
!254 = !{!162, !162, !255}
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64, align: 64)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !257, line: 403)
!257 = !DISubprogram(name: "pow", scope: !214, file: !214, line: 153, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !259, line: 440)
!259 = !DISubprogram(name: "sin", scope: !214, file: !214, line: 65, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !261, line: 459)
!261 = !DISubprogram(name: "sinh", scope: !214, file: !214, line: 74, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !263, line: 478)
!263 = !DISubprogram(name: "sqrt", scope: !214, file: !214, line: 156, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !265, line: 497)
!265 = !DISubprogram(name: "tan", scope: !214, file: !214, line: 67, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !267, line: 516)
!267 = !DISubprogram(name: "tanh", scope: !214, file: !214, line: 76, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !269, line: 118)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !270, line: 101, baseType: !271)
!270 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!271 = !DICompositeType(tag: DW_TAG_structure_type, file: !270, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !273, line: 119)
!273 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !270, line: 109, baseType: !274)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !270, line: 105, size: 128, align: 64, elements: !275, identifier: "_ZTS6ldiv_t")
!275 = !{!276, !277}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !274, file: !270, line: 107, baseType: !122, size: 64, align: 64)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !274, file: !270, line: 108, baseType: !122, size: 64, align: 64, offset: 64)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !279, line: 121)
!279 = !DISubprogram(name: "abort", scope: !270, file: !270, line: 515, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{null}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !283, line: 122)
!283 = !DISubprogram(name: "abs", scope: !270, file: !270, line: 774, type: !284, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DISubroutineType(types: !285)
!285 = !{!14, !14}
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !287, line: 123)
!287 = !DISubprogram(name: "atexit", scope: !270, file: !270, line: 519, type: !288, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DISubroutineType(types: !289)
!289 = !{!14, !290}
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64, align: 64)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !292, line: 129)
!292 = !DISubprogram(name: "atof", scope: !270, file: !270, line: 144, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !294, line: 130)
!294 = !DISubprogram(name: "atoi", scope: !270, file: !270, line: 147, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DISubroutineType(types: !296)
!296 = !{!14, !163}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !298, line: 131)
!298 = !DISubprogram(name: "atol", scope: !270, file: !270, line: 150, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DISubroutineType(types: !300)
!300 = !{!122, !163}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !302, line: 132)
!302 = !DISubprogram(name: "bsearch", scope: !270, file: !270, line: 754, type: !303, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DISubroutineType(types: !304)
!304 = !{!16, !305, !305, !307, !307, !310}
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !306, size: 64, align: 64)
!306 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!307 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !308, line: 62, baseType: !309)
!308 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!309 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !270, line: 741, baseType: !311)
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64, align: 64)
!312 = !DISubroutineType(types: !313)
!313 = !{!14, !305, !305}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !315, line: 133)
!315 = !DISubprogram(name: "calloc", scope: !270, file: !270, line: 468, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!16, !307, !307}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !319, line: 134)
!319 = !DISubprogram(name: "div", scope: !270, file: !270, line: 788, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DISubroutineType(types: !321)
!321 = !{!269, !14, !14}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !323, line: 135)
!323 = !DISubprogram(name: "exit", scope: !270, file: !270, line: 543, type: !324, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!324 = !DISubroutineType(types: !325)
!325 = !{null, !14}
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !327, line: 136)
!327 = !DISubprogram(name: "free", scope: !270, file: !270, line: 483, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DISubroutineType(types: !329)
!329 = !{null, !16}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !331, line: 137)
!331 = !DISubprogram(name: "getenv", scope: !270, file: !270, line: 564, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DISubroutineType(types: !333)
!333 = !{!334, !163}
!334 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64, align: 64)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !336, line: 138)
!336 = !DISubprogram(name: "labs", scope: !270, file: !270, line: 775, type: !120, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !338, line: 139)
!338 = !DISubprogram(name: "ldiv", scope: !270, file: !270, line: 790, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DISubroutineType(types: !340)
!340 = !{!273, !122, !122}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !342, line: 140)
!342 = !DISubprogram(name: "malloc", scope: !270, file: !270, line: 466, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DISubroutineType(types: !344)
!344 = !{!16, !307}
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !346, line: 142)
!346 = !DISubprogram(name: "mblen", scope: !270, file: !270, line: 862, type: !347, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DISubroutineType(types: !348)
!348 = !{!14, !163, !307}
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !350, line: 143)
!350 = !DISubprogram(name: "mbstowcs", scope: !270, file: !270, line: 873, type: !351, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!351 = !DISubroutineType(types: !352)
!352 = !{!307, !353, !356, !307}
!353 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !354)
!354 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !355, size: 64, align: 64)
!355 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!356 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !163)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !358, line: 144)
!358 = !DISubprogram(name: "mbtowc", scope: !270, file: !270, line: 865, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{!14, !353, !356, !307}
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !362, line: 146)
!362 = !DISubprogram(name: "qsort", scope: !270, file: !270, line: 764, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DISubroutineType(types: !364)
!364 = !{null, !16, !307, !307, !310}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !366, line: 152)
!366 = !DISubprogram(name: "rand", scope: !270, file: !270, line: 374, type: !367, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!367 = !DISubroutineType(types: !368)
!368 = !{!14}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !370, line: 153)
!370 = !DISubprogram(name: "realloc", scope: !270, file: !270, line: 480, type: !371, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!371 = !DISubroutineType(types: !372)
!372 = !{!16, !16, !307}
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !374, line: 154)
!374 = !DISubprogram(name: "srand", scope: !270, file: !270, line: 376, type: !375, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!375 = !DISubroutineType(types: !376)
!376 = !{null, !377}
!377 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !379, line: 155)
!379 = !DISubprogram(name: "strtod", scope: !270, file: !270, line: 164, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!162, !356, !382}
!382 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !383)
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !334, size: 64, align: 64)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !385, line: 156)
!385 = !DISubprogram(name: "strtol", scope: !270, file: !270, line: 183, type: !386, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!386 = !DISubroutineType(types: !387)
!387 = !{!122, !356, !382, !14}
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !389, line: 157)
!389 = !DISubprogram(name: "strtoul", scope: !270, file: !270, line: 187, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !DISubroutineType(types: !391)
!391 = !{!309, !356, !382, !14}
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !393, line: 158)
!393 = !DISubprogram(name: "system", scope: !270, file: !270, line: 716, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !395, line: 160)
!395 = !DISubprogram(name: "wcstombs", scope: !270, file: !270, line: 876, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!307, !398, !399, !307}
!398 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !334)
!399 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !400)
!400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !401, size: 64, align: 64)
!401 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !355)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !403, line: 161)
!403 = !DISubprogram(name: "wctomb", scope: !270, file: !270, line: 869, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DISubroutineType(types: !405)
!405 = !{!14, !334, !355}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !409, line: 214)
!407 = !DINamespace(name: "__gnu_cxx", scope: null, file: !408, line: 220)
!408 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !270, line: 121, baseType: !410)
!410 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !270, line: 117, size: 128, align: 64, elements: !411, identifier: "_ZTS7lldiv_t")
!411 = !{!412, !413}
!412 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !410, file: !270, line: 119, baseType: !25, size: 64, align: 64)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !410, file: !270, line: 120, baseType: !25, size: 64, align: 64, offset: 64)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !415, line: 220)
!415 = !DISubprogram(name: "_Exit", scope: !270, file: !270, line: 557, type: !324, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !417, line: 224)
!417 = !DISubprogram(name: "llabs", scope: !270, file: !270, line: 779, type: !23, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !419, line: 230)
!419 = !DISubprogram(name: "lldiv", scope: !270, file: !270, line: 796, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{!409, !25, !25}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !423, line: 241)
!423 = !DISubprogram(name: "atoll", scope: !270, file: !270, line: 157, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{!25, !163}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !427, line: 242)
!427 = !DISubprogram(name: "strtoll", scope: !270, file: !270, line: 209, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{!25, !356, !382, !14}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !431, line: 243)
!431 = !DISubprogram(name: "strtoull", scope: !270, file: !270, line: 214, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DISubroutineType(types: !433)
!433 = !{!434, !356, !382, !14}
!434 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !436, line: 245)
!436 = !DISubprogram(name: "strtof", scope: !270, file: !270, line: 172, type: !437, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!437 = !DISubroutineType(types: !438)
!438 = !{!30, !356, !382}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !407, entity: !440, line: 246)
!440 = !DISubprogram(name: "strtold", scope: !270, file: !270, line: 175, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!441 = !DISubroutineType(types: !442)
!442 = !{!443, !356, !382}
!443 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !409, line: 254)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !415, line: 256)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !417, line: 258)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !448, line: 259)
!448 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !407, file: !449, line: 227, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!449 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !419, line: 260)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !423, line: 262)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !436, line: 263)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !427, line: 264)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !431, line: 265)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !440, line: 266)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !457, line: 397)
!457 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !458, file: !458, line: 1342, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !460, line: 398)
!460 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !458, file: !458, line: 1370, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !462, line: 399)
!462 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !458, file: !458, line: 1337, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !464, line: 400)
!464 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !458, file: !458, line: 1375, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !466, line: 401)
!466 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !458, file: !458, line: 1327, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !468, line: 402)
!468 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !458, file: !458, line: 1332, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !470, line: 403)
!470 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !458, file: !458, line: 1380, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !472, line: 404)
!472 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !458, file: !458, line: 1430, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !474, line: 405)
!474 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !475, file: !475, line: 667, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !477, line: 406)
!477 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !458, file: !458, line: 1189, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !479, line: 407)
!479 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !458, file: !458, line: 1243, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !481, line: 408)
!481 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !458, file: !458, line: 1312, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !483, line: 409)
!483 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !458, file: !458, line: 1490, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !485, line: 410)
!485 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !458, file: !458, line: 1480, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !487, line: 411)
!487 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !475, file: !475, line: 657, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !489, line: 412)
!489 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !458, file: !458, line: 1294, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !491, line: 413)
!491 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !458, file: !458, line: 1385, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !493, line: 414)
!493 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !475, file: !475, line: 607, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !495, line: 415)
!495 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !458, file: !458, line: 1616, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !497, line: 416)
!497 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !475, file: !475, line: 597, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !499, line: 417)
!499 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !458, file: !458, line: 1568, type: !73, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !501, line: 418)
!501 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !475, file: !475, line: 622, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !503, line: 419)
!503 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !475, file: !475, line: 617, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !505, line: 420)
!505 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !458, file: !458, line: 1553, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !507, line: 421)
!507 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !458, file: !458, line: 1543, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !509, line: 422)
!509 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !458, file: !458, line: 1390, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !511, line: 423)
!511 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !458, file: !458, line: 1621, type: !83, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !513, line: 424)
!513 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !458, file: !458, line: 1520, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !515, line: 425)
!515 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !458, file: !458, line: 1515, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !517, line: 426)
!517 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !458, file: !458, line: 1149, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !519, line: 427)
!519 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !458, file: !458, line: 1602, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !521, line: 428)
!521 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !458, file: !458, line: 1356, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !523, line: 429)
!523 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !458, file: !458, line: 1365, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !525, line: 430)
!525 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !458, file: !458, line: 1285, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !527, line: 431)
!527 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !458, file: !458, line: 1626, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !529, line: 432)
!529 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !458, file: !458, line: 1347, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !531, line: 433)
!531 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !458, file: !458, line: 1140, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !533, line: 434)
!533 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !458, file: !458, line: 1607, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !535, line: 435)
!535 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !458, file: !458, line: 1548, type: !155, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !537, line: 436)
!537 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !458, file: !458, line: 1154, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !539, line: 437)
!539 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !458, file: !458, line: 1218, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !541, line: 438)
!541 = !DISubprogram(name: "nexttowardf", scope: !214, file: !214, line: 294, type: !542, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DISubroutineType(types: !543)
!543 = !{!30, !30, !443}
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !541, line: 439)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !546, line: 440)
!546 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !458, file: !458, line: 1583, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !548, line: 441)
!548 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !458, file: !458, line: 1558, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !550, line: 442)
!550 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !458, file: !458, line: 1563, type: !184, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !552, line: 443)
!552 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !458, file: !458, line: 1135, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !554, line: 444)
!554 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !458, file: !458, line: 1597, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !556, line: 445)
!556 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !458, file: !458, line: 1530, type: !192, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !558, line: 446)
!558 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !458, file: !458, line: 1525, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !560, line: 447)
!560 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !458, file: !458, line: 1234, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !562, line: 448)
!562 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !458, file: !458, line: 1317, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !564, line: 449)
!564 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !475, file: !475, line: 907, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !566, line: 450)
!566 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !458, file: !458, line: 1276, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !568, line: 451)
!568 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !458, file: !458, line: 1322, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !570, line: 452)
!570 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !458, file: !458, line: 1592, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !572, line: 453)
!572 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !475, file: !475, line: 662, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 18432, align: 32, elements: !574)
!574 = !{!575, !575}
!575 = !DISubrange(count: 24)
!576 = !{i32 2, !"Dwarf Version", i32 4}
!577 = !{i32 2, !"Debug Info Version", i32 3}
!578 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!579 = distinct !DISubprogram(name: "maximum", linkageName: "_Z7maximumiii", scope: !580, file: !580, line: 9, type: !581, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !583)
!580 = !DIFile(filename: "./needle_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!581 = !DISubroutineType(types: !582)
!582 = !{!14, !14, !14, !14}
!583 = !{}
!584 = !DILocalVariable(name: "a", arg: 1, scope: !579, file: !580, line: 9, type: !14)
!585 = !DIExpression()
!586 = !DILocation(line: 9, column: 14, scope: !579)
!587 = !DILocalVariable(name: "b", arg: 2, scope: !579, file: !580, line: 10, type: !14)
!588 = !DILocation(line: 10, column: 8, scope: !579)
!589 = !DILocalVariable(name: "c", arg: 3, scope: !579, file: !580, line: 11, type: !14)
!590 = !DILocation(line: 11, column: 8, scope: !579)
!591 = !DILocalVariable(name: "k", scope: !579, file: !580, line: 13, type: !14)
!592 = !DILocation(line: 13, column: 5, scope: !579)
!593 = !DILocation(line: 14, column: 5, scope: !594)
!594 = distinct !DILexicalBlock(scope: !579, file: !580, line: 14, column: 5)
!595 = !DILocation(line: 14, column: 10, scope: !594)
!596 = !DILocation(line: 14, column: 7, scope: !594)
!597 = !DILocation(line: 14, column: 5, scope: !579)
!598 = !DILocation(line: 15, column: 5, scope: !594)
!599 = !DILocation(line: 15, column: 3, scope: !594)
!600 = !DILocation(line: 15, column: 1, scope: !594)
!601 = !DILocation(line: 17, column: 5, scope: !594)
!602 = !DILocation(line: 17, column: 3, scope: !594)
!603 = !DILocation(line: 19, column: 5, scope: !604)
!604 = distinct !DILexicalBlock(scope: !579, file: !580, line: 19, column: 5)
!605 = !DILocation(line: 19, column: 9, scope: !604)
!606 = !DILocation(line: 19, column: 7, scope: !604)
!607 = !DILocation(line: 19, column: 5, scope: !579)
!608 = !DILocation(line: 20, column: 8, scope: !604)
!609 = !DILocation(line: 20, column: 1, scope: !604)
!610 = !DILocation(line: 22, column: 8, scope: !604)
!611 = !DILocation(line: 22, column: 1, scope: !604)
!612 = !DILocation(line: 24, column: 1, scope: !579)
!613 = distinct !DISubprogram(name: "needle_cuda_shared_1", linkageName: "_Z20needle_cuda_shared_1PiS_iiii", scope: !580, file: !580, line: 27, type: !614, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !583)
!614 = !DISubroutineType(types: !615)
!615 = !{null, !13, !13, !14, !14, !14, !14}
!616 = !DILocalVariable(name: "referrence", arg: 1, scope: !613, file: !580, line: 27, type: !13)
!617 = !DILocation(line: 27, column: 29, scope: !613)
!618 = !DILocalVariable(name: "matrix_cuda", arg: 2, scope: !613, file: !580, line: 28, type: !13)
!619 = !DILocation(line: 28, column: 11, scope: !613)
!620 = !DILocalVariable(name: "cols", arg: 3, scope: !613, file: !580, line: 29, type: !14)
!621 = !DILocation(line: 29, column: 10, scope: !613)
!622 = !DILocalVariable(name: "penalty", arg: 4, scope: !613, file: !580, line: 30, type: !14)
!623 = !DILocation(line: 30, column: 10, scope: !613)
!624 = !DILocalVariable(name: "i", arg: 5, scope: !613, file: !580, line: 31, type: !14)
!625 = !DILocation(line: 31, column: 10, scope: !613)
!626 = !DILocalVariable(name: "block_width", arg: 6, scope: !613, file: !580, line: 32, type: !14)
!627 = !DILocation(line: 32, column: 10, scope: !613)
!628 = !DILocation(line: 33, column: 1, scope: !613)
!629 = !DILocation(line: 33, column: 1, scope: !630)
!630 = !DILexicalBlockFile(scope: !613, file: !580, discriminator: 1)
!631 = !DILocation(line: 33, column: 1, scope: !632)
!632 = !DILexicalBlockFile(scope: !613, file: !580, discriminator: 2)
!633 = !DILocation(line: 33, column: 1, scope: !634)
!634 = !DILexicalBlockFile(scope: !613, file: !580, discriminator: 3)
!635 = !DILocation(line: 33, column: 1, scope: !636)
!636 = !DILexicalBlockFile(scope: !613, file: !580, discriminator: 4)
!637 = !DILocation(line: 33, column: 1, scope: !638)
!638 = !DILexicalBlockFile(scope: !613, file: !580, discriminator: 5)
!639 = !DILocation(line: 33, column: 1, scope: !640)
!640 = !DILexicalBlockFile(scope: !613, file: !580, discriminator: 6)
!641 = !DILocation(line: 104, column: 1, scope: !613)
!642 = distinct !DISubprogram(name: "needle_cuda_shared_2", linkageName: "_Z20needle_cuda_shared_2PiS_iiii", scope: !580, file: !580, line: 108, type: !614, isLocal: false, isDefinition: true, scopeLine: 115, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !583)
!643 = !DILocalVariable(name: "referrence", arg: 1, scope: !642, file: !580, line: 108, type: !13)
!644 = !DILocation(line: 108, column: 29, scope: !642)
!645 = !DILocalVariable(name: "matrix_cuda", arg: 2, scope: !642, file: !580, line: 109, type: !13)
!646 = !DILocation(line: 109, column: 11, scope: !642)
!647 = !DILocalVariable(name: "cols", arg: 3, scope: !642, file: !580, line: 111, type: !14)
!648 = !DILocation(line: 111, column: 10, scope: !642)
!649 = !DILocalVariable(name: "penalty", arg: 4, scope: !642, file: !580, line: 112, type: !14)
!650 = !DILocation(line: 112, column: 10, scope: !642)
!651 = !DILocalVariable(name: "i", arg: 5, scope: !642, file: !580, line: 113, type: !14)
!652 = !DILocation(line: 113, column: 10, scope: !642)
!653 = !DILocalVariable(name: "block_width", arg: 6, scope: !642, file: !580, line: 114, type: !14)
!654 = !DILocation(line: 114, column: 10, scope: !642)
!655 = !DILocation(line: 115, column: 1, scope: !642)
!656 = !DILocation(line: 115, column: 1, scope: !657)
!657 = !DILexicalBlockFile(scope: !642, file: !580, discriminator: 1)
!658 = !DILocation(line: 115, column: 1, scope: !659)
!659 = !DILexicalBlockFile(scope: !642, file: !580, discriminator: 2)
!660 = !DILocation(line: 115, column: 1, scope: !661)
!661 = !DILexicalBlockFile(scope: !642, file: !580, discriminator: 3)
!662 = !DILocation(line: 115, column: 1, scope: !663)
!663 = !DILexicalBlockFile(scope: !642, file: !580, discriminator: 4)
!664 = !DILocation(line: 115, column: 1, scope: !665)
!665 = !DILexicalBlockFile(scope: !642, file: !580, discriminator: 5)
!666 = !DILocation(line: 115, column: 1, scope: !667)
!667 = !DILexicalBlockFile(scope: !642, file: !580, discriminator: 6)
!668 = !DILocation(line: 188, column: 1, scope: !642)
!669 = distinct !DISubprogram(name: "gettime", linkageName: "_Z7gettimev", scope: !2, file: !2, line: 45, type: !670, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !583)
!670 = !DISubroutineType(types: !671)
!671 = !{!162}
!672 = !DILocalVariable(name: "t", scope: !669, file: !2, line: 46, type: !673)
!673 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !674, line: 30, size: 128, align: 64, elements: !675, identifier: "_ZTS7timeval")
!674 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!675 = !{!676, !679}
!676 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !673, file: !674, line: 32, baseType: !677, size: 64, align: 64)
!677 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !678, line: 139, baseType: !122)
!678 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!679 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !673, file: !674, line: 33, baseType: !680, size: 64, align: 64, offset: 64)
!680 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !678, line: 141, baseType: !122)
!681 = !DILocation(line: 46, column: 18, scope: !669)
!682 = !DILocation(line: 47, column: 3, scope: !669)
!683 = !DILocation(line: 48, column: 12, scope: !669)
!684 = !DILocation(line: 48, column: 10, scope: !669)
!685 = !DILocation(line: 48, column: 21, scope: !669)
!686 = !DILocation(line: 48, column: 19, scope: !669)
!687 = !DILocation(line: 48, column: 28, scope: !669)
!688 = !DILocation(line: 48, column: 18, scope: !669)
!689 = !DILocation(line: 48, column: 3, scope: !669)
!690 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 55, type: !691, isLocal: false, isDefinition: true, scopeLine: 56, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !583)
!691 = !DISubroutineType(types: !692)
!692 = !{!14, !14, !383}
!693 = !DILocalVariable(name: "argc", arg: 1, scope: !690, file: !2, line: 55, type: !14)
!694 = !DILocation(line: 55, column: 11, scope: !690)
!695 = !DILocalVariable(name: "argv", arg: 2, scope: !690, file: !2, line: 55, type: !383)
!696 = !DILocation(line: 55, column: 24, scope: !690)
!697 = !DILocation(line: 58, column: 3, scope: !690)
!698 = !DILocation(line: 60, column: 14, scope: !690)
!699 = !DILocation(line: 60, column: 20, scope: !690)
!700 = !DILocation(line: 60, column: 5, scope: !690)
!701 = !DILocation(line: 62, column: 5, scope: !690)
!702 = distinct !DISubprogram(name: "runTest", linkageName: "_Z7runTestiPPc", scope: !2, file: !2, line: 73, type: !703, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !583)
!703 = !DISubroutineType(types: !704)
!704 = !{null, !14, !383}
!705 = !DILocalVariable(name: "argc", arg: 1, scope: !702, file: !2, line: 73, type: !14)
!706 = !DILocation(line: 73, column: 19, scope: !702)
!707 = !DILocalVariable(name: "argv", arg: 2, scope: !702, file: !2, line: 73, type: !383)
!708 = !DILocation(line: 73, column: 32, scope: !702)
!709 = !DILocalVariable(name: "max_rows", scope: !702, file: !2, line: 75, type: !14)
!710 = !DILocation(line: 75, column: 9, scope: !702)
!711 = !DILocalVariable(name: "max_cols", scope: !702, file: !2, line: 75, type: !14)
!712 = !DILocation(line: 75, column: 19, scope: !702)
!713 = !DILocalVariable(name: "penalty", scope: !702, file: !2, line: 75, type: !14)
!714 = !DILocation(line: 75, column: 29, scope: !702)
!715 = !DILocalVariable(name: "input_itemsets", scope: !702, file: !2, line: 76, type: !13)
!716 = !DILocation(line: 76, column: 10, scope: !702)
!717 = !DILocalVariable(name: "output_itemsets", scope: !702, file: !2, line: 76, type: !13)
!718 = !DILocation(line: 76, column: 27, scope: !702)
!719 = !DILocalVariable(name: "referrence", scope: !702, file: !2, line: 76, type: !13)
!720 = !DILocation(line: 76, column: 45, scope: !702)
!721 = !DILocalVariable(name: "matrix_cuda", scope: !702, file: !2, line: 77, type: !13)
!722 = !DILocation(line: 77, column: 7, scope: !702)
!723 = !DILocalVariable(name: "referrence_cuda", scope: !702, file: !2, line: 77, type: !13)
!724 = !DILocation(line: 77, column: 22, scope: !702)
!725 = !DILocalVariable(name: "size", scope: !702, file: !2, line: 78, type: !14)
!726 = !DILocation(line: 78, column: 6, scope: !702)
!727 = !DILocation(line: 83, column: 6, scope: !728)
!728 = distinct !DILexicalBlock(scope: !702, file: !2, line: 83, column: 6)
!729 = !DILocation(line: 83, column: 11, scope: !728)
!730 = !DILocation(line: 83, column: 6, scope: !702)
!731 = !DILocation(line: 85, column: 19, scope: !732)
!732 = distinct !DILexicalBlock(scope: !728, file: !2, line: 84, column: 2)
!733 = !DILocation(line: 85, column: 14, scope: !732)
!734 = !DILocation(line: 85, column: 12, scope: !732)
!735 = !DILocation(line: 86, column: 19, scope: !732)
!736 = !DILocation(line: 86, column: 14, scope: !732)
!737 = !DILocation(line: 86, column: 12, scope: !732)
!738 = !DILocation(line: 87, column: 18, scope: !732)
!739 = !DILocation(line: 87, column: 13, scope: !732)
!740 = !DILocation(line: 87, column: 11, scope: !732)
!741 = !DILocation(line: 88, column: 2, scope: !732)
!742 = !DILocation(line: 90, column: 8, scope: !743)
!743 = distinct !DILexicalBlock(scope: !728, file: !2, line: 89, column: 9)
!744 = !DILocation(line: 90, column: 14, scope: !743)
!745 = !DILocation(line: 90, column: 2, scope: !743)
!746 = !DILocation(line: 93, column: 10, scope: !747)
!747 = distinct !DILexicalBlock(scope: !702, file: !2, line: 93, column: 5)
!748 = !DILocation(line: 93, column: 5, scope: !747)
!749 = !DILocation(line: 93, column: 18, scope: !747)
!750 = !DILocation(line: 93, column: 21, scope: !747)
!751 = !DILocation(line: 93, column: 5, scope: !702)
!752 = !DILocation(line: 94, column: 10, scope: !753)
!753 = distinct !DILexicalBlock(scope: !747, file: !2, line: 93, column: 25)
!754 = !DILocation(line: 94, column: 2, scope: !753)
!755 = !DILocation(line: 95, column: 2, scope: !753)
!756 = !DILocation(line: 99, column: 13, scope: !702)
!757 = !DILocation(line: 99, column: 22, scope: !702)
!758 = !DILocation(line: 99, column: 11, scope: !702)
!759 = !DILocation(line: 100, column: 13, scope: !702)
!760 = !DILocation(line: 100, column: 22, scope: !702)
!761 = !DILocation(line: 100, column: 11, scope: !702)
!762 = !DILocation(line: 101, column: 30, scope: !702)
!763 = !DILocation(line: 101, column: 41, scope: !702)
!764 = !DILocation(line: 101, column: 39, scope: !702)
!765 = !DILocation(line: 101, column: 50, scope: !702)
!766 = !DILocation(line: 101, column: 22, scope: !702)
!767 = !DILocation(line: 101, column: 15, scope: !702)
!768 = !DILocation(line: 101, column: 13, scope: !702)
!769 = !DILocation(line: 102, column: 37, scope: !702)
!770 = !DILocation(line: 102, column: 48, scope: !702)
!771 = !DILocation(line: 102, column: 46, scope: !702)
!772 = !DILocation(line: 102, column: 57, scope: !702)
!773 = !DILocation(line: 102, column: 29, scope: !702)
!774 = !DILocation(line: 102, column: 22, scope: !702)
!775 = !DILocation(line: 102, column: 20, scope: !702)
!776 = !DILocation(line: 103, column: 35, scope: !702)
!777 = !DILocation(line: 103, column: 46, scope: !702)
!778 = !DILocation(line: 103, column: 44, scope: !702)
!779 = !DILocation(line: 103, column: 55, scope: !702)
!780 = !DILocation(line: 103, column: 27, scope: !702)
!781 = !DILocation(line: 103, column: 20, scope: !702)
!782 = !DILocation(line: 103, column: 18, scope: !702)
!783 = !DILocation(line: 106, column: 7, scope: !784)
!784 = distinct !DILexicalBlock(scope: !702, file: !2, line: 106, column: 6)
!785 = !DILocation(line: 106, column: 6, scope: !702)
!786 = !DILocation(line: 107, column: 11, scope: !784)
!787 = !DILocation(line: 107, column: 3, scope: !784)
!788 = !DILocation(line: 109, column: 5, scope: !702)
!789 = !DILocalVariable(name: "i", scope: !790, file: !2, line: 112, type: !14)
!790 = distinct !DILexicalBlock(scope: !702, file: !2, line: 112, column: 5)
!791 = !DILocation(line: 112, column: 14, scope: !790)
!792 = !DILocation(line: 112, column: 10, scope: !790)
!793 = !DILocation(line: 112, column: 22, scope: !794)
!794 = !DILexicalBlockFile(scope: !795, file: !2, discriminator: 1)
!795 = distinct !DILexicalBlock(scope: !790, file: !2, line: 112, column: 5)
!796 = !DILocation(line: 112, column: 26, scope: !794)
!797 = !DILocation(line: 112, column: 24, scope: !794)
!798 = !DILocation(line: 112, column: 5, scope: !794)
!799 = !DILocalVariable(name: "j", scope: !800, file: !2, line: 113, type: !14)
!800 = distinct !DILexicalBlock(scope: !801, file: !2, line: 113, column: 3)
!801 = distinct !DILexicalBlock(scope: !795, file: !2, line: 112, column: 40)
!802 = !DILocation(line: 113, column: 12, scope: !800)
!803 = !DILocation(line: 113, column: 8, scope: !800)
!804 = !DILocation(line: 113, column: 20, scope: !805)
!805 = !DILexicalBlockFile(scope: !806, file: !2, discriminator: 1)
!806 = distinct !DILexicalBlock(scope: !800, file: !2, line: 113, column: 3)
!807 = !DILocation(line: 113, column: 24, scope: !805)
!808 = !DILocation(line: 113, column: 22, scope: !805)
!809 = !DILocation(line: 113, column: 3, scope: !805)
!810 = !DILocation(line: 114, column: 4, scope: !811)
!811 = distinct !DILexicalBlock(scope: !806, file: !2, line: 113, column: 38)
!812 = !DILocation(line: 114, column: 19, scope: !811)
!813 = !DILocation(line: 114, column: 21, scope: !811)
!814 = !DILocation(line: 114, column: 20, scope: !811)
!815 = !DILocation(line: 114, column: 30, scope: !811)
!816 = !DILocation(line: 114, column: 29, scope: !811)
!817 = !DILocation(line: 114, column: 33, scope: !811)
!818 = !DILocation(line: 115, column: 3, scope: !811)
!819 = !DILocation(line: 113, column: 35, scope: !820)
!820 = !DILexicalBlockFile(scope: !806, file: !2, discriminator: 2)
!821 = !DILocation(line: 113, column: 3, scope: !820)
!822 = distinct !{!822, !823}
!823 = !DILocation(line: 113, column: 3, scope: !801)
!824 = !DILocation(line: 116, column: 2, scope: !801)
!825 = !DILocation(line: 112, column: 37, scope: !826)
!826 = !DILexicalBlockFile(scope: !795, file: !2, discriminator: 2)
!827 = !DILocation(line: 112, column: 5, scope: !826)
!828 = distinct !{!828, !829}
!829 = !DILocation(line: 112, column: 5, scope: !702)
!830 = !DILocation(line: 118, column: 2, scope: !702)
!831 = !DILocalVariable(name: "i", scope: !832, file: !2, line: 120, type: !14)
!832 = distinct !DILexicalBlock(scope: !702, file: !2, line: 120, column: 2)
!833 = !DILocation(line: 120, column: 11, scope: !832)
!834 = !DILocation(line: 120, column: 7, scope: !832)
!835 = !DILocation(line: 120, column: 16, scope: !836)
!836 = !DILexicalBlockFile(scope: !837, file: !2, discriminator: 1)
!837 = distinct !DILexicalBlock(scope: !832, file: !2, line: 120, column: 2)
!838 = !DILocation(line: 120, column: 19, scope: !836)
!839 = !DILocation(line: 120, column: 17, scope: !836)
!840 = !DILocation(line: 120, column: 2, scope: !836)
!841 = !DILocation(line: 121, column: 37, scope: !842)
!842 = distinct !DILexicalBlock(scope: !837, file: !2, line: 120, column: 34)
!843 = !DILocation(line: 121, column: 44, scope: !842)
!844 = !DILocation(line: 121, column: 49, scope: !842)
!845 = !DILocation(line: 121, column: 8, scope: !842)
!846 = !DILocation(line: 121, column: 23, scope: !842)
!847 = !DILocation(line: 121, column: 25, scope: !842)
!848 = !DILocation(line: 121, column: 24, scope: !842)
!849 = !DILocation(line: 121, column: 35, scope: !842)
!850 = !DILocation(line: 122, column: 2, scope: !842)
!851 = !DILocation(line: 120, column: 31, scope: !852)
!852 = !DILexicalBlockFile(scope: !837, file: !2, discriminator: 2)
!853 = !DILocation(line: 120, column: 2, scope: !852)
!854 = distinct !{!854, !855}
!855 = !DILocation(line: 120, column: 2, scope: !702)
!856 = !DILocalVariable(name: "j", scope: !857, file: !2, line: 123, type: !14)
!857 = distinct !DILexicalBlock(scope: !702, file: !2, line: 123, column: 5)
!858 = !DILocation(line: 123, column: 14, scope: !857)
!859 = !DILocation(line: 123, column: 10, scope: !857)
!860 = !DILocation(line: 123, column: 19, scope: !861)
!861 = !DILexicalBlockFile(scope: !862, file: !2, discriminator: 1)
!862 = distinct !DILexicalBlock(scope: !857, file: !2, line: 123, column: 5)
!863 = !DILocation(line: 123, column: 22, scope: !861)
!864 = !DILocation(line: 123, column: 20, scope: !861)
!865 = !DILocation(line: 123, column: 5, scope: !861)
!866 = !DILocation(line: 124, column: 28, scope: !867)
!867 = distinct !DILexicalBlock(scope: !862, file: !2, line: 123, column: 37)
!868 = !DILocation(line: 124, column: 35, scope: !867)
!869 = !DILocation(line: 124, column: 40, scope: !867)
!870 = !DILocation(line: 124, column: 8, scope: !867)
!871 = !DILocation(line: 124, column: 23, scope: !867)
!872 = !DILocation(line: 124, column: 26, scope: !867)
!873 = !DILocation(line: 125, column: 2, scope: !867)
!874 = !DILocation(line: 123, column: 34, scope: !875)
!875 = !DILexicalBlockFile(scope: !862, file: !2, discriminator: 2)
!876 = !DILocation(line: 123, column: 5, scope: !875)
!877 = distinct !{!877, !878}
!878 = !DILocation(line: 123, column: 5, scope: !702)
!879 = !DILocalVariable(name: "i", scope: !880, file: !2, line: 128, type: !14)
!880 = distinct !DILexicalBlock(scope: !702, file: !2, line: 128, column: 2)
!881 = !DILocation(line: 128, column: 11, scope: !880)
!882 = !DILocation(line: 128, column: 7, scope: !880)
!883 = !DILocation(line: 128, column: 19, scope: !884)
!884 = !DILexicalBlockFile(scope: !885, file: !2, discriminator: 1)
!885 = distinct !DILexicalBlock(scope: !880, file: !2, line: 128, column: 2)
!886 = !DILocation(line: 128, column: 23, scope: !884)
!887 = !DILocation(line: 128, column: 21, scope: !884)
!888 = !DILocation(line: 128, column: 2, scope: !884)
!889 = !DILocalVariable(name: "j", scope: !890, file: !2, line: 129, type: !14)
!890 = distinct !DILexicalBlock(scope: !891, file: !2, line: 129, column: 3)
!891 = distinct !DILexicalBlock(scope: !885, file: !2, line: 128, column: 37)
!892 = !DILocation(line: 129, column: 12, scope: !890)
!893 = !DILocation(line: 129, column: 8, scope: !890)
!894 = !DILocation(line: 129, column: 20, scope: !895)
!895 = !DILexicalBlockFile(scope: !896, file: !2, discriminator: 1)
!896 = distinct !DILexicalBlock(scope: !890, file: !2, line: 129, column: 3)
!897 = !DILocation(line: 129, column: 24, scope: !895)
!898 = !DILocation(line: 129, column: 22, scope: !895)
!899 = !DILocation(line: 129, column: 3, scope: !895)
!900 = !DILocation(line: 130, column: 39, scope: !901)
!901 = distinct !DILexicalBlock(scope: !896, file: !2, line: 129, column: 38)
!902 = !DILocation(line: 130, column: 54, scope: !901)
!903 = !DILocation(line: 130, column: 56, scope: !901)
!904 = !DILocation(line: 130, column: 55, scope: !901)
!905 = !DILocation(line: 130, column: 30, scope: !901)
!906 = !DILocation(line: 130, column: 67, scope: !901)
!907 = !DILocation(line: 130, column: 82, scope: !901)
!908 = !DILocation(line: 130, column: 3, scope: !901)
!909 = !DILocation(line: 130, column: 14, scope: !901)
!910 = !DILocation(line: 130, column: 16, scope: !901)
!911 = !DILocation(line: 130, column: 15, scope: !901)
!912 = !DILocation(line: 130, column: 25, scope: !901)
!913 = !DILocation(line: 130, column: 24, scope: !901)
!914 = !DILocation(line: 130, column: 28, scope: !901)
!915 = !DILocation(line: 131, column: 3, scope: !901)
!916 = !DILocation(line: 129, column: 35, scope: !917)
!917 = !DILexicalBlockFile(scope: !896, file: !2, discriminator: 2)
!918 = !DILocation(line: 129, column: 3, scope: !917)
!919 = distinct !{!919, !920}
!920 = !DILocation(line: 129, column: 3, scope: !891)
!921 = !DILocation(line: 132, column: 2, scope: !891)
!922 = !DILocation(line: 128, column: 34, scope: !923)
!923 = !DILexicalBlockFile(scope: !885, file: !2, discriminator: 2)
!924 = !DILocation(line: 128, column: 2, scope: !923)
!925 = distinct !{!925, !926}
!926 = !DILocation(line: 128, column: 2, scope: !702)
!927 = !DILocalVariable(name: "i", scope: !928, file: !2, line: 134, type: !14)
!928 = distinct !DILexicalBlock(scope: !702, file: !2, line: 134, column: 5)
!929 = !DILocation(line: 134, column: 14, scope: !928)
!930 = !DILocation(line: 134, column: 10, scope: !928)
!931 = !DILocation(line: 134, column: 21, scope: !932)
!932 = !DILexicalBlockFile(scope: !933, file: !2, discriminator: 1)
!933 = distinct !DILexicalBlock(scope: !928, file: !2, line: 134, column: 5)
!934 = !DILocation(line: 134, column: 24, scope: !932)
!935 = !DILocation(line: 134, column: 22, scope: !932)
!936 = !DILocation(line: 134, column: 5, scope: !932)
!937 = !DILocation(line: 135, column: 38, scope: !933)
!938 = !DILocation(line: 135, column: 37, scope: !933)
!939 = !DILocation(line: 135, column: 42, scope: !933)
!940 = !DILocation(line: 135, column: 40, scope: !933)
!941 = !DILocation(line: 135, column: 8, scope: !933)
!942 = !DILocation(line: 135, column: 23, scope: !933)
!943 = !DILocation(line: 135, column: 25, scope: !933)
!944 = !DILocation(line: 135, column: 24, scope: !933)
!945 = !DILocation(line: 135, column: 35, scope: !933)
!946 = !DILocation(line: 134, column: 36, scope: !947)
!947 = !DILexicalBlockFile(scope: !933, file: !2, discriminator: 2)
!948 = !DILocation(line: 134, column: 5, scope: !947)
!949 = distinct !{!949, !950}
!950 = !DILocation(line: 134, column: 5, scope: !702)
!951 = !DILocalVariable(name: "j", scope: !952, file: !2, line: 136, type: !14)
!952 = distinct !DILexicalBlock(scope: !702, file: !2, line: 136, column: 2)
!953 = !DILocation(line: 136, column: 11, scope: !952)
!954 = !DILocation(line: 136, column: 7, scope: !952)
!955 = !DILocation(line: 136, column: 18, scope: !956)
!956 = !DILexicalBlockFile(scope: !957, file: !2, discriminator: 1)
!957 = distinct !DILexicalBlock(scope: !952, file: !2, line: 136, column: 2)
!958 = !DILocation(line: 136, column: 21, scope: !956)
!959 = !DILocation(line: 136, column: 19, scope: !956)
!960 = !DILocation(line: 136, column: 2, scope: !956)
!961 = !DILocation(line: 137, column: 29, scope: !957)
!962 = !DILocation(line: 137, column: 28, scope: !957)
!963 = !DILocation(line: 137, column: 33, scope: !957)
!964 = !DILocation(line: 137, column: 31, scope: !957)
!965 = !DILocation(line: 137, column: 8, scope: !957)
!966 = !DILocation(line: 137, column: 23, scope: !957)
!967 = !DILocation(line: 137, column: 26, scope: !957)
!968 = !DILocation(line: 136, column: 33, scope: !969)
!969 = !DILexicalBlockFile(scope: !957, file: !2, discriminator: 2)
!970 = !DILocation(line: 136, column: 2, scope: !969)
!971 = distinct !{!971, !972}
!972 = !DILocation(line: 136, column: 2, scope: !702)
!973 = !DILocation(line: 140, column: 12, scope: !702)
!974 = !DILocation(line: 140, column: 23, scope: !702)
!975 = !DILocation(line: 140, column: 21, scope: !702)
!976 = !DILocation(line: 140, column: 10, scope: !702)
!977 = !DILocation(line: 141, column: 13, scope: !702)
!978 = !DILocation(line: 141, column: 52, scope: !702)
!979 = !DILocation(line: 141, column: 51, scope: !702)
!980 = !DILocation(line: 141, column: 2, scope: !702)
!981 = !DILocation(line: 142, column: 13, scope: !702)
!982 = !DILocation(line: 142, column: 48, scope: !702)
!983 = !DILocation(line: 142, column: 47, scope: !702)
!984 = !DILocation(line: 142, column: 2, scope: !702)
!985 = !DILocation(line: 144, column: 13, scope: !702)
!986 = !DILocation(line: 144, column: 30, scope: !702)
!987 = !DILocation(line: 144, column: 56, scope: !702)
!988 = !DILocation(line: 144, column: 54, scope: !702)
!989 = !DILocation(line: 144, column: 2, scope: !702)
!990 = !DILocation(line: 145, column: 13, scope: !702)
!991 = !DILocation(line: 145, column: 26, scope: !702)
!992 = !DILocation(line: 145, column: 56, scope: !702)
!993 = !DILocation(line: 145, column: 54, scope: !702)
!994 = !DILocation(line: 145, column: 2, scope: !702)
!995 = !DILocalVariable(name: "dimGrid", scope: !702, file: !2, line: 147, type: !996)
!996 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !997, line: 427, baseType: !998)
!997 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nw")
!998 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !997, line: 417, size: 96, align: 32, elements: !999, identifier: "_ZTS4dim3")
!999 = !{!1000, !1001, !1002, !1003, !1007, !1016}
!1000 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !998, file: !997, line: 419, baseType: !377, size: 32, align: 32)
!1001 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !998, file: !997, line: 419, baseType: !377, size: 32, align: 32, offset: 32)
!1002 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !998, file: !997, line: 419, baseType: !377, size: 32, align: 32, offset: 64)
!1003 = !DISubprogram(name: "dim3", scope: !998, file: !997, line: 421, type: !1004, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1004 = !DISubroutineType(types: !1005)
!1005 = !{null, !1006, !377, !377, !377}
!1006 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !998, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1007 = !DISubprogram(name: "dim3", scope: !998, file: !997, line: 422, type: !1008, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{null, !1006, !1010}
!1010 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !997, line: 383, baseType: !1011)
!1011 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !997, line: 190, size: 96, align: 32, elements: !1012, identifier: "_ZTS5uint3")
!1012 = !{!1013, !1014, !1015}
!1013 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1011, file: !997, line: 192, baseType: !377, size: 32, align: 32)
!1014 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1011, file: !997, line: 192, baseType: !377, size: 32, align: 32, offset: 32)
!1015 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1011, file: !997, line: 192, baseType: !377, size: 32, align: 32, offset: 64)
!1016 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !998, file: !997, line: 423, type: !1017, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!1010, !1006}
!1019 = !DILocation(line: 147, column: 10, scope: !702)
!1020 = !DILocalVariable(name: "dimBlock", scope: !702, file: !2, line: 148, type: !996)
!1021 = !DILocation(line: 148, column: 7, scope: !702)
!1022 = !DILocalVariable(name: "block_width", scope: !702, file: !2, line: 149, type: !14)
!1023 = !DILocation(line: 149, column: 6, scope: !702)
!1024 = !DILocation(line: 149, column: 22, scope: !702)
!1025 = !DILocation(line: 149, column: 31, scope: !702)
!1026 = !DILocation(line: 149, column: 36, scope: !702)
!1027 = !DILocation(line: 151, column: 2, scope: !702)
!1028 = !DILocalVariable(name: "i", scope: !1029, file: !2, line: 153, type: !14)
!1029 = distinct !DILexicalBlock(scope: !702, file: !2, line: 153, column: 2)
!1030 = !DILocation(line: 153, column: 11, scope: !1029)
!1031 = !DILocation(line: 153, column: 7, scope: !1029)
!1032 = !DILocation(line: 153, column: 19, scope: !1033)
!1033 = !DILexicalBlockFile(scope: !1034, file: !2, discriminator: 1)
!1034 = distinct !DILexicalBlock(scope: !1029, file: !2, line: 153, column: 2)
!1035 = !DILocation(line: 153, column: 24, scope: !1033)
!1036 = !DILocation(line: 153, column: 21, scope: !1033)
!1037 = !DILocation(line: 153, column: 2, scope: !1033)
!1038 = !DILocation(line: 154, column: 15, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1034, file: !2, line: 153, column: 42)
!1040 = !DILocation(line: 154, column: 11, scope: !1039)
!1041 = !DILocation(line: 154, column: 13, scope: !1039)
!1042 = !DILocation(line: 155, column: 11, scope: !1039)
!1043 = !DILocation(line: 155, column: 13, scope: !1039)
!1044 = !DILocation(line: 156, column: 26, scope: !1039)
!1045 = !DILocation(line: 156, column: 35, scope: !1039)
!1046 = !DILocation(line: 156, column: 23, scope: !1039)
!1047 = !DILocation(line: 156, column: 3, scope: !1039)
!1048 = !DILocation(line: 156, column: 47, scope: !1049)
!1049 = !DILexicalBlockFile(scope: !1039, file: !2, discriminator: 1)
!1050 = !DILocation(line: 156, column: 64, scope: !1049)
!1051 = !DILocation(line: 157, column: 42, scope: !1039)
!1052 = !DILocation(line: 157, column: 52, scope: !1039)
!1053 = !DILocation(line: 157, column: 61, scope: !1039)
!1054 = !DILocation(line: 157, column: 64, scope: !1039)
!1055 = !DILocation(line: 156, column: 3, scope: !1049)
!1056 = !DILocation(line: 158, column: 2, scope: !1039)
!1057 = !DILocation(line: 153, column: 39, scope: !1058)
!1058 = !DILexicalBlockFile(scope: !1034, file: !2, discriminator: 2)
!1059 = !DILocation(line: 153, column: 2, scope: !1058)
!1060 = distinct !{!1060, !1061}
!1061 = !DILocation(line: 153, column: 2, scope: !702)
!1062 = !DILocation(line: 159, column: 2, scope: !702)
!1063 = !DILocalVariable(name: "i", scope: !1064, file: !2, line: 161, type: !14)
!1064 = distinct !DILexicalBlock(scope: !702, file: !2, line: 161, column: 2)
!1065 = !DILocation(line: 161, column: 11, scope: !1064)
!1066 = !DILocation(line: 161, column: 15, scope: !1064)
!1067 = !DILocation(line: 161, column: 27, scope: !1064)
!1068 = !DILocation(line: 161, column: 7, scope: !1064)
!1069 = !DILocation(line: 161, column: 34, scope: !1070)
!1070 = !DILexicalBlockFile(scope: !1071, file: !2, discriminator: 1)
!1071 = distinct !DILexicalBlock(scope: !1064, file: !2, line: 161, column: 2)
!1072 = !DILocation(line: 161, column: 36, scope: !1070)
!1073 = !DILocation(line: 161, column: 2, scope: !1070)
!1074 = !DILocation(line: 162, column: 15, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1071, file: !2, line: 161, column: 47)
!1076 = !DILocation(line: 162, column: 11, scope: !1075)
!1077 = !DILocation(line: 162, column: 13, scope: !1075)
!1078 = !DILocation(line: 163, column: 11, scope: !1075)
!1079 = !DILocation(line: 163, column: 13, scope: !1075)
!1080 = !DILocation(line: 164, column: 26, scope: !1075)
!1081 = !DILocation(line: 164, column: 35, scope: !1075)
!1082 = !DILocation(line: 164, column: 23, scope: !1075)
!1083 = !DILocation(line: 164, column: 3, scope: !1075)
!1084 = !DILocation(line: 164, column: 47, scope: !1085)
!1085 = !DILexicalBlockFile(scope: !1075, file: !2, discriminator: 1)
!1086 = !DILocation(line: 164, column: 64, scope: !1085)
!1087 = !DILocation(line: 165, column: 42, scope: !1075)
!1088 = !DILocation(line: 165, column: 52, scope: !1075)
!1089 = !DILocation(line: 165, column: 61, scope: !1075)
!1090 = !DILocation(line: 165, column: 64, scope: !1075)
!1091 = !DILocation(line: 164, column: 3, scope: !1085)
!1092 = !DILocation(line: 166, column: 2, scope: !1075)
!1093 = !DILocation(line: 161, column: 44, scope: !1094)
!1094 = !DILexicalBlockFile(scope: !1071, file: !2, discriminator: 2)
!1095 = !DILocation(line: 161, column: 2, scope: !1094)
!1096 = distinct !{!1096, !1097}
!1097 = !DILocation(line: 161, column: 2, scope: !702)
!1098 = !DILocation(line: 169, column: 16, scope: !702)
!1099 = !DILocation(line: 169, column: 33, scope: !702)
!1100 = !DILocation(line: 169, column: 60, scope: !702)
!1101 = !DILocation(line: 169, column: 58, scope: !702)
!1102 = !DILocation(line: 169, column: 5, scope: !702)
!1103 = !DILocation(line: 232, column: 11, scope: !702)
!1104 = !DILocation(line: 232, column: 2, scope: !702)
!1105 = !DILocation(line: 233, column: 11, scope: !702)
!1106 = !DILocation(line: 233, column: 2, scope: !702)
!1107 = !DILocation(line: 235, column: 7, scope: !702)
!1108 = !DILocation(line: 235, column: 2, scope: !702)
!1109 = !DILocation(line: 236, column: 7, scope: !702)
!1110 = !DILocation(line: 236, column: 2, scope: !702)
!1111 = !DILocation(line: 237, column: 7, scope: !702)
!1112 = !DILocation(line: 237, column: 2, scope: !702)
!1113 = !DILocation(line: 239, column: 1, scope: !702)
!1114 = distinct !DISubprogram(name: "usage", linkageName: "_Z5usageiPPc", scope: !2, file: !2, line: 65, type: !703, isLocal: false, isDefinition: true, scopeLine: 66, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !583)
!1115 = !DILocalVariable(name: "argc", arg: 1, scope: !1114, file: !2, line: 65, type: !14)
!1116 = !DILocation(line: 65, column: 16, scope: !1114)
!1117 = !DILocalVariable(name: "argv", arg: 2, scope: !1114, file: !2, line: 65, type: !383)
!1118 = !DILocation(line: 65, column: 29, scope: !1114)
!1119 = !DILocation(line: 67, column: 10, scope: !1114)
!1120 = !DILocation(line: 67, column: 64, scope: !1114)
!1121 = !DILocation(line: 67, column: 2, scope: !1114)
!1122 = !DILocation(line: 68, column: 10, scope: !1114)
!1123 = !DILocation(line: 68, column: 2, scope: !1114)
!1124 = !DILocation(line: 69, column: 10, scope: !1114)
!1125 = !DILocation(line: 69, column: 2, scope: !1114)
!1126 = !DILocation(line: 70, column: 2, scope: !1114)
!1127 = !DILocation(line: 71, column: 1, scope: !1114)
!1128 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !998, file: !997, line: 421, type: !1004, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !1003, variables: !583)
!1129 = !DILocalVariable(name: "this", arg: 1, scope: !1128, type: !1130, flags: DIFlagArtificial | DIFlagObjectPointer)
!1130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !998, size: 64, align: 64)
!1131 = !DILocation(line: 0, scope: !1128)
!1132 = !DILocalVariable(name: "vx", arg: 2, scope: !1128, file: !997, line: 421, type: !377)
!1133 = !DILocation(line: 421, column: 43, scope: !1128)
!1134 = !DILocalVariable(name: "vy", arg: 3, scope: !1128, file: !997, line: 421, type: !377)
!1135 = !DILocation(line: 421, column: 64, scope: !1128)
!1136 = !DILocalVariable(name: "vz", arg: 4, scope: !1128, file: !997, line: 421, type: !377)
!1137 = !DILocation(line: 421, column: 85, scope: !1128)
!1138 = !DILocation(line: 421, column: 95, scope: !1128)
!1139 = !DILocation(line: 421, column: 97, scope: !1128)
!1140 = !DILocation(line: 421, column: 102, scope: !1128)
!1141 = !DILocation(line: 421, column: 104, scope: !1128)
!1142 = !DILocation(line: 421, column: 109, scope: !1128)
!1143 = !DILocation(line: 421, column: 111, scope: !1128)
!1144 = !DILocation(line: 421, column: 116, scope: !1128)
