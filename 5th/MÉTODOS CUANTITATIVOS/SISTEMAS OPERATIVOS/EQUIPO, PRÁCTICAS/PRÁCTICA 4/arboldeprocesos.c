#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

typedef struct nodo
{
	int contador;
	struct nodo** hijos;
}nodo;


nodo* nuevoNodo()
{
	nodo *tmp  = calloc(1,sizeof(nodo*));
	tmp->hijos = calloc(50, sizeof(nodo*));
	return tmp;
}

void imprimeespacio(int n)
{
	for (int i=0; i<n ;++i) printf(".");
}

void arboldeProcesos(nodo* pos, int nivel)
{
	if(!pos) return;
	if(nivel == 0) printf("main: %d\n", getpid());
	int id_proc;
		for(int i = 0; i < pos->contador; ++i)
		{
			id_proc =fork();
			if(id_proc == 0)  //The child is on the recursion
			{
				imprimeespacio(nivel + 1);
				printf("inicio proceso hijo %d\n", getpid());
				arboldeProcesos(pos-> hijos[i], nivel + 1);
				exit(0);
			}
			else //Father is in the same level
			{
				imprimeespacio(nivel);
				printf("creando proceso hijo %d desde %d\n", id_proc, getpid());				
			}
		}
		for(int i=0; i< pos-> contador; ++i)
		{
			int id = wait(0);
			imprimeespacio(nivel+1);
			printf("fin proceso hijo %d\n", id);
		}
}

int main()
{
	nodo* raiz =nuevoNodo();
	raiz->contador = 1;
	raiz->hijos[0] = nuevoNodo();
	raiz->hijos[0]->contador = 10;
	nodo** principal = raiz->hijos[0]->hijos;
		for(int i= 0; i < 10; ++i)
		{
			principal[i] = nuevoNodo();
			int abajo = i < 5 ? (5 - i) : (i - 4);
			nodo* pos = principal[i];
				for (int j = 0; j < abajo; ++j)
				{
					pos->contador = 1;
					pos->hijos[0] = nuevoNodo();
					pos = pos->hijos[0];
				}
				pos-> contador = abajo;
				for(int j = 0; j < abajo; ++j)
				{
					pos ->hijos[j] = nuevoNodo();
				}
		}
	arboldeProcesos(raiz, 0);
	return 0;
}
