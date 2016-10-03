; ModuleID = 'loopkernel-device-cuda-nvptx64-nvidia-cuda-sm_20.bc'
source_filename = "loopkernel.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }

@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent
define void @_Z6kernelPiS_(i32* %a, i32* %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %idxprom = zext i32 %0 to i64
  %1 = load i32*, i32** %b.addr, align 8
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !range !8
  %idxprom2 = zext i32 %3 to i64
  %4 = load i32*, i32** %a.addr, align 8
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %idxprom2
  store i32 %2, i32* %arrayidx3, align 4
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!6 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)"}
!7 = !{i32 1, i32 2}
!8 = !{i32 0, i32 1024}
