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

void menu(char cadena[], char cadena1[]); //funcion que despliega el menú de todas las operaciones posibles
void palindromo(char cadena[]); //funcion que te dice si es palindromo la cadena 1 o no
void palindromo1(char cadena1[]);//funcion que te dice si es palindromo la cadena 2 o no
void repetirmenu(char cadena[], char cadena1[]); //funcion que generé para volver a llamar a menú después de un proceso de elección
int longitud(char cadena[]); //función que te dice la longitud de la cadena ingresada
char concatenacion(char cadena[], char cadena1[]); //función que concatena las dos cadenas ingresadas
void potencia(char cadena[], int pot2); //funcion que te da la opción de elegir a que potencia elevar la cadena 1
void potencia1(char cadena1[], int pot2); //funcion que te da la opción de elegir a que potencia elevar la cadena 2
char inverso(char cadena[], char cadena1[]); //función que te regresa la cadena en su inverso
char prefijos(char cadena[]); //función que te genera los prefijos de la cadena 1
char prefijos1(char cadena1[]); //función que te genera los prefijos de la cadena 2
void sufijos(char cadena[]); //función que te genera el sufijo de la cadena 1
void sufijos1(char cadena1[]); //función que te genera el sufijo de la cadena 2
void subcadenas(char cadena[]); //función que te genera la subcadena de la cadena 1
void subcadenas1(char cadena1[]); //función que te genera la subcadena de la cadena 1
main(){ //main del programa
		char  cadena[100], cadena1[100]; //declaracion de las dos variables tipo caracter que serán las principales con las que se harán todas las opciones del switchcase
		printf("BIENVENIDO AL PROGRAMA DE OPERACIONES CON CADENAS\n");	//mensaje de bienvenido
		printf("EL ALFABETO ES DE LA {a-z}\n"); //mensaje de los caracteres que admite la cadena
		printf("inserte cadena 1\n"); //se pide la primer cadena
		gets(cadena); //se recibe la primer cadena
		printf("inserte cadena 2\n"); //se pide la segunda cadena
		gets(cadena1); //se recibe la primer cadena
		menu(cadena, cadena1);  //despliego función menú
}

