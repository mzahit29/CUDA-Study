#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "Examples.cuh"


int main()
{
  
	int nx{16};
	int ny{4};
	dim3 block(8, 2, 1);
	dim3 grid(nx / block.x, ny / block.y, 1);

	print_thread_variables << < grid, block>> > ();

	cudaDeviceSynchronize();

	cudaDeviceReset();

    return 0;
}