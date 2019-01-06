#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <windows.h>
#include <math.h>
#include <time.h>
#define LIM_X 90
#define LIM_Y 21

void gotoxy(int x, int y);
char * binarioDecimal (int x);
int decimalBinario (char * x);
void encerrarNumeros (char * num1, char * num2);
char * suma (char * num1, char * num2);
void animacion (char * num1, char * num2, int x1, int x2, int xR, char * resultado);



int main(int argc, char const *argv[])
{
	system("cls");
	char * num1 = (char *)malloc (sizeof (char));
	char * num2 = (char *)malloc (sizeof (char));
	gotoxy(32,2);
	printf("SUMA DE 2 NUMEROS BINARIOS\n\n\n\n");
	printf("Ingresa el primer numero:\t");
	scanf("%s",num1);
	printf("Ingresa el segundo numero:\t");
	scanf("%s",num2);
	encerrarNumeros(num1, num2);
	gotoxy (5,19);
	return 0;
}

void gotoxy(int x, int y)
{  
      HANDLE hcon;  
      hcon = GetStdHandle(STD_OUTPUT_HANDLE);  
      COORD dwPos;  
      dwPos.X = x;  
      dwPos.Y= y;  
      SetConsoleCursorPosition(hcon,dwPos);
}

void encerrarNumeros (char * num1, char * num2)
{
	system("cls");
	char * res = (char *)malloc (sizeof (char));
	int longitudPalabra1, numGuiones1, x1, i;
	int longitudPalabra2, numGuiones2, x2;
	int longitudResultado, numGuionesRes, xR;
	longitudPalabra1 = strlen(num1);					//Obtenemos la longitud de la cadena
	longitudPalabra2 = strlen(num2);					//Obtenemos la longitud de la cadena 2
	numGuiones1 = (longitudPalabra1 * 2) + 1;			//Calculamos los guiones para simular la cinta
	numGuiones2 = (longitudPalabra2 * 2) + 1;			//Calculamos los guiones para simular la cinta 2
	x1 = (LIM_X - (longitudPalabra1 * 2)) / 2;			//Centramos la cadena
	x2 = (LIM_X - (longitudPalabra2 * 2)) / 2;			//Centramos la cadena 2
	if (longitudPalabra2 > longitudPalabra1)
	{
		x2 -= (longitudPalabra2 - longitudPalabra1);		//Alineamos con la cadena 1
		longitudResultado = (longitudPalabra2 + 1);
		numGuionesRes = (longitudResultado * 2) + 1;
		xR = (LIM_X - (longitudResultado * 2))/2;
		xR -= (longitudResultado - longitudPalabra1);
	}
	else
	{
		x1 -= (longitudPalabra1 - longitudPalabra2);
		longitudResultado = (longitudPalabra1 + 1);
		numGuionesRes = (longitudResultado * 2) + 1;
		xR = (LIM_X - (longitudResultado * 2))/2;
		xR -= (longitudResultado - longitudPalabra2);
	}
	//ENCERRAMOS EL PRIMER NÚMERO
	gotoxy(x1,5);
	for (i = 0; i < numGuiones1; i ++)
	{
		printf("_");
	}
	gotoxy(x1,6);
	for (i = 0; i < longitudPalabra1; i ++)
	{
		printf("|%c", num1[i]);
	}
	printf("|");
	gotoxy(x1,7);
	for (i = 0; i < numGuiones1; i ++)
	{
		printf("%c",238);
	}
	//ENCERRAMOS EL SEGUNDO NÚMERO
	gotoxy(x2,10);
	for (i = 0; i < numGuiones2; i ++)
	{
		printf("_");
	}
	gotoxy(x2,11);
	for (i = 0; i < longitudPalabra2; i ++)
	{
		printf("|%c", num2[i]);
	}
	printf("|");
	gotoxy(x2,12);
	for (i = 0; i < numGuiones2; i ++)
	{
		printf("%c",238);
	}
	//ENCERRAMOS EL RESULTADO
	gotoxy (xR, 15);
	for (i = 0; i < numGuionesRes; i ++)
	{
		printf("_");
	}
	gotoxy(xR,16);
	for (i = 0; i < longitudResultado; i ++)
	{
		printf("| ");
	}
	printf("|");
	gotoxy(xR,17);
	for (i = 0; i < numGuionesRes; i ++)
	{
		printf("%c",238);
	}
	//res = suma (num1, num2);
	int numero1 = decimalBinario (num1);
	int numero2 = decimalBinario (num2);
	int result = numero1 + numero2;
	res = binarioDecimal (result);
	animacion(num1, num2, x1, x2, xR, res);
}

