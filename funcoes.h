#ifndef _FUNCOES_
#define _FUNCOES_

typedef struct _TermoIF
{
	char *termo1;
	char *termo2;
	char *termo1Tipo;
	char *termo2Tipo;
	char *operador;
	char *tipo;
} TermoIF;

extern void declaracaoVariavel(char *token, char *identificador);
extern void criarArquivoBSS();
extern void criarArquivoStart();

extern void atribuir(char *variavel, char *numero);

extern void pupularTermosIf(TermoIF *termoIF, char *identificador);
extern void funcaoIF();

#endif
