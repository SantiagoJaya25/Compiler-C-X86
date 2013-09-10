%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMERO VARIAVEL
%token SOMA SUBTRACAO MULTIPLICACAO DIVISAO INCREMENTO DECREMENTO
%token PARENTESES_ESQUERDA PARENTESES_DIREITA CHAVE_ESQUERDA CHAVE_DIREITA
%token RECEBE COMPARACAO E OU MAIOR_IGUAL MENOR_IGUAL MAIOR_QUE MENOR_QUE DIFERENTE
%token IF ELSE
%token FOR WHILE

%start Entrada

%%

Entrada:
   	/* Empty */
   	| Entrada if
	;
if:
	IF PARENTESES_ESQUERDA condicao PARENTESES_DIREITA { printf("CMP EAX,EBX\n"); }
	;
condicao:
	VARIAVEL
	| PARENTESES_ESQUERDA condicao PARENTESES_DIREITA
	| expressao
	| condicao COMPARACAO condicao
	| condicao OU condicao
	| condicao E condicao
	| condicao MAIOR_IGUAL condicao
	| condicao MENOR_IGUAL condicao
	| condicao DIFERENTE condicao
	| condicao MAIOR_QUE condicao
	| condicao MENOR_QUE condicao
	;
	
expressao:
   NUMERO { $$=$1; }
   | expressao SOMA expressao { $$=$1+$3; }
   | expressao SUBTRACAO expressao { $$=$1-$3; }
   | expressao MULTIPLICACAO expressao { $$=$1*$3; }
   | expressao DIVISAO expressao { $$=$1/$3; }
   | PARENTESES_ESQUERDA expressao PARENTESES_DIREITA { $$=$2; }
   ;
%%

int yyerror(char *s) {
	printf("%s\n",s);
}

int main(void) {
   	yyparse();
}
