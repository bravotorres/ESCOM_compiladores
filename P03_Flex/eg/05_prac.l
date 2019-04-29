mayus	[A-Z]
minus	[a-z]
letra	{mayus}|{minus}
letras	{letra}+
digito	[0-9]
identficador	(({letra}|"_"{letras}){digito})+{letras}
%%
{identificador}	{
	printf("identificador correcto!");
}

