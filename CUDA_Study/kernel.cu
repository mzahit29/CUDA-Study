#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "Examples.cuh"


int main()
{
  
	dim3 block(2, 1, 1);  // 2 threads in x dimension per block
	dim3 grid(4, 1, 1);  // 4 blocks in x dimension

	hello_cuda << <grid, block >> > ();

	cudaDeviceSynchronize();

	cudaDeviceReset();

    return 0;
}