#include <stdio.h>
#include <string.h>
#include "funcoes.h"

void
declaracaoVariavel(char *token)
{
	if(strcmp(token, "int")==0)
		declaracaoVariavelInteira();
	else if(strcmp(token, "float")==0)
		declaracaoVariavelReal();
}

void declaracaoVariavelInteira()
{
	printf("declaracaoVariavelInteira\n");
}

void declaracaoVariavelReal()
{
	printf("declaracaoVariavelReal\n");
}

void funcaoIF()
{
	printf("CMP condicao\n");
	printf("JZ if\n");
	printf("if: instrucoes\n");
}
