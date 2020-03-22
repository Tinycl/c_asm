#include <stdlib.h>
#include <stdio.h>

extern "C" unsigned long long asmvar1;
extern "C" void asmfun1();
extern "C" void asmfun_call_cfun1();
extern "C" void asmfun_call_cfun2_1();
extern "C" void asmfun_call_cfun2_2(unsigned long long a, unsigned long long b, unsigned long long c, unsigned long long d, unsigned long long e);
extern "C" void asmfun_call_cprintf();

extern "C" unsigned long long cvar1;
unsigned long long cvar1;
extern "C" void cfun1();
void cfun1()
{
	printf("asm fun call c fun and c fun without para\n");
}

extern "C" void cfun2(unsigned long long a, unsigned long long b, unsigned long long c, unsigned long long d,unsigned long long e);
void cfun2(unsigned long long a, unsigned long long b, unsigned long long c, unsigned long long d, unsigned long long e)
{
	printf("a is %llx\n", a);
	printf("b is %llx\n", b);
	printf("c is %llx\n", c);
	printf("d is %llx\n", d);
	printf("e is %llx\n", e);
}


int main()
{
	printf("asmvar1 is 0x%llx\n", asmvar1);
	printf("...............\n");
	asmfun1();
	printf("...............\n");
	asmfun_call_cfun1();
	printf("...............\n");

	printf("...............\n");
	asmfun_call_cfun2_1();
	printf("...............\n");
	asmfun_call_cfun2_2(1,2,3,4,5);
	printf("...............\n");
	asmfun_call_cprintf();
	system("pause");
	return 0;
}