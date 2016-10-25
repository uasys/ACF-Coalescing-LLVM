; ModuleID = 'lud.cu'
source_filename = "lud.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.option = type { i8*, i32, i32*, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__stopwatch_t = type { %struct.timeval, %struct.timeval }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [29 x i8] c"WG size of kernel = %d X %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"::vs:i:\00", align 1
@_ZL12long_options = internal global [4 x %struct.option] [%struct.option { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i32 1, i32* null, i32 105 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i32 1, i32* null, i32 115 }, %struct.option { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 0, i32* null, i32 118 }, %struct.option zeroinitializer], align 16, !dbg !0
@optarg = external global i8*, align 8
@_ZL9do_verify = internal global i32 0, align 4, !dbg !21
@.str.2 = private unnamed_addr constant [44 x i8] c"Generate input matrix internally, size =%d\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [16 x i8] c"invalid option\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"missing argument\0A\00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"Usage: %s [-v] [-s matrix_size|-i input_file]\0A\00", align 1
@optind = external global i32, align 4
@.str.6 = private unnamed_addr constant [29 x i8] c"Reading matrix from file %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [34 x i8] c"error create matrix from file %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c"Creating matrix internally size=%d\0A\00", align 1
@.str.9 = private unnamed_addr constant [40 x i8] c"error create matrix internally size=%d\0A\00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"No input file specified!\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Before LUD\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"Time consumed(ms): %lf\0A\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"After LUD\0A\00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c">>>Verify<<<<\0A\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"verify\00", align 1

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !592 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %matrix_dim = alloca i32, align 4
  %opt = alloca i32, align 4
  %option_index = alloca i32, align 4
  %ret = alloca i32, align 4
  %input_file = alloca i8*, align 8
  %m = alloca float*, align 8
  %d_m = alloca float*, align 8
  %mm = alloca float*, align 8
  %sw = alloca %struct.__stopwatch_t, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !596, metadata !597), !dbg !598
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !599, metadata !597), !dbg !600
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0), i32 16, i32 16), !dbg !601
  call void @llvm.dbg.declare(metadata i32* %matrix_dim, metadata !602, metadata !597), !dbg !603
  store i32 32, i32* %matrix_dim, align 4, !dbg !603
  call void @llvm.dbg.declare(metadata i32* %opt, metadata !604, metadata !597), !dbg !605
  call void @llvm.dbg.declare(metadata i32* %option_index, metadata !606, metadata !597), !dbg !607
  store i32 0, i32* %option_index, align 4, !dbg !607
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !608, metadata !597), !dbg !610
  call void @llvm.dbg.declare(metadata i8** %input_file, metadata !611, metadata !597), !dbg !612
  store i8* null, i8** %input_file, align 8, !dbg !612
  call void @llvm.dbg.declare(metadata float** %m, metadata !613, metadata !597), !dbg !614
  call void @llvm.dbg.declare(metadata float** %d_m, metadata !615, metadata !597), !dbg !616
  call void @llvm.dbg.declare(metadata float** %mm, metadata !617, metadata !597), !dbg !618
  call void @llvm.dbg.declare(metadata %struct.__stopwatch_t* %sw, metadata !619, metadata !597), !dbg !633
  br label %while.cond, !dbg !634

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load i32, i32* %argc.addr, align 4, !dbg !635
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !637
  %call1 = call i32 @getopt_long(i32 %0, i8** %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), %struct.option* getelementptr inbounds ([4 x %struct.option], [4 x %struct.option]* @_ZL12long_options, i32 0, i32 0), i32* %option_index) #6, !dbg !638
  store i32 %call1, i32* %opt, align 4, !dbg !639
  %cmp = icmp ne i32 %call1, -1, !dbg !640
  br i1 %cmp, label %while.body, label %while.end, !dbg !641

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %opt, align 4, !dbg !642
  switch i32 %2, label %sw.default [
    i32 105, label %sw.bb
    i32 118, label %sw.bb2
    i32 115, label %sw.bb3
    i32 63, label %sw.bb6
    i32 58, label %sw.bb8
  ], !dbg !644

sw.bb:                                            ; preds = %while.body
  %3 = load i8*, i8** @optarg, align 8, !dbg !645
  store i8* %3, i8** %input_file, align 8, !dbg !647
  br label %sw.epilog, !dbg !648

sw.bb2:                                           ; preds = %while.body
  store i32 1, i32* @_ZL9do_verify, align 4, !dbg !649
  br label %sw.epilog, !dbg !650

sw.bb3:                                           ; preds = %while.body
  %4 = load i8*, i8** @optarg, align 8, !dbg !651
  %call4 = call i32 @atoi(i8* %4) #7, !dbg !652
  store i32 %call4, i32* %matrix_dim, align 4, !dbg !653
  %5 = load i32, i32* %matrix_dim, align 4, !dbg !654
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.2, i32 0, i32 0), i32 %5), !dbg !655
  br label %sw.epilog, !dbg !656

sw.bb6:                                           ; preds = %while.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !657
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0)), !dbg !658
  br label %sw.epilog, !dbg !659

sw.bb8:                                           ; preds = %while.body
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !660
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0)), !dbg !661
  br label %sw.epilog, !dbg !662

sw.default:                                       ; preds = %while.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !663
  %9 = load i8**, i8*** %argv.addr, align 8, !dbg !664
  %arrayidx = getelementptr inbounds i8*, i8** %9, i64 0, !dbg !664
  %10 = load i8*, i8** %arrayidx, align 8, !dbg !664
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i32 0, i32 0), i8* %10), !dbg !665
  call void @exit(i32 1) #8, !dbg !666
  unreachable, !dbg !666

sw.epilog:                                        ; preds = %sw.bb8, %sw.bb6, %sw.bb3, %sw.bb2, %sw.bb
  br label %while.cond, !dbg !667, !llvm.loop !669

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* @optind, align 4, !dbg !670
  %12 = load i32, i32* %argc.addr, align 4, !dbg !672
  %cmp11 = icmp slt i32 %11, %12, !dbg !673
  br i1 %cmp11, label %if.then, label %lor.lhs.false, !dbg !674

lor.lhs.false:                                    ; preds = %while.end
  %13 = load i32, i32* @optind, align 4, !dbg !675
  %cmp12 = icmp eq i32 %13, 1, !dbg !677
  br i1 %cmp12, label %if.then, label %if.end, !dbg !678

