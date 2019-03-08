#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "Examples.cuh"


int main()
{
  
	hello_cuda << <1, 4 >> > ();

	cudaDeviceSynchronize();

	cudaDeviceReset();

    return 0;
}