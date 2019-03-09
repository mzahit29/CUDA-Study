#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "Examples.cuh"
#include <cstdlib>
#include <time.h>
#include <stdio.h>


int main()
{
  
	int nx{ 4 };
	int ny{ 4 };
	int nz{ 4 };

	dim3 block(2, 2, 2);
	dim3 grid(nx / block.x, ny / block.y, nz / block.z);


	// Allocate memory for 64 ints on host
	int array_size{ 64 };
	int * data_h = (int *)malloc(array_size * sizeof(int));

	// Fill the array with random values between 0-63
	srand(time(0));
	for (int i = 0; i < array_size; ++i)
	{
		data_h[i] = rand() % array_size;
	}

	// Print the array contents for debugging
	for (int i = 0; i < array_size; i++)
	{
		printf("%d ", data_h[i]);
	} printf("\n");

	// Allocate memory on device
	int * data_d;
	cudaMalloc((void **)&data_d, array_size * sizeof(int));

	// Copy the host array 
	cudaMemcpy(data_d, data_h, array_size * sizeof(int), cudaMemcpyKind::cudaMemcpyHostToDevice);

	print_unique_thread_id_3D << < grid, block>> > (data_d);

	// Wait for GPU threads to finish
	cudaDeviceSynchronize();

	// Free the allocated memory on host and device
	free(data_h);
	cudaFree(data_d);

	cudaDeviceReset();

    return 0;
}