if.then:                                          ; preds = %lor.lhs.false, %while.end
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !679
  %15 = load i8**, i8*** %argv.addr, align 8, !dbg !681
  %arrayidx13 = getelementptr inbounds i8*, i8** %15, i64 0, !dbg !681
  %16 = load i8*, i8** %arrayidx13, align 8, !dbg !681
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i32 0, i32 0), i8* %16), !dbg !682
  call void @exit(i32 1) #8, !dbg !683
  unreachable, !dbg !683

if.end:                                           ; preds = %lor.lhs.false
  %17 = load i8*, i8** %input_file, align 8, !dbg !684
  %tobool = icmp ne i8* %17, null, !dbg !684
  br i1 %tobool, label %if.then15, label %if.else, !dbg !686

if.then15:                                        ; preds = %if.end
  %18 = load i8*, i8** %input_file, align 8, !dbg !687
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i32 0, i32 0), i8* %18), !dbg !689
  %19 = load i8*, i8** %input_file, align 8, !dbg !690
  %call17 = call i32 @create_matrix_from_file(float** %m, i8* %19, i32* %matrix_dim), !dbg !691
  store i32 %call17, i32* %ret, align 4, !dbg !692
  %20 = load i32, i32* %ret, align 4, !dbg !693
  %cmp18 = icmp ne i32 %20, 0, !dbg !695
  br i1 %cmp18, label %if.then19, label %if.end21, !dbg !696

if.then19:                                        ; preds = %if.then15
  store float* null, float** %m, align 8, !dbg !697
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !699
  %22 = load i8*, i8** %input_file, align 8, !dbg !700
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.7, i32 0, i32 0), i8* %22), !dbg !701
  call void @exit(i32 1) #8, !dbg !702
  unreachable, !dbg !702

if.end21:                                         ; preds = %if.then15
  br label %if.end33, !dbg !703

if.else:                                          ; preds = %if.end
  %23 = load i32, i32* %matrix_dim, align 4, !dbg !704
  %tobool22 = icmp ne i32 %23, 0, !dbg !704
  br i1 %tobool22, label %if.then23, label %if.else30, !dbg !706

if.then23:                                        ; preds = %if.else
  %24 = load i32, i32* %matrix_dim, align 4, !dbg !707
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i32 0, i32 0), i32 %24), !dbg !709
  %25 = load i32, i32* %matrix_dim, align 4, !dbg !710
  %call25 = call i32 @create_matrix(float** %m, i32 %25), !dbg !711
  store i32 %call25, i32* %ret, align 4, !dbg !712
  %26 = load i32, i32* %ret, align 4, !dbg !713
  %cmp26 = icmp ne i32 %26, 0, !dbg !715
  br i1 %cmp26, label %if.then27, label %if.end29, !dbg !716

if.then27:                                        ; preds = %if.then23
  store float* null, float** %m, align 8, !dbg !717
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !719
  %28 = load i32, i32* %matrix_dim, align 4, !dbg !720
  %call28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i32 0, i32 0), i32 %28), !dbg !721
  call void @exit(i32 1) #8, !dbg !722
  unreachable, !dbg !722

if.end29:                                         ; preds = %if.then23
  br label %if.end32, !dbg !723

if.else30:                                        ; preds = %if.else
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.10, i32 0, i32 0)), !dbg !724
  call void @exit(i32 1) #8, !dbg !726
  unreachable, !dbg !726

if.end32:                                         ; preds = %if.end29
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end21
  %29 = load i32, i32* @_ZL9do_verify, align 4, !dbg !727
  %tobool34 = icmp ne i32 %29, 0, !dbg !727
  br i1 %tobool34, label %if.then35, label %if.end37, !dbg !729

if.then35:                                        ; preds = %if.end33
  %call36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0)), !dbg !730
  %30 = load float*, float** %m, align 8, !dbg !732
  %31 = load i32, i32* %matrix_dim, align 4, !dbg !733
  call void @matrix_duplicate(float* %30, float** %mm, i32 %31), !dbg !734
  br label %if.end37, !dbg !735

if.end37:                                         ; preds = %if.then35, %if.end33
  %32 = bitcast float** %d_m to i8**, !dbg !736
  %33 = load i32, i32* %matrix_dim, align 4, !dbg !737
  %34 = load i32, i32* %matrix_dim, align 4, !dbg !738
  %mul = mul nsw i32 %33, %34, !dbg !739
  %conv = sext i32 %mul to i64, !dbg !737
  %mul38 = mul i64 %conv, 4, !dbg !740
  %call39 = call i32 @cudaMalloc(i8** %32, i64 %mul38), !dbg !741
  call void @stopwatch_start(%struct.__stopwatch_t* %sw), !dbg !742
  %35 = load float*, float** %d_m, align 8, !dbg !743
  %36 = bitcast float* %35 to i8*, !dbg !743
  %37 = load float*, float** %m, align 8, !dbg !744
  %38 = bitcast float* %37 to i8*, !dbg !744
  %39 = load i32, i32* %matrix_dim, align 4, !dbg !745
  %40 = load i32, i32* %matrix_dim, align 4, !dbg !746
  %mul40 = mul nsw i32 %39, %40, !dbg !747
  %conv41 = sext i32 %mul40 to i64, !dbg !745
  %mul42 = mul i64 %conv41, 4, !dbg !748
  %call43 = call i32 @cudaMemcpy(i8* %36, i8* %38, i64 %mul42, i32 1), !dbg !749
  %41 = load float*, float** %d_m, align 8, !dbg !750
  %42 = load i32, i32* %matrix_dim, align 4, !dbg !751
  call void @_Z8lud_cudaPfi(float* %41, i32 %42), !dbg !752
  %43 = load float*, float** %m, align 8, !dbg !753
  %44 = bitcast float* %43 to i8*, !dbg !753
  %45 = load float*, float** %d_m, align 8, !dbg !754
  %46 = bitcast float* %45 to i8*, !dbg !754
  %47 = load i32, i32* %matrix_dim, align 4, !dbg !755
  %48 = load i32, i32* %matrix_dim, align 4, !dbg !756
  %mul44 = mul nsw i32 %47, %48, !dbg !757
  %conv45 = sext i32 %mul44 to i64, !dbg !755
  %mul46 = mul i64 %conv45, 4, !dbg !758
  %call47 = call i32 @cudaMemcpy(i8* %44, i8* %46, i64 %mul46, i32 2), !dbg !759
  call void @stopwatch_stop(%struct.__stopwatch_t* %sw), !dbg !760
  %call48 = call double @get_interval_by_sec(%struct.__stopwatch_t* %sw), !dbg !761
  %mul49 = fmul double 1.000000e+03, %call48, !dbg !762
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i32 0, i32 0), double %mul49), !dbg !763
  %49 = load float*, float** %d_m, align 8, !dbg !764
  %50 = bitcast float* %49 to i8*, !dbg !764
  %call51 = call i32 @cudaFree(i8* %50), !dbg !765
  %51 = load i32, i32* @_ZL9do_verify, align 4, !dbg !766
  %tobool52 = icmp ne i32 %51, 0, !dbg !766
  br i1 %tobool52, label %if.then53, label %if.end57, !dbg !768

