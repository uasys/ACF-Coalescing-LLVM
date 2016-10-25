; ModuleID = 'hotspot.cu'
source_filename = "hotspot.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@t_chip = global float 0x3F40624DE0000000, align 4, !dbg !0
@chip_height = global float 0x3F90624DE0000000, align 4, !dbg !18
@chip_width = global float 0x3F90624DE0000000, align 4, !dbg !19
@amb_temp = global float 8.000000e+01, align 4, !dbg !20
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [11 x i8] c"error: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"The file was not opened\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%d\09%g\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"not enough lines in file\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"invalid file format\00", align 1
@.str.8 = private unnamed_addr constant [100 x i8] c"Usage: %s <grid_rows/grid_cols> <pyramid_height> <sim_time> <temp_file> <power_file> <output_file>\0A\00", align 1
@.str.9 = private unnamed_addr constant [78 x i8] c"\09<grid_rows/grid_cols>  - number of rows/cols in the grid (positive integer)\0A\00", align 1
@.str.10 = private unnamed_addr constant [53 x i8] c"\09<pyramid_height> - pyramid heigh(positive integer)\0A\00", align 1
@.str.11 = private unnamed_addr constant [38 x i8] c"\09<sim_time>   - number of iterations\0A\00", align 1
@.str.12 = private unnamed_addr constant [89 x i8] c"\09<temp_file>  - name of the file containing the initial temperature values of each cell\0A\00", align 1
@.str.13 = private unnamed_addr constant [86 x i8] c"\09<power_file> - name of the file containing the dissipated power values of each cell\0A\00", align 1
@.str.14 = private unnamed_addr constant [42 x i8] c"\09<output_file> - name of the output file\0A\00", align 1
@.str.15 = private unnamed_addr constant [29 x i8] c"WG size of kernel = %d X %d\0A\00", align 1
@.str.16 = private unnamed_addr constant [26 x i8] c"unable to allocate memory\00", align 1
@.str.17 = private unnamed_addr constant [94 x i8] c"pyramidHeight: %d\0AgridSize: [%d, %d]\0Aborder:[%d, %d]\0AblockGrid:[%d, %d]\0AtargetBlock:[%d, %d]\0A\00", align 1
@.str.18 = private unnamed_addr constant [43 x i8] c"Start computing the transient temperature\0A\00", align 1
@.str.19 = private unnamed_addr constant [19 x i8] c"Ending simulation\0A\00", align 1

; Function Attrs: uwtable
define void @_Z5fatalPc(i8* %s) #0 !dbg !579 {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !583, metadata !584), !dbg !585
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !586
  %1 = load i8*, i8** %s.addr, align 8, !dbg !587
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !588
  ret void, !dbg !589
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: uwtable
define void @_Z11writeoutputPfiiPc(float* %vect, i32 %grid_rows, i32 %grid_cols, i8* %file) #0 !dbg !590 {
entry:
  %vect.addr = alloca float*, align 8
  %grid_rows.addr = alloca i32, align 4
  %grid_cols.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %index = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 8
  %str = alloca [256 x i8], align 16
  store float* %vect, float** %vect.addr, align 8
  call void @llvm.dbg.declare(metadata float** %vect.addr, metadata !593, metadata !584), !dbg !594
  store i32 %grid_rows, i32* %grid_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_rows.addr, metadata !595, metadata !584), !dbg !596
  store i32 %grid_cols, i32* %grid_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_cols.addr, metadata !597, metadata !584), !dbg !598
  store i8* %file, i8** %file.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %file.addr, metadata !599, metadata !584), !dbg !600
  call void @llvm.dbg.declare(metadata i32* %i, metadata !601, metadata !584), !dbg !602
  call void @llvm.dbg.declare(metadata i32* %j, metadata !603, metadata !584), !dbg !604
  call void @llvm.dbg.declare(metadata i32* %index, metadata !605, metadata !584), !dbg !606
  store i32 0, i32* %index, align 4, !dbg !606
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !607, metadata !584), !dbg !613
  call void @llvm.dbg.declare(metadata [256 x i8]* %str, metadata !614, metadata !584), !dbg !618
  %0 = load i8*, i8** %file.addr, align 8, !dbg !619
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !621
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !622
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !623
  br i1 %cmp, label %if.then, label %if.end, !dbg !624

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i32 0, i32 0)), !dbg !625
  br label %if.end, !dbg !625

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4, !dbg !626
  br label %for.cond, !dbg !628

for.cond:                                         ; preds = %for.inc10, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !629
  %2 = load i32, i32* %grid_rows.addr, align 4, !dbg !632
  %cmp2 = icmp slt i32 %1, %2, !dbg !633
  br i1 %cmp2, label %for.body, label %for.end12, !dbg !634

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !635
  br label %for.cond3, !dbg !637

for.cond3:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !638
  %4 = load i32, i32* %grid_cols.addr, align 4, !dbg !641
  %cmp4 = icmp slt i32 %3, %4, !dbg !642
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !643

for.body5:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !644
  %5 = load i32, i32* %index, align 4, !dbg !646
  %6 = load float*, float** %vect.addr, align 8, !dbg !647
  %7 = load i32, i32* %i, align 4, !dbg !648
  %8 = load i32, i32* %grid_cols.addr, align 4, !dbg !649
  %mul = mul nsw i32 %7, %8, !dbg !650
  %9 = load i32, i32* %j, align 4, !dbg !651
  %add = add nsw i32 %mul, %9, !dbg !652
  %idxprom = sext i32 %add to i64, !dbg !647
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom, !dbg !647
  %10 = load float, float* %arrayidx, align 4, !dbg !647
  %conv = fpext float %10 to double, !dbg !647
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i32 %5, double %conv) #9, !dbg !653
  %arraydecay7 = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !654
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !655
  %call8 = call i32 @fputs(i8* %arraydecay7, %struct._IO_FILE* %11), !dbg !656
  %12 = load i32, i32* %index, align 4, !dbg !657
  %inc = add nsw i32 %12, 1, !dbg !657
  store i32 %inc, i32* %index, align 4, !dbg !657
  br label %for.inc, !dbg !658

for.inc:                                          ; preds = %for.body5
  %13 = load i32, i32* %j, align 4, !dbg !659
  %inc9 = add nsw i32 %13, 1, !dbg !659
  store i32 %inc9, i32* %j, align 4, !dbg !659
  br label %for.cond3, !dbg !661, !llvm.loop !662

for.end:                                          ; preds = %for.cond3
  br label %for.inc10, !dbg !664

for.inc10:                                        ; preds = %for.end
  %14 = load i32, i32* %i, align 4, !dbg !666
  %inc11 = add nsw i32 %14, 1, !dbg !666
  store i32 %inc11, i32* %i, align 4, !dbg !666
  br label %for.cond, !dbg !668, !llvm.loop !669

for.end12:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !671
  %call13 = call i32 @fclose(%struct._IO_FILE* %15), !dbg !672
  ret void, !dbg !673
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

declare i32 @fputs(i8*, %struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: uwtable
define void @_Z9readinputPfiiPc(float* %vect, i32 %grid_rows, i32 %grid_cols, i8* %file) #0 !dbg !674 {
entry:
  %vect.addr = alloca float*, align 8
  %grid_rows.addr = alloca i32, align 4
  %grid_cols.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 8
  %str = alloca [256 x i8], align 16
  %val = alloca float, align 4
  store float* %vect, float** %vect.addr, align 8
  call void @llvm.dbg.declare(metadata float** %vect.addr, metadata !675, metadata !584), !dbg !676
  store i32 %grid_rows, i32* %grid_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_rows.addr, metadata !677, metadata !584), !dbg !678
  store i32 %grid_cols, i32* %grid_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_cols.addr, metadata !679, metadata !584), !dbg !680
  store i8* %file, i8** %file.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %file.addr, metadata !681, metadata !584), !dbg !682
  call void @llvm.dbg.declare(metadata i32* %i, metadata !683, metadata !584), !dbg !684
  call void @llvm.dbg.declare(metadata i32* %j, metadata !685, metadata !584), !dbg !686
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !687, metadata !584), !dbg !688
  call void @llvm.dbg.declare(metadata [256 x i8]* %str, metadata !689, metadata !584), !dbg !690
  call void @llvm.dbg.declare(metadata float* %val, metadata !691, metadata !584), !dbg !692
  %0 = load i8*, i8** %file.addr, align 8, !dbg !693
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0)), !dbg !695
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !696
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !697
  br i1 %cmp, label %if.then, label %if.end, !dbg !698

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i32 0, i32 0)), !dbg !699
  br label %if.end, !dbg !699

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4, !dbg !700
  br label %for.cond, !dbg !702

for.cond:                                         ; preds = %for.inc16, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !703
  %2 = load i32, i32* %grid_rows.addr, align 4, !dbg !706
  %sub = sub nsw i32 %2, 1, !dbg !707
  %cmp2 = icmp sle i32 %1, %sub, !dbg !708
  br i1 %cmp2, label %for.body, label %for.end18, !dbg !709

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !710
  br label %for.cond3, !dbg !712

for.cond3:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !713
  %4 = load i32, i32* %grid_cols.addr, align 4, !dbg !716
  %sub4 = sub nsw i32 %4, 1, !dbg !717
  %cmp5 = icmp sle i32 %3, %sub4, !dbg !718
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !719

for.body6:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !720
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !722
  %call7 = call i8* @fgets(i8* %arraydecay, i32 256, %struct._IO_FILE* %5), !dbg !723
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !724
  %call8 = call i32 @feof(%struct._IO_FILE* %6) #9, !dbg !726
  %tobool = icmp ne i32 %call8, 0, !dbg !726
  br i1 %tobool, label %if.then9, label %if.end10, !dbg !727

if.then9:                                         ; preds = %for.body6
  call void @_Z5fatalPc(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i32 0, i32 0)), !dbg !728
  br label %if.end10, !dbg !728

if.end10:                                         ; preds = %if.then9, %for.body6
  %arraydecay11 = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !729
  %call12 = call i32 (i8*, i8*, ...) @sscanf(i8* %arraydecay11, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), float* %val) #9, !dbg !731
  %cmp13 = icmp ne i32 %call12, 1, !dbg !732
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !733

if.then14:                                        ; preds = %if.end10
  call void @_Z5fatalPc(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i32 0, i32 0)), !dbg !734
  br label %if.end15, !dbg !734

if.end15:                                         ; preds = %if.then14, %if.end10
  %7 = load float, float* %val, align 4, !dbg !735
  %8 = load float*, float** %vect.addr, align 8, !dbg !736
  %9 = load i32, i32* %i, align 4, !dbg !737
  %10 = load i32, i32* %grid_cols.addr, align 4, !dbg !738
  %mul = mul nsw i32 %9, %10, !dbg !739
  %11 = load i32, i32* %j, align 4, !dbg !740
  %add = add nsw i32 %mul, %11, !dbg !741
  %idxprom = sext i32 %add to i64, !dbg !736
  %arrayidx = getelementptr inbounds float, float* %8, i64 %idxprom, !dbg !736
  store float %7, float* %arrayidx, align 4, !dbg !742
  br label %for.inc, !dbg !743

for.inc:                                          ; preds = %if.end15
  %12 = load i32, i32* %j, align 4, !dbg !744
  %inc = add nsw i32 %12, 1, !dbg !744
  store i32 %inc, i32* %j, align 4, !dbg !744
  br label %for.cond3, !dbg !746, !llvm.loop !747

for.end:                                          ; preds = %for.cond3
  br label %for.inc16, !dbg !749

for.inc16:                                        ; preds = %for.end
  %13 = load i32, i32* %i, align 4, !dbg !751
  %inc17 = add nsw i32 %13, 1, !dbg !751
  store i32 %inc17, i32* %i, align 4, !dbg !751
  br label %for.cond, !dbg !753, !llvm.loop !754

for.end18:                                        ; preds = %for.cond
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !756
  %call19 = call i32 @fclose(%struct._IO_FILE* %14), !dbg !757
  ret void, !dbg !758
}

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare i32 @sscanf(i8*, i8*, ...) #3

; Function Attrs: uwtable
define void @_Z14calculate_tempiPfS_S_iiiiffffff(i32 %iteration, float* %power, float* %temp_src, float* %temp_dst, i32 %grid_cols, i32 %grid_rows, i32 %border_cols, i32 %border_rows, float %Cap, float %Rx, float %Ry, float %Rz, float %step, float %time_elapsed) #0 !dbg !759 {
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
  store i32 %iteration, i32* %iteration.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %iteration.addr, metadata !762, metadata !584), !dbg !763
  store float* %power, float** %power.addr, align 8
  call void @llvm.dbg.declare(metadata float** %power.addr, metadata !764, metadata !584), !dbg !765
  store float* %temp_src, float** %temp_src.addr, align 8
  call void @llvm.dbg.declare(metadata float** %temp_src.addr, metadata !766, metadata !584), !dbg !767
  store float* %temp_dst, float** %temp_dst.addr, align 8
  call void @llvm.dbg.declare(metadata float** %temp_dst.addr, metadata !768, metadata !584), !dbg !769
  store i32 %grid_cols, i32* %grid_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_cols.addr, metadata !770, metadata !584), !dbg !771
  store i32 %grid_rows, i32* %grid_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_rows.addr, metadata !772, metadata !584), !dbg !773
  store i32 %border_cols, i32* %border_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %border_cols.addr, metadata !774, metadata !584), !dbg !775
  store i32 %border_rows, i32* %border_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %border_rows.addr, metadata !776, metadata !584), !dbg !777
  store float %Cap, float* %Cap.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Cap.addr, metadata !778, metadata !584), !dbg !779
  store float %Rx, float* %Rx.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rx.addr, metadata !780, metadata !584), !dbg !781
  store float %Ry, float* %Ry.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Ry.addr, metadata !782, metadata !584), !dbg !783
  store float %Rz, float* %Rz.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rz.addr, metadata !784, metadata !584), !dbg !785
  store float %step, float* %step.addr, align 4
  call void @llvm.dbg.declare(metadata float* %step.addr, metadata !786, metadata !584), !dbg !787
  store float %time_elapsed, float* %time_elapsed.addr, align 4
  call void @llvm.dbg.declare(metadata float* %time_elapsed.addr, metadata !788, metadata !584), !dbg !789
  %0 = bitcast i32* %iteration.addr to i8*, !dbg !790
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !790
  %2 = icmp eq i32 %1, 0, !dbg !790
  br i1 %2, label %setup.next, label %setup.end, !dbg !790

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %power.addr to i8*, !dbg !791
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !791
  %5 = icmp eq i32 %4, 0, !dbg !791
  br i1 %5, label %setup.next1, label %setup.end, !dbg !791

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %temp_src.addr to i8*, !dbg !793
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !793
  %8 = icmp eq i32 %7, 0, !dbg !793
  br i1 %8, label %setup.next2, label %setup.end, !dbg !793

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %temp_dst.addr to i8*, !dbg !795
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !795
  %11 = icmp eq i32 %10, 0, !dbg !795
  br i1 %11, label %setup.next3, label %setup.end, !dbg !795

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %grid_cols.addr to i8*, !dbg !797
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 32), !dbg !797
  %14 = icmp eq i32 %13, 0, !dbg !797
  br i1 %14, label %setup.next4, label %setup.end, !dbg !797

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %grid_rows.addr to i8*, !dbg !799
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 36), !dbg !799
  %17 = icmp eq i32 %16, 0, !dbg !799
  br i1 %17, label %setup.next5, label %setup.end, !dbg !799

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %border_cols.addr to i8*, !dbg !801
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 40), !dbg !801
  %20 = icmp eq i32 %19, 0, !dbg !801
  br i1 %20, label %setup.next6, label %setup.end, !dbg !801

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %border_rows.addr to i8*, !dbg !803
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 44), !dbg !803
  %23 = icmp eq i32 %22, 0, !dbg !803
  br i1 %23, label %setup.next7, label %setup.end, !dbg !803

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %Cap.addr to i8*, !dbg !805
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 4, i64 48), !dbg !805
  %26 = icmp eq i32 %25, 0, !dbg !805
  br i1 %26, label %setup.next8, label %setup.end, !dbg !805

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast float* %Rx.addr to i8*, !dbg !807
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 4, i64 52), !dbg !807
  %29 = icmp eq i32 %28, 0, !dbg !807
  br i1 %29, label %setup.next9, label %setup.end, !dbg !807

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast float* %Ry.addr to i8*, !dbg !809
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 4, i64 56), !dbg !809
  %32 = icmp eq i32 %31, 0, !dbg !809
  br i1 %32, label %setup.next10, label %setup.end, !dbg !809

