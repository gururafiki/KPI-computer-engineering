#include "lab1_part2.h"

int main()
{
	char *argz;
	size_t argz_len;
	// 1
	printf("1:\n");
	if (argz_create_sep("SHELL=/bin/bash:usr=monty:=/bin/monty:LANG=en_US.UTF-8", 58 /*ASCII for : */, &argz, &argz_len) == OK)
	{
		for (int i = 0; i < argz_len; i++)
		{
			printf("%c", *(argz + i) == '\0' ? '\n' : *(argz + i));
		}
		// 2
		printf("\n2 - %d\n", argz_count(argz, argz_len));
		// 3
		printf("\n3:\n");
		argz_add(&argz, &argz_len, "asdf");
		for (int i = 0; i < argz_len; i++)
		{
			printf("%c", *(argz + i) == '\0' ? '\n' : *(argz + i));
		}
		// 4
		printf("\n4:\n");
		argz_delete(&argz, &argz_len, "LANG=en_US.UTF-8");
		for (int i = 0; i < argz_len; i++)
		{
			printf("%c", *(argz + i) == '\0' ? '\n' : *(argz + i));
		}
	}
	else printf("ERROR: Something went wrong! Check it out and try again.");

	return 0;
}