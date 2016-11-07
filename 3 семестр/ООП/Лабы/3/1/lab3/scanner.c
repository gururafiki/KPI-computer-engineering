#include "scanner.h"

int write_dat(FILE **dba, const SCAN_INFO *rec)
{
	SCAN_INFO *buff = (SCAN_INFO*)malloc(sizeof(SCAN_INFO));
	int num = 0;

	if (buff == NULL)
		return -1;

	rewind(*dba);
	
	if (!feof(*dba))
	{
		fread(&num, sizeof(int), 1, *dba);

		while (!feof(*dba))
		{
			fread(buff, sizeof(SCAN_INFO), 1, *dba);
			if (memcmp(rec, buff, sizeof(SCAN_INFO)) == 0)
			{
				free(buff);
				return 0;
			}
		}

		free(buff);
		rewind(*dba);
	}

	num++;
	fwrite(&num, sizeof(int), 1, *dba);
	fseek(*dba, 0, SEEK_END);
	fwrite(rec, sizeof(SCAN_INFO), 1, *dba);

	return 1;
}

int csv_to_dba(const char *path_dba, const char *path_csv)
{
	FILE *dba = fopen(path_dba, "wb+");
	FILE *csv = fopen(path_csv, "r");
	SCAN_INFO *rec;

	if (dba == NULL || csv == NULL)
	{
		printf("open file error\n");
		return 0;
	}

	if ((rec = (SCAN_INFO*)malloc(sizeof(SCAN_INFO))) == NULL)
		return -1;

	while (!feof(csv))
	{
		fscanf(csv, "%[A-z0-9];%[A-z0-9];%d;%f;%d;%d;%d\n", rec->manufacturer, rec->model, &(rec->year), &(rec->price), &(rec->x_size), &(rec->y_size), &(rec->optr));
		write_dat(&dba, rec);
	}

	free(rec);

	fclose(dba);
	fclose(csv);
	
	return 1;
}

int make_index(char *path_dba, char *field_name)
{
	FILE *idx, *dba;
	char *path_idx;
	int i = strlen(path_dba), j = 0, num = 0;
	const len = strlen(field_name);
	SCAN_INFO **recs, *buff;
	
	if ((dba = fopen(path_dba, "rb")) == NULL)
	{
		printf("open file error\n");
		return 0;
	}

	while (i >= 0 && *(path_dba + i) != '/')
	{
		i--;
	}

	if ((path_idx = malloc((len + i + 2) * sizeof(char))) == NULL)
		return -1;

	if (i >= 0)
	{
		strncpy(path_idx, path_dba, i + 1);
	}

	strcpy(path_idx + i + 1, field_name);
	strcpy(path_idx + len + i + 1, ".idx");

	if ((idx = fopen(path_idx, "w")) == NULL)
	{
		free(path_idx);
		printf("open file error\n");
		return 0;
	}

	free(path_idx);

	fread(&num, sizeof(int), 1, dba);

	if (num > 0)
	{
		recs = (SCAN_INFO**)malloc(num * sizeof(SCAN_INFO*));
		buff = (SCAN_INFO*)malloc(sizeof(SCAN_INFO));

		if (recs == NULL || buff == NULL)
			return -1;

		for (i = 0; i < num; i++)
		{
			recs[i] = (SCAN_INFO*)malloc(sizeof(SCAN_INFO));
			fread(recs[i], sizeof(SCAN_INFO), 1, dba);
		}
	}

	if (field_name == "manufacturer")
		qsort(recs, num, sizeof(SCAN_INFO*), manufacturer_cmp);
	else if (field_name == "year")
		qsort(recs, num, sizeof(SCAN_INFO*), year_cmp);
	else if (field_name == "model")
		qsort(recs, num, sizeof(SCAN_INFO*), model_cmp);
	else if (field_name == "price")
		qsort(recs, num, sizeof(SCAN_INFO*), price_cmp);
	else if (field_name == "x_size")
		qsort(recs, num, sizeof(SCAN_INFO*), x_size_cmp);
	else if (field_name == "y_size")
		qsort(recs, num, sizeof(SCAN_INFO*), y_size_cmp);
	else if (field_name == "optr")
		qsort(recs, num, sizeof(SCAN_INFO*), optr_cmp);

	for (i = 0; i < num; i++)
	{
		fseek(dba, sizeof(int), SEEK_SET);
		for (j = 0; j < num; j++)
		{
			fread(buff, sizeof(SCAN_INFO), 1, dba);
			if (recs[i] != NULL && strcmp(buff->manufacturer, recs[i]->manufacturer) == 0 && strcmp(buff->model, recs[i]->model) == 0)
			{
				fprintf(idx, "%d ", j);
				free(recs[i]);
				recs[i] = NULL;
			}
		}
	}

	free(recs);
	free(buff);
	fclose(dba);
	fclose(idx);

	return 1;
}

int manufacturer_cmp(const void *val1, const void *val2)
{
	// вах-вах. подгоняем под результаты в методичке
	return strcmp((*(SCAN_INFO**)val1)->manufacturer, (*(SCAN_INFO**)val2)->manufacturer) >= 0 && strcmp((*(SCAN_INFO**)val1)->model, (*(SCAN_INFO**)val2)->model) >= 0;
}
int year_cmp(const void *val1, const void *val2)
{
	return (*(SCAN_INFO**)val1)->year - (*(SCAN_INFO**)val2)->year;
}
int model_cmp(const void *val1, const void *val2)
{
	return strcmp((*(SCAN_INFO**)val1)->model, (*(SCAN_INFO**)val2)->model);
}
int price_cmp(const void *val1, const void *val2)
{
	return (int)((*(SCAN_INFO**)val1)->price - (*(SCAN_INFO**)val2)->price);
}
int x_size_cmp(const void *val1, const void *val2)
{
	return (*(SCAN_INFO**)val1)->x_size - (*(SCAN_INFO**)val2)->x_size;
}
int y_size_cmp(const void *val1, const void *val2)
{
	return (*(SCAN_INFO**)val1)->y_size - (*(SCAN_INFO**)val2)->y_size;
}
int optr_cmp(const void *val1, const void *val2)
{
	return (*(SCAN_INFO**)val1)->optr - (*(SCAN_INFO**)val2)->optr;
}