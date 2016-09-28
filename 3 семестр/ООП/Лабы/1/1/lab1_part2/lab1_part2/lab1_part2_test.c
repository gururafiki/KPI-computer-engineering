#include "lab1_part2.h"

int main()
{
	char *argz;
	size_t argz_len;
	// 1
	printf("1:\n");
	if (argz_create_sep("SHELL=/bin/bash:usr=monty:=/bin/monty:LANG=en_US.UTF-8", 58 /*ASCII for : */, &argz, &argz_len) == OK)
	{
		argz_print(argz, argz_len);
		// 2
		printf("\n2 - %d\n", argz_count(argz, argz_len));
		// 3
		printf("\n3:\n");
		argz_add(&argz, &argz_len, "asdf");
		argz_print(argz, argz_len);
		// 4
		printf("\n4:\n");
		argz_delete(&argz, &argz_len, argz + 16); // в качестве третьего параметра, лучше использовать argz_next()
		argz_print(argz, argz_len);
		// 5
		printf("\n5:\n");
		argz_insert(&argz, &argz_len, argz, "new string");
		argz_print(argz, argz_len);
		// 6
		//	argz_next()
		//	используется в argz_print()
		// 7
		printf("\n7:\n");
		argz_replace(&argz, &argz_len, "new string", "string2");
		argz_print(argz, argz_len);
	}
	else printf("ERROR: Something went wrong! Check it out and try again.");

	return 0;
}