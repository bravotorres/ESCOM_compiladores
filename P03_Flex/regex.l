digito      [0-9]
entero      {digito}+
real_pre    "."{entero}
real_pos    {entero}"."
real_com    {entero}"."{entero}
argumento   {entero}|{real_pos}|{real_pre}|{real_com}
operador    "+"|"-"|"*"|"/"
salida		'^C'

%%
{entero}		{ printf("int(%s) ", yytext);	}
{argumento}		{ printf("float(%s) ", yytext);	}
{operador}		{ printf("op "); }

{salida}	{ printf("ctrl\n"); yyterminate(); }
<<EOF>>		{ printf("Fin...\n"); yyterminate(); }

%%

int main(){
    yylex();
    return 0;
}



//  "-"?{argumento}{operador}"-"?{argumento}	{printf("Operacion Valida.");}