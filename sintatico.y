%{
#include <stdio.h>
#include <stdlib.h>
#include "funcoes.h"
#include "list.h"

extern List list;
%}

%token MAIN
%token NUMERO_INTEIRO NUMERO_REAL IDENTIFICADOR
%token INT FLOAT
%token SOMA SUBTRACAO MULTIPLICACAO DIVISAO INCREMENTO DECREMENTO
%token PARENTESES_ESQUERDA PARENTESES_DIREITA CHAVE_ESQUERDA CHAVE_DIREITA
%token RECEBE COMPARACAO E OU MAIOR_IGUAL MENOR_IGUAL MAIOR_QUE MENOR_QUE DIFERENTE
%token IF ELSE
%token FOR WHILE
%token PONTOVIRGULA VIRGULA ASPAS

%start Entrada

%%

Entrada:
   	/* Empty */
   	| Entrada CHAVE_ESQUERDA Entrada CHAVE_DIREITA
   	| Entrada if
   	| Entrada while
   	| Entrada for
   	| Entrada instrucao
   	| Entrada declaracao
   	| Entrada main
	;

main:
	INT MAIN PARENTESES_ESQUERDA PARENTESES_DIREITA
	;
if:
	IF PARENTESES_ESQUERDA condicao PARENTESES_DIREITA { printf("Isso é um if\n"); }
	| ELSE { printf("Isso é um else\n"); }
	| ELSE if { printf("Isso é um else if\n"); }
	;
	
condicao:
	IDENTIFICADOR
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
   NUMERO_INTEIRO
   |NUMERO_REAL
   | IDENTIFICADOR
   | expressao SOMA expressao
   | expressao SUBTRACAO expressao
   | expressao MULTIPLICACAO expressao
   | expressao DIVISAO expressao
   | PARENTESES_ESQUERDA expressao PARENTESES_DIREITA
   | IDENTIFICADOR RECEBE expressao
   ;
   
while:
	WHILE PARENTESES_ESQUERDA condicao PARENTESES_DIREITA { printf("Isso é um while\n"); }
	;
	
for:
	FOR PARENTESES_ESQUERDA PONTOVIRGULA PONTOVIRGULA PARENTESES_DIREITA { printf("Isso é um for\n"); }
	| FOR PARENTESES_ESQUERDA condicao PONTOVIRGULA condicao PONTOVIRGULA condicao PARENTESES_DIREITA { printf("Isso é um for\n"); }
	| FOR PARENTESES_ESQUERDA variavelDeclarada PONTOVIRGULA condicao PONTOVIRGULA condicao PARENTESES_DIREITA { printf("Isso é um for\n"); }
	;
	
instrucao:
	PONTOVIRGULA { printf("Isso é uma instrucao\n"); }
	| expressao PONTOVIRGULA { printf("Isso é uma instrucao\n"); }
	;
	
declaracao:
	INT variavelDeclarada PONTOVIRGULA
	| FLOAT variavelDeclarada PONTOVIRGULA
	;
	
variavelDeclarada:
	IDENTIFICADOR
	| IDENTIFICADOR RECEBE expressao
	| variavelDeclarada VIRGULA	variavelDeclarada
	;

%%

int yyerror(char *s) {
	printf("%s\n",s);
}

int main(void) {
	inicializarLista(&list);

	criarArquivoBSS();
   	yyparse();
}
