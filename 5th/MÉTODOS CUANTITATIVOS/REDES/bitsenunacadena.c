/*
REDES DE COMPUTADORAS
PROFESORA NIDIA ASUNCION CORTEZ DUARTE
ALUMNO : MARCOS OSWALDO VÁZQUEZ MORENO 2016601777
PROGRAMA QUE CUENTA LOS BITS DE UNA CADENA EN HEXADECIMAL 

*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

main (){
	unsigned char *t, i, j, cont; //tipo de insercion de cadena dinámica
	t = (unsigned char*)malloc(sizeof(unsigned char)); //delimitacion de cadena dinamica
	printf("Inserte una cadena: \n");
	gets(t); //recibe la cadena
		for(i = 0; i < strlen(t); i++) 
		{
			for(j = 128; j > 0 ; j = j>>1) //and con el 128, resultado 128 o 0 
			{
				if (t[i] & j) 
					cont++; //aumentamos el contador si la and de la posicion de la cadena y el 128 en decimal es verdadera
			}
		}
	printf("Numero de bits encendidos: %d\n", cont);
}