setup.next10:                                     ; preds = %setup.next9
  %33 = bitcast float* %Rz.addr to i8*, !dbg !811
  %34 = call i32 @cudaSetupArgument(i8* %33, i64 4, i64 60), !dbg !811
  %35 = icmp eq i32 %34, 0, !dbg !811
  br i1 %35, label %setup.next11, label %setup.end, !dbg !811

setup.next11:                                     ; preds = %setup.next10
  %36 = bitcast float* %step.addr to i8*, !dbg !813
  %37 = call i32 @cudaSetupArgument(i8* %36, i64 4, i64 64), !dbg !813
  %38 = icmp eq i32 %37, 0, !dbg !813
  br i1 %38, label %setup.next12, label %setup.end, !dbg !813

setup.next12:                                     ; preds = %setup.next11
  %39 = bitcast float* %time_elapsed.addr to i8*, !dbg !815
  %40 = call i32 @cudaSetupArgument(i8* %39, i64 4, i64 68), !dbg !815
  %41 = icmp eq i32 %40, 0, !dbg !815
  br i1 %41, label %setup.next13, label %setup.end, !dbg !815

setup.next13:                                     ; preds = %setup.next12
  %42 = call i32 @cudaLaunch(i8* bitcast (void (i32, float*, float*, float*, i32, i32, i32, i32, float, float, float, float, float, float)* @_Z14calculate_tempiPfS_S_iiiiffffff to i8*)), !dbg !817
  br label %setup.end, !dbg !817

setup.end:                                        ; preds = %setup.next13, %setup.next12, %setup.next11, %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !819
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define i32 @_Z17compute_tran_tempPfPS_iiiiiiii(float* %MatrixPower, float** %MatrixTemp, i32 %col, i32 %row, i32 %total_iterations, i32 %num_iterations, i32 %blockCols, i32 %blockRows, i32 %borderCols, i32 %borderRows) #0 !dbg !820 {
entry:
  %MatrixPower.addr = alloca float*, align 8
  %MatrixTemp.addr = alloca float**, align 8
  %col.addr = alloca i32, align 4
  %row.addr = alloca i32, align 4
  %total_iterations.addr = alloca i32, align 4
  %num_iterations.addr = alloca i32, align 4
  %blockCols.addr = alloca i32, align 4
  %blockRows.addr = alloca i32, align 4
  %borderCols.addr = alloca i32, align 4
  %borderRows.addr = alloca i32, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %dimGrid = alloca %struct.dim3, align 4
  %grid_height = alloca float, align 4
  %grid_width = alloca float, align 4
  %Cap = alloca float, align 4
  %Rx = alloca float, align 4
  %Ry = alloca float, align 4
  %Rz = alloca float, align 4
  %max_slope = alloca float, align 4
  %step = alloca float, align 4
  %t = alloca float, align 4
  %time_elapsed = alloca float, align 4
  %src = alloca i32, align 4
  %dst = alloca i32, align 4
  %temp = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp35 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp35.coerce = alloca { i64, i32 }, align 4
  store float* %MatrixPower, float** %MatrixPower.addr, align 8
  call void @llvm.dbg.declare(metadata float** %MatrixPower.addr, metadata !824, metadata !584), !dbg !825
  store float** %MatrixTemp, float*** %MatrixTemp.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %MatrixTemp.addr, metadata !826, metadata !584), !dbg !827
  store i32 %col, i32* %col.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %col.addr, metadata !828, metadata !584), !dbg !829
  store i32 %row, i32* %row.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %row.addr, metadata !830, metadata !584), !dbg !831
  store i32 %total_iterations, i32* %total_iterations.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %total_iterations.addr, metadata !832, metadata !584), !dbg !833
  store i32 %num_iterations, i32* %num_iterations.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_iterations.addr, metadata !834, metadata !584), !dbg !835
  store i32 %blockCols, i32* %blockCols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %blockCols.addr, metadata !836, metadata !584), !dbg !837
  store i32 %blockRows, i32* %blockRows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %blockRows.addr, metadata !838, metadata !584), !dbg !839
  store i32 %borderCols, i32* %borderCols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %borderCols.addr, metadata !840, metadata !584), !dbg !841
  store i32 %borderRows, i32* %borderRows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %borderRows.addr, metadata !842, metadata !584), !dbg !843
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !844, metadata !584), !dbg !868
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlock, i32 16, i32 16, i32 1), !dbg !868
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !869, metadata !584), !dbg !870
  %0 = load i32, i32* %blockCols.addr, align 4, !dbg !871
  %1 = load i32, i32* %blockRows.addr, align 4, !dbg !872
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGrid, i32 %0, i32 %1, i32 1), !dbg !870
  call void @llvm.dbg.declare(metadata float* %grid_height, metadata !873, metadata !584), !dbg !874
  %2 = load float, float* @chip_height, align 4, !dbg !875
  %3 = load i32, i32* %row.addr, align 4, !dbg !876
  %conv = sitofp i32 %3 to float, !dbg !876
  %div = fdiv float %2, %conv, !dbg !877
  store float %div, float* %grid_height, align 4, !dbg !874
  call void @llvm.dbg.declare(metadata float* %grid_width, metadata !878, metadata !584), !dbg !879
  %4 = load float, float* @chip_width, align 4, !dbg !880
  %5 = load i32, i32* %col.addr, align 4, !dbg !881
  %conv1 = sitofp i32 %5 to float, !dbg !881
  %div2 = fdiv float %4, %conv1, !dbg !882
  store float %div2, float* %grid_width, align 4, !dbg !879
  call void @llvm.dbg.declare(metadata float* %Cap, metadata !883, metadata !584), !dbg !884
  %6 = load float, float* @t_chip, align 4, !dbg !885
  %conv3 = fpext float %6 to double, !dbg !885
  %mul = fmul double 8.750000e+05, %conv3, !dbg !886
  %7 = load float, float* %grid_width, align 4, !dbg !887
  %conv4 = fpext float %7 to double, !dbg !887
  %mul5 = fmul double %mul, %conv4, !dbg !888
  %8 = load float, float* %grid_height, align 4, !dbg !889
  %conv6 = fpext float %8 to double, !dbg !889
  %mul7 = fmul double %mul5, %conv6, !dbg !890
  %conv8 = fptrunc double %mul7 to float, !dbg !891
  store float %conv8, float* %Cap, align 4, !dbg !884
  call void @llvm.dbg.declare(metadata float* %Rx, metadata !892, metadata !584), !dbg !893
  %9 = load float, float* %grid_width, align 4, !dbg !894
  %conv9 = fpext float %9 to double, !dbg !894
  %10 = load float, float* @t_chip, align 4, !dbg !895
  %conv10 = fpext float %10 to double, !dbg !895
  %mul11 = fmul double 2.000000e+02, %conv10, !dbg !896
  %11 = load float, float* %grid_height, align 4, !dbg !897
  %conv12 = fpext float %11 to double, !dbg !897
  %mul13 = fmul double %mul11, %conv12, !dbg !898
  %div14 = fdiv double %conv9, %mul13, !dbg !899
  %conv15 = fptrunc double %div14 to float, !dbg !894
  store float %conv15, float* %Rx, align 4, !dbg !893
  call void @llvm.dbg.declare(metadata float* %Ry, metadata !900, metadata !584), !dbg !901
  %12 = load float, float* %grid_height, align 4, !dbg !902
  %conv16 = fpext float %12 to double, !dbg !902
  %13 = load float, float* @t_chip, align 4, !dbg !903
  %conv17 = fpext float %13 to double, !dbg !903
  %mul18 = fmul double 2.000000e+02, %conv17, !dbg !904
  %14 = load float, float* %grid_width, align 4, !dbg !905
  %conv19 = fpext float %14 to double, !dbg !905
  %mul20 = fmul double %mul18, %conv19, !dbg !906
  %div21 = fdiv double %conv16, %mul20, !dbg !907
  %conv22 = fptrunc double %div21 to float, !dbg !902
  store float %conv22, float* %Ry, align 4, !dbg !901
  call void @llvm.dbg.declare(metadata float* %Rz, metadata !908, metadata !584), !dbg !909
  %15 = load float, float* @t_chip, align 4, !dbg !910
  %16 = load float, float* %grid_height, align 4, !dbg !911
  %mul23 = fmul float 1.000000e+02, %16, !dbg !912
  %17 = load float, float* %grid_width, align 4, !dbg !913
  %mul24 = fmul float %mul23, %17, !dbg !914
  %div25 = fdiv float %15, %mul24, !dbg !915
  store float %div25, float* %Rz, align 4, !dbg !909
  call void @llvm.dbg.declare(metadata float* %max_slope, metadata !916, metadata !584), !dbg !917
  %18 = load float, float* @t_chip, align 4, !dbg !918
  %conv26 = fpext float %18 to double, !dbg !918
  %mul27 = fmul double 5.000000e-01, %conv26, !dbg !919
  %mul28 = fmul double %mul27, 1.750000e+06, !dbg !920
  %div29 = fdiv double 3.000000e+06, %mul28, !dbg !921
  %conv30 = fptrunc double %div29 to float, !dbg !922
  store float %conv30, float* %max_slope, align 4, !dbg !917
  call void @llvm.dbg.declare(metadata float* %step, metadata !923, metadata !584), !dbg !924
  %19 = load float, float* %max_slope, align 4, !dbg !925
  %conv31 = fpext float %19 to double, !dbg !925
  %div32 = fdiv double 1.000000e-03, %conv31, !dbg !926
  %conv33 = fptrunc double %div32 to float, !dbg !927
  store float %conv33, float* %step, align 4, !dbg !924
  call void @llvm.dbg.declare(metadata float* %t, metadata !928, metadata !584), !dbg !929
  call void @llvm.dbg.declare(metadata float* %time_elapsed, metadata !930, metadata !584), !dbg !931
  store float 0x3F50624DE0000000, float* %time_elapsed, align 4, !dbg !932
  call void @llvm.dbg.declare(metadata i32* %src, metadata !933, metadata !584), !dbg !934
  store i32 1, i32* %src, align 4, !dbg !934
  call void @llvm.dbg.declare(metadata i32* %dst, metadata !935, metadata !584), !dbg !936
  store i32 0, i32* %dst, align 4, !dbg !936
  store float 0.000000e+00, float* %t, align 4, !dbg !937
  br label %for.cond, !dbg !939

for.cond:                                         ; preds = %for.inc, %entry
  %20 = load float, float* %t, align 4, !dbg !940
  %21 = load i32, i32* %total_iterations.addr, align 4, !dbg !943
  %conv34 = sitofp i32 %21 to float, !dbg !943
  %cmp = fcmp olt float %20, %conv34, !dbg !944
  br i1 %cmp, label %for.body, label %for.end, !dbg !945

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !946, metadata !584), !dbg !948
  %22 = load i32, i32* %src, align 4, !dbg !949
  store i32 %22, i32* %temp, align 4, !dbg !948
  %23 = load i32, i32* %dst, align 4, !dbg !950
  store i32 %23, i32* %src, align 4, !dbg !951
  %24 = load i32, i32* %temp, align 4, !dbg !952
  store i32 %24, i32* %dst, align 4, !dbg !953
  %25 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !954
  %26 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !954
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 12, i32 4, i1 false), !dbg !954
  %27 = bitcast %struct.dim3* %agg.tmp35 to i8*, !dbg !955
  %28 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !955
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 12, i32 4, i1 false), !dbg !955
  %29 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !956
  %30 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !956
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 12, i32 4, i1 false), !dbg !956
  %31 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !956
  %32 = load i64, i64* %31, align 4, !dbg !956
  %33 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !956
  %34 = load i32, i32* %33, align 4, !dbg !956
  %35 = bitcast { i64, i32 }* %agg.tmp35.coerce to i8*, !dbg !956
  %36 = bitcast %struct.dim3* %agg.tmp35 to i8*, !dbg !956
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* %36, i64 12, i32 4, i1 false), !dbg !956
  %37 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp35.coerce, i32 0, i32 0, !dbg !956
  %38 = load i64, i64* %37, align 4, !dbg !956
  %39 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp35.coerce, i32 0, i32 1, !dbg !956
  %40 = load i32, i32* %39, align 4, !dbg !956
  %call = call i32 @cudaConfigureCall(i64 %32, i32 %34, i64 %38, i32 %40, i64 0, %struct.CUstream_st* null), !dbg !956
  %tobool = icmp ne i32 %call, 0, !dbg !956
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !957

kcall.configok:                                   ; preds = %for.body
  %41 = load i32, i32* %num_iterations.addr, align 4, !dbg !958
  %conv36 = sitofp i32 %41 to float, !dbg !958
  %42 = load i32, i32* %total_iterations.addr, align 4, !dbg !958
  %conv37 = sitofp i32 %42 to float, !dbg !958
  %43 = load float, float* %t, align 4, !dbg !958
  %sub = fsub float %conv37, %43, !dbg !958
  %cmp38 = fcmp ole float %conv36, %sub, !dbg !958
  br i1 %cmp38, label %cond.true, label %cond.false, !dbg !958

cond.true:                                        ; preds = %kcall.configok
  %44 = load i32, i32* %num_iterations.addr, align 4, !dbg !960
  %conv39 = sitofp i32 %44 to float, !dbg !960
  br label %cond.end, !dbg !960

cond.false:                                       ; preds = %kcall.configok
  %45 = load i32, i32* %total_iterations.addr, align 4, !dbg !962
  %conv40 = sitofp i32 %45 to float, !dbg !962
  %46 = load float, float* %t, align 4, !dbg !962
  %sub41 = fsub float %conv40, %46, !dbg !962
  br label %cond.end, !dbg !962

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %conv39, %cond.true ], [ %sub41, %cond.false ], !dbg !964
  %conv42 = fptosi float %cond to i32, !dbg !964
  %47 = load float*, float** %MatrixPower.addr, align 8, !dbg !966
  %48 = load float**, float*** %MatrixTemp.addr, align 8, !dbg !967
  %49 = load i32, i32* %src, align 4, !dbg !968
  %idxprom = sext i32 %49 to i64, !dbg !967
  %arrayidx = getelementptr inbounds float*, float** %48, i64 %idxprom, !dbg !967
  %50 = load float*, float** %arrayidx, align 8, !dbg !967
  %51 = load float**, float*** %MatrixTemp.addr, align 8, !dbg !969
  %52 = load i32, i32* %dst, align 4, !dbg !970
  %idxprom43 = sext i32 %52 to i64, !dbg !969
  %arrayidx44 = getelementptr inbounds float*, float** %51, i64 %idxprom43, !dbg !969
  %53 = load float*, float** %arrayidx44, align 8, !dbg !969
  %54 = load i32, i32* %col.addr, align 4, !dbg !971
  %55 = load i32, i32* %row.addr, align 4, !dbg !972
  %56 = load i32, i32* %borderCols.addr, align 4, !dbg !973
  %57 = load i32, i32* %borderRows.addr, align 4, !dbg !974
  %58 = load float, float* %Cap, align 4, !dbg !975
  %59 = load float, float* %Rx, align 4, !dbg !976
  %60 = load float, float* %Ry, align 4, !dbg !977
  %61 = load float, float* %Rz, align 4, !dbg !978
  %62 = load float, float* %step, align 4, !dbg !979
  %63 = load float, float* %time_elapsed, align 4, !dbg !980
  call void @_Z14calculate_tempiPfS_S_iiiiffffff(i32 %conv42, float* %47, float* %50, float* %53, i32 %54, i32 %55, i32 %56, i32 %57, float %58, float %59, float %60, float %61, float %62, float %63), !dbg !981
  br label %kcall.end, !dbg !981

