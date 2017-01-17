; ModuleID = './src/0-arithmetic.c'
source_filename = "./src/0-arithmetic.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable
define i32 @a(i32 %arg) local_unnamed_addr #0 {
entry:
  %mul1 = mul i32 %arg, 9
  %div = sdiv i32 %mul1, %arg
  ret i32 %div
}

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 31cdb61cadbdd09862ed8ab9298c57997a0df710) (http://llvm.org/git/llvm.git 3b7d88cca41f31c738050239d6a789ec155e2258)"}
