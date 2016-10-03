
__global__
void kernel(int *a, int *b) {
    a[threadIdx.x] = b[threadIdx.x];
}

int main()
{
    int a[10] = {2};
    int b[10] = {1};

    int *a_d;
    int *b_d;
    cudaMalloc( &a_d, sizeof(a) );
    cudaMalloc( &b_d, sizeof(b) );
    cudaMemcpy(a_d, a, sizeof(a), cudaMemcpyHostToDevice );
    cudaMemcpy(b_d, b, sizeof(b), cudaMemcpyHostToDevice );
    kernel<<<10,1>>>(a,b);
    cudaMemcpy(a, a_d, sizeof(a), cudaMemcpyDeviceToHost );
    cudaFree(a_d);
    cudaFree(b_d);
}
