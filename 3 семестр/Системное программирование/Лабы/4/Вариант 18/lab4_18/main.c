#include <stdio.h>

#define n 36 // ������� ����� � ����������� ����
typedef unsigned char byte; // ��� ������ � ������� ��������������� ��� char

void Big2sSub(byte* p1, byte* p2, /*byte* p3,*/ int p4);

void PrintBinary(byte *number, short length)
{
	for (short i = length; i != 0; --i)
	{
		byte currentPart = *(number + i - 1);
		currentPart & 0x80 ? printf("1") : printf("0");
		currentPart & 0x40 ? printf("1") : printf("0");
		currentPart & 0x20 ? printf("1") : printf("0");
		currentPart & 0x10 ? printf("1") : printf("0");
		currentPart & 0x08 ? printf("1") : printf("0");
		currentPart & 0x04 ? printf("1") : printf("0");
		currentPart & 0x02 ? printf("1") : printf("0");
		currentPart & 0x01 ? printf("1") : printf("0");
		printf(" ");
	}
	printf("\n\n");
}
int main()
{
	srand(time(NULL));
	byte x[n], y[n],z[n]; //�������� �����
	for (int i = 0; i<n; i++)
	{
		x[i] = 0;
		y[i] = 0;
		z[i] = 0;
	}
	y[2] = 8;
	printf("Before: \n\n");
	printf("M1 = \n");
	PrintBinary(x,n);
	printf("M2 = \n");
	PrintBinary(y,n);
	Big2sSub(x, y, n);
	printf("New M1 = \n");
	PrintBinary(x,n);
	getch();
	return 0;
}