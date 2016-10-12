; ModuleID = 'loopkernel.cu'
source_filename = "loopkernel.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

; Function Attrs: uwtable
define void @_Z6kernelPiS_(i32* %a, i32* %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  %0 = bitcast i32** %a.addr to i8*
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0)
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %setup.next, label %setup.end

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %b.addr to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %setup.next1, label %setup.end

setup.next1:                                      ; preds = %setup.next
  %6 = call i32 @cudaLaunch(i8* bitcast (void (i32*, i32*)* @_Z6kernelPiS_ to i8*))
  br label %setup.end

setup.end:                                        ; preds = %setup.next1, %setup.next, %entry
  ret void
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: norecurse uwtable
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %b = alloca [10 x i32], align 16
  %a_d = alloca i32*, align 8
  %b_d = alloca i32*, align 8
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp5 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp5.coerce = alloca { i64, i32 }, align 4
  store i32 0, i32* %retval, align 4
  %0 = bitcast [10 x i32]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 40, i32 16, i1 false)
  %1 = bitcast i8* %0 to [10 x i32]*
  %2 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i32 0
  store i32 2, i32* %2
  %3 = bitcast [10 x i32]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 40, i32 16, i1 false)
  %4 = bitcast i8* %3 to [10 x i32]*
  %5 = getelementptr [10 x i32], [10 x i32]* %4, i32 0, i32 0
  store i32 1, i32* %5
  %call = call i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %a_d, i64 40)
  %call1 = call i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %b_d, i64 40)
  %6 = load i32*, i32** %a_d, align 8
  %7 = bitcast i32* %6 to i8*
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0
  %8 = bitcast i32* %arraydecay to i8*
  %call2 = call i32 @cudaMemcpy(i8* %7, i8* %8, i64 40, i32 1)
  %9 = load i32*, i32** %b_d, align 8
  %10 = bitcast i32* %9 to i8*
  %arraydecay3 = getelementptr inbounds [10 x i32], [10 x i32]* %b, i32 0, i32 0
  %11 = bitcast i32* %arraydecay3 to i8*
  %call4 = call i32 @cudaMemcpy(i8* %10, i8* %11, i64 40, i32 1)
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 10, i32 1, i32 1)
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp5, i32 1, i32 1, i32 1)
  %12 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*
  %13 = bitcast %struct.dim3* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 12, i32 4, i1 false)
  %14 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0
  %15 = load i64, i64* %14, align 4
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = bitcast { i64, i32 }* %agg.tmp5.coerce to i8*
  %19 = bitcast %struct.dim3* %agg.tmp5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 12, i32 4, i1 false)
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 0
  %21 = load i64, i64* %20, align 4
  %22 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %call6 = call i32 @cudaConfigureCall(i64 %15, i32 %17, i64 %21, i32 %23, i64 0, %struct.CUstream_st* null)
  %tobool = icmp ne i32 %call6, 0
  br i1 %tobool, label %kcall.end, label %kcall.configok

kcall.configok:                                   ; preds = %entry
  %arraydecay7 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0
  %arraydecay8 = getelementptr inbounds [10 x i32], [10 x i32]* %b, i32 0, i32 0
  call void @_Z6kernelPiS_(i32* %arraydecay7, i32* %arraydecay8)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %entry
  %arraydecay9 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0
  %24 = bitcast i32* %arraydecay9 to i8*
  %25 = load i32*, i32** %a_d, align 8
  %26 = bitcast i32* %25 to i8*
  %call10 = call i32 @cudaMemcpy(i8* %24, i8* %26, i64 40, i32 2)
  %27 = load i32*, i32** %a_d, align 8
  %28 = bitcast i32* %27 to i8*
  %call11 = call i32 @cudaFree(i8* %28)
  %29 = load i32*, i32** %b_d, align 8
  %30 = bitcast i32* %29 to i8*
  %call12 = call i32 @cudaFree(i8* %30)
  %31 = load i32, i32* %retval, align 4
  ret i32 %31
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: inlinehint uwtable
define internal i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %devPtr, i64 %size) #3 {
entry:
  %devPtr.addr = alloca i32**, align 8
  %size.addr = alloca i64, align 8
  store i32** %devPtr, i32*** %devPtr.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  %0 = load i32**, i32*** %devPtr.addr, align 8
  %1 = bitcast i32** %0 to i8*
  %2 = bitcast i8* %1 to i8**
  %3 = load i64, i64* %size.addr, align 8
  %call = call i32 @cudaMalloc(i8** %2, i64 %3)
  ret i32 %call
}

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #4

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #4

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0
  %0 = load i32, i32* %vx.addr, align 4
  store i32 %0, i32* %x, align 4
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1
  %1 = load i32, i32* %vy.addr, align 4
  store i32 %1, i32* %y, align 4
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2
  %2 = load i32, i32* %vz.addr, align 4
  store i32 %2, i32* %z, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @cudaFree(i8*) #4

declare i32 @cudaMalloc(i8**, i64) #4

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
