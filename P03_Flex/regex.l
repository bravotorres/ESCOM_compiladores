digito      [0-9]
entero      {digito}+
real_pre    "."{entero}
real_pos    {entero}"."
real_com    {entero}"."{entero}
argumento   {entero}|{real_pos}|{real_pre}|{real_com}
operador    "+" | "-" | "*" | "/"

%%
{digito}		{ printf("DIGITO");	}
{entero}		{ printf("ENTERO");	}
{real_com}		{ printf("REAL");	}

%%
/*
int main(){
    yylex();
    return 0;
}
*/
