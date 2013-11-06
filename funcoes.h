#ifndef _FUNCOES_
#define _FUNCOES_

extern void declaracaoVariavel(char *token, char *identificador);
extern void criarArquivoBSS();
extern void criarArquivoStart();

extern void atribuir(char *variavel, char *numero);

void pupularTermosIf(char *termo1, char *termo2, char *identificador, char *operador, char *tipo);
extern void funcaoIF();

#endif
