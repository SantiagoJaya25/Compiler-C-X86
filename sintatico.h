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
     NUMERO_INTEIRO = 258,
     NUMERO_REAL = 259,
     VARIAVEL = 260,
     INT = 261,
     FLOAT = 262,
     CHAR = 263,
     PRINTF = 264,
     SOMA = 265,
     SUBTRACAO = 266,
     MULTIPLICACAO = 267,
     DIVISAO = 268,
     INCREMENTO = 269,
     DECREMENTO = 270,
     PARENTESES_ESQUERDA = 271,
     PARENTESES_DIREITA = 272,
     CHAVE_ESQUERDA = 273,
     CHAVE_DIREITA = 274,
     RECEBE = 275,
     COMPARACAO = 276,
     E = 277,
     OU = 278,
     MAIOR_IGUAL = 279,
     MENOR_IGUAL = 280,
     MAIOR_QUE = 281,
     MENOR_QUE = 282,
     DIFERENTE = 283,
     IF = 284,
     ELSE = 285,
     FOR = 286,
     WHILE = 287,
     PONTOVIRGULA = 288,
     VIRGULA = 289,
     ASPAS = 290
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


