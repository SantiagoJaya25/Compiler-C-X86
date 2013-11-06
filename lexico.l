%{
#include "sintatico.h"
#include "funcoes.h"
#include <string.h>
#include <stdlib.h>
char token[100], variavel[100], termo1[100], termo2[100], operador[2];
int atribuicao=0, estaNoIf=0;
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
parentesesEsquerda "("
parentesesDireita ")"
pontoVirgula ";"
comparacao "=="
maiorIgual ">="
menorIgual "<="
maiorQue ">"
menorQue "<"
diferente "!="

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

	if(estaNoIf)
		pupularTermosIf(termo1,termo2, yytext, operador, "numero");

	return(NUMERO_INTEIRO);
}

{numeroReal} {
	if(atribuicao)
	{
		atribuir(variavel, yytext);
		atribuicao=0;
	}

	if(estaNoIf)
		pupularTermosIf(termo1,termo2, yytext, operador, "numero");

	return(NUMERO_REAL);
}

{se} {
	estaNoIf=1;
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

{parentesesEsquerda} {
	return(PARENTESES_ESQUERDA);
}

{parentesesDireita} {
	return(PARENTESES_DIREITA);
}

{recebe} {
	atribuicao=1;
	return(RECEBE);
}

{comparacao} {
	strcpy(operador,yytext);
	return(COMPARACAO);
}

{maiorIgual} {
	strcpy(operador,yytext);
	return(MAIOR_IGUAL);
}

{menorIgual} {
	strcpy(operador,yytext);
	return(MENOR_IGUAL);
}

{maiorQue} {
	strcpy(operador,yytext);
	return(MAIOR_QUE);
}

{menorQue} {
	strcpy(operador,yytext);
	return(MENOR_QUE);
}

{diferente} {
	strcpy(operador,yytext);
	return(DIFERENTE);
}

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
	strcpy(termo1, "");
	strcpy(termo2, "");
	atribuicao=0;
	estaNoIf=0;

	return(PONTOVIRGULA);
}

"," return(VIRGULA);
"\"" return(ASPAS);

{identificador} {
	strcpy(variavel,yytext);
	
	if(strcmp(token, "")!=0)
		declaracaoVariavel(token, yytext);

	if(estaNoIf)
		pupularTermosIf(termo1,termo2, yytext, operador, "variavel");
	
	return(IDENTIFICADOR);
}

%%

yywrap () {
return 0;
}
