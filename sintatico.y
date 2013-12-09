%{
#include <stdio.h>
#include <stdlib.h>
#include "funcoes.h"
#include "list.h"
#include "stack.h"

extern List list;
extern Stack stack;
%}

%token MAIN
%token NUMERO_INTEIRO NUMERO_REAL IDENTIFICADOR
%token INT FLOAT
%token PARENTESES_ESQUERDA PARENTESES_DIREITA CHAVE_ESQUERDA CHAVE_DIREITA
%token IF ELSE
%token FOR WHILE
%token PONTOVIRGULA VIRGULA ASPAS
%token FIMARQUIVO
%left SOMA SUBTRACAO
%left MULTIPLICACAO DIVISAO
%left COMPARACAO MAIOR_IGUAL MENOR_IGUAL MAIOR_QUE MENOR_QUE DIFERENTE
%left OU
%left E
%left INCREMENTO DECREMENTO
%right RECEBE

%start Entrada

%%

Entrada:
   	/* Empty */
   	| Entrada fimArquivo
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
	IF PARENTESES_ESQUERDA condicao PARENTESES_DIREITA 
	| ELSE 
	| ELSE if 
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
	WHILE PARENTESES_ESQUERDA condicao PARENTESES_DIREITA
	;
	
for:
	FOR PARENTESES_ESQUERDA PONTOVIRGULA PONTOVIRGULA PARENTESES_DIREITA
	| FOR PARENTESES_ESQUERDA condicao PONTOVIRGULA condicao PONTOVIRGULA condicao PARENTESES_DIREITA
	| FOR PARENTESES_ESQUERDA variavelDeclarada PONTOVIRGULA condicao PONTOVIRGULA condicao PARENTESES_DIREITA
	;
	
instrucao:
	PONTOVIRGULA 
	| expressao PONTOVIRGULA 
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

fimArquivo:
	FIMARQUIVO {exit(0);}


%%

int yyerror(char *s) {
	printf("%s\n",s);
}

int main(void) {
	inicializarLista(&list);
	inicializarPilha(&stack);

	criarArquivoBSS();
   	yyparse();
}
