; ModuleID = './src/2-loop.c'
source_filename = "./src/2-loop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @a(i32 %iter, i32* nocapture readonly %b) local_unnamed_addr #0 {
entry:
  %cmp5 = icmp sgt i32 %iter, 0
  br i1 %cmp5, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %iter to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds i32, i32* %b, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %cmp1 = icmp eq i32 %1, 0
  %2 = trunc i64 %indvars.iv to i32
  br i1 %cmp1, label %cleanup.loopexit, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %cleanup.loopexit

cleanup.loopexit:                                 ; preds = %for.inc, %for.body
  %.ph = phi i32 [ 0, %for.inc ], [ %2, %for.body ]
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %entry
  %3 = phi i32 [ 0, %entry ], [ %.ph, %cleanup.loopexit ]
  ret i32 %3
}

attributes #0 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 31cdb61cadbdd09862ed8ab9298c57997a0df710) (http://llvm.org/git/llvm.git 3b7d88cca41f31c738050239d6a789ec155e2258)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
