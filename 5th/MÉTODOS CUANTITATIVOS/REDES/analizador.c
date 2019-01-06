/*
	analizador trama pizarron
	autor: Marcos Oswaldo Vazquez Moreno
	Redes de Computadoras
	
*/


#include <stdio.h>
#include <stdlib.h>
void analiza(unsigned char T[]); //FUNCION QUE RECIBE LA TRAMA ANALIZAR
unsigned char contarBits(unsigned char T[], unsigned char tam); //FUNCION QUE RECIBE A LA TRAMA Y AL TAMAÑO Y CUENTA LOS BITS
int main()
	
{	
		unsigned char T[] = {0x7B, 0x69, 0x6C, 0x20, 0x79, 0x20, 0x61, 0x20, 0x64, 0x75, 0x20, 0x76, 0x65, 0x6E, 0x74, 0xCF, 0x9A, 0xA0, 0x00, 0x24}; //TRAMA 
	//	unsigned char T[]= {0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x};
	analiza(T); //FUNCION QUE GENERA TODO EL ANALISIS
}


	void analiza(unsigned char T[]){
	
	unsigned char idioma[][10]= {" ", "Nada", "Espaniol", "Ingles", "Portugues", "Frances", "Aleman", "Nada"};
	unsigned char enrutamiento[][9]= {"Estatico", "Dinamico"};
	unsigned char grupos[][5] = {"", "2CM7", "3CM5", "5CM3"};
	unsigned char alambrico[][8] = {"", "F.O", "Coaxial", "UTP"};
	unsigned char inalambrico[][10] = {"Infrarrojo", "WiFi", "NFC"};
	unsigned char Codigolinea[][9] = {"Unipolar", "Polar", "RZ", "NRZ", "AMI"};
	unsigned char controlerror[][9] = {"Paridad", "CRC", "5ntrol", "Checksum"};
	unsigned char tam = (T[0]>>4)*2; 
	unsigned char i=0, j = 0;
	
	//CAPA 1 QUE CONTIENE A TAMANIO, IDIOMA, ENRUTAMIENTO Y MENSAJE
	printf("El tamanio es: %d  bytes \n", tam); //TAMANIO
	printf("El idioma es %s \n", idioma[ (T[0]>>1) & 7 ] ); //IDIOMA
	printf("Enrutamiento: %s\n", enrutamiento[T[0]&1]); //ENRUTAMIENTO
	printf("Mensaje:  "); //MENSAJE
	//ITERACION DESDE LA POSICION 0 DEL MENSAJE HASTA LA POSICION N=FINAL
		for(i=0; i<tam; i++){
			printf("%c",T[i+1]);
	
		}


	printf("ID Origen: %s  %d\n", grupos[T[tam + 1]>>6], T[tam + 1] & 63);
	printf("ID Destino: %s  %d\n", grupos[T[tam + 2]>>6], T[tam + 2] & 63);
	

	printf("Control de flujo: ");
	if (T[tam + 3]>>7 & 1)
	{
		printf("Ventana deslizante \n");
		if (T[tam+3]>>6 & 1)
		{
			printf("Rechazo Selectivo");
		}
		else
		{
			printf("Go back N");
		}

		if (T[tam + 3]>>5 & 1)
		{
			printf("  Extendido\n");
			j = 7;
		}
		
	}
	else
	{
		printf("Parar y esperar\n");
	}
	
	printf("Control de error: ");  // CONTROL DE ERROR
	printf("%s", controlerror[T[tam + 4]>>6]);
	if(T[tam + 4]>>6 == 0)
	{
		if(T[tam + 4]>>5 & 1)
		{
			printf("Impar\n");
			printf("Bits encendidos: %d \n", contarBits(T, tam));
			if(contarBits(T, tam)%2)
				printf("Trama correctisima \n");
			else
				printf("Trama incorrecta\n");
		}
		else
		{
			printf(" Par\n");
			printf("Bits encendidos: %d\n", contarBits(T, tam));
			if(contarBits(T, tam)%2)
				printf("Trama icorrecta\n");
			else
				printf("Trama correctisima\n");
		}
	}
	
	
	
	
	printf("Medio: ");
	if(T[19]>>7 & 1)
	{
		printf("Inalambrico %s\n", inalambrico[ (T[19]>>5) & 3]);
	}
	else
	{
		printf("Alambrico %s\n", alambrico[ (T[19]>>5) & 3]);
	}
	printf("Codigo de linea: ");
	for(i = 16, j = 0; i > 0; i = i >> 1, j++)
	{
		if (T[19] & i)
			printf("%s ", Codigolinea[j]);
	}
	
}
	//CONTADOR DE LOS BITS
	unsigned char contarBits(unsigned char t[], unsigned char tam)
{
	unsigned char cont = 0, i = 0, j = 0;
	for(i = 0; i < tam + 4; i++)
	{
		for(j = 128; j > 0 ; j = j>>1)
		{
			if (t[i] & j)
				cont++;
		}
	}
	return cont;
}
	
	
	
	
	
	
