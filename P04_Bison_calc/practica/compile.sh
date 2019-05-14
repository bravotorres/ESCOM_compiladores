#!/usr/bin/env bash

echo -e "pow(entero|decimal, entero)"
echo -e "-1--1 = 0"
echo -e "\"hola\"^3: \"holaholahola\""
echo -e "\"ho\"+\"la\"^3: \"holaholahola\""

bison -d segundo.y
flex primero.l
gcc segundo.tab.c lex.yy.c -o calc -lfl -lbl
