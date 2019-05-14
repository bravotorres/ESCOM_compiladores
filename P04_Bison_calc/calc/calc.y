%union {
	char cadena[100];
	int numero;
}

%token <numero> NUM
%token <cadena> CAD
%type <numero> expnum
%type <cadena> expcad
%left '+'

%%
entrada : expnum '\n' {printf("Resultado:%d", $1);};
		| expcad '\n' {printf("Resultado:%s", $1);};
		;

expnum  : expnum '+' expnum {$$=$1+$3;}
 		| NUM {$$=S1;}
		;

expcad  : expcad '+' expcad {
            strcat($1,$3);
            strcpy($$,$1);
        }
 		| CAD {strcpy($$,S1);}
        ;
%%
main(){
	yyparse();
}
