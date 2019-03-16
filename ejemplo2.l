beta [0-9a-zA-Z]*
%%
[0-9] {printf("unidad -");}
[1-9][0-9] {printf("Decena -");}
1[0-9][0-9] {printf("centena -");}
2[0-4][0-9] {printf("centena -");}
25[0-5] {printf("centena -");}
{beta}[a-z]{beta}[A-Z]{beta}|{beta}[A-Z]{beta}[a-z]{beta}{
	// printf("pass correcto- %s", yytext);
	int i=0;
	while(yytext[i]){
		i++;
	}
	if(i<8 || i>16){
		printf("Pass Incorrecta: ");
	}else{
		printf("pass correcto");
	}
}