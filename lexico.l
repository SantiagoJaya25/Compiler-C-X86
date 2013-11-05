%{
#include "sintatico.h"
#include "funcoes.h"
#include <string.h>
#include <stdlib.h>
char token[100];
%}

branco [ \t\n]+
digito [0-9]
letra [a-zA-Z]
numeroInteiro {digito}+
numeroReal {numeroInteiro}("."{numeroInteiro})?
identificador {letra}+({digito}|{letra})*
inteiro "int"
float "float"
main "main"

%%

{branco} { /* Desconsiderar espaços em branco */ }
{main} {
	criarArquivoStart();
	
	return(MAIN);
}
{numeroInteiro} {
	return(NUMERO_INTEIRO);
}

{numeroReal} {
	return(NUMERO_REAL);
}

"if" return(IF);
"else" return(ELSE);
"while" return(WHILE);
"for" return(FOR);

{inteiro} {
	strcpy(token, yytext);
	return(INT);
}

{float} {
	strcpy(token, yytext);
	return(FLOAT);
}

"char" return(CHAR);
"printf" return(PRINTF);
"+" return(SOMA);
"-" return(SUBTRACAO);
"*" return(MULTIPLICACAO);
"/" return(DIVISAO);
"(" return(PARENTESES_ESQUERDA);
")" return(PARENTESES_DIREITA);
"=" return(RECEBE);
"==" return(COMPARACAO);
">=" return(MAIOR_IGUAL);
"<=" return(MENOR_IGUAL);
">" return(MAIOR_QUE);
"<" return(MENOR_QUE);
"!=" return(DIFERENTE);
"&&" return(E);
"||" return(OU);
"++" return(INCREMENTO);
"--" return(DECREMENTO);
"{" return(CHAVE_ESQUERDA);
"}" return(CHAVE_DIREITA);
";" return(PONTOVIRGULA);
"," return(VIRGULA);
"\"" return(ASPAS);

{identificador} {
	declaracaoVariavel(token, yytext);
	
	return(IDENTIFICADOR);
}

%%

yywrap () {
return 0;
}
