#include <stdio.h>
#include "Examples.cuh"
#include <device_launch_parameters.h>


__global__ void hello_cuda()
{
	printf("Hello Cuda\n");
}

__global__ void print_thread_id()
{
	printf("Hello Cuda tid[%d, %d, %d]\n",
		threadIdx.x + blockDim.x * blockIdx.x,
		threadIdx.y + blockDim.y * blockIdx.y,
		threadIdx.z + blockDim.z * blockIdx.z);
		//threadIdx.x, threadIdx.y, threadIdx.z);
}
