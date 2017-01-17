
for f in $(ls src)
do
  clang -O2 -S -emit-llvm ./src/$f -o ./llvm-ir/"${f%.*}.ll"
  #opt -O2 ./llvm-ir/"${f%.*}.ll" -o ./llvm-ir/"${f%.*}.ll"
done
