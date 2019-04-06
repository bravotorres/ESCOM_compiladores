digito	[0-9]
min		[a-z]
mayus	[A-Z]
letras	{min}*{mayus}*

%%
{letras}	{
	printf("Letras ");
}

{digito}*	{
	printf("Números ");
}


