#include <stdio.h>
#include "Examples.cuh"


__global__ void hello_cuda()
{
	printf("Hello Cuda\n");
}
