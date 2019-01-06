/* Hecho por Vázquez Moreno Marcos Oswaldo Boleta 2016601777
	El 22 de Febrero de 2018
	Materia Teoría Computacional 
	Práctica número 1 OPERACIONES CON CADENA
	Fecha de inicio 21 de Febrero
	Fecha de terminación 26 de Febrero
*/

//librerías
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <conio.h>

void muerto(gram1[], cadena1[]);

main(){
	char yn, gram1[1], gram2[2], gram3[3], gram4[4],  cadena1[5], cadena2[5],cadena3[5], cadena4[5];
	char aux[20], l;
	int o;
	printf("BIENVENIDO AL LIMPIADOR DE CADENAS 5000\n");	
	printf("ELIJA EL NUMERO DE GRAMATICAS QUE QUIERE INSERTAR ENTRE 1-4 \n");
	scanf("%d", &o);
	fflush(stdin);
	if(o > 0){
	
		switch(o)
		{
		 	case 1:
		 		printf("Dame la letra que produce la gramatica\n");
		 		gets(gram1);
		 		printf("Dame la produccion\n");
		 		gets(cadena1);
		 		fflush(stdin);
				sprintf(aux, "\n%s -> %s\n", gram1, cadena1);
				puts(aux);
				printf("Desea limpiarla? (Y/N)\n");
				scanf("%c", &l);
				if(l == 'y' || 'Y'){
				//	redenominacion();
				//	muerto();
				//	inaccesible();	
				}
				else
				exit(0);
		 	break;
		 
		 	case 2:
		 		printf("Dame la letra que produce la primer gramatica\n");
		 		gets(gram1);
		 		printf("Dame la produccion\n");
		 		gets(cadena1);
				printf("Dame la letra que produce la segunda gramatica\n");
		 		gets(gram2);
		 		printf("Dame la produccion\n");
		 		gets(cadena2);
		 		fflush(stdin);
		 		printf("%s -> %s \n", gram1, cadena1);
		 		printf("%s -> %s \n", gram2, cadena2);
		 		
		 		fflush(stdin);
		 		
		 	break;
		 	
		 	case 3:
		 		printf("Dame la letra que produce la primer gramatica\n");
		 		gets(gram1);
		 		printf("Dame la produccion\n");
		 		gets(cadena1);
				printf("Dame la letra que produce la segunda gramatica\n");
		 		gets(gram2);
		 		printf("Dame la produccion\n");
		 		gets(cadena2);
		 		printf("Dame la letra que produce la segunda gramatica\n");
		 		gets(gram3);
		 		printf("Dame la produccion\n");
		 		gets(cadena3);
		 		fflush(stdin);
		 		printf("%s -> %s \n", gram1, cadena1);
		 		printf("%s -> %s \n", gram2, cadena2);
		 		printf("%s -> %s \n", gram3, cadena3);
		 		fflush(stdin);
		 	break;
		 	
		 	case 4:
		 		printf("Dame la letra que produce la primer gramatica\n");
		 		gets(gram1);
		 		printf("Dame la produccion\n");
		 		gets(cadena1);
				printf("Dame la letra que produce la segunda gramatica\n");
		 		gets(gram2);
		 		printf("Dame la produccion\n");
		 		gets(cadena2);
		 		printf("Dame la letra que produce la segunda gramatica\n");
		 		gets(gram3);
		 		printf("Dame la produccion\n");
		 		gets(cadena3);
		 		printf("Dame la letra que produce la segunda gramatica\n");
		 		gets(gram4);
		 		printf("Dame la produccion\n");
		 		gets(cadena4);
		 		fflush(stdin);
		 		printf("%s -> %s \n", gram1, cadena1);
		 		printf("%s -> %s \n", gram2, cadena2);
		 		printf("%s -> %s \n", gram3, cadena3);
		 		printf("%s -> %s \n", gram4, cadena4);
		 		fflush(stdin);
		 	break;
		 	
		}
	}
	else 
	exit(0);
}

void muerto(gram1, cadena1){
	int buscar_subcadena(const char cad1[ ],const char cad2[ ]){
int i=0;
int j,k;
int encontrado=0;

while((gram1[i] != '\0') && (encontrado != 1)){
j=0;
k=i;
while((cadena1[k]==cadena1[j]) && (cadena1[j] != '\0')){
k++;
j++;
}
if(cadena1[j]=='\0'){
encontrado=1;
}
else{
i++;
}
if(encontrado==0){
i=-1;
}
return(i);
} 
	
	
	
	
	
}