kcall.end:                                        ; preds = %cond.end, %for.body
  br label %for.inc, !dbg !982

for.inc:                                          ; preds = %kcall.end
  %64 = load i32, i32* %num_iterations.addr, align 4, !dbg !983
  %conv45 = sitofp i32 %64 to float, !dbg !983
  %65 = load float, float* %t, align 4, !dbg !985
  %add = fadd float %65, %conv45, !dbg !985
  store float %add, float* %t, align 4, !dbg !985
  br label %for.cond, !dbg !986, !llvm.loop !987

for.end:                                          ; preds = %for.cond
  %66 = load i32, i32* %dst, align 4, !dbg !989
  ret i32 %66, !dbg !990
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #4 comdat align 2 !dbg !991 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !992, metadata !584), !dbg !994
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !995, metadata !584), !dbg !996
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !997, metadata !584), !dbg !998
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !999, metadata !584), !dbg !1000
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1001
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1002
  store i32 %0, i32* %x, align 4, !dbg !1001
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1003
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1004
  store i32 %1, i32* %y, align 4, !dbg !1003
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1005
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1006
  store i32 %2, i32* %z, align 4, !dbg !1005
  ret void, !dbg !1007
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: uwtable
define void @_Z5usageiPPc(i32 %argc, i8** %argv) #0 !dbg !1008 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1011, metadata !584), !dbg !1012
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1013, metadata !584), !dbg !1014
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1015
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1016
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !1016
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !1016
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.8, i32 0, i32 0), i8* %2), !dbg !1017
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1018
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.9, i32 0, i32 0)), !dbg !1019
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1020
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.10, i32 0, i32 0)), !dbg !1021
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1022
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.11, i32 0, i32 0)), !dbg !1023
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1024
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.12, i32 0, i32 0)), !dbg !1025
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1026
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.13, i32 0, i32 0)), !dbg !1027
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1028
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.14, i32 0, i32 0)), !dbg !1029
  call void @exit(i32 1) #10, !dbg !1030
  unreachable, !dbg !1030

return:                                           ; No predecessors!
  ret void, !dbg !1031
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #7 !dbg !1032 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1035, metadata !584), !dbg !1036
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1037, metadata !584), !dbg !1038
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.15, i32 0, i32 0), i32 16, i32 16), !dbg !1039
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1040
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1041
  call void @_Z3runiPPc(i32 %0, i8** %1), !dbg !1042
  ret i32 0, !dbg !1043
}

; Function Attrs: uwtable
define void @_Z3runiPPc(i32 %argc, i8** %argv) #0 !dbg !1044 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %size = alloca i32, align 4
  %grid_rows = alloca i32, align 4
  %grid_cols = alloca i32, align 4
  %FilesavingTemp = alloca float*, align 8
  %FilesavingPower = alloca float*, align 8
  %MatrixOut = alloca float*, align 8
  %tfile = alloca i8*, align 8
  %pfile = alloca i8*, align 8
  %ofile = alloca i8*, align 8
  %total_iterations = alloca i32, align 4
  %pyramid_height = alloca i32, align 4
  %borderCols = alloca i32, align 4
  %borderRows = alloca i32, align 4
  %smallBlockCol = alloca i32, align 4
  %smallBlockRow = alloca i32, align 4
  %blockCols = alloca i32, align 4
  %blockRows = alloca i32, align 4
  %MatrixTemp = alloca [2 x float*], align 16
  %MatrixPower = alloca float*, align 8
  %ret = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1045, metadata !584), !dbg !1046
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1047, metadata !584), !dbg !1048
  call void @llvm.dbg.declare(metadata i32* %size, metadata !1049, metadata !584), !dbg !1050
  call void @llvm.dbg.declare(metadata i32* %grid_rows, metadata !1051, metadata !584), !dbg !1052
  call void @llvm.dbg.declare(metadata i32* %grid_cols, metadata !1053, metadata !584), !dbg !1054
  call void @llvm.dbg.declare(metadata float** %FilesavingTemp, metadata !1055, metadata !584), !dbg !1056
  call void @llvm.dbg.declare(metadata float** %FilesavingPower, metadata !1057, metadata !584), !dbg !1058
  call void @llvm.dbg.declare(metadata float** %MatrixOut, metadata !1059, metadata !584), !dbg !1060
  call void @llvm.dbg.declare(metadata i8** %tfile, metadata !1061, metadata !584), !dbg !1062
  call void @llvm.dbg.declare(metadata i8** %pfile, metadata !1063, metadata !584), !dbg !1064
  call void @llvm.dbg.declare(metadata i8** %ofile, metadata !1065, metadata !584), !dbg !1066
  call void @llvm.dbg.declare(metadata i32* %total_iterations, metadata !1067, metadata !584), !dbg !1068
  store i32 60, i32* %total_iterations, align 4, !dbg !1068
  call void @llvm.dbg.declare(metadata i32* %pyramid_height, metadata !1069, metadata !584), !dbg !1070
  store i32 1, i32* %pyramid_height, align 4, !dbg !1070
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1071
  %cmp = icmp ne i32 %0, 7, !dbg !1073
  br i1 %cmp, label %if.then, label %if.end, !dbg !1074

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %argc.addr, align 4, !dbg !1075
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !1076
  call void @_Z5usageiPPc(i32 %1, i8** %2), !dbg !1077
  br label %if.end, !dbg !1077

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !1078
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !1078
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !1078
  %call = call i32 @atoi(i8* %4) #11, !dbg !1080
  store i32 %call, i32* %grid_rows, align 4, !dbg !1081
  %cmp1 = icmp sle i32 %call, 0, !dbg !1082
  br i1 %cmp1, label %if.then13, label %lor.lhs.false, !dbg !1083

lor.lhs.false:                                    ; preds = %if.end
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !1084
  %arrayidx2 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !1084
  %6 = load i8*, i8** %arrayidx2, align 8, !dbg !1084
  %call3 = call i32 @atoi(i8* %6) #11, !dbg !1085
  store i32 %call3, i32* %grid_cols, align 4, !dbg !1086
  %cmp4 = icmp sle i32 %call3, 0, !dbg !1087
  br i1 %cmp4, label %if.then13, label %lor.lhs.false5, !dbg !1088

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %7 = load i8**, i8*** %argv.addr, align 8, !dbg !1089
  %arrayidx6 = getelementptr inbounds i8*, i8** %7, i64 2, !dbg !1089
  %8 = load i8*, i8** %arrayidx6, align 8, !dbg !1089
  %call7 = call i32 @atoi(i8* %8) #11, !dbg !1090
  store i32 %call7, i32* %pyramid_height, align 4, !dbg !1091
  %cmp8 = icmp sle i32 %call7, 0, !dbg !1092
  br i1 %cmp8, label %if.then13, label %lor.lhs.false9, !dbg !1093

lor.lhs.false9:                                   ; preds = %lor.lhs.false5
  %9 = load i8**, i8*** %argv.addr, align 8, !dbg !1094
  %arrayidx10 = getelementptr inbounds i8*, i8** %9, i64 3, !dbg !1094
  %10 = load i8*, i8** %arrayidx10, align 8, !dbg !1094
  %call11 = call i32 @atoi(i8* %10) #11, !dbg !1095
  store i32 %call11, i32* %total_iterations, align 4, !dbg !1096
  %cmp12 = icmp sle i32 %call11, 0, !dbg !1097
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !1098

if.then13:                                        ; preds = %lor.lhs.false9, %lor.lhs.false5, %lor.lhs.false, %if.end
  %11 = load i32, i32* %argc.addr, align 4, !dbg !1100
  %12 = load i8**, i8*** %argv.addr, align 8, !dbg !1101
  call void @_Z5usageiPPc(i32 %11, i8** %12), !dbg !1102
  br label %if.end14, !dbg !1102

if.end14:                                         ; preds = %if.then13, %lor.lhs.false9
  %13 = load i8**, i8*** %argv.addr, align 8, !dbg !1103
  %arrayidx15 = getelementptr inbounds i8*, i8** %13, i64 4, !dbg !1103
  %14 = load i8*, i8** %arrayidx15, align 8, !dbg !1103
  store i8* %14, i8** %tfile, align 8, !dbg !1104
  %15 = load i8**, i8*** %argv.addr, align 8, !dbg !1105
  %arrayidx16 = getelementptr inbounds i8*, i8** %15, i64 5, !dbg !1105
  %16 = load i8*, i8** %arrayidx16, align 8, !dbg !1105
  store i8* %16, i8** %pfile, align 8, !dbg !1106
  %17 = load i8**, i8*** %argv.addr, align 8, !dbg !1107
  %arrayidx17 = getelementptr inbounds i8*, i8** %17, i64 6, !dbg !1107
  %18 = load i8*, i8** %arrayidx17, align 8, !dbg !1107
  store i8* %18, i8** %ofile, align 8, !dbg !1108
  %19 = load i32, i32* %grid_rows, align 4, !dbg !1109
  %20 = load i32, i32* %grid_cols, align 4, !dbg !1110
  %mul = mul nsw i32 %19, %20, !dbg !1111
  store i32 %mul, i32* %size, align 4, !dbg !1112
  call void @llvm.dbg.declare(metadata i32* %borderCols, metadata !1113, metadata !584), !dbg !1114
  %21 = load i32, i32* %pyramid_height, align 4, !dbg !1115
  %mul18 = mul nsw i32 %21, 2, !dbg !1116
  %div = sdiv i32 %mul18, 2, !dbg !1117
  store i32 %div, i32* %borderCols, align 4, !dbg !1114
  call void @llvm.dbg.declare(metadata i32* %borderRows, metadata !1118, metadata !584), !dbg !1119
  %22 = load i32, i32* %pyramid_height, align 4, !dbg !1120
  %mul19 = mul nsw i32 %22, 2, !dbg !1121
  %div20 = sdiv i32 %mul19, 2, !dbg !1122
  store i32 %div20, i32* %borderRows, align 4, !dbg !1119
  call void @llvm.dbg.declare(metadata i32* %smallBlockCol, metadata !1123, metadata !584), !dbg !1124
  %23 = load i32, i32* %pyramid_height, align 4, !dbg !1125
  %mul21 = mul nsw i32 %23, 2, !dbg !1126
  %sub = sub nsw i32 16, %mul21, !dbg !1127
  store i32 %sub, i32* %smallBlockCol, align 4, !dbg !1124
  call void @llvm.dbg.declare(metadata i32* %smallBlockRow, metadata !1128, metadata !584), !dbg !1129
  %24 = load i32, i32* %pyramid_height, align 4, !dbg !1130
  %mul22 = mul nsw i32 %24, 2, !dbg !1131
  %sub23 = sub nsw i32 16, %mul22, !dbg !1132
  store i32 %sub23, i32* %smallBlockRow, align 4, !dbg !1129
  call void @llvm.dbg.declare(metadata i32* %blockCols, metadata !1133, metadata !584), !dbg !1134
  %25 = load i32, i32* %grid_cols, align 4, !dbg !1135
  %26 = load i32, i32* %smallBlockCol, align 4, !dbg !1136
  %div24 = sdiv i32 %25, %26, !dbg !1137
  %27 = load i32, i32* %grid_cols, align 4, !dbg !1138
  %28 = load i32, i32* %smallBlockCol, align 4, !dbg !1139
  %rem = srem i32 %27, %28, !dbg !1140
  %cmp25 = icmp eq i32 %rem, 0, !dbg !1141
  %cond = select i1 %cmp25, i32 0, i32 1, !dbg !1142
  %add = add nsw i32 %div24, %cond, !dbg !1143
  store i32 %add, i32* %blockCols, align 4, !dbg !1134
  call void @llvm.dbg.declare(metadata i32* %blockRows, metadata !1144, metadata !584), !dbg !1145
  %29 = load i32, i32* %grid_rows, align 4, !dbg !1146
  %30 = load i32, i32* %smallBlockRow, align 4, !dbg !1147
  %div26 = sdiv i32 %29, %30, !dbg !1148
  %31 = load i32, i32* %grid_rows, align 4, !dbg !1149
  %32 = load i32, i32* %smallBlockRow, align 4, !dbg !1150
  %rem27 = srem i32 %31, %32, !dbg !1151
  %cmp28 = icmp eq i32 %rem27, 0, !dbg !1152
  %cond29 = select i1 %cmp28, i32 0, i32 1, !dbg !1153
  %add30 = add nsw i32 %div26, %cond29, !dbg !1154
  store i32 %add30, i32* %blockRows, align 4, !dbg !1145
  %33 = load i32, i32* %size, align 4, !dbg !1155
  %conv = sext i32 %33 to i64, !dbg !1155
  %mul31 = mul i64 %conv, 4, !dbg !1156
  %call32 = call noalias i8* @malloc(i64 %mul31) #9, !dbg !1157
  %34 = bitcast i8* %call32 to float*, !dbg !1158
  store float* %34, float** %FilesavingTemp, align 8, !dbg !1159
  %35 = load i32, i32* %size, align 4, !dbg !1160
  %conv33 = sext i32 %35 to i64, !dbg !1160
  %mul34 = mul i64 %conv33, 4, !dbg !1161
  %call35 = call noalias i8* @malloc(i64 %mul34) #9, !dbg !1162
  %36 = bitcast i8* %call35 to float*, !dbg !1163
  store float* %36, float** %FilesavingPower, align 8, !dbg !1164
  %37 = load i32, i32* %size, align 4, !dbg !1165
  %conv36 = sext i32 %37 to i64, !dbg !1165
  %call37 = call noalias i8* @calloc(i64 %conv36, i64 4) #9, !dbg !1166
  %38 = bitcast i8* %call37 to float*, !dbg !1167
  store float* %38, float** %MatrixOut, align 8, !dbg !1168
  %39 = load float*, float** %FilesavingPower, align 8, !dbg !1169
  %tobool = icmp ne float* %39, null, !dbg !1169
  br i1 %tobool, label %lor.lhs.false38, label %if.then42, !dbg !1171

lor.lhs.false38:                                  ; preds = %if.end14
  %40 = load float*, float** %FilesavingTemp, align 8, !dbg !1172
  %tobool39 = icmp ne float* %40, null, !dbg !1172
  br i1 %tobool39, label %lor.lhs.false40, label %if.then42, !dbg !1174

lor.lhs.false40:                                  ; preds = %lor.lhs.false38
  %41 = load float*, float** %MatrixOut, align 8, !dbg !1175
  %tobool41 = icmp ne float* %41, null, !dbg !1175
  br i1 %tobool41, label %if.end43, label %if.then42, !dbg !1177

if.then42:                                        ; preds = %lor.lhs.false40, %lor.lhs.false38, %if.end14
  call void @_Z5fatalPc(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.16, i32 0, i32 0)), !dbg !1178
  br label %if.end43, !dbg !1178