void menu(char cadena[], char cadena1[]){ //función menú
	int r=0, o, pot1, pot2;  //variables para el switch, elección del menú, potencia 1 y potencia 2
	char v; //variable para repetir o  no el proceso
	do{ //comienzo del do while 
		
		printf("ELIJA EL NUMERO DE LA OPCION DEL PROCESO QUE QUIERE REALIZAR\n");// mensaje
		//desplegado de las opciones a elegir
		printf("  1.- PALINDROMO\n  2.- LONGITUD\n  3.- CONCATENACION\n  4.- POTENCIA\n  5.- INVERSO\n  6.- PREFIJOS\n  7.- SUFIJOS\n  8.- SUBCADENAS\n");
		scanf("%d", &o); //recibe la opciópn elegida
		fflush(stdin); //limpeza de buffer
		switch(o) //empieza el switch dependiendo de lo elegido
		{
			case 1:		 //PALINDROMO
				palindromo (cadena); //llamo a función palidnromo el cual recibe la primer cadena
				palindromo1(cadena1); //llamo a función palidnromo el cual recibe la segunda cadena
				repetirmenu(cadena, cadena1); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo
			break;	//fin del caso 1
		
			case 2:		// LONGITUD
				printf("La longitud de la cadena 1 es: %d \n", longitud(cadena)); //imprime la longitud de la cadena 1 y ahí mismo llamo a la función
				printf("La longitud de la cadena 2 es: %d \n", longitud(cadena1));//imprime la longitud de la cadena 2 y ahí mismo llamo a la función
				repetirmenu(cadena, cadena1); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo
			break;  //fin del caso 2
			
			
			case 3:   	//CONCATENACION
				concatenacion(cadena, cadena1); //llamo a la función concatenacion y recibe a la cadea 1 y 2
				printf("\n"); //salto de linea bien guapo
				repetirmenu(cadena, cadena1); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo
			break;  //fin del caso 3
			
		
			
			case 4:		//POTENCIA
				
				printf("Dame la potencia para la cadena 1\n"); //pido qué potencia quiere para la cadena 1
				scanf("%d", &pot1); //recibe la potencia
				printf("Dame la potencia para la cadena 2\n"); //pido qué potencia quiere para la cadena 2
				scanf("%d", &pot2); //recibe la potencia
				potencia(cadena, pot1);  //lamo a funcion potencia
				potencia1(cadena1, pot2); //llamo a funcion potencia 1
				repetirmenu(cadena, cadena1); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo
				
			break; //fin del caso 4
			
			
				
			case 5:		//INVERSO
			inverso(cadena, cadena1); //funcion que inverte la cadena 1 y 2
			repetirmenu(strrev(cadena), strrev(cadena1)); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo pero inversas por si 
														  //elige primero usar la opcion 4
			break; //fin del caso 5
			
		
			
			case 6:		//PREFIJOS
			prefijos(cadena); //llamo a la funcion prefijo
			prefijos(cadena1); //llamo a la funcion prefijo para la cadena número 2
			repetirmenu(cadena, cadena1); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo
			break;  //fin del caso 6
			
			
				
			case 7:		//SUFIJOS
			sufijos(cadena);  //llamo a la funcion sufijo de la cadena 1
			sufijos(cadena1); //llamo a la funcion sufijo de la cadena 2
			repetirmenu(cadena, cadena1); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo
			
			break;  //fin del caso 7
			
			
			case 8:		//SUBCADENAS
			subcadenas(cadena); //llamo a la funcion subcadenas de la cadena 1
			subcadenas1(cadena1);  //llamo a la funcion subcadenas de la cadena 2
			repetirmenu(cadena, cadena1); //llamo a función repetir el menu y recibe cadena 1 y cadena 2 de nuevo
			break;  //fin del caso 8
		}	
	}while (r=0); //Para que no salga del while
};
	

void repetirmenu(char cadena[], char cadena1[]){ //FUNCION REPETIR EL MENU
			char v; //recibe valor para repetir el proceso
			printf("LE GUSTARIA REPETIR EL PROCESO  (Y/N)\n"); //mensaje
			fflush(stdin); //limpieza del buffer
			scanf("%c", &v); //recibe el valor para repetir el proceso
			if ( v =='y' || v == 'Y') //validacion para ser y o Y la llave
			menu(cadena, cadena1); //si así se desea entrar de nuevo a menú repitiendo así el proceso
			else //sino
			exit(0); //matas al programa
}  //fin de la funcion


void palindromo(char cadena[]){ //FUNCION PARA SABER SI LA CADENA 1 ES PALINDROMO 
	char aux[100]; //variable tipo caracter que sirve como auxiliar de 100 caracteres
		strcpy (aux, cadena); //palabra reservada de la libreria string que copia la cadena
		strrev (aux);     //palabra reservada xde la libreria string que invierte la cadena
			if(strcmp(cadena, aux) == 0) //validación con la palabra reservada de comparación si la invertida es igual a la cadena
				printf("La cadena 1 ingresada es palindromo\n"); //mensaje de es o no es palindromo
			else
				printf("La cadena 1 ingresada no es palindromo\n");
};

void palindromo1(char cadena1[]){ //FUNCION QUE HACE LO MISMO QUE PPALINDROMO PERO ESTA ES PARA LA CADENA 2
	char aux[100];
		strcpy (aux, cadena1); 
		strrev (aux);
			if(strcmp(cadena1, aux) == 0)
				printf("La cadena 2 ingresada es palindromo\n");
			else
				printf("La cadena 2 ingresada no es palindromo\n");
} //fin de la funcion palindromo


