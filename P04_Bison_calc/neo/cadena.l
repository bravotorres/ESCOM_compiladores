cadena	\"[a-zA-Z]*\"

%%

{cadena}	{ printf("Es una cadena: '%s'", yytext); }

