#include "stdio.h"
#include <iostream>
#include "time.h"

int A[8];
int k;

int asm_func()
{
	_asm
	{
		mov k, 1
		mov EAX, 0 // i = 0
		repeat:
		mov ECX, k
		shl ECX, 1
		mov EBX, k
		add EBX, EAX // j = i + k * 2
		cmp EBX, 11
		jbe SHORT if_not
		mov ECX, k
		mov DWORD PTR A[EAX], ECX
		jmp if_end
		if_not:
		inc k
		mov ECX, k
		mov DWORD PTR A[EAX], ECX
		if_end:
		add EAX, 4
		cmp EAX, 8
		jb SHORT repeat
	}

	for (int i = 0; i < 8; i++)
		printf("%d ", A[i]);
	printf("\n");

	return 0;
}

int simple_func()
{
	int i, j;
	k = 1;
	i = 0;

	do
	{
		j = i + k * 2;
		if (j > 11)
			A[i] = j;
		else
		{
			k += 1;
			A[i] = k;
		}

		i++;
	} while (i < 8);

	for (i = 0; i < 8; i++)
		printf("%d ", A[i]);
	printf("\n");

	return 0;
}

int main()
{
	int time = clock();
	simple_func();
	std::cout << "Time without asm: " << clock() - time << "ms \n \n";

	time = clock();
	asm_func();
	std::cout << "Asm time: " << clock() - time << "ms \n \n";

	return 0;
}