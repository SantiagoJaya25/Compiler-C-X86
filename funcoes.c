#include <stdio.h>
#include <string.h>
#include "funcoes.h"
#include "list.h"
#include "sintatico.h"
#include <stdlib.h>

List list;

void
declaracaoVariavel(char *token, char *identificador)
{
	if(strcmp(token, "int")==0)
		printf("%s resb %lu\n",identificador,sizeof(int));
	else if(strcmp(token, "float")==0)
		printf("%s resb %lu\n",identificador,sizeof(float));
	
	char *elemento = (char*)malloc(strlen(identificador));
	strcpy(elemento, identificador);
	
	inserirElemento(&list, elemento, token);
	printf("Lista: ");
	printList(&list);
}

void funcaoIF()
{
	printf("CMP condicao\n");
	printf("JZ if\n");
	printf("if: instrucoes\n");
}
