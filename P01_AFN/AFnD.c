/*
 * FILE: AFnD-e.c
 *
 * REV.01: 2018/10/08
 * CREATE: 2018/10/05
 * 
 * 	IPN-ESCOM, 2018
 * 	Compiladores, 3CV3
 * 
 * 	Alejandro Bravo Torres [2013630045] <navegonauta@gmail.com>
 * 
 * Descripcion:
 * 
 * 
 * 	Comentarios:
 * 	Un Automata Finito no determinista con transiciones epsilon (AFnD-e), esta formado por una 5-tupla de la forma:
 * 		AFnD-e(Q, S, q, d, F)
 * 
 * 	Donde:
 *  	Q: Conjunto de Estados
 * 		S: Alfabeto aceptado
 * 		q: Estado inicial
 * 		d: Funcion de Transicion
 * 		F: Conjunto de Estados finales o de aceptacion
 * 
 * 
 * 	El automata se lee desde un archivo de texto plano con el siquiente formato:
 * 
 *  Linea | Formato | Descripcion
 * 	  1   | 0,1,2,3 | - Q - Tupla con los indices de los estados del Automata
 * 	  2   | a,b,c   | - S - Tupla con los los simbolos del alfabeto
 * 	  3   | 0       | - q - Estado inicial, Elemento de Q.
 * 	  4   | 1,3     | - F - Tupla con los indices de los estados finales o de aceptacion, subconjunto de Q
 * 	  5   | 0,a,1   | - d - A partir de la linea 5, se muestra la 'tabla' de transicion de la forma <estado>,<simbolo>,<estado>
 * 	  ... | ...     | ...
 * 
 * 
 * 	Ejemplo de Archivo Recibido: ejemplo1.txt
 * 		0,1,2,3,4,5
 * 		0,1,b,e
 * 		0
 * 		5
 * 		0,b,1
 * 		0,e,2
 * 		1,0,1
 * 		1,1,1
 * 		1,e,2
 * 		2,b,3
 * 		2,e,4
 * 		3,b,3
 * 		3,e,4
 * 		4,b,5
 * 
 * 	Validaciones:
 * 	Sobre los elementos de la 5-tupla:
 * 		V01: q es un elmento de Q
 * 		V02: F es un subconjunto de Q
 * 		V03: Los Estados de las transiciones pertenecen a Q
 * 		V04: Los Simbolos de las transiciones pertenecen a S
 * 
 * 	Sobre las entradas del usuario:
 * 		V05: Los simbolos de la cadena de entrada pertenece al alfabeto.
 * 
 */

#include <stdio.h>
#include <stdlib.h>

<<<<<<< Updated upstream
typedef struct defNodo{
    char edo_pre;
    char trans;
    char edo_post;
    struct defNodo *next;
}Nodo;

typedef struct defDelta{
    Nodo *init;
    Nodo *fin;
    int size;
}Delta;
=======
>>>>>>> Stashed changes

typedef struct defAFN{
    char *estados;
    char *alfabeto;
    char inicial;
<<<<<<< Updated upstream
    Delta *delta;
    char *aceptados;
}AFN;

void read_file(char *file_name){
    FILE *archivo;
    char *lectura;
    
    if(archivo = fopen(file_name, "r") != NULL){
        while(!feof(archivo){
            fscanf(archivo, "%s\n", archivo);
            printf(">> '%s'\n", lectura);
        }
    }
}

int main(int argc, char **argv){
    char *archivo;
=======
    // char 
}AFN;


int main(int argc, char **argv){
>>>>>>> Stashed changes
	if( argc != 2 ){
		printf("Modo de uso: ./AFnD-e <automata.txt>\n");
		return 1;
	}else{
<<<<<<< Updated upstream
        archivo = argv[1];
		printf("Archivo a procesar: '%s'\n",archivo);
        read_file(archivo);
=======
		printf("Dentro...\n");
>>>>>>> Stashed changes
	}
	
	return 0;
}
