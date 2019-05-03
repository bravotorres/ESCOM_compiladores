numero  [0-9]+\.?|[0-9]*\.[0-9]+
%%
[ ]         { /* Se omiten espacios en blanco. */ }
{numero}    { sscanf(yytext, "%lf", &yylval);
              return NUMERO; }
\nl.        { return yytext[0]; }
