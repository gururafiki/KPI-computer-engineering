#include "lab1_part2.h"

error_t argz_create_sep(const char *string, int sep, char **argz, size_t *argz_len)
{
	if (sep < 0 || sep > 255)
		return ENOMEM;

	*argz_len = strlen(string) + 1;

	if (*argz_len == 0)
		return ENOMEM;

	*argz = (char*)malloc((*argz_len) * sizeof(char));

	if (*argz == NULL)
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
		if (*(argz + i) == '\0' && *(argz + i + 1) != '\0')
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

	if ((*argz = realloc(*argz, (*argz_len + len + 1) * sizeof(char))) == NULL)
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
	char *ptr = *argz, *begin = NULL;
	size_t i = 0;

	while (ptr + 1 < *argz + *argz_len)
	{
		if (*ptr == '\0')
		{
			ptr++;
			continue;
		}
		
		begin = strstr(ptr, entry);

		if (begin != NULL)
		{
			ptr = memmove(begin, begin + len * sizeof(char), (*argz_len * sizeof(char) - (begin - *argz + len * sizeof(char))));
			*argz_len -= len;

			if (*ptr == '\0')
			{
				ptr = memmove(ptr, ptr + sizeof(char), *argz_len * sizeof(char) - (ptr - *argz + sizeof(char)));
				--*argz_len;
			}
		}
		else ptr++;
	}

	*argz = (char*)realloc(*argz, *argz_len * sizeof(char));
}