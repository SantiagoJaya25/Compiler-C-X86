#include <stdio.h>
#include <string.h>
#include "funcoes.h"
#include "list.h"
#include "sintatico.h"
#include <stdlib.h>

List list;
FILE *ArquivoAssembly;
FILE *ArquivoStart;

void criarArquivoBSS()
{
	ArquivoAssembly = fopen("programa.asm","w");
	fprintf(ArquivoAssembly, "section .bss\n");
	fclose(ArquivoAssembly);
}

void criarArquivoStart()
{
	ArquivoStart = fopen("start.asm","w");
	fprintf(ArquivoStart, "\nsection .text\n\tglobal _start\n_start:\n");
	fclose(ArquivoStart);
}

void
declaracaoVariavel(char *token, char *identificador)
{
	ArquivoAssembly = fopen("programa.asm","a");

	if(strcmp(token, "int")==0)
		fprintf(ArquivoAssembly,"\t%s resb %lu\n",identificador,sizeof(int));
	else if(strcmp(token, "float")==0)
		fprintf(ArquivoAssembly,"\t%s resb %lu\n",identificador,sizeof(double));
	
	char *elemento = (char*)malloc(strlen(identificador));
	strcpy(elemento, identificador);
	
	inserirElemento(&list, elemento, token);
	printf("Lista: ");
	printList(&list);

	fclose(ArquivoAssembly);
}

void atribuir(char *variavel, char *numero)
{
	ArquivoStart = fopen("start.asm","a");
	
	fprintf(ArquivoStart,"\tmov [%s], %s\n",variavel,numero);
	fprintf(ArquivoStart,"\tint 80h\n\n");

	fclose(ArquivoStart);
}

void funcaoIF()
{
	printf("CMP condicao\n");
	printf("JZ if\n");
	printf("if: instrucoes\n");
}
