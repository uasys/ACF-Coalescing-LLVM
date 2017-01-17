; ModuleID = './src/1-conditional.c'
source_filename = "./src/1-conditional.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable
define i32 @a(i32 %c1, i32 %c2, i32 %c3) local_unnamed_addr #0 {
entry:
  %tobool = icmp eq i32 %c1, 0
  br i1 %tobool, label %if.else, label %if.end4

if.else:                                          ; preds = %entry
  %tobool1 = icmp eq i32 %c2, 0
  br i1 %tobool1, label %if.else3, label %if.then2

if.then2:                                         ; preds = %if.else
  %add = add nsw i32 %c3, 4
  br label %if.end4

if.else3:                                         ; preds = %if.else
  %dec = add nsw i32 %c3, -1
  br label %if.end4

if.end4:                                          ; preds = %entry, %if.then2, %if.else3
  %a.0 = phi i32 [ 1, %if.then2 ], [ 2, %if.else3 ], [ 8, %entry ]
  %b.0 = phi i32 [ %add, %if.then2 ], [ %dec, %if.else3 ], [ %c3, %entry ]
  %add5 = add nsw i32 %b.0, %a.0
  ret i32 %add5
}

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 31cdb61cadbdd09862ed8ab9298c57997a0df710) (http://llvm.org/git/llvm.git 3b7d88cca41f31c738050239d6a789ec155e2258)"}
