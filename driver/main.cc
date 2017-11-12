/* Main Entry Point */
#include <iostream>
#include "llvm/IR/Module.h"
#include <algorithm>
using namespace llvm;
using namespace std;


int main(int argc, char** argsv)
{
	FILE *myfile = fopen("test.ni", "r");
	if (!myfile)
	{
		cerr << "Couldn't open file" << endl;
		perror("test.ni");
		return -1;
	}
	return 0;
}
