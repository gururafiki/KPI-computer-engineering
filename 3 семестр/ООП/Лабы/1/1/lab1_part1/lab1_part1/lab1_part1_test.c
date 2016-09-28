#include "lab1_part1.h"

int main()
{
	printf("1 - %d\n", substr("Hello, World", "orl"));
	printf("2 - %d\n", subseq("llasdlasdddd", "jllasdddd"));
	printf("3 - %c\n", ispal("aagsaa"));
	printf("4 - %s\n", makepal("ass"));

	// 5
	int size = 0;
	double *arr = txt2double("3.14;8.16;10", &size);
	for (int i = 0; i < size; i++)
	{
		printf("5 - arr[%d] = %.4f\n", i, arr[i]);
	}

	if (size == 0)
		printf("5 - (size = 0)\n");

	return 0;
}