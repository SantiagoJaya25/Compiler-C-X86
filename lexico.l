%{
#include "sintatico.h"
#include <stdlib.h>
%}

branco [ \t\n]+
digito [0-9]
letra [a-zA-Z]
int -?{digito}+
float {int}("."{int}){1}
char [{digito}{letra}]{1}
variavel {letra}+{digito}*

%%

{int} {
	printf("Isso e um inteiro: %s\n",yytext);
}

{float} {
	printf("Isso e um float: %s\n",yytext);
}

{char} {
	printf("Isso e um char: %s\n",yytext);
}

{variavel} {
	printf("Isso e uma variavel: %s\n",yytext);
}

"+" return(SOMA);
"-" return(SUBTRACAO);
"*" return(MULTIPLICACAO);
"/" return(DIVISAO);
"(" return(PARENTESES_ESQUERDA);
")" return(PARENTESES_DIREITA);
"=" return(RECEBE);
"==" return(COMPARACAO);
"&&" return(E);
"||" return(OU);

%%

yywrap () {
return 0;
}