if.then53:                                        ; preds = %if.end37
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i32 0, i32 0)), !dbg !769
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i32 0, i32 0)), !dbg !771
  %52 = load float*, float** %mm, align 8, !dbg !772
  %53 = load float*, float** %m, align 8, !dbg !773
  %54 = load i32, i32* %matrix_dim, align 4, !dbg !774
  %call56 = call i32 @lud_verify(float* %52, float* %53, i32 %54), !dbg !775
  %55 = load float*, float** %mm, align 8, !dbg !776
  %56 = bitcast float* %55 to i8*, !dbg !776
  call void @free(i8* %56) #6, !dbg !777
  br label %if.end57, !dbg !778

if.end57:                                         ; preds = %if.then53, %if.end37
  %57 = load float*, float** %m, align 8, !dbg !779
  %58 = bitcast float* %57 to i8*, !dbg !779
  call void @free(i8* %58) #6, !dbg !780
  ret i32 0, !dbg !781
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare i32 @getopt_long(i32, i8**, i8*, %struct.option*, i32*) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

declare i32 @create_matrix_from_file(float**, i8*, i32*) #2

declare i32 @create_matrix(float**, i32) #2

declare void @matrix_duplicate(float*, float**, i32) #2

declare i32 @cudaMalloc(i8**, i64) #2

declare void @stopwatch_start(%struct.__stopwatch_t*) #2

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

declare void @_Z8lud_cudaPfi(float*, i32) #2

declare void @stopwatch_stop(%struct.__stopwatch_t*) #2

declare double @get_interval_by_sec(%struct.__stopwatch_t*) #2

declare i32 @cudaFree(i8*) #2

declare i32 @lud_verify(float*, float*, i32) #2

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!589, !590}
!llvm.ident = !{!591}

