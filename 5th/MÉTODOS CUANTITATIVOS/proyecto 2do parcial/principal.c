#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "PL.h"

int main(int argc, char const *argv[])
{
	Limites * lim;
	integrante ** poblacion;
	char i;																		//Auxiliar utilizado como contador
	Z funcion_objetivo;															//Estructura para almacenar la F.O
	lista restricciones;														//Lista para almacenar las restricciones
	Condiciones_AG geneticos;													//EStructura para almacenar algunas condiciones del problema
	Initialize (&restricciones);												//Inicializamos la lista de restricciones
	system (clear);
	geneticos = obtener_condiciones_iniciales ();								//Se pide tiempo e iteraciones máximas, bits de precisión e integrantes
	funcion_objetivo = obtener_funcion_objetivo ();								//Obtener la función objetivo del problema
	restricciones = obtener_restricciones ();									//Obtener las restricciones del problema
	lim = obtener_limites_variables(&restricciones, funcion_objetivo);
	poblacion = obtener_primera_poblacion (funcion_objetivo, lim, geneticos, &restricciones);
	//solve (poblacion, funcion_objetivo, geneticos, lim, &restricciones);
	int j,n;
	char * fuerte1 = (char *) malloc (sizeof (char));
	double tiempo_inicial, tiempo_final;
	tomar_tiempo (&tiempo_inicial);
	//srand (time (NULL));
	for (j = 0; j < geneticos.it_max; j ++)
	{
		srand (time (NULL));
		FireFly (poblacion, funcion_objetivo, geneticos, (j + 1));
		poblacion = generar_nueva_poblacion (poblacion, funcion_objetivo, geneticos, lim, &restricciones);
		tomar_tiempo (&tiempo_final);
		if ((tiempo_final - tiempo_inicial) >= (geneticos.tiempo_maximo * 60))
		{
			printf ("\n\n\n\n\n\tCRITERIO DE FINALIZACIÓN: TIEMPO MÁXIMO ALCANZADO\n\n\n\n");
			exit (0);
		}
	}
	printf ("\n\n\n\n\n\tCRITERIO DE FINALIZACIÓN: ITERACIONES MÁXIMAS ALCANZADAS\n\n\n\n");
	return 0;
}