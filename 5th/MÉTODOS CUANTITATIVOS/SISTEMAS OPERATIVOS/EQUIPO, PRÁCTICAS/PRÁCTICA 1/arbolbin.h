#ifndef ArbolBin_H
#define ArbolBin_H

#include <stdlib.h>
#include <string.h>
#define TRUE 1
#define FALSE 0

typedef unsigned char boolean;
typedef unsigned char Char;

typedef struct{
	Char c;
} elemento;

typedef struct nodo{
	struct nodo * izq;
	struct nodo * der;
	elemento e;
} nodo;

typedef struct{
	nodo * raiz;
} arbol_bin;

typedef nodo* posicion;

//Operaciones de construcción
void Initialize(arbol_bin *A);
posicion NewNode(elemento e);
void Destroy(arbol_bin *A);

//Operaciones de posicionamiento y búsqueda
posicion Root(arbol_bin *A);
posicion Parent(arbol_bin *A, posicion p);
posicion LeftSon(arbol_bin *A, posicion p);
posicion RightSon(arbol_bin *A, posicion p);
posicion Search(arbol_bin *A, elemento e);

//Operaciones de consulta
boolean IsEmpty(arbol_bin *A);
boolean NullNode(arbol_bin *A, posicion p);
elemento ReadNode(arbol_bin *A, posicion p);
boolean IsLeaf(posicion p);

//Operaciones de modificación
void NewLeftSon(arbol_bin *A, posicion p, elemento e);
void NewRightSon(arbol_bin *A, posicion p, elemento e);
void DeleteLeftSon(arbol_bin *A, posicion p);
void DeleteRightSon(arbol_bin *A, posicion p);
void DeleteNode(arbol_bin *A, posicion p);
void ReplaceNode(arbol_bin *A, posicion p, elemento e);
arbol_bin * MergeTrees(arbol_bin *A, arbol_bin *B);

#endif