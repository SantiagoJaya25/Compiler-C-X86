%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMERO_INTEIRO NUMERO_REAL VARIAVEL
%token INT FLOAT CHAR
%token PRINTF
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
   	| Entrada else
   	| Entrada instrucao
   	| Entrada declaracao
   	| Entrada printf
	;
if:
	IF PARENTESES_ESQUERDA condicao PARENTESES_DIREITA { printf("Isso é um if\n"); }
	;

else:
	ELSE { printf("Isso é um else\n"); }
	| ELSE if { printf("Isso é um else if\n"); }
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
   NUMERO_INTEIRO
   |NUMERO_REAL
   | VARIAVEL
   | expressao SOMA expressao
   | expressao SUBTRACAO expressao
   | expressao MULTIPLICACAO expressao
   | expressao DIVISAO expressao
   | PARENTESES_ESQUERDA expressao PARENTESES_DIREITA
   | VARIAVEL RECEBE expressao
   ;
	
instrucao:
	PONTOVIRGULA { printf("Isso é uma instrucao\n"); }
	| expressao PONTOVIRGULA { printf("Isso é uma instrucao\n"); }
	;
	
declaracao:
	INT variavelDeclarada PONTOVIRGULA { printf("Isso é uma declaracao de inteiro\n"); }
	| FLOAT variavelDeclarada PONTOVIRGULA { printf("Isso é uma declaracao de float\n"); }
	| CHAR variavelDeclarada PONTOVIRGULA { printf("Isso é uma declaracao de char\n"); }
	;
	
variavelDeclarada:
	VARIAVEL
	| variavelDeclarada VIRGULA	variavelDeclarada
	;

printf:
	PRINTF PARENTESES_ESQUERDA ASPAS ASPAS PARENTESES_DIREITA PONTOVIRGULA { printf("Isso é um printf\n"); }
	;

%%

int yyerror(char *s) {
	printf("%s\n",s);
}

int main(void) {
   	yyparse();
}
