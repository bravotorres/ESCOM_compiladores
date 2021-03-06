%{
#include <ctype.h>
#include <stdio.h>
#define YYSTYPE double
%}
%union{
    int numero;
}
%token NUMERO
%type <numero> NUMERO

%left '+' '-'
%left '*' '/'
%right UMENOS

%%

lineas  : lineas expr '\n'  { printf("%g\n", $2); }
        | lineas '\n'
        | /* vacia */
        | error '\n'        { yyerror("Reingrese linea anterior: ");
                              yyerrok; }
        ;
        
expr    : expr '+' expr     { $$ = $1 + $3; }
        | expr '-' expr     { $$ = $1 - $3; }
        | expr '*' expr     { $$ = $1 * $3; }
        | expr '/' expr     { $$ = $1 / $3; }
        | '(' expr')'       { $$ = $2; }
        | '-' expr %prec UMENOS { $$ = - $2; }
        | NUMERO
        ;
        
%%
#include "lex.yy.c"