char * suma (char * num1, char * num2)
{
	int acarreo = 0, i = 0;
	char * resultado = (char *)malloc (sizeof (char));
	char * pt1 = num1;
	char * pt2 = num2;
	for (; *pt1 != '\0'; pt1 ++);
	for (; *pt2 != '\0'; pt2 ++);
	if (strlen (num1) > strlen (num2))					//El número 1 es más grande
	{
		pt2--;
		for (pt1 --; pt1 >= num1; pt1 --)
		{
			if (pt2 >= num2)
			{
				if ((*pt1 == '0' && *pt2 == '1') || (*pt1 == '1' && *pt2 == '0'))
				{
					if (acarreo == 0)							//Si no existe acarreo
					{
						resultado [i++] = '1';
						acarreo = 0;
					}else										//Si existe acarreo
					{
						resultado [i++] = '0';
						acarreo = 1;
					}
				}else if (*pt1 == '0' && *pt2 == '0')
				{
					if (acarreo == 0)							//Si no existe acarreo
						resultado [i++] = '0';
					else										//Si existe acarreo
						resultado [i++] = '1';
					acarreo = 0;
				}else if (*pt1 == '1' && *pt2 == '1')
				{
					if (acarreo == 0)							//Si no existe acarreo
					{
						resultado [i++] = '0';
						acarreo = 1;
					}
					else										//Si existe acarreo
					{
						resultado [i++] = '1';
						acarreo = 0;
					}
				}else
				{
					printf("No es un numero binario.\n");
					exit(0);
				}
			}else
			{
				if (acarreo == 0)
				{
					resultado [i++] = *pt1;
					acarreo = 0;
				}
				else
				{
					if (*pt1 == '1')
					{
						resultado [i ++] = '0';
						acarreo = 1;
					}else if (*pt1 == '0')
					{
						resultado [i ++] = '1';
						acarreo = 0;
					}else
					{
						printf("No es un numero binario.\n");
						exit(0);
					}
				}
			}
			pt2 --;
		}
	}else
	{
		pt1 --;
		for (pt2 --; pt2 >= num2; pt2 --)
		{
			if (pt1 >= num1)
			{
				if ((*pt1 == '0' && *pt2 == '1') || (*pt1 == '1' && *pt2 == '0'))
				{
					if (acarreo == 0)							//Si no existe acarreo
					{
						resultado [i++] = '1';
						acarreo = 0;
					}else										//Si existe acarreo
					{
						resultado [i++] = '0';
						acarreo = 1;
					}
				}else if (*pt1 == '0' && *pt2 == '0')
				{
					if (acarreo == 0)							//Si no existe acarreo
						resultado [i++] = '0';
					else										//Si existe acarreo
						resultado [i++] = '1';
					acarreo = 0;
				}else if (*pt1 == '1' && *pt2 == '1')
				{
					if (acarreo == 0)							//Si no existe acarreo
					{
						resultado [i++] = '0';
						acarreo = 1;
					}
					else										//Si existe acarreo
					{
						resultado [i++] = '1';
						acarreo = 0;
					}
				}else
				{
					printf("No es un numero binario.\n");
					exit(0);
				}
			}else
			{
				if (acarreo == 0)
				{
					resultado [i++] = *pt2;
					acarreo = 0;
				}
				else
				{
					if (*pt2 == '1')
					{
						resultado [i ++] = '0';
						acarreo = 1;
					}else if (*pt2 == '0')
					{
						resultado [i ++] = '1';
						acarreo = 0;
					}else
					{
						printf("No es un numero binario.\n");
						exit(0);
					}
				}
			}
			pt1 --;
		}
	}
	if (acarreo == 1)
	{
		resultado [i ++] = '1';
	}
	resultado [i] = '\0';
	return resultado;
}

