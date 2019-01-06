#include <stdio.h>
#include <stdlib.h>
#include "Lista.h"
#include <string.h>

//Inicializar lista
void Initialize(lista *l)
{
	l->frente = NULL;
	l -> final = NULL;
	l->tam = 0;
	return;
}

//Libera completamente una lista
void Destroy(lista *l)
{
	posicion aux,aux_siguiente;;
	aux=l->frente;
	//Destruir los nodos
	while(aux!=NULL)
	{
		aux_siguiente=aux->atras;
		free(aux);
		aux=aux_siguiente;
	}
	//Inicializar la lista
	Initialize(l);
}

//Recibe una lista L y regresa la posición del final
posicion Final(lista *l)
{
	return l->final;
}

//Recibe una lista L y regresa la posición del frente
posicion First(lista *l)
{
	return l->frente;
}

//Recibe una lista L, una posición P y devuelve la posición de la restriccion siguiente de P
posicion Following(lista *l, posicion p)
{
	if(ValidatePosition(l,p))
	{
		return p->atras;
	}
	else
	{
		printf("\nERROR (Following): Posicion no valida o  lista vacia");		
		exit(1);
	}	
}

//Recibe una lista L, una posición P y devuelve la posición de la restriccion anterior de P
posicion Previus(lista *l, posicion p)
{
	
	if(ValidatePosition(l,p))
	{
		return p->adelante;
	}
	else
	{
		printf("ERROR (Previus): Posicion no valida o  lista vacia");		
		exit(1);
	}
}

//Recibe una lista L y un restriccion r, regresa la posición que coincida exactamente con la restriccion e.
posicion Search(lista *l, restriccion r)
{
	posicion p=NULL,aux;
	
	if (l->tam>0)
	{
		aux=l->frente;
		while (aux!=NULL&&p==NULL)
		{
			if(memcmp(&r,&aux->r,sizeof(restriccion))==0)
			{
				p=aux;
			}
			else 
			{
				aux=aux->atras;
			}
		}
	}
	return p;
}

//Recibe una lista L, una posición P y devuelve la restriccion en dicha posición.
restriccion Position(lista *l, posicion p)
{
	if(ValidatePosition(l,p))
	{
		return p->r;
	}
	else
	{
		printf("ERROR: Position(La poscion es invalida)");
		exit(1);
	}
}

//Recibe una lista L, una posición P y devuelve TRUE si la posición es valida.
boolean ValidatePosition(lista *l, posicion p)
{
	boolean b = FALSE;
	posicion aux;
	aux = l->frente;
	while (aux!=NULL && b!=TRUE)
	{
		if (aux==p)
			b = TRUE;
		
		aux = aux->atras;
	}
	return b;
}

//Recibe una lista, un índice y devuelve la restriccion que se encuentra en ese índice partiendo del frente
restriccion Element(lista *l, int n)
{
	restriccion r;
	nodo *aux;
	int i;
	//Si el restriccion solicitado esta entre 1 y el tamaño de la lista
	if (n>0&&n<=Size(l))
	{
		//Obtener el restriccion en la posición n
		aux=l->frente;
		for(i=1;i<n;i++)
			aux=aux->atras;
		r=aux->r;
	}
	else
	{
		printf("\nERROR (Element): Se intenta acceder a restriccion %d inexistente",n);
		exit(1);		
	}
	return r;	
}

//Recibe una lista y un índice y devuelve la posicion de la restriccion que se encuentra en ese índice partiendo del frente
posicion ElementPosition(lista *l, int n)
{
	posicion aux=NULL;
	int i;
	//Si el restriccion solicitado esta entre 1 y el tamaño de la lista
	if (n>0&&n<=Size(l))
	{
		//Obtener el restriccion en la posición n
		aux=l->frente;
		for(i=1;i<n;i++)
			aux=aux->atras;
	}
	return aux;		
}

//Recibe una lista y devuelve el número de restriccion que se encuentran en esta.
int Size(lista *l)
{
	return l->tam;
}

boolean Empty(lista *l)
{
	return (l->tam == 0) ? TRUE : FALSE;	
}

//Inserta una nueva restricción antes de la posición p si b es TRUE y después de p si es FALSE
void Insert(lista *l, restriccion r, posicion p,boolean b)
{
	posicion aux;
	aux = malloc(sizeof(nodo));
		if (aux==NULL)
		{
			printf("ERROR (Insert): No se pudo crear un nuevo nodo");
			exit(1);
		}
		aux->r = r;
	
	//Si la posición es invalida se inserta el nodo al frente de la lista 
	if (!ValidatePosition (l,p))
	{
		aux->atras=l->frente;
		aux->adelante=NULL;
		l->frente=aux;
		if (l->tam==0) //Si no habia restricciones en la lista 
			l->final=aux; //La restriccion nuevo es unica y el final de la lista apuntará también a ella
		else
			aux->atras->adelante = aux;
	}
	else
	{
		//Si el parametro b es TRUE, se agrega el nodo antes de p
		if (b==TRUE)
		{
			aux->atras = p;
			aux->adelante = p->adelante;
			p->adelante = aux;
			if (p==l->frente) //Si p era el frente de la lista
				l->frente = aux; //aux es el nuevo frente
			else
				aux->adelante->atras = aux; //Reconectar el nodo de adelante de aux con el
		}
		//Si el parametro b es FALSO, se agrega el nodo despues de p
		else
		{
			aux->adelante = p;
			aux->atras = p->atras;
			p->atras = aux;
			if (p==l->final) //Si p era el restriccion del final de la lista
				l->final = aux; //aux es el nuevo final
			else
				aux->atras->adelante = aux; //Reconectar el nodo de atras de aux con el
		}
	}
	//Incrementar el tamaño de la lista
	l->tam++;
}


void Add(lista *l,restriccion r)
{
	posicion aux;
	aux = malloc(sizeof(nodo));
	if (aux==NULL)
	{
		printf("ERROR (Add): No se pudo crear un nuevo nodo");
		exit(1);
	}
	
	aux->r=r;	
	aux->atras=NULL;
	aux->adelante=l->final;
	l->final=aux;
	if (l->tam==0)
		l->frente=aux;
	else
		l->final->adelante->atras=l->final;
	l->tam++;	
}

//Elimina la restricción en la posición p
void Remove(lista *l,posicion p)
{	
	if(ValidatePosition(l,p))
	{
		posicion adelante_p, atras_p;
		adelante_p=p->adelante;
		atras_p=p->atras;
		free(p);
		
		//Si se no remueve el restriccion del frente
		if(adelante_p!=NULL)
			adelante_p->atras=atras_p; //El restriccion del frente del removido en su parte de atras apuntará a el que estaba atras de p
		else
			l->frente=atras_p; //Si se removio el del frente de la lista entonces este cambia
			
		
		//Si se no remueve el restriccion del final
		if(atras_p!=NULL)
			atras_p->adelante=adelante_p;//El restriccion de atras del removido en su parte de adelante apuntará al que estaba delante de p
		else
			l->final=adelante_p; //Si se removio el del final de la lista entonces este cambia
		
		//Restar en uno el tamaño de la lista
		l->tam--;
	}
	else
	{
		printf("ERROR (Remove): La poscion es invalida");
		exit(1);
	}	
}

//Cambia la restricción de la posición p por la restricción r
void Replace(lista *l,posicion p, restriccion r)
{
	if(ValidatePosition(l,p))
	{
		p->r=r;
	}
	else
	{
		printf("ERROR (Replace): La poscion es invalida");
		exit(1);
	}		
}