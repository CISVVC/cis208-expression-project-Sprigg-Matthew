/*
 * file: main.c
 * main C program that uses assembly routine in prog.asm
 * to create executable:
 * gcc:   gcc -m32 -o main main.c asm_main.o asm_io.o
 */

#include "cdecl.h"
#include <stdio.h>
#define A 2471
#define B 626000000
#define C 200
#define D 333

int PRE_CDECL asm_main( int a, int b, int c, int d) POST_CDECL;

int main()
{
	int res = asm_main(A, B, C, D);
	printf("%d\n",res);
	return 0;
}
