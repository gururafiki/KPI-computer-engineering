#if defined _LAB1_PART1
#endinput
#endif
#define _LAB1_PART1

#include <stdio.h>
#include <string.h> // strlen(), strstr(), ..
#include <stdlib.h> // calloc(), malloc(), realloc(), free()

int substr(const char *string1, const char *string2);
int subseq(const char *string1, const char *string2);
char ispal(const char *string);
char* makepal(const char *string);
double* txt2double(const char *string, int *size);