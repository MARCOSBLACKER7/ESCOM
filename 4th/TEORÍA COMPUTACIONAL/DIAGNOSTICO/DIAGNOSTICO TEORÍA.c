	/*  
	15 de Febrero de 2015
	Hecho por Marcos Oswaldo Vázquez Moreno 2016601777
	Teoría Computacional
	Examen diagnóstico 
	Leer un frase y contar el número de vocales (de cada una) que aparecen 
	*/
	
#include <stdlib.h>
#include <conio.h>
#include <string.h>
#include <stdio.h>

main() 
{
char cadena[400];	
int v=0, i;
printf("Ingresa frase: \n");
gets(cadena);

for (i=0; i < strlen(cadena); i++)
		{
		if(cadena[i] == 'a' || cadena[i] == 'e' || cadena[i] == 'i' || cadena[i] == 'o' || cadena[i] == 'u' || cadena[i] == 'A' || cadena[i] == 'E' || cadena[i] == 'I' || cadena[i] == 'O' || cadena[i] == 'U')
		v++;
		
		}

printf("\nEl total de vocales que contiene tu frase es: %d", v);
	
}
