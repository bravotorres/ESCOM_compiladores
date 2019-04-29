digito	[0-9]
min		[a-z]
mayus	[A-Z]
letras	({min}|{mayus})*


%%
({digito}+|{mayus}+|{min}+)+	{
	printf("Password Correcta ");
}

