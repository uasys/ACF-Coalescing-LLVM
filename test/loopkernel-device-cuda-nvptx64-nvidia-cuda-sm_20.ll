; ModuleID = 'loopkernel.cu'
source_filename = "loopkernel.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }

@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent nounwind
define void @_Z6kernelPiS_(i32* %a, i32* %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %a.addr, align 8
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %idxprom = zext i32 %2 to i64
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %b.addr, align 8
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %idxprom3 = zext i32 %4 to i64
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %idxprom3
  %5 = load i32, i32* %arrayidx4, align 4
  %6 = load i32*, i32** %a.addr, align 8
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %idxprom6 = zext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %idxprom6
  store i32 %5, i32* %arrayidx7, align 4
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %rem = urem i32 %8, 2
  %cmp9 = icmp eq i32 %rem, 0
  br i1 %cmp9, label %if.then10, label %if.end14

if.then10:                                        ; preds = %if.end
  %9 = load i32*, i32** %a.addr, align 8
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %idxprom12 = zext i32 %10 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %9, i64 %idxprom12
  store i32 0, i32* %arrayidx13, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then10, %if.end
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !1, !3, !3, !3, !3, !4, !4, !3}
!llvm.module.flags = !{!5}
!llvm.ident = !{!6}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!7}

!0 = !{void (i32*, i32*)* @_Z6kernelPiS_, !"kernel", i32 1}
!1 = !{null, !"align", i32 8}
!2 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!3 = !{null, !"align", i32 16}
!4 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!5 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!6 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!7 = !{i32 1, i32 2}
!8 = !{i32 0, i32 1024}
