beta [0-9a-zA-Z_]*
%%
a {printf("e");}

{beta}[a-z]{beta}[A-Z]{beta}|{beta}[A-Z]{beta}[a-z]{beta} {
															int i=0;
															while(yytext[i]){i++;}
															if(i<8 || i>16){printf("pass incorrecto");}
															else{printf("pass correcto");}
														  }