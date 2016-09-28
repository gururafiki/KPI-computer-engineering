#if defined _LAB1_PART2
#endinput
#endif
#define _LAB1_PART2

#include <stdio.h>
#include <string.h> // strlen(), strstr(), ..
#include <stdlib.h> // calloc(), malloc(), realloc(), free()

#undef ENOMEM
typedef enum { OK, ENOMEM } error_t;

error_t argz_create_sep(const char *string, int sep, char **argz, size_t *argz_len);
size_t argz_count(const char *argz, size_t arg_len);
error_t argz_add(char **argz, size_t *argz_len, const char *str);
void argz_delete(char **argz, size_t *argz_len, char *entry);
error_t argz_insert(char **argz, size_t *argz_len, char *before, const char *entry);
char* argz_next(char *argz, size_t argz_len, const char *entry);
error_t argz_replace(char **argz, size_t *argz_len, const char *str, const char *with);
void argz_print(const char *argz, size_t argz_len);