void animacion (char * num1, char * num2, int x1, int x2, int xR, char * resultado)
{
	int j1 = (x1 + (strlen(num1) * 2) - 1);
	int j2 = (x2 + (strlen (num2) * 2) - 1);
	int j3 = (xR + (strlen(resultado) * 2) - 1);
	char * pt1 = num1;
	char * pt2 = num2;
	char * pt3 = resultado;
	int i = 0;
	for (; *pt1 != '\0'; pt1 ++);
	for (; *pt2 != '\0'; pt2 ++);
	if (strlen (num1) > strlen (num2))
	{
		for (pt1 --; pt1 >= num1; pt1 --)
		{
			gotoxy (j1, 8);
			printf ("%c", 140);
			if (pt2 > num2)
			{
				gotoxy (j2, 13);
				printf ("%c", 140);
			}
			gotoxy (j3, 18);
			printf("%c\n", 140);
			Sleep (700);
			gotoxy (j1, 8);
			printf (" ");
			if (pt2 > num2)
			{
				gotoxy (j2, 13);
				printf (" ");
			}
			gotoxy(j3, 18);
			printf(" ");
			gotoxy (j3, 16);
			printf("%c\n", *pt3);
			gotoxy (j1, 6);
			printf ("#");
			if (pt2 > num2)
			{
				gotoxy (j2, 11);
				printf("#");
			}
			j1--;j1--;j2--;j2--;pt2--;j3--;j3--;pt3++;
		}
		if (*pt3 != '\0')
		{
			gotoxy (j3, 18);
			printf("%c\n", 140);
			Sleep (700);
			gotoxy (j3, 18);
			printf(" ");
			gotoxy (j3, 16);
			printf("%c", *pt3);
		}
	}else
	{
		for (pt2 --; pt2 >= num2; pt2 --)
		{
			gotoxy (j2, 13);
			printf ("%c", 140);
			if (pt1 > num1)
			{
				gotoxy (j1, 8);
				printf ("%c", 140);
			}
			gotoxy (j3, 18);
			printf("%c", 140);
			Sleep (700);
			gotoxy (j2, 13);
			printf (" ");
			if (pt1 > num1)
			{
				gotoxy (j1, 8);
				printf (" ");
			}
			gotoxy (j3, 18);
			printf(" ");
			gotoxy (j3, 16);
			printf("%c", *pt3);
			gotoxy (j2, 11);
			printf ("#");
			if (pt1 > num1)
			{
				gotoxy (j1, 6);
				printf("#");
			}		
			j1--;j1--;j2--;j2--;pt1--;j3--;j3--;pt3++;
		}
		if (*pt3 != '\0')
		{
			gotoxy (j3, 18);
			printf("%c\n", 140);
			Sleep (700);
			gotoxy (j3, 18);
			printf(" ");
			gotoxy (j3, 16);
			printf("%c", *pt3);
		}
	}
}

char * binarioDecimal (int x)
{
	char * c = (char *) malloc (sizeof (char));
	int i = 0;
	while (x >= 1)
	{
		if (x % 2 == 1)
		{
			c [i++] = '1';
			x /= 2;
		}else
		{
			c [i++] = '0';
			x /= 2;
		}
	}
	c [i] = '\0';
	return c;
}

int decimalBinario (char * x)
{
	int numeroDecimal = 0;
	int flag = 0;
	char *pt = x, *ptr = x;
	for (; *pt != '\0'; pt++); pt--;								//Mandamos un apuntador al final de la cadena, o a la posicion 2^0
	for (; pt >= ptr; pt--)
	{
		if (*pt == '1')
		{
			numeroDecimal += pow (2, flag);							//Si encuentra un 1, sumamos a la variable 2^flag
		}
		if (*pt != '0' && *pt != '1')
		{
			printf("No es un numero binario.\n");
			exit(0);
		}
		flag++;														//Cada que se mueva a la izquierda, sumamos la potencia del 2
	}
	return numeroDecimal;
}
