%{
 #include <stdio.h>
 #include <stdlib.h>
 #include "ejeyac1.h"
%}
%%
[0-9]+ {return NUM;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[ \t\n] {;}
[\+\*\(\)\-] {return yytext[0];}
. {printf("Error lexico [%s]\n",yytext);}
%%
int yywrap()
{
 return 1;
} 
