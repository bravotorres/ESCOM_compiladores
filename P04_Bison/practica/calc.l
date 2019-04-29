%{
#include "calc.tab.h"
%}

INTEGER [0-9]+
REAL    [0-9]+('.'[0-9]+)*
STR     [a-zA-Z]+

%%

{INTEGER}       {
    printf("Numero entero: %s\n", yytext);
    yylval.entero = atoi(yytext);
    return (INTEGER);
}

{INTEGER}       {
    printf("Numero entero: %s\n", yytext);
    yylval.entero = atof(yytext);
    return (REAL);
}

"+"|"-"|"*"|"/" {
    printf("Operación binaria: \'%s\'\n", yytext);
    return (yytext[0]);
}

"\n"        {
    printf("Salto de linea\n");
    return (yytext[0]);
}
%%
