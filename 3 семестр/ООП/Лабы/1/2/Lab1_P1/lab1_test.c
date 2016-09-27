#include <stdio.h>
#include "forlab1.h"

int main(int argc, char const *argv[])
{
	printf("function substr('kekos', 'os')	: %d\n", substr("kekos", "os"));
	printf("function subseq('KPIrazdvaraz', 'raz')'	: %d\n", subseq("KPIrazdvaraz", "raz"));
	printf("function ispal('lol')		: %d\n", ispal("lol"));
	printf("function makepal('Pascal')	: %s\n", makepal("Pascalac"));
	printf("function txt2double('2.3;2.2;3.14', &size):\n");

	int size = 0;
	double *array = txt2double("2.3;2.a2;3.14", &size);

	if (array != NULL)
		for (int i = 0; i < size; ++i)
			printf("%.4e ", array[i]);
	else
		printf("array == NULL\n");

	printf("\n");

	return 0;
}