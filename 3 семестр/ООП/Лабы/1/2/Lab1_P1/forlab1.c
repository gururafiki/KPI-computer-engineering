#include <stdlib.h>
#include <stdio.h>

int substr(const char *string1, const char *string2) {

	int lenString1, lenString2;

	for (int i = 0; *(string1 + i) != '\0'; ++i)
		lenString1 = i + 1;

	for (int i = 0; *(string2 + i) != '\0'; ++i)
		lenString2 = i + 1;

	for (int i = 0; i < lenString1; i++) {
		if (*(string1 + i) == *(string2)) {
			for (int j = 0; j < lenString2; ++j) 
				if (*(string1 + i + j) != *(string2 + j)) 
					return -1;

			return i;
		}
	}

	return -1;
}

int subseq(const char *string1, const char *string2) {

	int lenString1, lenString2;

	for (int i = 0; *(string1 + i) != '\0'; ++i)
		lenString1 = i;
	lenString1++;

	for (int i = 0; *(string2 + i) != '\0'; ++i)
		lenString2 = i;
	lenString2++;

	int k;
	int maxSeq = 0;
	for (int i = 0; i < lenString1; ++i)
		for (int j = 0; j < lenString2; ++j)
			if (*(string1 + i) == *(string2 + j)) {
				k = 0;
				while ((*(string1 + i + k) == *(string2 + j + k)) && ((i + k < lenString1) && (j + k < lenString2)))
					k++;
				if (k > maxSeq)
					maxSeq = k;
			}

	return maxSeq;
}

char ispal(const char *string) 
{
	int len;
	for (int i = 0; *(string + i) != '\0'; ++i)
		len = i;
	len++;

	int i = 0;
	while ((*(string + i) == *(string + len - i - 1)) && (i < len / 2))
		i++;

	if (i == len / 2)
		return 1;
	else
		return 0;
}

char* makepal(const char *string)
{
	int len;
	for (int i = 0; *(string + i) != '\0'; ++i)
		len = i;
	len++;

	int equal = 1;
	for (int i = 0; i < len; ++i)
		if (ispal(string + i))
		{
			equal = len - i;
			break;
		}	

	char *p = (char*) malloc(len + len - equal + 1);
	if (p == NULL)
		exit(1);

	*(p + 2 * len - equal) = '\0';

	for (int i = 0; i < len; ++i)
		*(p + i) = *(string + i);

	for (int i = 0; i < len - equal; ++i)
		*(p + len + i) = *(string + len - equal - i - 1);

	return p;
}

double* txt2double(const char *string, int *size)
{
	double 	*a 	= NULL;
	char   	*p 	= NULL;

	int dotsNum = 0;
	int i = 0;
	while (*(string + i) != '\0')
	{
		if (*(string + i) == '.')
		{
			dotsNum++;
			if (dotsNum > 1)
			{
				*size = 0;
				return NULL;
			}
		}

		if (*(string + i) == ';')
		{
			dotsNum = 0;
			++*size;
		}

		if ((*(string + i) != '.') && (*(string + i) != ';') && (!(isdigit(*(string + i)))))
		{
			*size = 0;
			return NULL;
		}
		i++;
	}
	++*size;
	if ((a = (double*) malloc (sizeof(double) * *size)) == NULL)
		exit(1);

	*a = strtod(string, &p); 
	i = 1;
	while (*p == ';')
	{
		*(a + i) = strtod(p + 1, &p);
		i++;
	}

	return a;
}