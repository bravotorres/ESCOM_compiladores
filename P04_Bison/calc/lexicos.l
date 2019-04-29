%{
	#include "calc.tab.h"
%}

%%
[a-zA-Z]+ {
	strcpy(yylval.cadena, yytext);
	return(CAD);
};

[0-9]+  {
	yylval.numero=atoi(yytext);
	return(NUM);
};

"+"		{return('+');};

"\n"	{return('\n');};
;
