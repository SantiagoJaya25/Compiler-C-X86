#ifndef _FUNCOES_
#define _FUNCOES_

typedef struct _Parametros
{
	char termo1[100];
	char termo2[100];
	char tipoTermo1[10];
	char tipoTermo2[10];
	char operador[2];
} Parametros;

extern void declaracaoVariavel(char *token, char *identificador);
extern void criarArquivoBSS();
extern void criarArquivoStart();

extern void atribuir(char *variavel, char *numero);

extern void inicializarParametros(Parametros *parametros);
extern void popularParametros(Parametros *parametros, char *identificador, char *tipoTermo);
extern void funcaoIF(Parametros *Pprametros);
extern void funcaoWhile(Parametros *Pprametros);

#endif
