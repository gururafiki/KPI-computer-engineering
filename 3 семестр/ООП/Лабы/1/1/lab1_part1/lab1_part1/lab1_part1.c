#include "lab1_part1.h"

int substr(const char *string1, const char *string2)
{
	const char *sub = (char*)strstr(string1, string2);

	return sub != NULL ? sub - string1 + 1 : -1;
}

int subseq(const char *string1, const char *string2)
{
	const int len1 = strlen(string1);
	const int len2 = strlen(string2);

	int imax = 0, jmax = 0;

	int *matrix = (int*)calloc(((len1 + 1) * (len2 + 1)), sizeof(int));	// возможно, выделил немного больше памяти, чем нужно
	
	if (matrix == NULL)
		return -1;

	for (int i = 0; i < len1; i++)
	{
		for (int j = 0; j < len2; j++)
		{
			if (*(string1 + i) == *(string2 + j))
			{
				*(matrix + (i + 1) * len2 + (j + 1)) = *(matrix + i * len2 + j) + 1;
				if (*(matrix + (i + 1) * len2 + (j + 1)) > *(matrix + imax*len2 + jmax))
				{
					imax = i + 1;
					jmax = j + 1;
				}
			}
		}
	}

	imax = *(matrix + imax*len2 + jmax); // записываем результат в уже неиспользумую переменную

	free(matrix); // освобождаем память

	return imax; // возвращаем результат
}

char ispal(const char *string)
{
	const int len = strlen(string);

	for (int i = 0; i < len / 2; i++)
	{
	//	printf("%c-%c\n", *(string + i), *(string + len - 1 - i));

		if (*(string + i) != *(string + len - 1 - i))
			return '0';
	}

	return '1';
}

char* makepal(const char *string)
{
	int len = strlen(string);
	char *substring;

	if (ispal(string) == '1')
	{
		if ((substring = (char*)malloc((len + 1) * sizeof(char))) == NULL)
			return NULL;

		strcpy(substring, string);
	}
	else
	{
		int equal = 1;

		for (int i = len - 1; i > 0; i--)
		{
			if (*(string + i) == *(string + i - 1))
				equal++;
			else
				break;
		}

		if ((substring = (char*)malloc((len * 2 - equal + 1) * sizeof(char))) == NULL)
			return NULL;

		strcpy(substring, string);

		for (int i = 0; i < len - equal; i++)
		{
			*(substring + len + i) = *(string + len - equal - 1 - i);
		}

		*(substring + len * 2 - equal) = '\0';
	}

	return substring;
}

double* txt2double(const char *string, int *size)
{
	double *arr = NULL;
	char *ptr = string;
	const int len = strlen(string);
	*size = 0;

	do
	{
		if (isdigit(*ptr))
		{
			if ((arr = realloc(arr, ++*size * sizeof(double))) == NULL)
				return NULL;

			arr[*size - 1] = strtod(ptr, &ptr);
		}
		else if (*ptr == ';' && !(*ptr == '.' && !isdigit(*(ptr + 1))))
		{
			ptr++;
		}
		else
		{
			*size = 0;
			free(arr);

			return NULL;
		}
	} while (ptr < string + len);

	return arr;
}