int longitud(char cadena[]){ //FUNCION QUE TE DICE LA LONGITUD DE LA CADENA 1
	int lon= strlen (cadena); //palabra reservada de la librería string que cuenta los caracteres dentro de la cadena
	return lon; //valor que regresa en entero
	
} //fin de la funcion longitud


char concatenacion(char cadena[], char cadena1[]){ //FUNCION QUE TE CONCATENA LAS DOS CADENAS INGRESADAS
	char aux1[100], aux2[100], aux3[100]; //variables tipo caracter que servirán como  auxiliares para copiar y pegar las cadenas juntas
	strcpy(aux1, cadena); //se copia la cadena 1
	strcpy(aux2, cadena1); //se copia la cadena 2
	strcpy(aux3, cadena);  //se copia de nuevo la cadena 1 para que la cadena 1 no pierda su valor inicial
	printf ("\nLa concatenacion queda de la siguiente manera = %s\n", strcat (aux3, cadena1));  //se imprime la concatenacion con strcat 
  	printf ("La concatenacion al reves queda de la siguiente manera = %s\n", strcat (aux2, aux1)); //se imprime la concatenacion con strcat invirtiendo el orden
} //fin de la función concatenación


void potencia(char cadena[], int pot1){ //FUNCION QUE TE GENERA LA POTENCIA DE LA CADENA 1
	int i; //variable para ser el contador
	char aux[100]; //mi auxiliar de 100 caracteres
	strcpy(aux, cadena); //copia la cadena en el auxiliar
		if(pot1>0){ //valida se la potencia es mayor a 0
			for(i=0; i< pot1 ;i++) //entra a un ciclo para repetir las veces que indicque pot1
				printf("%s", aux); //imprime cómo queda
				printf("\n"); //salto de línea bien épico
		} //aaah pero sino es así
		else if(pot1<0){ //pot1 es negativo wowowo
			strcpy(aux, strrev(cadena)); //se copia al revés la cadena en el auxiliar
			for(i=0; i> pot1 ;i--) //entra al ciclo hasta que se cumpla pot2
				printf("%s", aux); //los despliega
				printf("\n");  //salto de linea épico again
		}
		else  // si es 0 pues Epsilon
			printf("E");
}


//FUNCION QUE TE DA LA POTENCIA DE LA SEGUNDA CADENA, LO MISMO DE ARRIBA PERO PARA LA CADENA 2
void potencia1(char cadena1[], int pot2){ 
	int i;
	char aux[100];
	strcpy(aux, cadena1);
		if(pot2>0){
			for(i=0; i< pot2 ;i++)
				printf("%s", aux);
				printf("\n");
		}
		else if(pot2<0){
			strcpy(aux, strrev(cadena1));
			for(i=0; i> pot2 ;i--)
				printf("%s", aux);
				printf("\n");
		}
		else
			printf("E");
}

char inverso(char cadena[], char cadena1[]){ //FUNCION QUE TE DA LA CADENA EN INVERSO
    	printf("%s", strrev(cadena)); //impresión de la cadena 1 al revés con strrev de reversa
    	printf("\n"); //bello salto de linea
    	printf("%s", strrev(cadena1)); //impresión de la cadena 2 al revés con strrev de reversa
    	printf("\n"); //bello salto de linea again
}


char prefijos(char cadena[]){ //FUNCION QUE DESPLIEGA PREFIJOS DE LA CADENA 1
	int l = strlen(cadena); //se cuenta los caracteres que hay en la cadena 1
	int i,x; //contadores y barrido de posiciones
	printf("E\n");  //sexy salto de linea y Epsilon que siempre está
	for (i = 0; i < l; i++)  //ciclo para ir contando los caracteres
	{
		for (x = 0; x <= i; x++) //ciclo para ir haciendo el barrido
			printf("%c", cadena[x]); // impresión de los barridos
		printf("\n");	
}
}

