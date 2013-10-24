#include <stdio.h>
#include <string.h>
#include "funcoes.h"

void
declaracaoVariavel(char *token)
{
	if(strcmp(token, "int")==0)
		declaracaoVariavelInteira();
}

void declaracaoVariavelInteira()
{
	printf("declaracaoVariavelInteira\n");
}

void
funcaoIF()
{
	printf("CMP condicao\n");
	printf("JZ if\n");
	printf("if: instrucoes\n");
}
