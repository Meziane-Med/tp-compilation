
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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
     MC_SCRIPT = 258,
     MC_VARS = 259,
     MC_CODE = 260,
     MC_BEGIN = 261,
     MC_FINISH = 262,
     MC_INT = 263,
     MC_REAL = 264,
     IDF = 265,
     CST = 266,
     CHAINE = 267,
     VG = 268,
     PVG = 269,
     DEUX_POINTS = 270,
     AFF = 271,
     ACC_OUV = 272,
     ACC_FER = 273,
     PAR_OUV = 274,
     PAR_FER = 275,
     PLUS = 276,
     MULT = 277,
     DIV = 278,
     CMNTR = 279,
     MC_If = 280,
     MC_Else = 281,
     MC_EndIf = 282,
     MC_For = 283,
     MC_Do = 284,
     MC_OR = 285,
     MC_AND = 286,
     MC_While = 287,
     MC_de = 288,
     MC_pas = 289,
     MC_a = 290,
     OP_Sp = 291,
     OP_Mn = 292,
     GE = 293,
     LE = 294,
     EQ = 295,
     NEQ = 296
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


