%{
//#include <math.h>
%}
             
/* Declaraciones de BISON */
%union{
	int entero;
}

%token <entero> ENTERO
%type <entero> exp
             
%left '+' 
%left '*'
             
/* Gramática */
%%
             
input:  /* cadena vacía */
        | input line             
        ;

line:   '\n'
        | exp '\n'  { printf ("\tResultado: %d\n", $1); }
        ;
             
exp:    ENTERO          { $$ = $1; }
        | exp '+' exp   { $$ = $1 + $3; }
        | exp '*' exp   { $$ = $1 * $3;	}
        ;

             
%%
// Punto de Ejecución Principal
int main() {
    yyparse();
}
             
// Manejo de error
yyerror (char *s) {
    printf ("ERR: --%s--\n", s);
}

// 
int yywrap() {
    return 1;
}  
