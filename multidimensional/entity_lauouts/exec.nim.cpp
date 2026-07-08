// CUDA Kernel: Executed simultaneously by thousands of GPU cores
__global__ void omnipotentMatrixKernel(float* omniSpace, int width, int height, int depth) {
    // Map thread coordinates to a physical 3D grid space
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int z = blockIdx.z * blockDim.z + threadIdx.z;

    // Boundary check for the edges of our universe
    if (x < width && y < height && z < depth) {
        // Map 3D coordinates to a 1D flat memory array
        int idx = x + (y * width) + (z * width * height);
        
        // Every thread alters its own reality at the exact same microsecond
        omniSpace[idx] = omniSpace[idx] * 0.0f; // Collapse the space to zero
    }
}
