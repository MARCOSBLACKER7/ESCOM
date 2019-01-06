/*
VAZQUEZ MORENO MARCOS OSWALDO 
REDES DE COMPUTADORAS
EJERCICIO 1
CLASIFICACION DE CLASES EN UNA DIRECCION IP, MASCARA DE RED, TIPO, RANGO DE HOST, BROADCAST, REPETIR 
*/

#include<stdio.h>
#include<stdlib.h>

//int validacion(int ip);

int main(){


//arreglo de cuatro octetos
unsigned char IP[4]= {0,0,0,0}, MR[4]= {0,0,0,0};
char a= 'y';
do{

	printf("ingrese direccion ip valida: \n");
	scanf("%u.%u.%u.%u",&IP[0], &IP[1], &IP[2], &IP[3]);
	fflush(stdin);
//validacion para entrar al distinto tipo de casos 
if(IP[0] & 128) //clase A
	{
		if(IP[0] & 64) //clase B
		{	
			if(IP[0] & 32) //clase C
			{	
				if(IP[0] & 16) //clase D
				{
					if(IP[0] & 8) //clase E
					{
						printf("Clase E\n");
					}
					else 
					{
						printf("Clase E\n");
					}
				}
				else
				{
					printf("Clase D\n");
				}
			}
			else 
			{
				printf("----------------------------------\n");
				printf("CLASE C\n");
				MR[0]= 255; //VALORES DE LS OCTETOS DE CADA MASCARA DE RED
				MR[1]= 255;
				MR[2]= 255;
				MR[3]= 0;
				if(IP[3]==255){ 
					printf("TIPO BROADCAST\n");
				}
				else if(IP[3]==0){
					printf("TIPO RED\n");
				}
				else
					printf("TIPO HOST\n");
				printf("MASCARA DE RED: %u.%u.%u.%u\n", MR[0],MR[1], MR[2], MR[3]);
				printf("RED: %u.%u.%u.%u\n", IP[0]&MR[0], IP[1]&MR[1], IP[2]&MR[2], IP[3]&MR[3]);
				printf("BROADCAST: %u.%u.%u.%u\n", IP[0] | (unsigned char)~MR[0], IP[1] | (unsigned char)~MR[1], IP[2] | (unsigned char)~MR[2], IP[3] | (unsigned char)~MR[3]); //CASTEO DE ENTERO A UNSIGNED CHAR
				printf("RANGO DE HOST: %u.%u.%u.%u A %u.%u.%u.%u\n", IP[0] & MR[0], IP[1] & MR[1], IP[2] & MR[2], (IP[3] &MR[3])+1, IP[0] | (unsigned char)~MR[0], IP[1] | (unsigned char)~MR[1], IP[2] | (unsigned char)~MR[2], (IP[3] | (unsigned char)~MR[3])-1);
			}
		}
		else
		{
			printf("----------------------------------\n");
			printf("CLASE B\n");
			MR[0]= 255; //VALORES DE LS OCTETOS DE CADA MASCARA DE RED
			MR[1]= 255;
			MR[2]= 0;
			MR[3]= 0;
			if(IP[3]==255 && IP[2]==255){
					printf("TIPO BROADCAST\n");
				}
				else if(IP[3]==0 && IP[2]==0){
					printf("TIPO RED\n");
				}
				else
					printf("TIPO HOST\n");
			printf("MASCARA DE RED: %u.%u.%u.%u\n", MR[0],MR[1], MR[2], MR[3]);
			printf("RED: %u.%u.%u.%u\n", IP[0]&MR[0], IP[1]&MR[1], IP[2]&MR[2], IP[3]&MR[3]);			
			printf("BROADCAST: %u.%u.%u.%u\n", IP[0] | (unsigned char)~MR[0], IP[1] | (unsigned char)~MR[1], IP[2] | (unsigned char)~MR[2], IP[3] | (unsigned char)~MR[3]);
			printf("RANGO DE HOST: %u.%u.%u.%u A %u.%u.%u.%u\n", IP[0] & MR[0], IP[1] & MR[1], IP[2] & MR[2], (IP[3] &MR[3])+1, IP[0] | (unsigned char)~MR[0], IP[1] | (unsigned char)~MR[1], IP[2] | (unsigned char)~MR[2], (IP[3] | (unsigned char)~MR[3])-1);
		} 
	}
	else
	{
		printf("----------------------------------\n");
		printf("CLASE A\n");
		MR[0]= 255; //VALORES DE LS OCTETOS DE CADA MASCARA DE RED
		MR[1]= 0;
		MR[2]= 0;
		MR[3]= 0;
		if(IP[3]==255 && IP[2]==255 && IP[1]==255){
					printf("TIPO BROADCAST\n");
				}
				else if(IP[3]==0 && IP[2]==0 && IP[1]==0){
					printf("TIPO RED\n");
				}
				else
					printf("TIPO HOST\n");

		printf("MASCARA DE RED: %u.%u.%u.%u\n", MR[0], MR[1], MR[2], MR[3]);
		printf("RED: %u.%u.%u.%u\n", IP[0] & MR[0], IP[1] & MR[1], IP[2] & MR[2], IP[3] &MR[3]);
		printf("BROADCAST: %u.%u.%u.%u\n", IP[0] | (unsigned char)~MR[0], IP[1] | (unsigned char)~MR[1], IP[2] | (unsigned char)~MR[2], IP[3] | (unsigned char)~MR[3], IP[4] | (unsigned char)~MR[4]);
		printf("RANGO DE HOST: %u.%u.%u.%u A %u.%u.%u.%u\n", IP[0] & MR[0], IP[1] & MR[1], IP[2] & MR[2], (IP[3] &MR[3])+1, IP[0] | (unsigned char)~MR[0], IP[1] | (unsigned char)~MR[1], IP[2] | (unsigned char)~MR[2], (IP[3] | (unsigned char)~MR[3])-1);	
	};

printf("desea repetir el proceso (Y/N)\n");
scanf("%c", &a);
fflush(stdin);

}while(a == 'Y' || a == 'y');
return 0;

}

