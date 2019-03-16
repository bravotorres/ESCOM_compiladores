digit [0-9]
minus [a-z]
mayus [A-Z]

%%

{{digit}|{minus}|{mayus}|"_"}*{
	int i = 0;
	
	while(yytext[i]){
		i++;
	}
	
	if ( i < 5 || i > 20 ) {
		printf("Operación NO Valida");
	else{
		printf("Operación Válida");
	}


}
