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
	| Expressao
	| condicao COMPARACAO condicao
	| condicao OU condicao
	| condicao E condicao
	| condicao MAIOR_IGUAL condicao
	| condicao MENOR_IGUAL condicao
	| condicao DIFERENTE condicao
	| condicao MAIOR_QUE condicao
	| condicao MENOR_QUE condicao
	;
	
Expression:
   NUMERO { $$=$1; }
   | Expression PLUS Expression { $$=$1+$3; }
   | Expression MINUS Expression { $$=$1-$3; }
   | Expression TIMES Expression { $$=$1*$3; }
   | Expression DIVIDE Expression { $$=$1/$3; }
   | MINUS Expression %prec NEG { $$=-$2; }
   | Expression POWER Expression { $$=pow($1,$3); }
   | LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=$2; }
   ;
%%

int yyerror(char *s) {
	printf("%s\n",s);
}

int main(void) {
   	yyparse();
}
