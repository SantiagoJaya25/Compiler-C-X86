#include <stdio.h>
#include <string.h>
#include "funcoes.h"
#include "list.h"
#include "sintatico.h"
#include <stdlib.h>

List list;
FILE *ArquivoAssembly;
FILE *ArquivoStart;
FILE *LabelSE;
FILE *LabelSENAO;
extern int corpoIf;
extern int corpoElse;
int condicao=0;
int ifs=0, elses=0;

//ifs = (int*) calloc(1000, sizeof(int));

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

void declaracaoVariavel(char *token, char *identificador)
{
	ArquivoAssembly = fopen("programa.asm","a");

	if(strcmp(token, "int")==0)
		fprintf(ArquivoAssembly,"\t%s resb %lu\n",identificador,sizeof(int));
	else if(strcmp(token, "float")==0)
		fprintf(ArquivoAssembly,"\t%s resb %lu\n",identificador,sizeof(double));
	
	char *elemento = (char*)malloc(strlen(identificador));
	strcpy(elemento, identificador);
	
	inserirElementoLista(&list, elemento, token);

	fclose(ArquivoAssembly);

	printf("Lista: ");
	printList(&list);
}

void atribuir(char *variavel, char *numero)
{
	char *novoValor = (char*)malloc(strlen(numero));
	strcpy(novoValor, numero);

	alterarElementoLista(&list, variavel, novoValor);

	ArquivoStart = fopen("start.asm","a");
	
	if(corpoIf){
		if(!ifs){
			fprintf(ArquivoStart,"\n\n\tCondicao%d:",condicao-2);
			ifs=1;
		}
		fprintf(ArquivoStart,"\n\t\tmov [%s], %s",variavel,numero);
	}
	else if(corpoElse){
		if(!elses){
			fprintf(ArquivoStart,"\n\n\tCondicao%d:",condicao-1);
			elses=1;
		}
		fprintf(ArquivoStart,"\n\t\tmov [%s], %s",variavel,numero);
	}
	else
		fprintf(ArquivoStart,"\tmov [%s], %s\n",variavel,numero);
		
	fclose(ArquivoStart);
}

void inicializarTermoIF(TermoIF *termoIF)
{
	strcpy(termoIF->termo1, "");
	strcpy(termoIF->termo2, "");
	strcpy(termoIF->tipoTermo1, "");
	strcpy(termoIF->tipoTermo2, "");
	strcpy(termoIF->operador, "");
}

void popularTermosIf(TermoIF *termoIF, char *identificador, char *tipoTermo)
{
	if(strcmp(tipoTermo, "variavel")==0)
	{
		if(!procuraElementoLista(&list, identificador))
			printf("ERROR: Variável %s não declarada\n",identificador);
	}

	char *elemento = (char*)malloc(strlen(identificador + 1));
	strcpy(elemento, identificador);

	if(strcmp(termoIF->termo1, "")==0)
	{
		strcpy(termoIF->tipoTermo1, tipoTermo);
		strcpy(termoIF->termo1, elemento);
	}
	else if(strcmp(termoIF->termo2, "")==0)
	{
		strcpy(termoIF->tipoTermo2, tipoTermo);
		strcpy(termoIF->termo2, elemento);

		funcaoIF(termoIF);
	}
}

void funcaoIF(TermoIF *termoIF)
{
	ArquivoStart = fopen("start.asm","a");

	fprintf(ArquivoStart,"\n\n\tCMP ");

	if(strcmp(termoIF->tipoTermo1, "variavel")==0)
		fprintf(ArquivoStart,"[%s], ",termoIF->termo1);
	else
		fprintf(ArquivoStart,"%s, ",termoIF->termo1);

	if(strcmp(termoIF->tipoTermo2, "variavel")==0)
		fprintf(ArquivoStart,"[%s]\n",termoIF->termo2);
	else
		fprintf(ArquivoStart,"%s\n",termoIF->termo2);

	if(strcmp(termoIF->operador, "==")==0)
	{
		fprintf(ArquivoStart,"\tJE Condicao%d\n",condicao);
		condicao++;
		ifs=0;

		fprintf(ArquivoStart,"\tJNE Condicao%d",condicao);
		condicao++;
		elses=0;
	}

	inicializarTermoIF(termoIF);

	fclose(ArquivoStart);
}
