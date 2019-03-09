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

__global__ void print_thread_variables()
{
	printf("Thread{%d,%d,%d}, Block{%d,%d,%d}, BlockDim{%d,%d,%d}, GridDim{%d,%d,%d}\n",
		threadIdx.x, threadIdx.y, threadIdx.z,
		blockIdx.x, blockIdx.y, blockIdx.z,
		blockDim.x, blockDim.y, blockDim.z,
		gridDim.x, gridDim.y, gridDim.z
		);
}

__global__ void print_unique_thread_id_1D()
{
	int tid = blockIdx.x * blockDim.x + threadIdx.x;

	printf("Thread{%d,%d,%d}, Block{%d,%d,%d}, tid{%d}\n",
		threadIdx.x, threadIdx.y, threadIdx.z,
		blockIdx.x, blockIdx.y, blockIdx.z,
		tid);
}
