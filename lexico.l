%{
#include "sintatico.h"
#include <stdlib.h>
%}

branco [ \t\n]+
digito [0-9]
letra [a-zA-Z]
int [-+]?{digito}+
float {int}("."{int})?
char [{letra}{digito}]
variavel {letra}+[0-9a-zA-Z]*
se "if"
senao "else"
enquanto "while"
repeticao "for"

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

"if" return(SE);
"else" return(SENAO);
"while" return(ENQUANTO);
"for" return(REPETICAO);
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
"++" return(INCREMENTO);
"--" return(DECREMENTO);
"{" return(CHAVE_ESQUERDA);
"}" return(CHAVE_DIREITA);

%%

yywrap () {
return 0;
}
