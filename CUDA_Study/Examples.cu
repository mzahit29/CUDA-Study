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

__global__ void print_unique_thread_id_3D(int * data)
{
	int thread_count_in_block = blockDim.x * blockDim.y * blockDim.z;
	
	// Inside a block, threads access consecutive elements of array
	// (for z=0) 0 1  (for z=1) 4 5
	//           2 3            6 7
	int tid_in_block = blockDim.x * blockDim.y * threadIdx.z + blockDim.x * threadIdx.y + threadIdx.x;

	int bid_in_grid = gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y + blockIdx.x;

	
	int gid = bid_in_grid * thread_count_in_block + tid_in_block;

	printf("gid{%d}, data[%d] = %d\n", gid, gid, data[gid]);
}
