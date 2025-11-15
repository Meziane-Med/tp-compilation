%{

#include <stdio.h>
#include "syntax.tab.h"
int nb_ligne = 1;
int nb_colonne = 1;
%}


IDF [a-zA-Z]([a-zA-Z0-9_])*
cmntr "//".*
CST [0-9]+
chaine \'[^\']*\'

%%
"Script"  {printf("MC_SCRIPT reconnu\n"); nb_colonne += yyleng; return MC_SCRIPT;}
"Vars"    {printf("MC_VARS reconnu\n"); nb_colonne += yyleng; return MC_VARS;}
"Int"     {printf("MC_INT reconnu\n"); nb_colonne += yyleng; return MC_INT;}
"Real"    {printf("MC_REAL reconnu\n"); nb_colonne += yyleng; return MC_REAL;}
"Code"    {printf("MC_CODE reconnu\n"); nb_colonne += yyleng; return MC_CODE;}
"Begin"   {printf("MC_BEGIN reconnu\n"); nb_colonne += yyleng; return MC_BEGIN;}
"Finish"  {printf("MC_FINISH reconnu\n"); nb_colonne += yyleng; return MC_FINISH;}
"If"      {printf("MC_If reconnu\n"); nb_colonne += yyleng; return MC_If;}
"Else"    {printf("MC_Else reconnu\n"); nb_colonne += yyleng; return MC_Else;}
"EndIf"   {printf("MC_EndIf reconnu\n"); nb_colonne += yyleng; return MC_EndIf;}
"AND"     {printf("MC_AND reconnu\n"); nb_colonne += yyleng; return MC_AND;}
"OR"      {printf("MC_OR reconnu\n"); nb_colonne += yyleng; return MC_OR;}
"For"     {printf("MC_For reconnu\n"); nb_colonne += yyleng; return MC_For;}
"Do"      {printf("MC_Do reconnu\n"); nb_colonne += yyleng; return MC_Do;}
"While"  {printf("MC_While reconnu\n"); nb_colonne += yyleng; return MC_While;}
"de"     {printf("MC_de reconnu\n"); nb_colonne += yyleng;return MC_de; }
"pas" {printf("MC_pas reconnu\n"); nb_colonne += yyleng; return MC_pas;}
"à"     {printf("MC_a reconnu\n"); nb_colonne += yyleng; return MC_a;}


{IDF}     {
            if(yyleng < 14) {
                printf("IDF valide: %s\n", yytext); 
                nb_colonne += yyleng; 
                return IDF;
            } else {
                printf("Erreur lexicale: idf %s trop long a la ligne %d\n", yytext, nb_ligne);
                nb_colonne += yyleng;
            }
          }

{cmntr}   {printf("Commentaire: %s\n", yytext); return CMNTR;}
{CST}     {printf("CST: %s\n", yytext); nb_colonne += yyleng; return CST;}
{chaine}  {printf("CHAINE: %s\n", yytext); nb_colonne += yyleng; return CHAINE;}

","       {printf("VG\n"); nb_colonne += yyleng; return VG;}
":"       {printf("DEUX_POINTS\n"); nb_colonne += yyleng; return DEUX_POINTS;}
";"       {printf("PVG\n"); nb_colonne += yyleng; return PVG;}
"{"       {printf("ACC_OUV\n"); nb_colonne += yyleng; return ACC_OUV;}
"}"       {printf("ACC_FER\n"); nb_colonne += yyleng; return ACC_FER;}
"("       {printf("PAR_OUV\n"); nb_colonne += yyleng; return PAR_OUV;}
")"       {printf("PAR_FER\n"); nb_colonne += yyleng; return PAR_FER;}
":="      {printf("AFF\n"); nb_colonne += yyleng; return AFF;}
"/"       {printf("DIV\n"); nb_colonne += yyleng; return DIV;}
"*"       {printf("MULT\n"); nb_colonne += yyleng; return MULT;}
"+"       {printf("PLUS\n"); nb_colonne += yyleng; return PLUS;}
">"             { printf("Op: >"); return OP_Sp; }
"<"             { printf("Op: <"); return OP_Mn; }
">="            { printf("Op: >="); return GE; }
"<="            { printf("Op: <="); return LE; }
"=="            { printf("Op: =="); return EQ; }
"!="            { printf("Op: !="); return NEQ; }

[ \t]     {nb_colonne += yyleng;}
\n        {nb_ligne++; nb_colonne = 1;}
.         {printf("Erreur lexicale sur l'entite %s a la ligne %d a la colonne %d\n", 
           yytext, nb_ligne, nb_colonne); nb_colonne += yyleng;}

%%