!0 = distinct !DIGlobalVariable(name: "long_options", linkageName: "_ZL12long_options", scope: !1, file: !2, line: 40, type: !579, isLocal: true, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !17, globals: !20, imports: !23)
!2 = !DIFile(filename: "lud.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!3 = !{!4, !9}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_FUNC_RETURN_CODE", file: !5, line: 18, size: 32, align: 32, elements: !6, identifier: "_ZTS17_FUNC_RETURN_CODE")
!5 = !DIFile(filename: "../common/common.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!6 = !{!7, !8}
!7 = !DIEnumerator(name: "RET_SUCCESS", value: 0)
!8 = !DIEnumerator(name: "RET_FAILURE", value: 1)
!9 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !10, line: 807, size: 32, align: 32, elements: !11, identifier: "_ZTS14cudaMemcpyKind")
!10 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!11 = !{!12, !13, !14, !15, !16}
!12 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!13 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!14 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!15 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!16 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!17 = !{!18}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64, align: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!20 = !{!0, !21}
!21 = distinct !DIGlobalVariable(name: "do_verify", linkageName: "_ZL9do_verify", scope: !1, file: !2, line: 38, type: !22, isLocal: true, isDefinition: true)
!22 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!23 = !{!24, !31, !36, !38, !40, !42, !44, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !72, !74, !76, !80, !82, !84, !86, !90, !95, !97, !99, !104, !108, !110, !112, !114, !116, !118, !120, !122, !124, !129, !133, !135, !137, !141, !143, !145, !147, !149, !151, !155, !157, !159, !164, !172, !176, !178, !180, !184, !186, !188, !192, !194, !196, !200, !202, !204, !206, !208, !210, !212, !214, !216, !218, !223, !225, !227, !231, !233, !235, !237, !239, !241, !243, !245, !249, !253, !255, !257, !262, !264, !266, !268, !270, !272, !274, !278, !284, !288, !292, !297, !299, !303, !307, !320, !324, !328, !332, !336, !341, !343, !347, !351, !355, !363, !367, !371, !375, !379, !384, !390, !394, !398, !400, !408, !412, !420, !422, !424, !428, !432, !436, !441, !445, !450, !451, !452, !453, !456, !457, !458, !459, !460, !461, !462, !465, !467, !469, !471, !473, !475, !477, !479, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !550, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577}
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !27, line: 189)
!25 = !DINamespace(name: "std", scope: null, file: !26, line: 188)
!26 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!27 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !26, file: !26, line: 44, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!28 = !DISubroutineType(types: !29)
!29 = !{!30, !30}
!30 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !32, line: 190)
!32 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !26, file: !26, line: 46, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35}
!35 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !37, line: 191)
!37 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !26, file: !26, line: 48, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !39, line: 192)
!39 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !26, file: !26, line: 50, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !41, line: 193)
!41 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !26, file: !26, line: 52, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !43, line: 194)
!43 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !26, file: !26, line: 56, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !45, line: 195)
!45 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !26, file: !26, line: 54, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DISubroutineType(types: !47)
!47 = !{!35, !35, !35}
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !49, line: 196)
!49 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !26, file: !26, line: 58, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !51, line: 197)
!51 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !26, file: !26, line: 60, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !53, line: 198)
!53 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !26, file: !26, line: 62, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !55, line: 199)
!55 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !26, file: !26, line: 64, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !57, line: 200)
!57 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !26, file: !26, line: 66, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !59, line: 201)
!59 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !26, file: !26, line: 68, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !61, line: 202)
!61 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !26, file: !26, line: 72, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !63, line: 203)
!63 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !26, file: !26, line: 70, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !65, line: 204)
!65 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !26, file: !26, line: 76, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !67, line: 205)
!67 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !26, file: !26, line: 74, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !69, line: 206)
!69 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !26, file: !26, line: 78, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !71, line: 207)
!71 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !26, file: !26, line: 80, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !73, line: 208)
!73 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !26, file: !26, line: 82, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !75, line: 209)
!75 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !26, file: !26, line: 84, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !77, line: 210)
!77 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !26, file: !26, line: 86, type: !78, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DISubroutineType(types: !79)
!79 = !{!35, !35, !35, !35}
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !81, line: 211)
!81 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !26, file: !26, line: 88, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !83, line: 212)
!83 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !26, file: !26, line: 90, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !85, line: 213)
!85 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !26, file: !26, line: 92, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !87, line: 214)
!87 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !26, file: !26, line: 94, type: !88, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DISubroutineType(types: !89)
!89 = !{!22, !35}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !91, line: 215)
!91 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !26, file: !26, line: 96, type: !92, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DISubroutineType(types: !93)
!93 = !{!35, !35, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !96, line: 216)
!96 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !26, file: !26, line: 98, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !98, line: 217)
!98 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !26, file: !26, line: 100, type: !88, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !100, line: 218)
!100 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !26, file: !26, line: 102, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !35}
!103 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !105, line: 219)
!105 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !26, file: !26, line: 106, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DISubroutineType(types: !107)
!107 = !{!103, !35, !35}
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !109, line: 220)
!109 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !26, file: !26, line: 105, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !111, line: 221)
!111 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !26, file: !26, line: 108, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !113, line: 222)
!113 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !26, file: !26, line: 112, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !115, line: 223)
!115 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !26, file: !26, line: 111, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !117, line: 224)
!117 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !26, file: !26, line: 114, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !119, line: 225)
!119 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !26, file: !26, line: 116, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !121, line: 226)
!121 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !26, file: !26, line: 118, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !123, line: 227)
!123 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !26, file: !26, line: 120, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !125, line: 228)
!125 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !26, file: !26, line: 121, type: !126, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DISubroutineType(types: !127)
!127 = !{!128, !128}
!128 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !130, line: 229)
!130 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !26, file: !26, line: 123, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!35, !35, !22}
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !134, line: 230)
!134 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !26, file: !26, line: 125, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !136, line: 231)
!136 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !26, file: !26, line: 126, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !138, line: 232)
!138 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !26, file: !26, line: 128, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!30, !35}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !142, line: 233)
!142 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !26, file: !26, line: 138, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !144, line: 234)
!144 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !26, file: !26, line: 130, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !146, line: 235)
!146 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !26, file: !26, line: 132, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !148, line: 236)
!148 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !26, file: !26, line: 134, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !150, line: 237)
!150 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !26, file: !26, line: 136, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !152, line: 238)
!152 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !26, file: !26, line: 140, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!128, !35}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !156, line: 239)
!156 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !26, file: !26, line: 142, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !158, line: 240)
!158 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !26, file: !26, line: 143, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !160, line: 241)
!160 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !26, file: !26, line: 145, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!35, !35, !163}
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64, align: 64)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !165, line: 242)
!165 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !26, file: !26, line: 146, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!168, !169}
!168 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64, align: 64)
!170 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !171)
!171 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !173, line: 243)
!173 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !26, file: !26, line: 147, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{!35, !169}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !177, line: 244)
!177 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !26, file: !26, line: 149, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !179, line: 245)
!179 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !26, file: !26, line: 151, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !181, line: 246)
!181 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !26, file: !26, line: 153, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DISubroutineType(types: !183)
!183 = !{!35, !35, !168}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !185, line: 247)
!185 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !26, file: !26, line: 158, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !187, line: 248)
!187 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !26, file: !26, line: 160, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !189, line: 249)
!189 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !26, file: !26, line: 162, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!35, !35, !35, !94}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !193, line: 250)
!193 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !26, file: !26, line: 164, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !195, line: 251)
!195 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !26, file: !26, line: 166, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !197, line: 252)
!197 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !26, file: !26, line: 168, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DISubroutineType(types: !199)
!199 = !{!35, !35, !128}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !201, line: 253)
!201 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !26, file: !26, line: 170, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !203, line: 254)
!203 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !26, file: !26, line: 172, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !205, line: 255)
!205 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !26, file: !26, line: 174, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !207, line: 256)
!207 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !26, file: !26, line: 176, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !209, line: 257)
!209 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !26, file: !26, line: 178, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !211, line: 258)
!211 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !26, file: !26, line: 180, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !213, line: 259)
!213 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !26, file: !26, line: 182, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !215, line: 260)
!215 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !26, file: !26, line: 184, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !217, line: 261)
!217 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !26, file: !26, line: 186, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !219, line: 102)
!219 = !DISubprogram(name: "acos", scope: !220, file: !220, line: 54, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!221 = !DISubroutineType(types: !222)
!222 = !{!168, !168}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !224, line: 121)
!224 = !DISubprogram(name: "asin", scope: !220, file: !220, line: 56, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !226, line: 140)
!226 = !DISubprogram(name: "atan", scope: !220, file: !220, line: 58, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !228, line: 159)
!228 = !DISubprogram(name: "atan2", scope: !220, file: !220, line: 60, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DISubroutineType(types: !230)
!230 = !{!168, !168, !168}
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !232, line: 180)
!232 = !DISubprogram(name: "ceil", scope: !220, file: !220, line: 178, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !234, line: 199)
!234 = !DISubprogram(name: "cos", scope: !220, file: !220, line: 63, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !236, line: 218)
!236 = !DISubprogram(name: "cosh", scope: !220, file: !220, line: 72, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !238, line: 237)
!238 = !DISubprogram(name: "exp", scope: !220, file: !220, line: 100, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !240, line: 256)
!240 = !DISubprogram(name: "fabs", scope: !220, file: !220, line: 181, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !242, line: 275)
!242 = !DISubprogram(name: "floor", scope: !220, file: !220, line: 184, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !244, line: 294)
!244 = !DISubprogram(name: "fmod", scope: !220, file: !220, line: 187, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !246, line: 315)
!246 = !DISubprogram(name: "frexp", scope: !220, file: !220, line: 103, type: !247, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DISubroutineType(types: !248)
!248 = !{!168, !168, !94}
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !250, line: 334)
!250 = !DISubprogram(name: "ldexp", scope: !220, file: !220, line: 106, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{!168, !168, !22}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !254, line: 353)
!254 = !DISubprogram(name: "log", scope: !220, file: !220, line: 109, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !256, line: 372)
!256 = !DISubprogram(name: "log10", scope: !220, file: !220, line: 112, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !258, line: 391)
!258 = !DISubprogram(name: "modf", scope: !220, file: !220, line: 115, type: !259, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DISubroutineType(types: !260)
!260 = !{!168, !168, !261}
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64, align: 64)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !263, line: 403)
!263 = !DISubprogram(name: "pow", scope: !220, file: !220, line: 153, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !265, line: 440)
!265 = !DISubprogram(name: "sin", scope: !220, file: !220, line: 65, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !267, line: 459)
!267 = !DISubprogram(name: "sinh", scope: !220, file: !220, line: 74, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !269, line: 478)
!269 = !DISubprogram(name: "sqrt", scope: !220, file: !220, line: 156, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !271, line: 497)
!271 = !DISubprogram(name: "tan", scope: !220, file: !220, line: 67, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !273, line: 516)
!273 = !DISubprogram(name: "tanh", scope: !220, file: !220, line: 76, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !275, line: 118)
!275 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !276, line: 101, baseType: !277)
!276 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!277 = !DICompositeType(tag: DW_TAG_structure_type, file: !276, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !279, line: 119)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !276, line: 109, baseType: !280)
!280 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !276, line: 105, size: 128, align: 64, elements: !281, identifier: "_ZTS6ldiv_t")
!281 = !{!282, !283}
!282 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !280, file: !276, line: 107, baseType: !128, size: 64, align: 64)
!283 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !280, file: !276, line: 108, baseType: !128, size: 64, align: 64, offset: 64)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !285, line: 121)
!285 = !DISubprogram(name: "abort", scope: !276, file: !276, line: 515, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{null}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !289, line: 122)
!289 = !DISubprogram(name: "abs", scope: !276, file: !276, line: 774, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!22, !22}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !293, line: 123)
!293 = !DISubprogram(name: "atexit", scope: !276, file: !276, line: 519, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!22, !296}
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64, align: 64)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !298, line: 129)
!298 = !DISubprogram(name: "atof", scope: !276, file: !276, line: 144, type: !166, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !300, line: 130)
!300 = !DISubprogram(name: "atoi", scope: !276, file: !276, line: 147, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!22, !169}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !304, line: 131)
!304 = !DISubprogram(name: "atol", scope: !276, file: !276, line: 150, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!128, !169}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !308, line: 132)
!308 = !DISubprogram(name: "bsearch", scope: !276, file: !276, line: 754, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DISubroutineType(types: !310)
!310 = !{!19, !311, !311, !313, !313, !316}
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64, align: 64)
!312 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !314, line: 62, baseType: !315)
!314 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!315 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !276, line: 741, baseType: !317)
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 64, align: 64)
!318 = !DISubroutineType(types: !319)
!319 = !{!22, !311, !311}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !321, line: 133)
!321 = !DISubprogram(name: "calloc", scope: !276, file: !276, line: 468, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{!19, !313, !313}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !325, line: 134)
!325 = !DISubprogram(name: "div", scope: !276, file: !276, line: 788, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!275, !22, !22}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !329, line: 135)
!329 = !DISubprogram(name: "exit", scope: !276, file: !276, line: 543, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{null, !22}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !333, line: 136)
!333 = !DISubprogram(name: "free", scope: !276, file: !276, line: 483, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{null, !19}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !337, line: 137)
!337 = !DISubprogram(name: "getenv", scope: !276, file: !276, line: 564, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{!340, !169}
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64, align: 64)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !342, line: 138)
!342 = !DISubprogram(name: "labs", scope: !276, file: !276, line: 775, type: !126, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !344, line: 139)
!344 = !DISubprogram(name: "ldiv", scope: !276, file: !276, line: 790, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!279, !128, !128}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !348, line: 140)
!348 = !DISubprogram(name: "malloc", scope: !276, file: !276, line: 466, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!19, !313}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !352, line: 142)
!352 = !DISubprogram(name: "mblen", scope: !276, file: !276, line: 862, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{!22, !169, !313}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !356, line: 143)
!356 = !DISubprogram(name: "mbstowcs", scope: !276, file: !276, line: 873, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!313, !359, !362, !313}
!359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !360)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64, align: 64)
!361 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!362 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !169)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !364, line: 144)
!364 = !DISubprogram(name: "mbtowc", scope: !276, file: !276, line: 865, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!22, !359, !362, !313}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !368, line: 146)
!368 = !DISubprogram(name: "qsort", scope: !276, file: !276, line: 764, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{null, !19, !313, !313, !316}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !372, line: 152)
!372 = !DISubprogram(name: "rand", scope: !276, file: !276, line: 374, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{!22}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !376, line: 153)
!376 = !DISubprogram(name: "realloc", scope: !276, file: !276, line: 480, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!19, !19, !313}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !380, line: 154)
!380 = !DISubprogram(name: "srand", scope: !276, file: !276, line: 376, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!381 = !DISubroutineType(types: !382)
!382 = !{null, !383}
!383 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !385, line: 155)
!385 = !DISubprogram(name: "strtod", scope: !276, file: !276, line: 164, type: !386, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!386 = !DISubroutineType(types: !387)
!387 = !{!168, !362, !388}
!388 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !389)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 64, align: 64)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !391, line: 156)
!391 = !DISubprogram(name: "strtol", scope: !276, file: !276, line: 183, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DISubroutineType(types: !393)
!393 = !{!128, !362, !388, !22}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !395, line: 157)
!395 = !DISubprogram(name: "strtoul", scope: !276, file: !276, line: 187, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!315, !362, !388, !22}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !399, line: 158)
!399 = !DISubprogram(name: "system", scope: !276, file: !276, line: 716, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !401, line: 160)
!401 = !DISubprogram(name: "wcstombs", scope: !276, file: !276, line: 876, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DISubroutineType(types: !403)
!403 = !{!313, !404, !405, !313}
!404 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !340)
!405 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !406)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64, align: 64)
!407 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !361)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !409, line: 161)
!409 = !DISubprogram(name: "wctomb", scope: !276, file: !276, line: 869, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!410 = !DISubroutineType(types: !411)
!411 = !{!22, !340, !361}
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !415, line: 214)
!413 = !DINamespace(name: "__gnu_cxx", scope: null, file: !414, line: 220)
!414 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !276, line: 121, baseType: !416)
!416 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !276, line: 117, size: 128, align: 64, elements: !417, identifier: "_ZTS7lldiv_t")
!417 = !{!418, !419}
!418 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !416, file: !276, line: 119, baseType: !30, size: 64, align: 64)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !416, file: !276, line: 120, baseType: !30, size: 64, align: 64, offset: 64)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !421, line: 220)
!421 = !DISubprogram(name: "_Exit", scope: !276, file: !276, line: 557, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !423, line: 224)
!423 = !DISubprogram(name: "llabs", scope: !276, file: !276, line: 779, type: !28, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !425, line: 230)
!425 = !DISubprogram(name: "lldiv", scope: !276, file: !276, line: 796, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!415, !30, !30}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !429, line: 241)
!429 = !DISubprogram(name: "atoll", scope: !276, file: !276, line: 157, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!30, !169}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !433, line: 242)
!433 = !DISubprogram(name: "strtoll", scope: !276, file: !276, line: 209, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!30, !362, !388, !22}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !437, line: 243)
!437 = !DISubprogram(name: "strtoull", scope: !276, file: !276, line: 214, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!440, !362, !388, !22}
!440 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !442, line: 245)
!442 = !DISubprogram(name: "strtof", scope: !276, file: !276, line: 172, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!35, !362, !388}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !413, entity: !446, line: 246)
!446 = !DISubprogram(name: "strtold", scope: !276, file: !276, line: 175, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!449, !362, !388}
!449 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !415, line: 254)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !421, line: 256)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !423, line: 258)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !454, line: 259)
!454 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !413, file: !455, line: 227, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !425, line: 260)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !429, line: 262)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !442, line: 263)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !433, line: 264)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !437, line: 265)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !446, line: 266)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !463, line: 397)
!463 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !464, file: !464, line: 1342, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !466, line: 398)
!466 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !464, file: !464, line: 1370, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !468, line: 399)
!468 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !464, file: !464, line: 1337, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !470, line: 400)
!470 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !464, file: !464, line: 1375, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !472, line: 401)
!472 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !464, file: !464, line: 1327, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !474, line: 402)
!474 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !464, file: !464, line: 1332, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !476, line: 403)
!476 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !464, file: !464, line: 1380, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !478, line: 404)
!478 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !464, file: !464, line: 1430, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !480, line: 405)
!480 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !481, file: !481, line: 667, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !483, line: 406)
!483 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !464, file: !464, line: 1189, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !485, line: 407)
!485 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !464, file: !464, line: 1243, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !487, line: 408)
!487 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !464, file: !464, line: 1312, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !489, line: 409)
!489 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !464, file: !464, line: 1490, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !491, line: 410)
!491 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !464, file: !464, line: 1480, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !493, line: 411)
!493 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !481, file: !481, line: 657, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !495, line: 412)
!495 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !464, file: !464, line: 1294, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !497, line: 413)
!497 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !464, file: !464, line: 1385, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !499, line: 414)
!499 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !481, file: !481, line: 607, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !501, line: 415)
!501 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !464, file: !464, line: 1616, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !503, line: 416)
!503 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !481, file: !481, line: 597, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !505, line: 417)
!505 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !464, file: !464, line: 1568, type: !78, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !507, line: 418)
!507 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !481, file: !481, line: 622, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !509, line: 419)
!509 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !481, file: !481, line: 617, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !511, line: 420)
!511 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !464, file: !464, line: 1553, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !513, line: 421)
!513 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !464, file: !464, line: 1543, type: !92, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !515, line: 422)
!515 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !464, file: !464, line: 1390, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !517, line: 423)
!517 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !464, file: !464, line: 1621, type: !88, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !519, line: 424)
!519 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !464, file: !464, line: 1520, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !521, line: 425)
!521 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !464, file: !464, line: 1515, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !523, line: 426)
!523 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !464, file: !464, line: 1149, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !525, line: 427)
!525 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !464, file: !464, line: 1602, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !527, line: 428)
!527 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !464, file: !464, line: 1356, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !529, line: 429)
!529 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !464, file: !464, line: 1365, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !531, line: 430)
!531 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !464, file: !464, line: 1285, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !533, line: 431)
!533 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !464, file: !464, line: 1626, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !535, line: 432)
!535 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !464, file: !464, line: 1347, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !537, line: 433)
!537 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !464, file: !464, line: 1140, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !539, line: 434)
!539 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !464, file: !464, line: 1607, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !541, line: 435)
!541 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !464, file: !464, line: 1548, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !543, line: 436)
!543 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !464, file: !464, line: 1154, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !545, line: 437)
!545 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !464, file: !464, line: 1218, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !547, line: 438)
!547 = !DISubprogram(name: "nexttowardf", scope: !220, file: !220, line: 294, type: !548, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!35, !35, !449}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !547, line: 439)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !552, line: 440)
!552 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !464, file: !464, line: 1583, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !554, line: 441)
!554 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !464, file: !464, line: 1558, type: !46, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !556, line: 442)
!556 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !464, file: !464, line: 1563, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !558, line: 443)
!558 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !464, file: !464, line: 1135, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !560, line: 444)
!560 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !464, file: !464, line: 1597, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !562, line: 445)
!562 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !464, file: !464, line: 1530, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !564, line: 446)
!564 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !464, file: !464, line: 1525, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !566, line: 447)
!566 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !464, file: !464, line: 1234, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !568, line: 448)
!568 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !464, file: !464, line: 1317, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !570, line: 449)
!570 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !481, file: !481, line: 907, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !572, line: 450)
!572 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !464, file: !464, line: 1276, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !574, line: 451)
!574 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !464, file: !464, line: 1322, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !576, line: 452)
!576 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !464, file: !464, line: 1592, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !578, line: 453)
!578 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !481, file: !481, line: 662, type: !33, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !DICompositeType(tag: DW_TAG_array_type, baseType: !580, size: 1024, align: 64, elements: !587)
!580 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !581, line: 104, size: 256, align: 64, elements: !582, identifier: "_ZTS6option")
!581 = !DIFile(filename: "/usr/include/getopt.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!582 = !{!583, !584, !585, !586}
!583 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !580, file: !581, line: 106, baseType: !169, size: 64, align: 64)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !580, file: !581, line: 109, baseType: !22, size: 32, align: 32, offset: 64)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !580, file: !581, line: 110, baseType: !94, size: 64, align: 64, offset: 128)
!586 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !580, file: !581, line: 111, baseType: !22, size: 32, align: 32, offset: 192)
!587 = !{!588}
!588 = !DISubrange(count: 4)
!589 = !{i32 2, !"Dwarf Version", i32 4}
!590 = !{i32 2, !"Debug Info Version", i32 3}
!591 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!592 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 53, type: !593, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !595)
!593 = !DISubroutineType(types: !594)
!594 = !{!22, !22, !389}
!595 = !{}
!596 = !DILocalVariable(name: "argc", arg: 1, scope: !592, file: !2, line: 53, type: !22)
!597 = !DIExpression()
!598 = !DILocation(line: 53, column: 12, scope: !592)
!599 = !DILocalVariable(name: "argv", arg: 2, scope: !592, file: !2, line: 53, type: !389)
!600 = !DILocation(line: 53, column: 24, scope: !592)
!601 = !DILocation(line: 55, column: 3, scope: !592)
!602 = !DILocalVariable(name: "matrix_dim", scope: !592, file: !2, line: 57, type: !22)
!603 = !DILocation(line: 57, column: 7, scope: !592)
!604 = !DILocalVariable(name: "opt", scope: !592, file: !2, line: 58, type: !22)
!605 = !DILocation(line: 58, column: 7, scope: !592)
!606 = !DILocalVariable(name: "option_index", scope: !592, file: !2, line: 58, type: !22)
!607 = !DILocation(line: 58, column: 12, scope: !592)
!608 = !DILocalVariable(name: "ret", scope: !592, file: !2, line: 59, type: !609)
!609 = !DIDerivedType(tag: DW_TAG_typedef, name: "func_ret_t", file: !5, line: 21, baseType: !4)
!610 = !DILocation(line: 59, column: 14, scope: !592)
!611 = !DILocalVariable(name: "input_file", scope: !592, file: !2, line: 60, type: !169)
!612 = !DILocation(line: 60, column: 15, scope: !592)
!613 = !DILocalVariable(name: "m", scope: !592, file: !2, line: 61, type: !163)
!614 = !DILocation(line: 61, column: 10, scope: !592)
!615 = !DILocalVariable(name: "d_m", scope: !592, file: !2, line: 61, type: !163)
!616 = !DILocation(line: 61, column: 14, scope: !592)
!617 = !DILocalVariable(name: "mm", scope: !592, file: !2, line: 61, type: !163)
!618 = !DILocation(line: 61, column: 20, scope: !592)
!619 = !DILocalVariable(name: "sw", scope: !592, file: !2, line: 62, type: !620)
!620 = !DIDerivedType(tag: DW_TAG_typedef, name: "stopwatch", file: !5, line: 26, baseType: !621)
!621 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__stopwatch_t", file: !5, line: 23, size: 256, align: 64, elements: !622, identifier: "_ZTS13__stopwatch_t")
!622 = !{!623, !632}
!623 = !DIDerivedType(tag: DW_TAG_member, name: "begin", scope: !621, file: !5, line: 24, baseType: !624, size: 128, align: 64)
!624 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !625, line: 30, size: 128, align: 64, elements: !626, identifier: "_ZTS7timeval")
!625 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!626 = !{!627, !630}
!627 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !624, file: !625, line: 32, baseType: !628, size: 64, align: 64)
!628 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !629, line: 139, baseType: !128)
!629 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!630 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !624, file: !625, line: 33, baseType: !631, size: 64, align: 64, offset: 64)
!631 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !629, line: 141, baseType: !128)
!632 = !DIDerivedType(tag: DW_TAG_member, name: "end", scope: !621, file: !5, line: 25, baseType: !624, size: 128, align: 64, offset: 128)
!633 = !DILocation(line: 62, column: 13, scope: !592)
!634 = !DILocation(line: 64, column: 3, scope: !592)
!635 = !DILocation(line: 64, column: 29, scope: !636)
!636 = !DILexicalBlockFile(scope: !592, file: !2, discriminator: 1)
!637 = !DILocation(line: 64, column: 35, scope: !636)
!638 = !DILocation(line: 64, column: 17, scope: !636)
!639 = !DILocation(line: 64, column: 15, scope: !636)
!640 = !DILocation(line: 65, column: 59, scope: !592)
!641 = !DILocation(line: 64, column: 3, scope: !636)
!642 = !DILocation(line: 66, column: 12, scope: !643)
!643 = distinct !DILexicalBlock(scope: !592, file: !2, line: 65, column: 67)
!644 = !DILocation(line: 66, column: 5, scope: !643)
!645 = !DILocation(line: 68, column: 20, scope: !646)
!646 = distinct !DILexicalBlock(scope: !643, file: !2, line: 66, column: 16)
!647 = !DILocation(line: 68, column: 18, scope: !646)
!648 = !DILocation(line: 69, column: 7, scope: !646)
!649 = !DILocation(line: 71, column: 17, scope: !646)
!650 = !DILocation(line: 72, column: 7, scope: !646)
!651 = !DILocation(line: 74, column: 25, scope: !646)
!652 = !DILocation(line: 74, column: 20, scope: !646)
!653 = !DILocation(line: 74, column: 18, scope: !646)
!654 = !DILocation(line: 75, column: 62, scope: !646)
!655 = !DILocation(line: 75, column: 7, scope: !646)
!656 = !DILocation(line: 79, column: 7, scope: !646)
!657 = !DILocation(line: 81, column: 15, scope: !646)
!658 = !DILocation(line: 81, column: 7, scope: !646)
!659 = !DILocation(line: 82, column: 7, scope: !646)
!660 = !DILocation(line: 84, column: 15, scope: !646)
!661 = !DILocation(line: 84, column: 7, scope: !646)
!662 = !DILocation(line: 85, column: 7, scope: !646)
!663 = !DILocation(line: 87, column: 15, scope: !646)
!664 = !DILocation(line: 88, column: 8, scope: !646)
!665 = !DILocation(line: 87, column: 7, scope: !646)
!666 = !DILocation(line: 89, column: 7, scope: !646)
!667 = !DILocation(line: 64, column: 3, scope: !668)
!668 = !DILexicalBlockFile(scope: !592, file: !2, discriminator: 2)
!669 = distinct !{!669, !634}
!670 = !DILocation(line: 93, column: 9, scope: !671)
!671 = distinct !DILexicalBlock(scope: !592, file: !2, line: 93, column: 8)
!672 = !DILocation(line: 93, column: 18, scope: !671)
!673 = !DILocation(line: 93, column: 16, scope: !671)
!674 = !DILocation(line: 93, column: 24, scope: !671)
!675 = !DILocation(line: 93, column: 28, scope: !676)
!676 = !DILexicalBlockFile(scope: !671, file: !2, discriminator: 1)
!677 = !DILocation(line: 93, column: 35, scope: !676)
!678 = !DILocation(line: 93, column: 8, scope: !676)
!679 = !DILocation(line: 94, column: 13, scope: !680)
!680 = distinct !DILexicalBlock(scope: !671, file: !2, line: 93, column: 42)
!681 = !DILocation(line: 94, column: 72, scope: !680)
!682 = !DILocation(line: 94, column: 5, scope: !680)
!683 = !DILocation(line: 95, column: 5, scope: !680)
!684 = !DILocation(line: 98, column: 7, scope: !685)
!685 = distinct !DILexicalBlock(scope: !592, file: !2, line: 98, column: 7)
!686 = !DILocation(line: 98, column: 7, scope: !592)
!687 = !DILocation(line: 99, column: 45, scope: !688)
!688 = distinct !DILexicalBlock(scope: !685, file: !2, line: 98, column: 19)
!689 = !DILocation(line: 99, column: 5, scope: !688)
!690 = !DILocation(line: 100, column: 39, scope: !688)
!691 = !DILocation(line: 100, column: 11, scope: !688)
!692 = !DILocation(line: 100, column: 9, scope: !688)
!693 = !DILocation(line: 101, column: 9, scope: !694)
!694 = distinct !DILexicalBlock(scope: !688, file: !2, line: 101, column: 9)
!695 = !DILocation(line: 101, column: 13, scope: !694)
!696 = !DILocation(line: 101, column: 9, scope: !688)
!697 = !DILocation(line: 102, column: 9, scope: !698)
!698 = distinct !DILexicalBlock(scope: !694, file: !2, line: 101, column: 29)
!699 = !DILocation(line: 103, column: 15, scope: !698)
!700 = !DILocation(line: 103, column: 61, scope: !698)
!701 = !DILocation(line: 103, column: 7, scope: !698)
!702 = !DILocation(line: 104, column: 7, scope: !698)
!703 = !DILocation(line: 106, column: 3, scope: !688)
!704 = !DILocation(line: 107, column: 12, scope: !705)
!705 = distinct !DILexicalBlock(scope: !685, file: !2, line: 107, column: 12)
!706 = !DILocation(line: 107, column: 12, scope: !685)
!707 = !DILocation(line: 108, column: 52, scope: !708)
!708 = distinct !DILexicalBlock(scope: !705, file: !2, line: 107, column: 24)
!709 = !DILocation(line: 108, column: 5, scope: !708)
!710 = !DILocation(line: 109, column: 29, scope: !708)
!711 = !DILocation(line: 109, column: 11, scope: !708)
!712 = !DILocation(line: 109, column: 9, scope: !708)
!713 = !DILocation(line: 110, column: 9, scope: !714)
!714 = distinct !DILexicalBlock(scope: !708, file: !2, line: 110, column: 9)
!715 = !DILocation(line: 110, column: 13, scope: !714)
!716 = !DILocation(line: 110, column: 9, scope: !708)
!717 = !DILocation(line: 111, column: 9, scope: !718)
!718 = distinct !DILexicalBlock(scope: !714, file: !2, line: 110, column: 29)
!719 = !DILocation(line: 112, column: 15, scope: !718)
!720 = !DILocation(line: 112, column: 67, scope: !718)
!721 = !DILocation(line: 112, column: 7, scope: !718)
!722 = !DILocation(line: 113, column: 7, scope: !718)
!723 = !DILocation(line: 115, column: 3, scope: !708)
!724 = !DILocation(line: 119, column: 5, scope: !725)
!725 = distinct !DILexicalBlock(scope: !705, file: !2, line: 118, column: 8)
!726 = !DILocation(line: 120, column: 5, scope: !725)
!727 = !DILocation(line: 123, column: 7, scope: !728)
!728 = distinct !DILexicalBlock(scope: !592, file: !2, line: 123, column: 7)
!729 = !DILocation(line: 123, column: 7, scope: !592)
!730 = !DILocation(line: 124, column: 5, scope: !731)
!731 = distinct !DILexicalBlock(scope: !728, file: !2, line: 123, column: 17)
!732 = !DILocation(line: 126, column: 22, scope: !731)
!733 = !DILocation(line: 126, column: 30, scope: !731)
!734 = !DILocation(line: 126, column: 5, scope: !731)
!735 = !DILocation(line: 127, column: 3, scope: !731)
!736 = !DILocation(line: 129, column: 14, scope: !592)
!737 = !DILocation(line: 130, column: 14, scope: !592)
!738 = !DILocation(line: 130, column: 25, scope: !592)
!739 = !DILocation(line: 130, column: 24, scope: !592)
!740 = !DILocation(line: 130, column: 35, scope: !592)
!741 = !DILocation(line: 129, column: 3, scope: !592)
!742 = !DILocation(line: 133, column: 3, scope: !592)
!743 = !DILocation(line: 134, column: 14, scope: !592)
!744 = !DILocation(line: 134, column: 19, scope: !592)
!745 = !DILocation(line: 134, column: 22, scope: !592)
!746 = !DILocation(line: 134, column: 33, scope: !592)
!747 = !DILocation(line: 134, column: 32, scope: !592)
!748 = !DILocation(line: 134, column: 43, scope: !592)
!749 = !DILocation(line: 134, column: 3, scope: !592)
!750 = !DILocation(line: 137, column: 12, scope: !592)
!751 = !DILocation(line: 137, column: 17, scope: !592)
!752 = !DILocation(line: 137, column: 3, scope: !592)
!753 = !DILocation(line: 139, column: 14, scope: !592)
!754 = !DILocation(line: 139, column: 17, scope: !592)
!755 = !DILocation(line: 139, column: 22, scope: !592)
!756 = !DILocation(line: 139, column: 33, scope: !592)
!757 = !DILocation(line: 139, column: 32, scope: !592)
!758 = !DILocation(line: 139, column: 43, scope: !592)
!759 = !DILocation(line: 139, column: 3, scope: !592)
!760 = !DILocation(line: 143, column: 3, scope: !592)
!761 = !DILocation(line: 144, column: 43, scope: !592)
!762 = !DILocation(line: 144, column: 42, scope: !592)
!763 = !DILocation(line: 144, column: 3, scope: !636)
!764 = !DILocation(line: 146, column: 12, scope: !592)
!765 = !DILocation(line: 146, column: 3, scope: !592)
!766 = !DILocation(line: 149, column: 7, scope: !767)
!767 = distinct !DILexicalBlock(scope: !592, file: !2, line: 149, column: 7)
!768 = !DILocation(line: 149, column: 7, scope: !592)
!769 = !DILocation(line: 150, column: 5, scope: !770)
!770 = distinct !DILexicalBlock(scope: !767, file: !2, line: 149, column: 17)
!771 = !DILocation(line: 152, column: 5, scope: !770)
!772 = !DILocation(line: 153, column: 16, scope: !770)
!773 = !DILocation(line: 153, column: 20, scope: !770)
!774 = !DILocation(line: 153, column: 23, scope: !770)
!775 = !DILocation(line: 153, column: 5, scope: !770)
!776 = !DILocation(line: 154, column: 10, scope: !770)
!777 = !DILocation(line: 154, column: 5, scope: !770)
!778 = !DILocation(line: 155, column: 3, scope: !770)
!779 = !DILocation(line: 157, column: 8, scope: !592)
!780 = !DILocation(line: 157, column: 3, scope: !592)
!781 = !DILocation(line: 159, column: 3, scope: !592)
