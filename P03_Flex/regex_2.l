integer [0-9]+
float_pre '.'[0-9]+
float_pos [0-9]+'.'

%%

{float_pos}{integer}{float_pre}{'+'|'-'|'*'|'/'}{float_pos}{integer}{float_pre} {
	
	; if(i<8 || i>16){
	; 	printf("Operación NO Valida");
	; else{
	; 	printf("Operación Válida");
}
