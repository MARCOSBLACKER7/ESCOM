	/*  
	15 de Febrero de 2015
	Hecho por Marcos Oswaldo Vázquez Moreno 2016601777
	Teoría Computacional
	Examen diagnóstico 
	Leer un frase y contar el número de vocales (de cada una) que aparecen 
	*/
	
//librerias a utilizar
#include <stdlib.h>
#include <conio.h>
#include <string.h>
#include <stdio.h>

main()     //Inicialización del programa
{
char cadena[400];	//declaración de una cadena de 400 caracteres 
int v=0, i;        //mis variables, v que cuenta las vocales y la i que recorre la cadena
printf("Ingresa frase: \n");  //pido que ingresen la cadena
gets(cadena);  //ingresan la cadena 

for (i=0; i < strlen(cadena); i++)  //Inicio un ciclo para que vaya recorriendo la cadena 
		{
		if(cadena[i] == 'a' || cadena[i] == 'e' || cadena[i] == 'i' || cadena[i] == 'o' || cadena[i] == 'u' || cadena[i] == 'A' || cadena[i] == 'E' || cadena[i] == 'I' || cadena[i] == 'O' || cadena[i] == 'U')
		v++;  //arriba realizo la validación para que sume al contador v +1 cuando  uno de esos casos dentro del  if se dé
		
		}

printf("\nEl total de vocales que contiene tu frase es: %d", v); //regreso el valor total de v al terminar de contar la cadena
	
}
