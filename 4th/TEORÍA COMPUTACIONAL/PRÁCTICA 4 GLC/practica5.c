/*
Ajitzi Ricardo Quintana Ruiz  2017631261
Vázquez Moreno Marcos Oswaldo Vázquez 2016601777
Práctica 4: Grámaticas Libres de contexto
2cm4
12/04/18
*/

//S->aSb|Îµ

#include <stdio.h>
#include <string.h>
#include <windows.h>

typedef struct{
	char a[2];//solo contener el caracter a
	char b[2];//solo contiene el caracter b
	char S[2];//solo contiene el caracter S
	char aa[300];
	char bb[300];
}cadenas;//declaro una structura con 5 cadenas, 3 con
		//un solo caracter y 2 para guardar concatenaciones y la llamo "cadenas"

cadenas lenguaje ={
	"a",
	"b",
	"S",
	"",//va contener la concatenacionde a's y b's sin la S
	"",
};//mi primera extructura "cadenas" se llama lenguaje y contiene los 3 caracteres
  // de mi LLC y los otros dos vacios

cadenas simbolo ={
	"a",
	"b",
	"S",
	"",//va contener las a's concatenadas
	"",//va contener las b's concatenadas
};//mi segunda extructura "cadenas" se llama simbolo y contiene los 3 caracteres
  // de mi LLC y los otros dos vacios

void Concatena (cadenas *len, int n); //declaracion de las funciones
void Pasos(cadenas lenguaje, int n);
void PegaA (cadenas *sim, int j);
void PegaB (cadenas *sim, int j);
void Limpiar (cadenas *sim);

int main (void)
{
	int n;//declaro n para guardar el numero de a's y b's
	printf("Ingresa el numero de a's y b's\n");//pido el valor de n
	scanf("%d",&n);//guardo el numero del usuario
	system("cls");//limpio la pantalla
	printf("%c\n",156);//imprimo Epsilon
	Pasos(lenguaje,n);//llamo a mi funcion pasos y le mando una copia de mi
					//structura lenguaje y el numero n

	return 0;
}

void Pasos(cadenas lenguaje, int n)
{
	int i=1;//mi contador que empieza en 1
	char res[500]="";//mi cadena que va a guardar los pasos y los va ir imprimiendo
	char coma[]=",";//mi cadena coma que contiene una coma

	while(i<n)
	{
		PegaA(&simbolo,i);/*llamo a mi funcion que pega las a's desde 1 hasta i
						  pero le mando la dir de simbolo*/
		PegaB(&simbolo,i);/*llamo a mi funcion que pega las b's desde 1 hasta i
						  pero le mando la dir de simbolo*/
		strcat(simbolo.aa,lenguaje.S);//concateno las a's con la cadena S
		strcat(simbolo.aa,simbolo.bb);//concateno las a's con la S y las b's
		strcat(res,simbolo.aa);//concateno todo en resultado
		strcat(res,coma);//le concateno la coma
		printf("%s\n",res);//imprimo mi cadena que contiene todo "res"
		strcpy(simbolo.aa,"");//vacio donde se guardan las a's
		strcpy(simbolo.bb,"");//vacio donde se guardan las b's

		i++;//incremento i
	}
	Concatena(&lenguaje,n);/*llamo a la funcion que me da el ultimo resultado
							de n a's y n b's sin la S en la mitad*/
	strcat(res,lenguaje.aa);/*concateno el ultimo valor de res y el resultado
							de mi funcion concatena*/
	printf("%s\n",res);//imprimo res

}

void Concatena (cadenas *len, int n)//concatena cambia los valores de lenguajes
{
	for (int i = 0; i < n; ++i)
	{
		strcat(len->aa,len->a);//concatena en aa el n a's
	}
	for (int i = 0; i < n; ++i)
	{
		strcat(len->aa,len->b);//le concatena a las n a's n b's
	}
}

void PegaA (cadenas *sim, int j)//manipula los valores de simbolo
{
	for (int i = 0; i < j; ++i)
	{
		strcat(sim->aa,sim->a);//guarda en aa desde una a hasta i aÂ´s
	}
}

void PegaB (cadenas *sim, int j)
{
	for (int i = 0; i < j; ++i)
	{
		strcat(sim->bb,sim->b);//guarda en bb desde una a hasta i bÂ´s
	}
}
