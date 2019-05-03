/* Parecido a wc de Unix */
%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+	{ words++; chars += strlen(yytext); }
\n		{ chars++; lines++; }
.		{ chars++; }

%%

int main(int argc, char **argv){
	yylex();
	printf("\n    Lineas: %8d", lines);
	printf("\n  Palabras: %8d", words);
	printf("\nCaracteres: %8d", chars);
	printf("\n");
	
	return 0;
}
