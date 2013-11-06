#ifndef _FUNCOES_
#define _FUNCOES_

typedef struct _TermoIF
{
	char termo1[100];
	char termo2[100];
	char tipoTermo1[10];
	char tipoTermo2[10];
	char operador[2];
} TermoIF;

extern void declaracaoVariavel(char *token, char *identificador);
extern void criarArquivoBSS();
extern void criarArquivoStart();

extern void atribuir(char *variavel, char *numero);

extern void inicializarTermoIF(TermoIF *termoIF);
extern void popularTermosIf(TermoIF *termoIF, char *identificador, char *tipoTermo);
extern void funcaoIF(TermoIF *termoIF);

#endif
