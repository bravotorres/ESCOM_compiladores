digito	[0-9]
entero	{digito}+
real	{entero}\.{entero}*
%%
[ ]			{ECHO;}
{digito}	{ECHO;}
{entero}	{ECHO;}
{real}		{ECHO;}
.			{printf("<<ERROR>>");}
<<EOF>>		{yyterminate();}
%%
main(){
	yylex();
}
