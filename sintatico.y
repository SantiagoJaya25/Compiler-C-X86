%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMERO
%token SOMA SUBTRACAO MULTIPLICACAO DIVISAO INCREMENTO DECREMENTO
%token PARENTESES_ESQUERDA PARENTESES_DIREITA CHAVE_ESQUERDA CHAVE_DIREITA
%token RECEBE COMPARACAO E OU
%token SE SENAO
%token REPETICAO ENQUANTO

%start Entrada

%%

Entrada:
   	/* Empty */
	;

%%

int yyerror(char *s) {
	printf("%s\n",s);
}

int main(void) {
   	yyparse();
}
