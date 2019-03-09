#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "Examples.cuh"


int main()
{
  
	int nx{16};
	int ny{1};
	dim3 block(8, 1, 1);
	dim3 grid(nx / block.x, ny / block.y, 1);

	print_unique_thread_id_1D << < grid, block>> > ();

	cudaDeviceSynchronize();

	cudaDeviceReset();

    return 0;
}