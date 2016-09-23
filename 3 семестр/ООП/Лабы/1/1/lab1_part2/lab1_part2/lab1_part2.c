#include "lab1_part2.h"

error_t argz_create_sep(const char *string, int sep, char **argz, size_t *argz_len)
{
	if (sep < 0 || sep > 255)
		return ENOMEM;

	*argz_len = strlen(string) + 1;

	if (*argz_len == 1)
		return ENOMEM;

	if ((*argz = (char*)malloc((*argz_len) * sizeof(char))) == NULL)
		return ENOMEM;

	for (size_t i = 0; i < *argz_len; i++)
	{
		if (*(string + i) == sep)
		{
			*(*argz + i) = '\0';
		}
		else
		{
			*(*argz + i) = *(string + i);
		}
	}

	return OK;
}

size_t argz_count(const char *argz, size_t argz_len)
{
	size_t num = 0;

	for (size_t i = 0; i < argz_len; i++)
	{
		if (*(argz + i) == '\0'/* && *(argz + i + 1) != '\0'*/)
		{
			num++;
		}
	}

	return num;
}

error_t argz_add(char **argz, size_t *argz_len, const char *str)
{
	int len = strlen(str);

	if (len == 0)
		return ENOMEM;

	if ((*argz = (char*)realloc(*argz, (*argz_len + len + 1) * sizeof(char))) == NULL)
		return ENOMEM;

	for (int i = 0; i <= len; i++)
	{
		*(*argz + *argz_len + i) = *(str + i);
	}

	*argz_len += len + 1;

	return OK;
}

void argz_delete(char **argz, size_t *argz_len, char *entry)
{
	const int len = strlen(entry);

	memmove(entry, entry + (len + 1) * sizeof(char), (*argz_len - (entry - *argz + len + 1)) * sizeof(char));
	*argz_len -= len + 1;

	*argz = (char*)realloc(*argz, *argz_len * sizeof(char));
}

error_t argz_insert(char **argz, size_t *argz_len, char *before, const char *entry)
{
	const int len = strlen(entry);

	if (len == 0)
		return ENOMEM;

	if (before == NULL)
	{
		if (realloc(*argz, (*argz_len + len + 1) * sizeof(char)) == NULL)
			return ENOMEM;

		for (int i = 0; i <= len; i++)
		{
			*(*argz + *argz_len + i) = *(entry + i);
		}
	}
	else
	{
		if (realloc(*argz, (*argz_len + len + 1) * sizeof(char)) == NULL)
			return ENOMEM;

		memmove(before + (len + 1) * sizeof(char), before, (*argz_len - (before - *argz)) * sizeof(char));
		
		for (int i = 0; i <= len; i++)
		{
			*(before + i) = *(entry + i);
		}
	}

	*argz_len += len + 1;

	return OK;
}

char* argz_next(char *argz, size_t argz_len, const char *entry)
{
	if (entry == NULL)
		return argz;

	for (char *ptr = entry; ptr <= argz + argz_len; ptr++)
	{
		if (ptr == argz + argz_len - 1)
		{
			return NULL;
		}
		else if (*ptr == '\0')
		{
			return ptr + 1;
		}
	}

	return NULL;
}

error_t argz_replace(char **argz, size_t *argz_len, const char *str, const char *with)
{
	const int len1 = strlen(str);
	const int len2 = strlen(with);

	if (len1 == 0 || len2 == 0)
		return ENOMEM;

	char *ptr = *argz, *begin = NULL;

	while (ptr < *argz + *argz_len)
	{
		begin = strstr(ptr, str);

		if (begin == NULL)
		{
			ptr += strlen(ptr) + 1;
			continue;
		}
		else break;
	}

	if (begin == NULL)
		return ENOMEM;

	if (len1 < len2)
	{
		if (realloc(*argz, (*argz_len - len1 + len2) * sizeof(char)) == NULL)
			return ENOMEM;

		memmove(begin + len2, begin + len1, *argz_len - (begin - *argz + len1) * sizeof(char));
	}
	else if (len1 > len2)
	{
		memmove(begin + len2, begin + len1, *argz_len - (begin - *argz + len1) * sizeof(char));

		if (realloc(*argz, (*argz_len - len1 + len2) * sizeof(char)) == NULL)
			return ENOMEM;
	}

	for (int i = 0; i < len2; i++)
	{
		*(begin + i) = *(with + i);
	}

	*argz_len += len2 - len1;

	return OK;
}

void argz_print(const char *argz, size_t argz_len)
{
	char *entry = NULL;
	while ((entry = argz_next(argz, argz_len, entry)))
	{
		printf("%s\n", entry);
	}
}