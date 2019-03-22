/*
 * FILE: AFnD-e.c
 *
 * REV.07: 2018/10/22
 * REV.06: 2018/10/18
 * REV.05: 2018/10/15
 * REV.04: 2018/10/12
 * REV.03: 2018/10/11
 * REV.02: 2018/10/09
 * REV.01: 2018/10/08
 * CREATE: 2018/10/05
 * 
 * 
 * 	IPN-ESCOM, 2018
 * 	Compiladores, 3CV3
 * 
 * 	Alejandro Bravo Torres [2013630045] <navegonauta@gmail.com>
 * 
 * 
 * 	Practica No.02: 
 * 		Automata Finito no Determinista con transiciones epsilon.
 * 
 * 	Descripcion:
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

// Definición del nodo que contiene las transiciones
typedef struct defNodo{
    char edo_pre;
    char trans;
    char edo_post;
    struct defNodo *next;
}Nodo;

// Definicion de la Tabla de transiciones como una lista enlazada
typedef struct defDelta{
    Nodo *init;
    Nodo *fin;
    int size;
}Delta;

// Definicion del AFnD_e, como una estructura encapsulada
typedef struct defAFnD_e{
    char *estados;
    char *alfabeto;
    char inicial;
    Delta *delta;
    char *aceptados;
}AFnD_e;

// Longitud de cadena
int str_len(char *cadena){
    int len = 0;
    
    while(cadena[len++] != '\0');
    
    return --len;
}

// Obtiene un areglo con los indices de los estados a partir de una cadena separada por comas
char *tuple_to_array(char  *tupla){
    char *array = (char*)malloc(sizeof(char));
    int i, x = 0;
    
    for(i=0; i<str_len(tupla); i++){
        if(tupla[i] != ','){
            // printf("\n\t'%c'.", tupla[i]);
            array[x++] = tupla[i];
        }else{
            continue;
        }
    }
    
    array[x] = '\0';
    
    return array;
}

void afnd_print(AFnD_e *afnd){
    Nodo *aux;
    
    aux = afnd->delta->init;
    
    while(aux){
        printf("%2c -> %2c -> %2c\n", aux->edo_pre, aux->trans, aux->edo_post);
        aux = aux->next;
    }
}

// void afnd_push(AFnD_e **afnd, char q_i, char t, char q_f){
    
// }

// afnd_pop()

// Lee el archivo y devuelve el AFnD_e ya formado.
void file_to_AFnDe(char *file_name){
    FILE *archivo;
    char *lectura = (char*)malloc(sizeof(char)*10);
    char *q_i = (char*)malloc(sizeof(char));
    char *t = (char*)malloc(sizeof(char));
    char *q_f = (char*)malloc(sizeof(char));
    
    // AFnD_e *afnd;
    char *estados = (char*)malloc(sizeof(char));
    char *alfabeto = (char*)malloc(sizeof(char));
    char axioma;
    char *finales = (char*)malloc(sizeof(char));
    
    archivo = fopen(file_name, "r");
    
    if(archivo){
        // Lectura de la coleccion de estados.
		fscanf(archivo, "%s\n", lectura);
        estados = tuple_to_array(lectura);
        printf("\nEstados en array: '%s'\n", estados);
		
        // Lectura del Alfabeto.
		fscanf(archivo, "%s\n", lectura);
        alfabeto = tuple_to_array(lectura);
		printf("\nAlfabeto: '%s'\n", alfabeto);
		
        // Lectura del Axioma, o estado inicial.
		fscanf(archivo, "%s\n", lectura);
        axioma = lectura[0];
		printf("\nEstado inical: '%c'\n", axioma);
		
        // Lectura de los estados finales, o de aceptación.
		fscanf(archivo, "%s\n", lectura);
        finales = estados = tuple_to_array(lectura);
		printf("\nEstados Finales: '%s'\n", finales);
		
        // Lectura del la tabla de transiciones como lista.
        printf("\nTransiciones:\n");
        while(!feof(archivo)){
            fscanf(archivo, "%c,%c,%c\n", q_i, t, q_f);
            printf(" %2s -> %2s -> %2s\n", q_i, t, q_f);
            // afnd_push(&afnd, q_i, t, q_f);
        }
        
        // afnd_print(&afnd);
    }else{
        printf("\nError en rl fichero '%s'. Verifiquelo,\n", file_name);
    }
}

// Punto de Ejecucion Principal
int main(int argc, char **argv){
	char *archivo;
	// AFnD_e *afnd;
	
	if( argc != 2 ){
		printf("Modo de uso: ./AFnD-e <automata.txt>\n");
		return 1;
	}else{
        archivo = argv[1];
		printf("Archivo a procesar: '%s'\n",archivo);
        file_to_AFnDe(archivo);
        // afnd = file_to_AFnDe(archivo);
        
	}
	
	return 0;
}
