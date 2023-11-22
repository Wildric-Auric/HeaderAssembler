#include "HeaderAssembler.h"

int main(int argc, const char* argv[]) {
	if (argc <= 1) {
		printf("arg0 : source directory\narg1 : output directory\narg2 : output filename");
		return -1;
	}
	if (argc < 4) {
		printf("You should Provide all required arguments");
	}
	AssembleHeaders(argv[1], argv[2], argv[3]);
}
