%{
#define YYSTYPE double  // Tipo de datos para la pila de yacc (bison)

%}
%union{
	int entero;
	float real;
	char *str;
}

// yylval es la variable del tipo union...
// yylval.entero = atoi(yylval)
// 	return ENTERO

%token	ENTERO
%left	'+' '-'
%left	'*' '/'

%%
lista:	/* vacio */
	| lista '\n'
	| lista exp '\n'	{ printf("\t%0.8g\n", $2); }
	;

exp:	NUMERO		{ $$ = $1; }
	| exp '+' exp	{ $$ = $1 + $3; }
	| exp '-' exp	{ $$ = $1 - $3; }
	| exp '*' exp	{ $$ = $1 * $3; }
	| exp '/' exp	{ $$ = $1 / $3; }
	| '(' exp ')'	{ $$ = $2; }
	;
%%
#include <stdio.h>
#include <ctype.h>

char *progname;
int nolinea = 1;

int main(int argc, char *argv[]){
	progname = argv[0];
	yyparse();

	return 0;
}

int yylex(){
	int c;

	while( (c=getchar()) == ' ' || c == '\t' );

	if (c == EOF){
		return 0;
	}

	if (c == '.' || isdigit(c)){
		ungetc(c, stdin);
		scanf("%lf", &yylval);
		return NUMERO;
	}

	if (c == '\n'){
		nolinea++;
	}

	return c;
}

/*
yyerror(s)
	char *s;
{
	warning(s, (char *)0);
}

warning(s, t)
	char *s, *t;
{
	fprintf(stderr, "%s: %s", progname, s);

	if( t ){
		fprintf(stderr, " %s", t);
	}

	fprintf(stderr, " linea contigua %d\n", nolinea);

}
*/

int main(int argc, char *argv[]){
	progname = argv[0];

	yyparse();

	return 0;
}
