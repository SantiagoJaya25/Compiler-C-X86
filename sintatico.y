%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMERO
%token SOMA SUBTRACAO MULTIPLICACAO DIVISAO
%token PARENTESES_ESQUERDA PARENTESES_DIREITA
%token RECEBE COMPARACAO E OU

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
