%{
	#include "ejly1.h"
%}
%token ID NUM
%start e

%%

e : e '+' t {printf("Esto es una suma\n");}
  | t {printf("Esto es un termino\n");}
  ;

t : t '*' f {printf("Esto es un producto\n");}
  | f {printf("Esto es un factor\n");}
  ;

f : m '(' e ')' {printf("Esto es una expresion\n");}
  | m ID {printf("Esto es un identificador\n");}
  | m NUM {printf("Esto es un numero\n");}
  ; 

m : /*epsilon*/
  | '-' {printf("Esto es negativo\n");}
  ;

%%

int main(){
	yyparse();
	return 1;
}

yyerror(char *s){
	printf("%s\n",s);
}

