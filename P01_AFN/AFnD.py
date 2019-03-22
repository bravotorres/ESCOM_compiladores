#!/usr/bin/env python3
# -*- encoding = 'utf-8' -*-

#
# FILE: AFnD.py
#
# REV.03: 2019/03/19
# REV.02: 2019/03/18
# REV.01: 2019/03/15
# CREATE: 2019/03/13
# 
# 	IPN-ESCOM, 2019
# 	Compiladores, 3CV7
# 
# 	Alejandro Bravo Torres [2013630045] <navegonauta@gmail.com>
# 
# Descripcion:
# 
# 
# Comentarios:
# 	Un Automata Finito no determinista con transiciones epsilon (AFnD-e), esta formado por una 5-tupla de la forma:
# 		AFnD-e(Q, S, q, d, F)
# 
# 	Donde:
#  		Q: Conjunto de Estados
# 		S: Alfabeto aceptado
# 		q: Estado inicial
# 		d: Funcion de Transicion
# 		F: Conjunto de Estados finales o de aceptacion
# 
# 		El automata se lee desde un archivo de texto plano con el siquiente formato:
# 
#  		Linea | Formato | Descripcion
# 		  1   | 0,1,2,3 | - Q - Tupla con los indices de los estados del Automata
# 		  2   | a,b,c   | - S - Tupla con los los simbolos del alfabeto
# 		  3   | 0       | - q - Estado inicial, Elemento de Q.
# 		  4   | 1,3     | - F - Tupla con los indices de los estados finales o de aceptacion, subconjunto de Q
# 		  5   | 0,a,1   | - d - A partir de aqui es la 'tabla' de transicion de la forma <estado>,<simbolo>,<estado>
# 		  ... | ...     | ...
# 
# 
# 	Ejemplo de Archivo Recibido: ejemplo1.txt
# 		0,1,2,3,4,5
# 		0,1,b,e
# 		0
# 		5
# 		0,b,1
# 		0,e,2
# 		1,0,1
# 		1,1,1
# 		1,e,2
# 		2,b,3
# 		2,e,4
# 		3,b,3
# 		3,e,4
# 		4,b,5
# 
# 	Validaciones:
# 	Sobre los elementos de la 5-tupla:
# 		V01: q es un elmento de Q
# 		V02: F es un subconjunto de Q
# 		V03: Los Estados de las transiciones pertenecen a Q
# 		V04: Los Simbolos de las transiciones pertenecen a S
# 
# 	Sobre las entradas del usuario:
# 		V05: Los simbolos de la cadena de entrada pertenece al alfabeto.
# 	
# 	Salidas:
# 		OUT01: Imprimir la tabla de transiciones Completada con el estado de error
# 		OUT02: 
#

import sys


class AFnD:
    def __init__(self, Q, S, q, F, D):
        self.estados = list(Q)
        self.alfabeto = list(S)
        self.estado_inicial = q
        self.estados_aceptacion = list(F)
        self.delta = list(D)
        self.completar_delta()

    def completar_delta(self):
        self.estados.append('ERR')
        transiciones = [[i, j] for i in self.estados for j in self.alfabeto]

        aux = []

        for i in self.delta:
            aux.append(i[:2])

        for t in transiciones:
            if t not in aux:
                self.delta.append([t[0], t[1], 'ERR'])

        self.delta.sort()
        print("Autómata completo...")

    def cadena_valida(self, entrada):
        for i in entrada:
            if i not in self.alfabeto:
                return False

        return True

    def recorrer(self, entrada):
        for i in entrada:
            print(i)

    def __str__(self):
        s = ''

        s += "\nEstados: \n"
        s += "\t{q_" + ", q_".join(self.estados) + "}"

        s += "\n\nAlfabeto: \n"
        s += "\t{'" + "', '".join(self.estados) + "'}"

        s += "\n\nEstado Inicial: \n"
        s += "\tq_{}".format(self.estado_inicial)

        s += "\n\nEstados de Aceptación: \n"
        s += "\t{q_" + ", q_".join(self.estados_aceptacion) + "}"

        s += "\n\nTabla de Transiciones: \n"
        for i in self.delta:
            s += "\t{}\n".format(i)

        return s


def file_to_afn(file):
    try:
        f = open(file, 'rt')
        print("Leyendo del Archivo '{}'".format(FILE))
        estados = (f.readline()).replace('\n', '').split(',')
        alfabeto = (f.readline()).replace('\n', '').split(',')
        inicial = (f.readline()).replace('\n', '').split(',')[0]
        aceptacion = (f.readline()).replace('\n', '').split(',')
        transiciones = []

        for i in f:
            transiciones.append(i.replace('\n', '').split(','))
        # print(i)

        f.close()

        return AFnD(estados, alfabeto, inicial, aceptacion, transiciones)

    except IOError as ex:
        print("ERROR: Verifique que el archivo '{}' exista".format(file))
        exit(1)

    except Exception as ex:
        print(">>> ERROR in file_to_afn: ", ex)
        return None


def main():
    afn = file_to_afn(FILE)
    print(afn)
    print(len(afn.delta))

    entrada = input("Ingrese Cadena: ")

    afn.recorrer(entrada)


if __name__ == '__main__':
    try:
        if len(sys.argv) != 2:
            raise Exception("Usage: \n\tpython3 AFnD.py <automata-file.txt>\n")

        FILE = sys.argv[1]

        main()
        exit(0)

    except Exception as ex:
        print(ex)
        exit(1)