if.end43:                                         ; preds = %if.then42, %lor.lhs.false40
  %42 = load i32, i32* %pyramid_height, align 4, !dbg !1179
  %43 = load i32, i32* %grid_cols, align 4, !dbg !1180
  %44 = load i32, i32* %grid_rows, align 4, !dbg !1181
  %45 = load i32, i32* %borderCols, align 4, !dbg !1182
  %46 = load i32, i32* %borderRows, align 4, !dbg !1183
  %47 = load i32, i32* %blockCols, align 4, !dbg !1184
  %48 = load i32, i32* %blockRows, align 4, !dbg !1185
  %49 = load i32, i32* %smallBlockCol, align 4, !dbg !1186
  %50 = load i32, i32* %smallBlockRow, align 4, !dbg !1187
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.17, i32 0, i32 0), i32 %42, i32 %43, i32 %44, i32 %45, i32 %46, i32 %47, i32 %48, i32 %49, i32 %50), !dbg !1188
  %51 = load float*, float** %FilesavingTemp, align 8, !dbg !1189
  %52 = load i32, i32* %grid_rows, align 4, !dbg !1190
  %53 = load i32, i32* %grid_cols, align 4, !dbg !1191
  %54 = load i8*, i8** %tfile, align 8, !dbg !1192
  call void @_Z9readinputPfiiPc(float* %51, i32 %52, i32 %53, i8* %54), !dbg !1193
  %55 = load float*, float** %FilesavingPower, align 8, !dbg !1194
  %56 = load i32, i32* %grid_rows, align 4, !dbg !1195
  %57 = load i32, i32* %grid_cols, align 4, !dbg !1196
  %58 = load i8*, i8** %pfile, align 8, !dbg !1197
  call void @_Z9readinputPfiiPc(float* %55, i32 %56, i32 %57, i8* %58), !dbg !1198
  call void @llvm.dbg.declare(metadata [2 x float*]* %MatrixTemp, metadata !1199, metadata !584), !dbg !1203
  call void @llvm.dbg.declare(metadata float** %MatrixPower, metadata !1204, metadata !584), !dbg !1205
  %arrayidx45 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 0, !dbg !1206
  %59 = bitcast float** %arrayidx45 to i8**, !dbg !1207
  %60 = load i32, i32* %size, align 4, !dbg !1208
  %conv46 = sext i32 %60 to i64, !dbg !1208
  %mul47 = mul i64 4, %conv46, !dbg !1209
  %call48 = call i32 @cudaMalloc(i8** %59, i64 %mul47), !dbg !1210
  %arrayidx49 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 1, !dbg !1211
  %61 = bitcast float** %arrayidx49 to i8**, !dbg !1212
  %62 = load i32, i32* %size, align 4, !dbg !1213
  %conv50 = sext i32 %62 to i64, !dbg !1213
  %mul51 = mul i64 4, %conv50, !dbg !1214
  %call52 = call i32 @cudaMalloc(i8** %61, i64 %mul51), !dbg !1215
  %arrayidx53 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 0, !dbg !1216
  %63 = load float*, float** %arrayidx53, align 16, !dbg !1216
  %64 = bitcast float* %63 to i8*, !dbg !1216
  %65 = load float*, float** %FilesavingTemp, align 8, !dbg !1217
  %66 = bitcast float* %65 to i8*, !dbg !1217
  %67 = load i32, i32* %size, align 4, !dbg !1218
  %conv54 = sext i32 %67 to i64, !dbg !1218
  %mul55 = mul i64 4, %conv54, !dbg !1219
  %call56 = call i32 @cudaMemcpy(i8* %64, i8* %66, i64 %mul55, i32 1), !dbg !1220
  %68 = bitcast float** %MatrixPower to i8**, !dbg !1221
  %69 = load i32, i32* %size, align 4, !dbg !1222
  %conv57 = sext i32 %69 to i64, !dbg !1222
  %mul58 = mul i64 4, %conv57, !dbg !1223
  %call59 = call i32 @cudaMalloc(i8** %68, i64 %mul58), !dbg !1224
  %70 = load float*, float** %MatrixPower, align 8, !dbg !1225
  %71 = bitcast float* %70 to i8*, !dbg !1225
  %72 = load float*, float** %FilesavingPower, align 8, !dbg !1226
  %73 = bitcast float* %72 to i8*, !dbg !1226
  %74 = load i32, i32* %size, align 4, !dbg !1227
  %conv60 = sext i32 %74 to i64, !dbg !1227
  %mul61 = mul i64 4, %conv60, !dbg !1228
  %call62 = call i32 @cudaMemcpy(i8* %71, i8* %73, i64 %mul61, i32 1), !dbg !1229
  %call63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.18, i32 0, i32 0)), !dbg !1230
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !1231, metadata !584), !dbg !1232
  %75 = load float*, float** %MatrixPower, align 8, !dbg !1233
  %arraydecay = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i32 0, i32 0, !dbg !1234
  %76 = load i32, i32* %grid_cols, align 4, !dbg !1235
  %77 = load i32, i32* %grid_rows, align 4, !dbg !1236
  %78 = load i32, i32* %total_iterations, align 4, !dbg !1237
  %79 = load i32, i32* %pyramid_height, align 4, !dbg !1238
  %80 = load i32, i32* %blockCols, align 4, !dbg !1239
  %81 = load i32, i32* %blockRows, align 4, !dbg !1240
  %82 = load i32, i32* %borderCols, align 4, !dbg !1241
  %83 = load i32, i32* %borderRows, align 4, !dbg !1242
  %call64 = call i32 @_Z17compute_tran_tempPfPS_iiiiiiii(float* %75, float** %arraydecay, i32 %76, i32 %77, i32 %78, i32 %79, i32 %80, i32 %81, i32 %82, i32 %83), !dbg !1243
  store i32 %call64, i32* %ret, align 4, !dbg !1232
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.19, i32 0, i32 0)), !dbg !1244
  %84 = load float*, float** %MatrixOut, align 8, !dbg !1245
  %85 = bitcast float* %84 to i8*, !dbg !1245
  %86 = load i32, i32* %ret, align 4, !dbg !1246
  %idxprom = sext i32 %86 to i64, !dbg !1247
  %arrayidx66 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 %idxprom, !dbg !1247
  %87 = load float*, float** %arrayidx66, align 8, !dbg !1247
  %88 = bitcast float* %87 to i8*, !dbg !1247
  %89 = load i32, i32* %size, align 4, !dbg !1248
  %conv67 = sext i32 %89 to i64, !dbg !1248
  %mul68 = mul i64 4, %conv67, !dbg !1249
  %call69 = call i32 @cudaMemcpy(i8* %85, i8* %88, i64 %mul68, i32 2), !dbg !1250
  %90 = load float*, float** %MatrixOut, align 8, !dbg !1251
  %91 = load i32, i32* %grid_rows, align 4, !dbg !1252
  %92 = load i32, i32* %grid_cols, align 4, !dbg !1253
  %93 = load i8*, i8** %ofile, align 8, !dbg !1254
  call void @_Z11writeoutputPfiiPc(float* %90, i32 %91, i32 %92, i8* %93), !dbg !1255
  %94 = load float*, float** %MatrixPower, align 8, !dbg !1256
  %95 = bitcast float* %94 to i8*, !dbg !1256
  %call70 = call i32 @cudaFree(i8* %95), !dbg !1257
  %arrayidx71 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 0, !dbg !1258
  %96 = load float*, float** %arrayidx71, align 16, !dbg !1258
  %97 = bitcast float* %96 to i8*, !dbg !1258
  %call72 = call i32 @cudaFree(i8* %97), !dbg !1259
  %arrayidx73 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 1, !dbg !1260
  %98 = load float*, float** %arrayidx73, align 8, !dbg !1260
  %99 = bitcast float* %98 to i8*, !dbg !1260
  %call74 = call i32 @cudaFree(i8* %99), !dbg !1261
  %100 = load float*, float** %MatrixOut, align 8, !dbg !1262
  %101 = bitcast float* %100 to i8*, !dbg !1262
  call void @free(i8* %101) #9, !dbg !1263
  ret void, !dbg !1264
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #8

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

declare i32 @cudaMalloc(i8**, i64) #2

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

declare i32 @cudaFree(i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind readonly }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!576, !577}
!llvm.ident = !{!578}