//FUNCIÓN QUE DESPLIEGA PREFIJOS DE LA CADENA 2, LO MISMO QUE ARRIBA
char prefijos1(char cadena1[]){
	int l = strlen(cadena1); 
	int i,x;
	printf("E\n"); 
	for (i = 0; i < l; i++) 
	{
		for (x = 0; x <= i; x++) 
			printf("%c", cadena1[x]);
		printf("\n");	
}
}


void sufijos(char cadena[]){ //Operación que calcula los sufijos de una cadena, recibe la cadena en cuestión{
	int l = strlen(cadena); //Se declara una variable y se iguala a la longitud de la cadena, se ocupará posteriormente para hacer el conteo de sufijos
	int i = l; //Variable contadora, en el caso de los sufijos, se recorrerá de atrás hacia adelante la cadena, por lo que se inicializa en la long. de la cadena
	int x;
	printf("E"); //Como primera instancia se imprime Epsilon (servirá haya o no una cadena posterior)
	for (i = l; i >= 0; i--) //El ciclo se detendrá al llegar al primer valor de la cadena
	{
		for (x = i; x < l; x++) //Este ciclo indica las posiciones que deben irse imprimiendo de acuerdo a la cadena y al ciclo anterior
			printf("%c", cadena[x]);
		printf("\n");
	}
}


void sufijos1(char cadena1[]){  //Operación que calcula los sufijos de una cadena, recibe la cadena en cuestión{
	int l = strlen(cadena1); //Se declara una variable y se iguala a la longitud de la cadena, se ocupará posteriormente para hacer el conteo de sufijos
	int i = l; //Variable contadora, en el caso de los sufijos, se recorrerá de atrás hacia adelante la cadena, por lo que se inicializa en la long. de la cadena
	int x;
	printf("E"); //Como primera instancia se imprime Epsilon (servirá haya o no una cadena posterior)
	for (i = l; i >= 0; i--) //El ciclo se detendrá al llegar al primer valor de la cadena
	{
		for (x = i; x < l; x++) //Este ciclo indica las posiciones que deben irse imprimiendo de acuerdo a la cadena y al ciclo anterior
			printf("%c", cadena1[x]);
		printf("\n");
	}

	
	
}


void subcadenas(char cadena[]) //FUNCIÓN PARA DESPLEGAR SUBCADENAS
{
	int l = strlen (cadena);
	int lim = 1; //Cantidad de caracteres que irá tomando por caso
	int li = 1; //Variable auxiliar para saber el número de posición que debe imprimirse 
	int i, x, y; //Variables de apoyo
	i = x = y = 0;
	while(y < l) //El ciclo termina cuando se alcance la longitud de la cadena
	{
		while(x < l && i <= l) //Ciclo que indica el número de caracteres que deben imprimirse según sea el caso 
		{
			if(i == (l - (lim - 1))) //Si la cadena no tiene caracteres la funcion termina
				break;

			for(i; i < li; i++) //Ciclo que indica las posiciones que deben irse imprimiendo 
				printf("%c", cadena[i]); 

			printf("\n");
			i -= lim - 1;
			li ++;
			x++;
		}
		li = ++lim;
		x = i = 0;
		y++;
		printf("\n");
	}
}



void subcadenas1(char cadena1[])
{
	int l = strlen (cadena1);
	int lim = 1; //Cantidad de caracteres que irá tomando por caso
	int li = 1; //Variable auxiliar para saber el número de posición que debe imprimirse 
	int i, x, y; //Variables de apoyo
	i = x = y = 0;
	while(y < l) //El ciclo termina cuando se alcance la longitud de la cadena
	{
		while(x < l && i <= l) //Ciclo que indica el número de caracteres que deben imprimirse según sea el caso 
		{
			if(i == (l - (lim - 1))) //Si la cadena no tiene caracteres la funcion termina
				break;

			for(i; i < li; i++) //Ciclo que indica las posiciones que deben irse imprimiendo 
				printf("%c", cadena1[i]);

			printf("\n");
			i -= lim - 1;
			li ++;
			x++;
		}
		li = ++lim;
		x = i = 0;
		y++;
		printf("\n");
	}
}

