%{
#include "sintatico.h"
#include "funcoes.h"
#include <string.h>
#include <stdlib.h>
char token[100], variavel[100];
int atribuicao=0;
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
recebe "="
se "if"
pontoVirgula ";"

%%

{branco} { /* Desconsiderar espaços em branco */ }
{main} {
	criarArquivoStart();

	return(MAIN);
}
{numeroInteiro} {
	if(atribuicao)
	{
		atribuir(variavel, yytext);
		atribuicao=0;
	}
	return(NUMERO_INTEIRO);
}

{numeroReal} {
	if(atribuicao)
	{
		atribuir(variavel, yytext);
		atribuicao=0;
	}
	return(NUMERO_REAL);
}

{se} {
	return(IF);
}

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

"+" return(SOMA);
"-" return(SUBTRACAO);
"*" return(MULTIPLICACAO);
"/" return(DIVISAO);
"(" return(PARENTESES_ESQUERDA);
")" return(PARENTESES_DIREITA);

{recebe} {
	atribuicao=1;
	return(RECEBE);
}

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

{pontoVirgula} {
	/* Reinicando todas as variáveis */
	strcpy(token, "");
	strcpy(variavel, "");
	atribuicao=0;

	return(PONTOVIRGULA);
}

"," return(VIRGULA);
"\"" return(ASPAS);

{identificador} {
	strcpy(variavel,yytext);
	
	if(strcmp(token, "")!=0)
		declaracaoVariavel(token, yytext);
	
	return(IDENTIFICADOR);
}

%%

yywrap () {
return 0;
}
