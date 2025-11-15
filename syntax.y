%{

#include <stdio.h>
#include <stdlib.h>

extern int nb_ligne;
extern int nb_colonne;

void yyerror(const char *s);
int yylex();
int yywrap();
%}


%token MC_SCRIPT MC_VARS MC_CODE MC_BEGIN MC_FINISH
%token MC_INT MC_REAL
%token IDF CST CHAINE
%token VG PVG DEUX_POINTS AFF
%token ACC_OUV ACC_FER PAR_OUV PAR_FER
%token PLUS MULT DIV
%token CMNTR
%token MC_If MC_Else MC_EndIf MC_For MC_Do MC_OR MC_AND MC_While MC_de MC_pas MC_a 
%token OP_Sp OP_Mn GE LE EQ NEQ


%left PLUS
%left MULT DIV


%start Programme

%%


Programme: MC_SCRIPT IDF PVG PartieDeclaration PartieCode 
          {printf("Programme syntaxiquement correct\n"); YYACCEPT;}
         ;

PartieDeclaration: MC_VARS ListeDeclarations
                 | 
                 ;

ListeDeclarations: Declaration
                 | ListeDeclarations Declaration
                 ;

Declaration: ListeIDF DEUX_POINTS Type PVG
           ;

ListeIDF: IDF
        | ListeIDF VG IDF
        ;

Type: MC_INT
    | MC_REAL
    ;

PartieCode: MC_CODE MC_BEGIN ACC_OUV ListeInstructions  ACC_FER MC_FINISH 
          ;

ListeInstructions: 
                 | ListeInstructions Instruction
                 | Instruction
                 ;

Instruction: Affectation
           | Ecriture
           | partif
           | partfor
           | partwhile
           | 
           ;

Affectation: IDF AFF Expression PVG
           ;

Expression: Expression PLUS Expression
          | Expression MULT Expression
          | Expression DIV Expression
          | Expression GE Expression
          | Expression LE Expression
          | Expression EQ Expression
          | Expression NEQ Expression
          | Expression OP_Sp Expression
          | Expression OP_Mn Expression
          | CST
          | IDF
          | PAR_OUV Expression PAR_FER
          ;

Ecriture: IDF PAR_OUV CHAINE PAR_FER PVG
        ;

partif: MC_If PAR_OUV partcond PAR_FER ACC_OUV ListeInstructions ACC_FER MC_Else ACC_OUV ListeInstructions ACC_FER MC_EndIf PVG
        ;

partcond: Expression MC_AND Expression
        | Expression MC_OR Expression
        | Expression GE Expression
        | Expression LE Expression
        | Expression EQ Expression
        | Expression NEQ Expression
        ;

partfor:
      MC_For IDF MC_de CST MC_a CST MC_pas CST ACC_OUV ListeInstructions ACC_FER
    ;

    
partwhile: MC_Do ACC_OUV Instruction ACC_FER MC_While PAR_OUV partcond PAR_FER PVG  
         ;       

%%



int main() {
    printf("Debut de l'analyse syntaxique...\n");
    yyparse();
    return 0;
}

int yywrap() {
    return 1;
}

void yyerror(const char *s) {
        printf("Erreur syntaxique a la ligne %d, colonne %d: %s\n", 
                   nb_ligne, nb_colonne, s);
    
}