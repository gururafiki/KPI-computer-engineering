// lab2_18.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include "time.h"
#include <iostream>

int simple_func(){
	int i = 0;
	int A[11];
	int s = 0;

	do{
		A[i] = 2 * i;
		s += A[i];
		if (s > 80)
			A[i] = s;
		i++;
	} while (i < 11);
	for (i = 0; i < 11; i++)
		printf("%d ", A[i]);
	printf("\n");
	return 0;
}

int asm_func(){
	int i = 0;
	int A[11];
	int s = 0;

	_asm{
		//do
		do_while:
		//A[i] = 2 * i;
		mov EAX, i
		shl EAX, 1
		mov A[EAX*2], EAX
		//s += A[i];
		add s, EAX
		//mov s, ECX
		//if (s > 80)
		cmp s, 80
		jle SHORT esc_if
			//A[i] = s;
			mov ECX, s
			mov A[EAX*2], ECX
		esc_if :
		//i++;
		inc i;
		//while (i < 11)
		cmp i, 11
		jl SHORT do_while
	}
	for (i = 0; i < 11; i++)
		printf("%d ", A[i]);
	printf("\n");
	return 0;
}


int main()
{
	int c = clock();
	simple_func();
	std::cout << "Time without asm: " << clock() - c << "ms \n \n";

	c = clock();
	asm_func();
	std::cout << "Asm time: " << clock() - c << "ms \n \n";

	return 0;
}
