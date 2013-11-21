/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     MAIN = 258,
     NUMERO_INTEIRO = 259,
     NUMERO_REAL = 260,
     IDENTIFICADOR = 261,
     INT = 262,
     FLOAT = 263,
     SOMA = 264,
     SUBTRACAO = 265,
     MULTIPLICACAO = 266,
     DIVISAO = 267,
     INCREMENTO = 268,
     DECREMENTO = 269,
     PARENTESES_ESQUERDA = 270,
     PARENTESES_DIREITA = 271,
     CHAVE_ESQUERDA = 272,
     CHAVE_DIREITA = 273,
     RECEBE = 274,
     COMPARACAO = 275,
     E = 276,
     OU = 277,
     MAIOR_IGUAL = 278,
     MENOR_IGUAL = 279,
     MAIOR_QUE = 280,
     MENOR_QUE = 281,
     DIFERENTE = 282,
     IF = 283,
     ELSE = 284,
     FOR = 285,
     WHILE = 286,
     PONTOVIRGULA = 287,
     VIRGULA = 288,
     ASPAS = 289
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


