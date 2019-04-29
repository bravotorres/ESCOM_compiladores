%{
//#include <math.h>
%}
             
/* Declaraciones de BISON */
%union{
	int entero;
    float real;
    char *cadena;
}

%token <entero> ENTERO
%type <entero> exp

%token <real> REAL
%type <real> exp

%token <cadena> STR
%type <cadena> exp
             
%left '+' '-'
%left '*' '/'
             
/* Gramática */
%%
             
input:  /* cadena vacía */
        | input line             
        ;

line:   '\n'
        | exp '\n'  { printf ("\tResultado: %d\n", $1); }
        ;
             
exp:    ENTERO          { $$ = $1; }
        REAL            { $$ = $1; }
        | exp '+' exp   { $$ = $1 + $3; }
        | exp '-' exp   { $$ = $1 - $3; }
        | exp '*' exp   { $$ = $1 * $3;	}
        | exp '/' exp   { $$ = $1 / $3;	}
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
