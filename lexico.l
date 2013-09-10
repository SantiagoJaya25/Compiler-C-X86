%{
#include "sintatico.h"
#include <stdlib.h>
%}

branco [ \t\n]+
digito [0-9]
letra [a-zA-Z]
int {digito}+
float {int}("."{int})?
variavel {letra}+({digito}|{letra})*

%%

{branco} { /* Desconsiderar espaços em branco */ }
{int} {
	printf("Isso e um inteiro: %s\n",yytext);
	return(NUMERO);
}

{float} {
	printf("Isso e um float: %s\n",yytext);
	return(NUMERO);
}

"if" return(IF);
"else" return(ELSE);
"while" return(WHILE);
"for" return(FOR);
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

{variavel} {
	printf("Isso e uma variavel: %s\n",yytext);
	return(VARIAVEL);
}

%%

yywrap () {
return 0;
}
