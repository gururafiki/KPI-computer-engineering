#include "scanner.h"

int main()
{
	csv_to_dba("../Scanners.dba", "../Scanners.csv");
	make_index("../Scanners.dba", "manufacturer");

	return 0;
}