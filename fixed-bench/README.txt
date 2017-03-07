gaussian - kernels 15% faster
Fan1 - Work with transposed matrices (better access characteristics)
Fan2 - Work with transposed matrices (better access characteristics)
     - Switch thread access for b_cuda (better access characteristics)
lavaMD - kernel 28% faster
     - Align shared memory buffer to 96 elements (from 100)
     - Don't launch wasted threads (128 threads to 96)
nw - kernel 15% faster
     - thread < 32 rather than thread = 0
srad - kernels 21% faster
     - min(max()) instead of conditional expressions