!0 = distinct !DIGlobalVariable(name: "t_chip", scope: !1, file: !2, line: 28, type: !14, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !12, globals: !17, imports: !21)
!2 = !DIFile(filename: "hotspot.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!3 = !{!4}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !5, line: 807, size: 32, align: 32, elements: !6, identifier: "_ZTS14cudaMemcpyKind")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!8 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!11 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!17 = !{!0, !18, !19, !20}
!18 = distinct !DIGlobalVariable(name: "chip_height", scope: !1, file: !2, line: 29, type: !14, isLocal: false, isDefinition: true)
!19 = distinct !DIGlobalVariable(name: "chip_width", scope: !1, file: !2, line: 30, type: !14, isLocal: false, isDefinition: true)
!20 = distinct !DIGlobalVariable(name: "amb_temp", scope: !1, file: !2, line: 32, type: !14, isLocal: false, isDefinition: true)
!21 = !{!22, !29, !33, !35, !37, !39, !41, !45, !47, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !77, !79, !81, !83, !88, !93, !95, !97, !102, !106, !108, !110, !112, !114, !116, !118, !120, !122, !127, !131, !133, !135, !139, !141, !143, !145, !147, !149, !153, !155, !157, !161, !169, !173, !175, !177, !181, !183, !185, !189, !191, !193, !197, !199, !201, !203, !205, !207, !209, !211, !213, !215, !220, !222, !224, !228, !230, !232, !234, !236, !238, !240, !242, !246, !250, !252, !254, !259, !261, !263, !265, !267, !269, !271, !275, !281, !285, !289, !294, !296, !300, !304, !317, !321, !325, !329, !333, !338, !340, !344, !348, !352, !360, !364, !368, !372, !376, !381, !387, !391, !395, !397, !405, !409, !417, !419, !421, !425, !429, !433, !438, !442, !447, !448, !449, !450, !453, !454, !455, !456, !457, !458, !459, !462, !464, !466, !468, !470, !472, !474, !476, !479, !481, !483, !485, !487, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !547, !548, !550, !552, !554, !556, !558, !560, !562, !564, !566, !568, !570, !572, !574}
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !25, line: 189)
!23 = !DINamespace(name: "std", scope: null, file: !24, line: 188)
!24 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!25 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !24, file: !24, line: 44, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !28}
!28 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !30, line: 190)
!30 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !24, file: !24, line: 46, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!31 = !DISubroutineType(types: !32)
!32 = !{!14, !14}
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !34, line: 191)
!34 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !24, file: !24, line: 48, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !36, line: 192)
!36 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !24, file: !24, line: 50, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !38, line: 193)
!38 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !24, file: !24, line: 52, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !40, line: 194)
!40 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !24, file: !24, line: 56, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !42, line: 195)
!42 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !24, file: !24, line: 54, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DISubroutineType(types: !44)
!44 = !{!14, !14, !14}
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !46, line: 196)
!46 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !24, file: !24, line: 58, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !48, line: 197)
!48 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !24, file: !24, line: 60, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !50, line: 198)
!50 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !24, file: !24, line: 62, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !52, line: 199)
!52 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !24, file: !24, line: 64, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !54, line: 200)
!54 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !24, file: !24, line: 66, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !56, line: 201)
!56 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !24, file: !24, line: 68, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !58, line: 202)
!58 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !24, file: !24, line: 72, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !60, line: 203)
!60 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !24, file: !24, line: 70, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !62, line: 204)
!62 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !24, file: !24, line: 76, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !64, line: 205)
!64 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !24, file: !24, line: 74, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !66, line: 206)
!66 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !24, file: !24, line: 78, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !68, line: 207)
!68 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !24, file: !24, line: 80, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !70, line: 208)
!70 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !24, file: !24, line: 82, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !72, line: 209)
!72 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !24, file: !24, line: 84, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !74, line: 210)
!74 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !24, file: !24, line: 86, type: !75, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DISubroutineType(types: !76)
!76 = !{!14, !14, !14, !14}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !78, line: 211)
!78 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !24, file: !24, line: 88, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !80, line: 212)
!80 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !24, file: !24, line: 90, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !82, line: 213)
!82 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !24, file: !24, line: 92, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !84, line: 214)
!84 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !24, file: !24, line: 94, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !14}
!87 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !89, line: 215)
!89 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !24, file: !24, line: 96, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DISubroutineType(types: !91)
!91 = !{!14, !14, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64, align: 64)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !94, line: 216)
!94 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !24, file: !24, line: 98, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !96, line: 217)
!96 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !24, file: !24, line: 100, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !98, line: 218)
!98 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !24, file: !24, line: 102, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{!101, !14}
!101 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !103, line: 219)
!103 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !24, file: !24, line: 106, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DISubroutineType(types: !105)
!105 = !{!101, !14, !14}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !107, line: 220)
!107 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !24, file: !24, line: 105, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !109, line: 221)
!109 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !24, file: !24, line: 108, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !111, line: 222)
!111 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !24, file: !24, line: 112, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !113, line: 223)
!113 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !24, file: !24, line: 111, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !115, line: 224)
!115 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !24, file: !24, line: 114, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !117, line: 225)
!117 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !24, file: !24, line: 116, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !119, line: 226)
!119 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !24, file: !24, line: 118, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !121, line: 227)
!121 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !24, file: !24, line: 120, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !123, line: 228)
!123 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !24, file: !24, line: 121, type: !124, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DISubroutineType(types: !125)
!125 = !{!126, !126}
!126 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !128, line: 229)
!128 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !24, file: !24, line: 123, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DISubroutineType(types: !130)
!130 = !{!14, !14, !87}
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !132, line: 230)
!132 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !24, file: !24, line: 125, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !134, line: 231)
!134 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !24, file: !24, line: 126, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !136, line: 232)
!136 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !24, file: !24, line: 128, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{!28, !14}
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !140, line: 233)
!140 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !24, file: !24, line: 138, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !142, line: 234)
!142 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !24, file: !24, line: 130, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !144, line: 235)
!144 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !24, file: !24, line: 132, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !146, line: 236)
!146 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !24, file: !24, line: 134, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !148, line: 237)
!148 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !24, file: !24, line: 136, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !150, line: 238)
!150 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !24, file: !24, line: 140, type: !151, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{!126, !14}
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !154, line: 239)
!154 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !24, file: !24, line: 142, type: !151, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !156, line: 240)
!156 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !24, file: !24, line: 143, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !158, line: 241)
!158 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !24, file: !24, line: 145, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DISubroutineType(types: !160)
!160 = !{!14, !14, !13}
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
!172 = !{!14, !166}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !174, line: 244)
!174 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !24, file: !24, line: 149, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !176, line: 245)
!176 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !24, file: !24, line: 151, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !178, line: 246)
!178 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !24, file: !24, line: 153, type: !179, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DISubroutineType(types: !180)
!180 = !{!14, !14, !165}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !182, line: 247)
!182 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !24, file: !24, line: 158, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !184, line: 248)
!184 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !24, file: !24, line: 160, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !186, line: 249)
!186 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !24, file: !24, line: 162, type: !187, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DISubroutineType(types: !188)
!188 = !{!14, !14, !14, !92}
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !190, line: 250)
!190 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !24, file: !24, line: 164, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !192, line: 251)
!192 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !24, file: !24, line: 166, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !194, line: 252)
!194 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !24, file: !24, line: 168, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{!14, !14, !126}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !198, line: 253)
!198 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !24, file: !24, line: 170, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !200, line: 254)
!200 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !24, file: !24, line: 172, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
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
!217 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
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
!245 = !{!165, !165, !92}
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !247, line: 334)
!247 = !DISubprogram(name: "ldexp", scope: !217, file: !217, line: 106, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DISubroutineType(types: !249)
!249 = !{!165, !165, !87}
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
!273 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!274 = !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !276, line: 119)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !273, line: 109, baseType: !277)
!277 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 105, size: 128, align: 64, elements: !278, identifier: "_ZTS6ldiv_t")
!278 = !{!279, !280}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !277, file: !273, line: 107, baseType: !126, size: 64, align: 64)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !277, file: !273, line: 108, baseType: !126, size: 64, align: 64, offset: 64)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !282, line: 121)
!282 = !DISubprogram(name: "abort", scope: !273, file: !273, line: 515, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!283 = !DISubroutineType(types: !284)
!284 = !{null}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !286, line: 122)
!286 = !DISubprogram(name: "abs", scope: !273, file: !273, line: 774, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DISubroutineType(types: !288)
!288 = !{!87, !87}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !290, line: 123)
!290 = !DISubprogram(name: "atexit", scope: !273, file: !273, line: 519, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DISubroutineType(types: !292)
!292 = !{!87, !293}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64, align: 64)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !295, line: 129)
!295 = !DISubprogram(name: "atof", scope: !273, file: !273, line: 144, type: !163, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !297, line: 130)
!297 = !DISubprogram(name: "atoi", scope: !273, file: !273, line: 147, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DISubroutineType(types: !299)
!299 = !{!87, !166}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !301, line: 131)
!301 = !DISubprogram(name: "atol", scope: !273, file: !273, line: 150, type: !302, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DISubroutineType(types: !303)
!303 = !{!126, !166}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !305, line: 132)
!305 = !DISubprogram(name: "bsearch", scope: !273, file: !273, line: 754, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DISubroutineType(types: !307)
!307 = !{!16, !308, !308, !310, !310, !313}
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64, align: 64)
!309 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !311, line: 62, baseType: !312)
!311 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!312 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !273, line: 741, baseType: !314)
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64, align: 64)
!315 = !DISubroutineType(types: !316)
!316 = !{!87, !308, !308}
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !318, line: 133)
!318 = !DISubprogram(name: "calloc", scope: !273, file: !273, line: 468, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!319 = !DISubroutineType(types: !320)
!320 = !{!16, !310, !310}
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !322, line: 134)
!322 = !DISubprogram(name: "div", scope: !273, file: !273, line: 788, type: !323, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!323 = !DISubroutineType(types: !324)
!324 = !{!272, !87, !87}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !326, line: 135)
!326 = !DISubprogram(name: "exit", scope: !273, file: !273, line: 543, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{null, !87}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !330, line: 136)
!330 = !DISubprogram(name: "free", scope: !273, file: !273, line: 483, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{null, !16}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !334, line: 137)
!334 = !DISubprogram(name: "getenv", scope: !273, file: !273, line: 564, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!337, !166}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64, align: 64)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !339, line: 138)
!339 = !DISubprogram(name: "labs", scope: !273, file: !273, line: 775, type: !124, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !341, line: 139)
!341 = !DISubprogram(name: "ldiv", scope: !273, file: !273, line: 790, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{!276, !126, !126}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !345, line: 140)
!345 = !DISubprogram(name: "malloc", scope: !273, file: !273, line: 466, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!16, !310}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !349, line: 142)
!349 = !DISubprogram(name: "mblen", scope: !273, file: !273, line: 862, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DISubroutineType(types: !351)
!351 = !{!87, !166, !310}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !353, line: 143)
!353 = !DISubprogram(name: "mbstowcs", scope: !273, file: !273, line: 873, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DISubroutineType(types: !355)
!355 = !{!310, !356, !359, !310}
!356 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !357)
!357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !358, size: 64, align: 64)
!358 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !166)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !361, line: 144)
!361 = !DISubprogram(name: "mbtowc", scope: !273, file: !273, line: 865, type: !362, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!362 = !DISubroutineType(types: !363)
!363 = !{!87, !356, !359, !310}
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !365, line: 146)
!365 = !DISubprogram(name: "qsort", scope: !273, file: !273, line: 764, type: !366, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !16, !310, !310, !313}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !369, line: 152)
!369 = !DISubprogram(name: "rand", scope: !273, file: !273, line: 374, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!87}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !373, line: 153)
!373 = !DISubprogram(name: "realloc", scope: !273, file: !273, line: 480, type: !374, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!374 = !DISubroutineType(types: !375)
!375 = !{!16, !16, !310}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !377, line: 154)
!377 = !DISubprogram(name: "srand", scope: !273, file: !273, line: 376, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DISubroutineType(types: !379)
!379 = !{null, !380}
!380 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !382, line: 155)
!382 = !DISubprogram(name: "strtod", scope: !273, file: !273, line: 164, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{!165, !359, !385}
!385 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !386)
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !337, size: 64, align: 64)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !388, line: 156)
!388 = !DISubprogram(name: "strtol", scope: !273, file: !273, line: 183, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!389 = !DISubroutineType(types: !390)
!390 = !{!126, !359, !385, !87}
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !392, line: 157)
!392 = !DISubprogram(name: "strtoul", scope: !273, file: !273, line: 187, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DISubroutineType(types: !394)
!394 = !{!312, !359, !385, !87}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !396, line: 158)
!396 = !DISubprogram(name: "system", scope: !273, file: !273, line: 716, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !398, line: 160)
!398 = !DISubprogram(name: "wcstombs", scope: !273, file: !273, line: 876, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!310, !401, !402, !310}
!401 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !337)
!402 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !403)
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64, align: 64)
!404 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !358)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !406, line: 161)
!406 = !DISubprogram(name: "wctomb", scope: !273, file: !273, line: 869, type: !407, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!407 = !DISubroutineType(types: !408)
!408 = !{!87, !337, !358}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !412, line: 214)
!410 = !DINamespace(name: "__gnu_cxx", scope: null, file: !411, line: 220)
!411 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !273, line: 121, baseType: !413)
!413 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 117, size: 128, align: 64, elements: !414, identifier: "_ZTS7lldiv_t")
!414 = !{!415, !416}
!415 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !413, file: !273, line: 119, baseType: !28, size: 64, align: 64)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !413, file: !273, line: 120, baseType: !28, size: 64, align: 64, offset: 64)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !418, line: 220)
!418 = !DISubprogram(name: "_Exit", scope: !273, file: !273, line: 557, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !420, line: 224)
!420 = !DISubprogram(name: "llabs", scope: !273, file: !273, line: 779, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !422, line: 230)
!422 = !DISubprogram(name: "lldiv", scope: !273, file: !273, line: 796, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!423 = !DISubroutineType(types: !424)
!424 = !{!412, !28, !28}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !426, line: 241)
!426 = !DISubprogram(name: "atoll", scope: !273, file: !273, line: 157, type: !427, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!427 = !DISubroutineType(types: !428)
!428 = !{!28, !166}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !430, line: 242)
!430 = !DISubprogram(name: "strtoll", scope: !273, file: !273, line: 209, type: !431, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!431 = !DISubroutineType(types: !432)
!432 = !{!28, !359, !385, !87}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !434, line: 243)
!434 = !DISubprogram(name: "strtoull", scope: !273, file: !273, line: 214, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!437, !359, !385, !87}
!437 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !439, line: 245)
!439 = !DISubprogram(name: "strtof", scope: !273, file: !273, line: 172, type: !440, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!440 = !DISubroutineType(types: !441)
!441 = !{!14, !359, !385}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !410, entity: !443, line: 246)
!443 = !DISubprogram(name: "strtold", scope: !273, file: !273, line: 175, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{!446, !359, !385}
!446 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !412, line: 254)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !418, line: 256)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !420, line: 258)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !451, line: 259)
!451 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !410, file: !452, line: 227, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !422, line: 260)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !426, line: 262)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !439, line: 263)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !430, line: 264)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !434, line: 265)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !443, line: 266)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !460, line: 397)
!460 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !461, file: !461, line: 1342, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !463, line: 398)
!463 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !461, file: !461, line: 1370, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !465, line: 399)
!465 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !461, file: !461, line: 1337, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !467, line: 400)
!467 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !461, file: !461, line: 1375, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !469, line: 401)
!469 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !461, file: !461, line: 1327, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !471, line: 402)
!471 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !461, file: !461, line: 1332, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !473, line: 403)
!473 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !461, file: !461, line: 1380, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !475, line: 404)
!475 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !461, file: !461, line: 1430, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !477, line: 405)
!477 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !478, file: !478, line: 667, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !480, line: 406)
!480 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !461, file: !461, line: 1189, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !482, line: 407)
!482 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !461, file: !461, line: 1243, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !484, line: 408)
!484 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !461, file: !461, line: 1312, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !486, line: 409)
!486 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !461, file: !461, line: 1490, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !488, line: 410)
!488 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !461, file: !461, line: 1480, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !490, line: 411)
!490 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !478, file: !478, line: 657, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !492, line: 412)
!492 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !461, file: !461, line: 1294, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !494, line: 413)
!494 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !461, file: !461, line: 1385, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !496, line: 414)
!496 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !478, file: !478, line: 607, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !498, line: 415)
!498 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !461, file: !461, line: 1616, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !500, line: 416)
!500 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !478, file: !478, line: 597, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !502, line: 417)
!502 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !461, file: !461, line: 1568, type: !75, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !504, line: 418)
!504 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !478, file: !478, line: 622, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !506, line: 419)
!506 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !478, file: !478, line: 617, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !508, line: 420)
!508 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !461, file: !461, line: 1553, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !510, line: 421)
!510 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !461, file: !461, line: 1543, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !512, line: 422)
!512 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !461, file: !461, line: 1390, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !514, line: 423)
!514 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !461, file: !461, line: 1621, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !516, line: 424)
!516 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !461, file: !461, line: 1520, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !518, line: 425)
!518 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !461, file: !461, line: 1515, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !520, line: 426)
!520 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !461, file: !461, line: 1149, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !522, line: 427)
!522 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !461, file: !461, line: 1602, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !524, line: 428)
!524 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !461, file: !461, line: 1356, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !526, line: 429)
!526 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !461, file: !461, line: 1365, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !528, line: 430)
!528 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !461, file: !461, line: 1285, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !530, line: 431)
!530 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !461, file: !461, line: 1626, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !532, line: 432)
!532 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !461, file: !461, line: 1347, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !534, line: 433)
!534 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !461, file: !461, line: 1140, type: !151, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !536, line: 434)
!536 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !461, file: !461, line: 1607, type: !151, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !538, line: 435)
!538 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !461, file: !461, line: 1548, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !540, line: 436)
!540 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !461, file: !461, line: 1154, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !542, line: 437)
!542 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !461, file: !461, line: 1218, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !544, line: 438)
!544 = !DISubprogram(name: "nexttowardf", scope: !217, file: !217, line: 294, type: !545, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DISubroutineType(types: !546)
!546 = !{!14, !14, !446}
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !544, line: 439)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !549, line: 440)
!549 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !461, file: !461, line: 1583, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !551, line: 441)
!551 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !461, file: !461, line: 1558, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !553, line: 442)
!553 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !461, file: !461, line: 1563, type: !187, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !555, line: 443)
!555 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !461, file: !461, line: 1135, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !557, line: 444)
!557 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !461, file: !461, line: 1597, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !559, line: 445)
!559 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !461, file: !461, line: 1530, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !561, line: 446)
!561 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !461, file: !461, line: 1525, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !563, line: 447)
!563 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !461, file: !461, line: 1234, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !565, line: 448)
!565 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !461, file: !461, line: 1317, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !567, line: 449)
!567 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !478, file: !478, line: 907, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !569, line: 450)
!569 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !461, file: !461, line: 1276, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !571, line: 451)
!571 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !461, file: !461, line: 1322, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !573, line: 452)
!573 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !461, file: !461, line: 1592, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !575, line: 453)
!575 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !478, file: !478, line: 662, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !{i32 2, !"Dwarf Version", i32 4}
!577 = !{i32 2, !"Debug Info Version", i32 3}
!578 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!579 = distinct !DISubprogram(name: "fatal", linkageName: "_Z5fatalPc", scope: !2, file: !2, line: 44, type: !580, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!580 = !DISubroutineType(types: !581)
!581 = !{null, !337}
!582 = !{}
!583 = !DILocalVariable(name: "s", arg: 1, scope: !579, file: !2, line: 44, type: !337)
!584 = !DIExpression()
!585 = !DILocation(line: 44, column: 13, scope: !579)
!586 = !DILocation(line: 46, column: 10, scope: !579)
!587 = !DILocation(line: 46, column: 33, scope: !579)
!588 = !DILocation(line: 46, column: 2, scope: !579)
!589 = !DILocation(line: 48, column: 1, scope: !579)
!590 = distinct !DISubprogram(name: "writeoutput", linkageName: "_Z11writeoutputPfiiPc", scope: !2, file: !2, line: 50, type: !591, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!591 = !DISubroutineType(types: !592)
!592 = !{null, !13, !87, !87, !337}
!593 = !DILocalVariable(name: "vect", arg: 1, scope: !590, file: !2, line: 50, type: !13)
!594 = !DILocation(line: 50, column: 25, scope: !590)
!595 = !DILocalVariable(name: "grid_rows", arg: 2, scope: !590, file: !2, line: 50, type: !87)
!596 = !DILocation(line: 50, column: 35, scope: !590)
!597 = !DILocalVariable(name: "grid_cols", arg: 3, scope: !590, file: !2, line: 50, type: !87)
!598 = !DILocation(line: 50, column: 50, scope: !590)
!599 = !DILocalVariable(name: "file", arg: 4, scope: !590, file: !2, line: 50, type: !337)
!600 = !DILocation(line: 50, column: 67, scope: !590)
!601 = !DILocalVariable(name: "i", scope: !590, file: !2, line: 52, type: !87)
!602 = !DILocation(line: 52, column: 6, scope: !590)
!603 = !DILocalVariable(name: "j", scope: !590, file: !2, line: 52, type: !87)
!604 = !DILocation(line: 52, column: 8, scope: !590)
!605 = !DILocalVariable(name: "index", scope: !590, file: !2, line: 52, type: !87)
!606 = !DILocation(line: 52, column: 11, scope: !590)
!607 = !DILocalVariable(name: "fp", scope: !590, file: !2, line: 53, type: !608)
!608 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !609, size: 64, align: 64)
!609 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !610, line: 48, baseType: !611)
!610 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!611 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !612, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!612 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!613 = !DILocation(line: 53, column: 8, scope: !590)
!614 = !DILocalVariable(name: "str", scope: !590, file: !2, line: 54, type: !615)
!615 = !DICompositeType(tag: DW_TAG_array_type, baseType: !168, size: 2048, align: 8, elements: !616)
!616 = !{!617}
!617 = !DISubrange(count: 256)
!618 = !DILocation(line: 54, column: 7, scope: !590)
!619 = !DILocation(line: 56, column: 18, scope: !620)
!620 = distinct !DILexicalBlock(scope: !590, file: !2, line: 56, column: 6)
!621 = !DILocation(line: 56, column: 12, scope: !620)
!622 = !DILocation(line: 56, column: 10, scope: !620)
!623 = !DILocation(line: 56, column: 31, scope: !620)
!624 = !DILocation(line: 56, column: 6, scope: !590)
!625 = !DILocation(line: 57, column: 11, scope: !620)
!626 = !DILocation(line: 60, column: 8, scope: !627)
!627 = distinct !DILexicalBlock(scope: !590, file: !2, line: 60, column: 2)
!628 = !DILocation(line: 60, column: 7, scope: !627)
!629 = !DILocation(line: 60, column: 12, scope: !630)
!630 = !DILexicalBlockFile(scope: !631, file: !2, discriminator: 1)
!631 = distinct !DILexicalBlock(scope: !627, file: !2, line: 60, column: 2)
!632 = !DILocation(line: 60, column: 16, scope: !630)
!633 = !DILocation(line: 60, column: 14, scope: !630)
!634 = !DILocation(line: 60, column: 2, scope: !630)
!635 = !DILocation(line: 61, column: 9, scope: !636)
!636 = distinct !DILexicalBlock(scope: !631, file: !2, line: 61, column: 3)
!637 = !DILocation(line: 61, column: 8, scope: !636)
!638 = !DILocation(line: 61, column: 13, scope: !639)
!639 = !DILexicalBlockFile(scope: !640, file: !2, discriminator: 1)
!640 = distinct !DILexicalBlock(scope: !636, file: !2, line: 61, column: 3)
!641 = !DILocation(line: 61, column: 17, scope: !639)
!642 = !DILocation(line: 61, column: 15, scope: !639)
!643 = !DILocation(line: 61, column: 3, scope: !639)
!644 = !DILocation(line: 64, column: 12, scope: !645)
!645 = distinct !DILexicalBlock(scope: !640, file: !2, line: 62, column: 3)
!646 = !DILocation(line: 64, column: 29, scope: !645)
!647 = !DILocation(line: 64, column: 36, scope: !645)
!648 = !DILocation(line: 64, column: 41, scope: !645)
!649 = !DILocation(line: 64, column: 43, scope: !645)
!650 = !DILocation(line: 64, column: 42, scope: !645)
!651 = !DILocation(line: 64, column: 53, scope: !645)
!652 = !DILocation(line: 64, column: 52, scope: !645)
!653 = !DILocation(line: 64, column: 4, scope: !645)
!654 = !DILocation(line: 65, column: 10, scope: !645)
!655 = !DILocation(line: 65, column: 14, scope: !645)
!656 = !DILocation(line: 65, column: 4, scope: !645)
!657 = !DILocation(line: 66, column: 9, scope: !645)
!658 = !DILocation(line: 67, column: 3, scope: !645)
!659 = !DILocation(line: 61, column: 29, scope: !660)
!660 = !DILexicalBlockFile(scope: !640, file: !2, discriminator: 2)
!661 = !DILocation(line: 61, column: 3, scope: !660)
!662 = distinct !{!662, !663}
!663 = !DILocation(line: 61, column: 3, scope: !631)
!664 = !DILocation(line: 67, column: 3, scope: !665)
!665 = !DILexicalBlockFile(scope: !636, file: !2, discriminator: 1)
!666 = !DILocation(line: 60, column: 28, scope: !667)
!667 = !DILexicalBlockFile(scope: !631, file: !2, discriminator: 2)
!668 = !DILocation(line: 60, column: 2, scope: !667)
!669 = distinct !{!669, !670}
!670 = !DILocation(line: 60, column: 2, scope: !590)
!671 = !DILocation(line: 69, column: 14, scope: !590)
!672 = !DILocation(line: 69, column: 7, scope: !590)
!673 = !DILocation(line: 70, column: 1, scope: !590)
!674 = distinct !DISubprogram(name: "readinput", linkageName: "_Z9readinputPfiiPc", scope: !2, file: !2, line: 73, type: !591, isLocal: false, isDefinition: true, scopeLine: 73, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!675 = !DILocalVariable(name: "vect", arg: 1, scope: !674, file: !2, line: 73, type: !13)
!676 = !DILocation(line: 73, column: 23, scope: !674)
!677 = !DILocalVariable(name: "grid_rows", arg: 2, scope: !674, file: !2, line: 73, type: !87)
!678 = !DILocation(line: 73, column: 33, scope: !674)
!679 = !DILocalVariable(name: "grid_cols", arg: 3, scope: !674, file: !2, line: 73, type: !87)
!680 = !DILocation(line: 73, column: 48, scope: !674)
!681 = !DILocalVariable(name: "file", arg: 4, scope: !674, file: !2, line: 73, type: !337)
!682 = !DILocation(line: 73, column: 65, scope: !674)
!683 = !DILocalVariable(name: "i", scope: !674, file: !2, line: 75, type: !87)
!684 = !DILocation(line: 75, column: 8, scope: !674)
!685 = !DILocalVariable(name: "j", scope: !674, file: !2, line: 75, type: !87)
!686 = !DILocation(line: 75, column: 10, scope: !674)
!687 = !DILocalVariable(name: "fp", scope: !674, file: !2, line: 76, type: !608)
!688 = !DILocation(line: 76, column: 8, scope: !674)
!689 = !DILocalVariable(name: "str", scope: !674, file: !2, line: 77, type: !615)
!690 = !DILocation(line: 77, column: 7, scope: !674)
!691 = !DILocalVariable(name: "val", scope: !674, file: !2, line: 78, type: !14)
!692 = !DILocation(line: 78, column: 8, scope: !674)
!693 = !DILocation(line: 80, column: 19, scope: !694)
!694 = distinct !DILexicalBlock(scope: !674, file: !2, line: 80, column: 6)
!695 = !DILocation(line: 80, column: 13, scope: !694)
!696 = !DILocation(line: 80, column: 11, scope: !694)
!697 = !DILocation(line: 80, column: 32, scope: !694)
!698 = !DILocation(line: 80, column: 6, scope: !674)
!699 = !DILocation(line: 81, column: 13, scope: !694)
!700 = !DILocation(line: 84, column: 8, scope: !701)
!701 = distinct !DILexicalBlock(scope: !674, file: !2, line: 84, column: 2)
!702 = !DILocation(line: 84, column: 7, scope: !701)
!703 = !DILocation(line: 84, column: 12, scope: !704)
!704 = !DILexicalBlockFile(scope: !705, file: !2, discriminator: 1)
!705 = distinct !DILexicalBlock(scope: !701, file: !2, line: 84, column: 2)
!706 = !DILocation(line: 84, column: 17, scope: !704)
!707 = !DILocation(line: 84, column: 26, scope: !704)
!708 = !DILocation(line: 84, column: 14, scope: !704)
!709 = !DILocation(line: 84, column: 2, scope: !704)
!710 = !DILocation(line: 85, column: 9, scope: !711)
!711 = distinct !DILexicalBlock(scope: !705, file: !2, line: 85, column: 3)
!712 = !DILocation(line: 85, column: 8, scope: !711)
!713 = !DILocation(line: 85, column: 13, scope: !714)
!714 = !DILexicalBlockFile(scope: !715, file: !2, discriminator: 1)
!715 = distinct !DILexicalBlock(scope: !711, file: !2, line: 85, column: 3)
!716 = !DILocation(line: 85, column: 18, scope: !714)
!717 = !DILocation(line: 85, column: 27, scope: !714)
!718 = !DILocation(line: 85, column: 15, scope: !714)
!719 = !DILocation(line: 85, column: 3, scope: !714)
!720 = !DILocation(line: 87, column: 9, scope: !721)
!721 = distinct !DILexicalBlock(scope: !715, file: !2, line: 86, column: 3)
!722 = !DILocation(line: 87, column: 24, scope: !721)
!723 = !DILocation(line: 87, column: 3, scope: !721)
!724 = !DILocation(line: 88, column: 12, scope: !725)
!725 = distinct !DILexicalBlock(scope: !721, file: !2, line: 88, column: 7)
!726 = !DILocation(line: 88, column: 7, scope: !725)
!727 = !DILocation(line: 88, column: 7, scope: !721)
!728 = !DILocation(line: 89, column: 4, scope: !725)
!729 = !DILocation(line: 91, column: 15, scope: !730)
!730 = distinct !DILexicalBlock(scope: !721, file: !2, line: 91, column: 7)
!731 = !DILocation(line: 91, column: 8, scope: !730)
!732 = !DILocation(line: 91, column: 32, scope: !730)
!733 = !DILocation(line: 91, column: 7, scope: !721)
!734 = !DILocation(line: 92, column: 4, scope: !730)
!735 = !DILocation(line: 93, column: 25, scope: !721)
!736 = !DILocation(line: 93, column: 3, scope: !721)
!737 = !DILocation(line: 93, column: 8, scope: !721)
!738 = !DILocation(line: 93, column: 10, scope: !721)
!739 = !DILocation(line: 93, column: 9, scope: !721)
!740 = !DILocation(line: 93, column: 20, scope: !721)
!741 = !DILocation(line: 93, column: 19, scope: !721)
!742 = !DILocation(line: 93, column: 23, scope: !721)
!743 = !DILocation(line: 94, column: 2, scope: !721)
!744 = !DILocation(line: 85, column: 32, scope: !745)
!745 = !DILexicalBlockFile(scope: !715, file: !2, discriminator: 2)
!746 = !DILocation(line: 85, column: 3, scope: !745)
!747 = distinct !{!747, !748}
!748 = !DILocation(line: 85, column: 3, scope: !705)
!749 = !DILocation(line: 94, column: 2, scope: !750)
!750 = !DILexicalBlockFile(scope: !711, file: !2, discriminator: 1)
!751 = !DILocation(line: 84, column: 31, scope: !752)
!752 = !DILexicalBlockFile(scope: !705, file: !2, discriminator: 2)
!753 = !DILocation(line: 84, column: 2, scope: !752)
!754 = distinct !{!754, !755}
!755 = !DILocation(line: 84, column: 2, scope: !674)
!756 = !DILocation(line: 96, column: 9, scope: !674)
!757 = !DILocation(line: 96, column: 2, scope: !674)
!758 = !DILocation(line: 98, column: 1, scope: !674)
!759 = distinct !DISubprogram(name: "calculate_temp", linkageName: "_Z14calculate_tempiPfS_S_iiiiffffff", scope: !2, file: !2, line: 104, type: !760, isLocal: false, isDefinition: true, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!760 = !DISubroutineType(types: !761)
!761 = !{null, !87, !13, !13, !13, !87, !87, !87, !87, !14, !14, !14, !14, !14, !14}
!762 = !DILocalVariable(name: "iteration", arg: 1, scope: !759, file: !2, line: 104, type: !87)
!763 = !DILocation(line: 104, column: 36, scope: !759)
!764 = !DILocalVariable(name: "power", arg: 2, scope: !759, file: !2, line: 105, type: !13)
!765 = !DILocation(line: 105, column: 39, scope: !759)
!766 = !DILocalVariable(name: "temp_src", arg: 3, scope: !759, file: !2, line: 106, type: !13)
!767 = !DILocation(line: 106, column: 39, scope: !759)
!768 = !DILocalVariable(name: "temp_dst", arg: 4, scope: !759, file: !2, line: 107, type: !13)
!769 = !DILocation(line: 107, column: 39, scope: !759)
!770 = !DILocalVariable(name: "grid_cols", arg: 5, scope: !759, file: !2, line: 108, type: !87)
!771 = !DILocation(line: 108, column: 36, scope: !759)
!772 = !DILocalVariable(name: "grid_rows", arg: 6, scope: !759, file: !2, line: 109, type: !87)
!773 = !DILocation(line: 109, column: 36, scope: !759)
!774 = !DILocalVariable(name: "border_cols", arg: 7, scope: !759, file: !2, line: 110, type: !87)
!775 = !DILocation(line: 110, column: 15, scope: !759)
!776 = !DILocalVariable(name: "border_rows", arg: 8, scope: !759, file: !2, line: 111, type: !87)
!777 = !DILocation(line: 111, column: 15, scope: !759)
!778 = !DILocalVariable(name: "Cap", arg: 9, scope: !759, file: !2, line: 112, type: !14)
!779 = !DILocation(line: 112, column: 38, scope: !759)
!780 = !DILocalVariable(name: "Rx", arg: 10, scope: !759, file: !2, line: 113, type: !14)
!781 = !DILocation(line: 113, column: 38, scope: !759)
!782 = !DILocalVariable(name: "Ry", arg: 11, scope: !759, file: !2, line: 114, type: !14)
!783 = !DILocation(line: 114, column: 38, scope: !759)
!784 = !DILocalVariable(name: "Rz", arg: 12, scope: !759, file: !2, line: 115, type: !14)
!785 = !DILocation(line: 115, column: 38, scope: !759)
!786 = !DILocalVariable(name: "step", arg: 13, scope: !759, file: !2, line: 116, type: !14)
!787 = !DILocation(line: 116, column: 38, scope: !759)
!788 = !DILocalVariable(name: "time_elapsed", arg: 14, scope: !759, file: !2, line: 117, type: !14)
!789 = !DILocation(line: 117, column: 38, scope: !759)
!790 = !DILocation(line: 117, column: 51, scope: !759)
!791 = !DILocation(line: 117, column: 51, scope: !792)
!792 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 1)
!793 = !DILocation(line: 117, column: 51, scope: !794)
!794 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 2)
!795 = !DILocation(line: 117, column: 51, scope: !796)
!796 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 3)
!797 = !DILocation(line: 117, column: 51, scope: !798)
!798 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 4)
!799 = !DILocation(line: 117, column: 51, scope: !800)
!800 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 5)
!801 = !DILocation(line: 117, column: 51, scope: !802)
!802 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 6)
!803 = !DILocation(line: 117, column: 51, scope: !804)
!804 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 7)
!805 = !DILocation(line: 117, column: 51, scope: !806)
!806 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 8)
!807 = !DILocation(line: 117, column: 51, scope: !808)
!808 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 9)
!809 = !DILocation(line: 117, column: 51, scope: !810)
!810 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 10)
!811 = !DILocation(line: 117, column: 51, scope: !812)
!812 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 11)
!813 = !DILocation(line: 117, column: 51, scope: !814)
!814 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 12)
!815 = !DILocation(line: 117, column: 51, scope: !816)
!816 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 13)
!817 = !DILocation(line: 117, column: 51, scope: !818)
!818 = !DILexicalBlockFile(scope: !759, file: !2, discriminator: 14)
!819 = !DILocation(line: 215, column: 1, scope: !759)
!820 = distinct !DISubprogram(name: "compute_tran_temp", linkageName: "_Z17compute_tran_tempPfPS_iiiiiiii", scope: !2, file: !2, line: 221, type: !821, isLocal: false, isDefinition: true, scopeLine: 223, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!821 = !DISubroutineType(types: !822)
!822 = !{!87, !13, !823, !87, !87, !87, !87, !87, !87, !87, !87}
!823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!824 = !DILocalVariable(name: "MatrixPower", arg: 1, scope: !820, file: !2, line: 221, type: !13)
!825 = !DILocation(line: 221, column: 30, scope: !820)
!826 = !DILocalVariable(name: "MatrixTemp", arg: 2, scope: !820, file: !2, line: 221, type: !823)
!827 = !DILocation(line: 221, column: 49, scope: !820)
!828 = !DILocalVariable(name: "col", arg: 3, scope: !820, file: !2, line: 221, type: !87)
!829 = !DILocation(line: 221, column: 68, scope: !820)
!830 = !DILocalVariable(name: "row", arg: 4, scope: !820, file: !2, line: 221, type: !87)
!831 = !DILocation(line: 221, column: 77, scope: !820)
!832 = !DILocalVariable(name: "total_iterations", arg: 5, scope: !820, file: !2, line: 222, type: !87)
!833 = !DILocation(line: 222, column: 7, scope: !820)
!834 = !DILocalVariable(name: "num_iterations", arg: 6, scope: !820, file: !2, line: 222, type: !87)
!835 = !DILocation(line: 222, column: 29, scope: !820)
!836 = !DILocalVariable(name: "blockCols", arg: 7, scope: !820, file: !2, line: 222, type: !87)
!837 = !DILocation(line: 222, column: 49, scope: !820)
!838 = !DILocalVariable(name: "blockRows", arg: 8, scope: !820, file: !2, line: 222, type: !87)
!839 = !DILocation(line: 222, column: 64, scope: !820)
!840 = !DILocalVariable(name: "borderCols", arg: 9, scope: !820, file: !2, line: 222, type: !87)
!841 = !DILocation(line: 222, column: 79, scope: !820)
!842 = !DILocalVariable(name: "borderRows", arg: 10, scope: !820, file: !2, line: 222, type: !87)
!843 = !DILocation(line: 222, column: 95, scope: !820)
!844 = !DILocalVariable(name: "dimBlock", scope: !820, file: !2, line: 224, type: !845)
!845 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !846, line: 427, baseType: !847)
!846 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot")
!847 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !846, line: 417, size: 96, align: 32, elements: !848, identifier: "_ZTS4dim3")
!848 = !{!849, !850, !851, !852, !856, !865}
!849 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !847, file: !846, line: 419, baseType: !380, size: 32, align: 32)
!850 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !847, file: !846, line: 419, baseType: !380, size: 32, align: 32, offset: 32)
!851 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !847, file: !846, line: 419, baseType: !380, size: 32, align: 32, offset: 64)
!852 = !DISubprogram(name: "dim3", scope: !847, file: !846, line: 421, type: !853, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!853 = !DISubroutineType(types: !854)
!854 = !{null, !855, !380, !380, !380}
!855 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !847, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!856 = !DISubprogram(name: "dim3", scope: !847, file: !846, line: 422, type: !857, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!857 = !DISubroutineType(types: !858)
!858 = !{null, !855, !859}
!859 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !846, line: 383, baseType: !860)
!860 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !846, line: 190, size: 96, align: 32, elements: !861, identifier: "_ZTS5uint3")
!861 = !{!862, !863, !864}
!862 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !860, file: !846, line: 192, baseType: !380, size: 32, align: 32)
!863 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !860, file: !846, line: 192, baseType: !380, size: 32, align: 32, offset: 32)
!864 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !860, file: !846, line: 192, baseType: !380, size: 32, align: 32, offset: 64)
!865 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !847, file: !846, line: 423, type: !866, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!866 = !DISubroutineType(types: !867)
!867 = !{!859, !855}
!868 = !DILocation(line: 224, column: 14, scope: !820)
!869 = !DILocalVariable(name: "dimGrid", scope: !820, file: !2, line: 225, type: !845)
!870 = !DILocation(line: 225, column: 14, scope: !820)
!871 = !DILocation(line: 225, column: 22, scope: !820)
!872 = !DILocation(line: 225, column: 33, scope: !820)
!873 = !DILocalVariable(name: "grid_height", scope: !820, file: !2, line: 227, type: !14)
!874 = !DILocation(line: 227, column: 8, scope: !820)
!875 = !DILocation(line: 227, column: 22, scope: !820)
!876 = !DILocation(line: 227, column: 36, scope: !820)
!877 = !DILocation(line: 227, column: 34, scope: !820)
!878 = !DILocalVariable(name: "grid_width", scope: !820, file: !2, line: 228, type: !14)
!879 = !DILocation(line: 228, column: 8, scope: !820)
!880 = !DILocation(line: 228, column: 21, scope: !820)
!881 = !DILocation(line: 228, column: 34, scope: !820)
!882 = !DILocation(line: 228, column: 32, scope: !820)
!883 = !DILocalVariable(name: "Cap", scope: !820, file: !2, line: 230, type: !14)
!884 = !DILocation(line: 230, column: 8, scope: !820)
!885 = !DILocation(line: 230, column: 43, scope: !820)
!886 = !DILocation(line: 230, column: 41, scope: !820)
!887 = !DILocation(line: 230, column: 52, scope: !820)
!888 = !DILocation(line: 230, column: 50, scope: !820)
!889 = !DILocation(line: 230, column: 65, scope: !820)
!890 = !DILocation(line: 230, column: 63, scope: !820)
!891 = !DILocation(line: 230, column: 14, scope: !820)
!892 = !DILocalVariable(name: "Rx", scope: !820, file: !2, line: 231, type: !14)
!893 = !DILocation(line: 231, column: 8, scope: !820)
!894 = !DILocation(line: 231, column: 13, scope: !820)
!895 = !DILocation(line: 231, column: 40, scope: !820)
!896 = !DILocation(line: 231, column: 38, scope: !820)
!897 = !DILocation(line: 231, column: 49, scope: !820)
!898 = !DILocation(line: 231, column: 47, scope: !820)
!899 = !DILocation(line: 231, column: 24, scope: !820)
!900 = !DILocalVariable(name: "Ry", scope: !820, file: !2, line: 232, type: !14)
!901 = !DILocation(line: 232, column: 8, scope: !820)
!902 = !DILocation(line: 232, column: 13, scope: !820)
!903 = !DILocation(line: 232, column: 41, scope: !820)
!904 = !DILocation(line: 232, column: 39, scope: !820)
!905 = !DILocation(line: 232, column: 50, scope: !820)
!906 = !DILocation(line: 232, column: 48, scope: !820)
!907 = !DILocation(line: 232, column: 25, scope: !820)
!908 = !DILocalVariable(name: "Rz", scope: !820, file: !2, line: 233, type: !14)
!909 = !DILocation(line: 233, column: 8, scope: !820)
!910 = !DILocation(line: 233, column: 13, scope: !820)
!911 = !DILocation(line: 233, column: 30, scope: !820)
!912 = !DILocation(line: 233, column: 28, scope: !820)
!913 = !DILocation(line: 233, column: 44, scope: !820)
!914 = !DILocation(line: 233, column: 42, scope: !820)
!915 = !DILocation(line: 233, column: 20, scope: !820)
!916 = !DILocalVariable(name: "max_slope", scope: !820, file: !2, line: 235, type: !14)
!917 = !DILocation(line: 235, column: 8, scope: !820)
!918 = !DILocation(line: 235, column: 44, scope: !820)
!919 = !DILocation(line: 235, column: 42, scope: !820)
!920 = !DILocation(line: 235, column: 51, scope: !820)
!921 = !DILocation(line: 235, column: 27, scope: !820)
!922 = !DILocation(line: 235, column: 20, scope: !820)
!923 = !DILocalVariable(name: "step", scope: !820, file: !2, line: 236, type: !14)
!924 = !DILocation(line: 236, column: 8, scope: !820)
!925 = !DILocation(line: 236, column: 27, scope: !820)
!926 = !DILocation(line: 236, column: 25, scope: !820)
!927 = !DILocation(line: 236, column: 15, scope: !820)
!928 = !DILocalVariable(name: "t", scope: !820, file: !2, line: 237, type: !14)
!929 = !DILocation(line: 237, column: 8, scope: !820)
!930 = !DILocalVariable(name: "time_elapsed", scope: !820, file: !2, line: 238, type: !14)
!931 = !DILocation(line: 238, column: 15, scope: !820)
!932 = !DILocation(line: 239, column: 14, scope: !820)
!933 = !DILocalVariable(name: "src", scope: !820, file: !2, line: 241, type: !87)
!934 = !DILocation(line: 241, column: 13, scope: !820)
!935 = !DILocalVariable(name: "dst", scope: !820, file: !2, line: 241, type: !87)
!936 = !DILocation(line: 241, column: 22, scope: !820)
!937 = !DILocation(line: 243, column: 9, scope: !938)
!938 = distinct !DILexicalBlock(scope: !820, file: !2, line: 243, column: 2)
!939 = !DILocation(line: 243, column: 7, scope: !938)
!940 = !DILocation(line: 243, column: 14, scope: !941)
!941 = !DILexicalBlockFile(scope: !942, file: !2, discriminator: 1)
!942 = distinct !DILexicalBlock(scope: !938, file: !2, line: 243, column: 2)
!943 = !DILocation(line: 243, column: 18, scope: !941)
!944 = !DILocation(line: 243, column: 16, scope: !941)
!945 = !DILocation(line: 243, column: 2, scope: !941)
!946 = !DILocalVariable(name: "temp", scope: !947, file: !2, line: 244, type: !87)
!947 = distinct !DILexicalBlock(scope: !942, file: !2, line: 243, column: 55)
!948 = !DILocation(line: 244, column: 17, scope: !947)
!949 = !DILocation(line: 244, column: 24, scope: !947)
!950 = !DILocation(line: 245, column: 19, scope: !947)
!951 = !DILocation(line: 245, column: 17, scope: !947)
!952 = !DILocation(line: 246, column: 19, scope: !947)
!953 = !DILocation(line: 246, column: 17, scope: !947)
!954 = !DILocation(line: 247, column: 30, scope: !947)
!955 = !DILocation(line: 247, column: 39, scope: !947)
!956 = !DILocation(line: 247, column: 27, scope: !947)
!957 = !DILocation(line: 247, column: 13, scope: !947)
!958 = !DILocation(line: 247, column: 51, scope: !959)
!959 = !DILexicalBlockFile(scope: !947, file: !2, discriminator: 1)
!960 = !DILocation(line: 247, column: 51, scope: !961)
!961 = !DILexicalBlockFile(scope: !947, file: !2, discriminator: 2)
!962 = !DILocation(line: 247, column: 51, scope: !963)
!963 = !DILexicalBlockFile(scope: !947, file: !2, discriminator: 3)
!964 = !DILocation(line: 247, column: 51, scope: !965)
!965 = !DILexicalBlockFile(scope: !947, file: !2, discriminator: 4)
!966 = !DILocation(line: 247, column: 92, scope: !965)
!967 = !DILocation(line: 247, column: 104, scope: !965)
!968 = !DILocation(line: 247, column: 115, scope: !965)
!969 = !DILocation(line: 247, column: 120, scope: !965)
!970 = !DILocation(line: 247, column: 131, scope: !965)
!971 = !DILocation(line: 248, column: 3, scope: !947)
!972 = !DILocation(line: 248, column: 7, scope: !947)
!973 = !DILocation(line: 248, column: 11, scope: !947)
!974 = !DILocation(line: 248, column: 23, scope: !947)
!975 = !DILocation(line: 248, column: 35, scope: !947)
!976 = !DILocation(line: 248, column: 39, scope: !947)
!977 = !DILocation(line: 248, column: 42, scope: !947)
!978 = !DILocation(line: 248, column: 45, scope: !947)
!979 = !DILocation(line: 248, column: 48, scope: !947)
!980 = !DILocation(line: 248, column: 53, scope: !947)
!981 = !DILocation(line: 247, column: 13, scope: !965)
!982 = !DILocation(line: 249, column: 2, scope: !947)
!983 = !DILocation(line: 243, column: 39, scope: !984)
!984 = !DILexicalBlockFile(scope: !942, file: !2, discriminator: 2)
!985 = !DILocation(line: 243, column: 37, scope: !984)
!986 = !DILocation(line: 243, column: 2, scope: !984)
!987 = distinct !{!987, !988}
!988 = !DILocation(line: 243, column: 2, scope: !820)
!989 = !DILocation(line: 250, column: 16, scope: !820)
!990 = !DILocation(line: 250, column: 9, scope: !820)
!991 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !847, file: !846, line: 421, type: !853, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !852, variables: !582)
!992 = !DILocalVariable(name: "this", arg: 1, scope: !991, type: !993, flags: DIFlagArtificial | DIFlagObjectPointer)
!993 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !847, size: 64, align: 64)
!994 = !DILocation(line: 0, scope: !991)
!995 = !DILocalVariable(name: "vx", arg: 2, scope: !991, file: !846, line: 421, type: !380)
!996 = !DILocation(line: 421, column: 43, scope: !991)
!997 = !DILocalVariable(name: "vy", arg: 3, scope: !991, file: !846, line: 421, type: !380)
!998 = !DILocation(line: 421, column: 64, scope: !991)
!999 = !DILocalVariable(name: "vz", arg: 4, scope: !991, file: !846, line: 421, type: !380)
!1000 = !DILocation(line: 421, column: 85, scope: !991)
!1001 = !DILocation(line: 421, column: 95, scope: !991)
!1002 = !DILocation(line: 421, column: 97, scope: !991)
!1003 = !DILocation(line: 421, column: 102, scope: !991)
!1004 = !DILocation(line: 421, column: 104, scope: !991)
!1005 = !DILocation(line: 421, column: 109, scope: !991)
!1006 = !DILocation(line: 421, column: 111, scope: !991)
!1007 = !DILocation(line: 421, column: 116, scope: !991)
!1008 = distinct !DISubprogram(name: "usage", linkageName: "_Z5usageiPPc", scope: !2, file: !2, line: 253, type: !1009, isLocal: false, isDefinition: true, scopeLine: 254, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{null, !87, !386}
!1011 = !DILocalVariable(name: "argc", arg: 1, scope: !1008, file: !2, line: 253, type: !87)
!1012 = !DILocation(line: 253, column: 16, scope: !1008)
!1013 = !DILocalVariable(name: "argv", arg: 2, scope: !1008, file: !2, line: 253, type: !386)
!1014 = !DILocation(line: 253, column: 29, scope: !1008)
!1015 = !DILocation(line: 255, column: 10, scope: !1008)
!1016 = !DILocation(line: 255, column: 122, scope: !1008)
!1017 = !DILocation(line: 255, column: 2, scope: !1008)
!1018 = !DILocation(line: 256, column: 10, scope: !1008)
!1019 = !DILocation(line: 256, column: 2, scope: !1008)
!1020 = !DILocation(line: 257, column: 10, scope: !1008)
!1021 = !DILocation(line: 257, column: 2, scope: !1008)
!1022 = !DILocation(line: 258, column: 10, scope: !1008)
!1023 = !DILocation(line: 258, column: 2, scope: !1008)
!1024 = !DILocation(line: 259, column: 10, scope: !1008)
!1025 = !DILocation(line: 259, column: 2, scope: !1008)
!1026 = !DILocation(line: 260, column: 10, scope: !1008)
!1027 = !DILocation(line: 260, column: 2, scope: !1008)
!1028 = !DILocation(line: 261, column: 10, scope: !1008)
!1029 = !DILocation(line: 261, column: 2, scope: !1008)
!1030 = !DILocation(line: 262, column: 2, scope: !1008)
!1031 = !DILocation(line: 263, column: 1, scope: !1008)
!1032 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 265, type: !1033, isLocal: false, isDefinition: true, scopeLine: 266, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!87, !87, !386}
!1035 = !DILocalVariable(name: "argc", arg: 1, scope: !1032, file: !2, line: 265, type: !87)
!1036 = !DILocation(line: 265, column: 14, scope: !1032)
!1037 = !DILocalVariable(name: "argv", arg: 2, scope: !1032, file: !2, line: 265, type: !386)
!1038 = !DILocation(line: 265, column: 27, scope: !1032)
!1039 = !DILocation(line: 267, column: 3, scope: !1032)
!1040 = !DILocation(line: 269, column: 9, scope: !1032)
!1041 = !DILocation(line: 269, column: 14, scope: !1032)
!1042 = !DILocation(line: 269, column: 5, scope: !1032)
!1043 = !DILocation(line: 271, column: 5, scope: !1032)
!1044 = distinct !DISubprogram(name: "run", linkageName: "_Z3runiPPc", scope: !2, file: !2, line: 274, type: !1009, isLocal: false, isDefinition: true, scopeLine: 275, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !582)
!1045 = !DILocalVariable(name: "argc", arg: 1, scope: !1044, file: !2, line: 274, type: !87)
!1046 = !DILocation(line: 274, column: 14, scope: !1044)
!1047 = !DILocalVariable(name: "argv", arg: 2, scope: !1044, file: !2, line: 274, type: !386)
!1048 = !DILocation(line: 274, column: 27, scope: !1044)
!1049 = !DILocalVariable(name: "size", scope: !1044, file: !2, line: 276, type: !87)
!1050 = !DILocation(line: 276, column: 9, scope: !1044)
!1051 = !DILocalVariable(name: "grid_rows", scope: !1044, file: !2, line: 277, type: !87)
!1052 = !DILocation(line: 277, column: 9, scope: !1044)
!1053 = !DILocalVariable(name: "grid_cols", scope: !1044, file: !2, line: 277, type: !87)
!1054 = !DILocation(line: 277, column: 19, scope: !1044)
!1055 = !DILocalVariable(name: "FilesavingTemp", scope: !1044, file: !2, line: 278, type: !13)
!1056 = !DILocation(line: 278, column: 12, scope: !1044)
!1057 = !DILocalVariable(name: "FilesavingPower", scope: !1044, file: !2, line: 278, type: !13)
!1058 = !DILocation(line: 278, column: 28, scope: !1044)
!1059 = !DILocalVariable(name: "MatrixOut", scope: !1044, file: !2, line: 278, type: !13)
!1060 = !DILocation(line: 278, column: 45, scope: !1044)
!1061 = !DILocalVariable(name: "tfile", scope: !1044, file: !2, line: 279, type: !337)
!1062 = !DILocation(line: 279, column: 11, scope: !1044)
!1063 = !DILocalVariable(name: "pfile", scope: !1044, file: !2, line: 279, type: !337)
!1064 = !DILocation(line: 279, column: 19, scope: !1044)
!1065 = !DILocalVariable(name: "ofile", scope: !1044, file: !2, line: 279, type: !337)
!1066 = !DILocation(line: 279, column: 27, scope: !1044)
!1067 = !DILocalVariable(name: "total_iterations", scope: !1044, file: !2, line: 281, type: !87)
!1068 = !DILocation(line: 281, column: 9, scope: !1044)
!1069 = !DILocalVariable(name: "pyramid_height", scope: !1044, file: !2, line: 282, type: !87)
!1070 = !DILocation(line: 282, column: 9, scope: !1044)
!1071 = !DILocation(line: 284, column: 6, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1044, file: !2, line: 284, column: 6)
!1073 = !DILocation(line: 284, column: 11, scope: !1072)
!1074 = !DILocation(line: 284, column: 6, scope: !1044)
!1075 = !DILocation(line: 285, column: 9, scope: !1072)
!1076 = !DILocation(line: 285, column: 15, scope: !1072)
!1077 = !DILocation(line: 285, column: 3, scope: !1072)
!1078 = !DILocation(line: 286, column: 23, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1044, file: !2, line: 286, column: 5)
!1080 = !DILocation(line: 286, column: 18, scope: !1079)
!1081 = !DILocation(line: 286, column: 16, scope: !1079)
!1082 = !DILocation(line: 286, column: 32, scope: !1079)
!1083 = !DILocation(line: 286, column: 35, scope: !1079)
!1084 = !DILocation(line: 287, column: 23, scope: !1079)
!1085 = !DILocation(line: 287, column: 18, scope: !1079)
!1086 = !DILocation(line: 287, column: 16, scope: !1079)
!1087 = !DILocation(line: 287, column: 32, scope: !1079)
!1088 = !DILocation(line: 287, column: 35, scope: !1079)
!1089 = !DILocation(line: 288, column: 31, scope: !1079)
!1090 = !DILocation(line: 288, column: 26, scope: !1079)
!1091 = !DILocation(line: 288, column: 24, scope: !1079)
!1092 = !DILocation(line: 288, column: 40, scope: !1079)
!1093 = !DILocation(line: 288, column: 43, scope: !1079)
!1094 = !DILocation(line: 289, column: 33, scope: !1079)
!1095 = !DILocation(line: 289, column: 28, scope: !1079)
!1096 = !DILocation(line: 289, column: 26, scope: !1079)
!1097 = !DILocation(line: 289, column: 42, scope: !1079)
!1098 = !DILocation(line: 286, column: 5, scope: !1099)
!1099 = !DILexicalBlockFile(scope: !1044, file: !2, discriminator: 1)
!1100 = !DILocation(line: 290, column: 9, scope: !1079)
!1101 = !DILocation(line: 290, column: 15, scope: !1079)
!1102 = !DILocation(line: 290, column: 3, scope: !1079)
!1103 = !DILocation(line: 292, column: 8, scope: !1044)
!1104 = !DILocation(line: 292, column: 7, scope: !1044)
!1105 = !DILocation(line: 293, column: 11, scope: !1044)
!1106 = !DILocation(line: 293, column: 10, scope: !1044)
!1107 = !DILocation(line: 294, column: 11, scope: !1044)
!1108 = !DILocation(line: 294, column: 10, scope: !1044)
!1109 = !DILocation(line: 296, column: 10, scope: !1044)
!1110 = !DILocation(line: 296, column: 20, scope: !1044)
!1111 = !DILocation(line: 296, column: 19, scope: !1044)
!1112 = !DILocation(line: 296, column: 9, scope: !1044)
!1113 = !DILocalVariable(name: "borderCols", scope: !1044, file: !2, line: 300, type: !87)
!1114 = !DILocation(line: 300, column: 9, scope: !1044)
!1115 = !DILocation(line: 300, column: 23, scope: !1044)
!1116 = !DILocation(line: 300, column: 38, scope: !1044)
!1117 = !DILocation(line: 300, column: 50, scope: !1044)
!1118 = !DILocalVariable(name: "borderRows", scope: !1044, file: !2, line: 301, type: !87)
!1119 = !DILocation(line: 301, column: 9, scope: !1044)
!1120 = !DILocation(line: 301, column: 23, scope: !1044)
!1121 = !DILocation(line: 301, column: 38, scope: !1044)
!1122 = !DILocation(line: 301, column: 50, scope: !1044)
!1123 = !DILocalVariable(name: "smallBlockCol", scope: !1044, file: !2, line: 302, type: !87)
!1124 = !DILocation(line: 302, column: 9, scope: !1044)
!1125 = !DILocation(line: 302, column: 37, scope: !1044)
!1126 = !DILocation(line: 302, column: 52, scope: !1044)
!1127 = !DILocation(line: 302, column: 35, scope: !1044)
!1128 = !DILocalVariable(name: "smallBlockRow", scope: !1044, file: !2, line: 303, type: !87)
!1129 = !DILocation(line: 303, column: 9, scope: !1044)
!1130 = !DILocation(line: 303, column: 37, scope: !1044)
!1131 = !DILocation(line: 303, column: 52, scope: !1044)
!1132 = !DILocation(line: 303, column: 35, scope: !1044)
!1133 = !DILocalVariable(name: "blockCols", scope: !1044, file: !2, line: 304, type: !87)
!1134 = !DILocation(line: 304, column: 9, scope: !1044)
!1135 = !DILocation(line: 304, column: 21, scope: !1044)
!1136 = !DILocation(line: 304, column: 31, scope: !1044)
!1137 = !DILocation(line: 304, column: 30, scope: !1044)
!1138 = !DILocation(line: 304, column: 47, scope: !1044)
!1139 = !DILocation(line: 304, column: 57, scope: !1044)
!1140 = !DILocation(line: 304, column: 56, scope: !1044)
!1141 = !DILocation(line: 304, column: 70, scope: !1044)
!1142 = !DILocation(line: 304, column: 46, scope: !1044)
!1143 = !DILocation(line: 304, column: 44, scope: !1044)
!1144 = !DILocalVariable(name: "blockRows", scope: !1044, file: !2, line: 305, type: !87)
!1145 = !DILocation(line: 305, column: 9, scope: !1044)
!1146 = !DILocation(line: 305, column: 21, scope: !1044)
!1147 = !DILocation(line: 305, column: 31, scope: !1044)
!1148 = !DILocation(line: 305, column: 30, scope: !1044)
!1149 = !DILocation(line: 305, column: 47, scope: !1044)
!1150 = !DILocation(line: 305, column: 57, scope: !1044)
!1151 = !DILocation(line: 305, column: 56, scope: !1044)
!1152 = !DILocation(line: 305, column: 70, scope: !1044)
!1153 = !DILocation(line: 305, column: 46, scope: !1044)
!1154 = !DILocation(line: 305, column: 44, scope: !1044)
!1155 = !DILocation(line: 307, column: 39, scope: !1044)
!1156 = !DILocation(line: 307, column: 43, scope: !1044)
!1157 = !DILocation(line: 307, column: 32, scope: !1044)
!1158 = !DILocation(line: 307, column: 22, scope: !1044)
!1159 = !DILocation(line: 307, column: 20, scope: !1044)
!1160 = !DILocation(line: 308, column: 40, scope: !1044)
!1161 = !DILocation(line: 308, column: 44, scope: !1044)
!1162 = !DILocation(line: 308, column: 33, scope: !1044)
!1163 = !DILocation(line: 308, column: 23, scope: !1044)
!1164 = !DILocation(line: 308, column: 21, scope: !1044)
!1165 = !DILocation(line: 309, column: 35, scope: !1044)
!1166 = !DILocation(line: 309, column: 27, scope: !1044)
!1167 = !DILocation(line: 309, column: 17, scope: !1044)
!1168 = !DILocation(line: 309, column: 15, scope: !1044)
!1169 = !DILocation(line: 311, column: 10, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1044, file: !2, line: 311, column: 9)
!1171 = !DILocation(line: 311, column: 26, scope: !1170)
!1172 = !DILocation(line: 311, column: 30, scope: !1173)
!1173 = !DILexicalBlockFile(scope: !1170, file: !2, discriminator: 1)
!1174 = !DILocation(line: 311, column: 45, scope: !1173)
!1175 = !DILocation(line: 311, column: 49, scope: !1176)
!1176 = !DILexicalBlockFile(scope: !1170, file: !2, discriminator: 2)
!1177 = !DILocation(line: 311, column: 9, scope: !1176)
!1178 = !DILocation(line: 312, column: 9, scope: !1170)
!1179 = !DILocation(line: 315, column: 2, scope: !1044)
!1180 = !DILocation(line: 315, column: 18, scope: !1044)
!1181 = !DILocation(line: 315, column: 29, scope: !1044)
!1182 = !DILocation(line: 315, column: 40, scope: !1044)
!1183 = !DILocation(line: 315, column: 52, scope: !1044)
!1184 = !DILocation(line: 315, column: 64, scope: !1044)
!1185 = !DILocation(line: 315, column: 75, scope: !1044)
!1186 = !DILocation(line: 315, column: 86, scope: !1044)
!1187 = !DILocation(line: 315, column: 101, scope: !1044)
!1188 = !DILocation(line: 314, column: 5, scope: !1044)
!1189 = !DILocation(line: 317, column: 15, scope: !1044)
!1190 = !DILocation(line: 317, column: 31, scope: !1044)
!1191 = !DILocation(line: 317, column: 42, scope: !1044)
!1192 = !DILocation(line: 317, column: 53, scope: !1044)
!1193 = !DILocation(line: 317, column: 5, scope: !1044)
!1194 = !DILocation(line: 318, column: 15, scope: !1044)
!1195 = !DILocation(line: 318, column: 32, scope: !1044)
!1196 = !DILocation(line: 318, column: 43, scope: !1044)
!1197 = !DILocation(line: 318, column: 54, scope: !1044)
!1198 = !DILocation(line: 318, column: 5, scope: !1044)
!1199 = !DILocalVariable(name: "MatrixTemp", scope: !1044, file: !2, line: 320, type: !1200)
!1200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, align: 64, elements: !1201)
!1201 = !{!1202}
!1202 = !DISubrange(count: 2)
!1203 = !DILocation(line: 320, column: 12, scope: !1044)
!1204 = !DILocalVariable(name: "MatrixPower", scope: !1044, file: !2, line: 320, type: !13)
!1205 = !DILocation(line: 320, column: 28, scope: !1044)
!1206 = !DILocation(line: 321, column: 25, scope: !1044)
!1207 = !DILocation(line: 321, column: 16, scope: !1044)
!1208 = !DILocation(line: 321, column: 54, scope: !1044)
!1209 = !DILocation(line: 321, column: 53, scope: !1044)
!1210 = !DILocation(line: 321, column: 5, scope: !1044)
!1211 = !DILocation(line: 322, column: 25, scope: !1044)
!1212 = !DILocation(line: 322, column: 16, scope: !1044)
!1213 = !DILocation(line: 322, column: 54, scope: !1044)
!1214 = !DILocation(line: 322, column: 53, scope: !1044)
!1215 = !DILocation(line: 322, column: 5, scope: !1044)
!1216 = !DILocation(line: 323, column: 16, scope: !1044)
!1217 = !DILocation(line: 323, column: 31, scope: !1044)
!1218 = !DILocation(line: 323, column: 61, scope: !1044)
!1219 = !DILocation(line: 323, column: 60, scope: !1044)
!1220 = !DILocation(line: 323, column: 5, scope: !1044)
!1221 = !DILocation(line: 325, column: 16, scope: !1044)
!1222 = !DILocation(line: 325, column: 52, scope: !1044)
!1223 = !DILocation(line: 325, column: 51, scope: !1044)
!1224 = !DILocation(line: 325, column: 5, scope: !1044)
!1225 = !DILocation(line: 326, column: 16, scope: !1044)
!1226 = !DILocation(line: 326, column: 29, scope: !1044)
!1227 = !DILocation(line: 326, column: 60, scope: !1044)
!1228 = !DILocation(line: 326, column: 59, scope: !1044)
!1229 = !DILocation(line: 326, column: 5, scope: !1044)
!1230 = !DILocation(line: 327, column: 5, scope: !1044)
!1231 = !DILocalVariable(name: "ret", scope: !1044, file: !2, line: 328, type: !87)
!1232 = !DILocation(line: 328, column: 9, scope: !1044)
!1233 = !DILocation(line: 328, column: 33, scope: !1044)
!1234 = !DILocation(line: 328, column: 45, scope: !1044)
!1235 = !DILocation(line: 328, column: 56, scope: !1044)
!1236 = !DILocation(line: 328, column: 66, scope: !1044)
!1237 = !DILocation(line: 329, column: 3, scope: !1044)
!1238 = !DILocation(line: 329, column: 20, scope: !1044)
!1239 = !DILocation(line: 329, column: 36, scope: !1044)
!1240 = !DILocation(line: 329, column: 47, scope: !1044)
!1241 = !DILocation(line: 329, column: 58, scope: !1044)
!1242 = !DILocation(line: 329, column: 70, scope: !1044)
!1243 = !DILocation(line: 328, column: 15, scope: !1044)
!1244 = !DILocation(line: 330, column: 2, scope: !1044)
!1245 = !DILocation(line: 331, column: 16, scope: !1044)
!1246 = !DILocation(line: 331, column: 38, scope: !1044)
!1247 = !DILocation(line: 331, column: 27, scope: !1044)
!1248 = !DILocation(line: 331, column: 58, scope: !1044)
!1249 = !DILocation(line: 331, column: 57, scope: !1044)
!1250 = !DILocation(line: 331, column: 5, scope: !1044)
!1251 = !DILocation(line: 333, column: 17, scope: !1044)
!1252 = !DILocation(line: 333, column: 27, scope: !1044)
!1253 = !DILocation(line: 333, column: 38, scope: !1044)
!1254 = !DILocation(line: 333, column: 49, scope: !1044)
!1255 = !DILocation(line: 333, column: 5, scope: !1044)
!1256 = !DILocation(line: 335, column: 14, scope: !1044)
!1257 = !DILocation(line: 335, column: 5, scope: !1044)
!1258 = !DILocation(line: 336, column: 14, scope: !1044)
!1259 = !DILocation(line: 336, column: 5, scope: !1044)
!1260 = !DILocation(line: 337, column: 14, scope: !1044)
!1261 = !DILocation(line: 337, column: 5, scope: !1044)
!1262 = !DILocation(line: 338, column: 10, scope: !1044)
!1263 = !DILocation(line: 338, column: 5, scope: !1044)
!1264 = !DILocation(line: 339, column: 1, scope: !1044)
