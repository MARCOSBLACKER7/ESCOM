#include "ArbolBin.h"
#include <stdio.h>
//Operaciones de construcción
void Initialize(arbol_bin *A){
	A->raiz = NULL;
	return;
}

posicion NewNode(elemento e){
	posicion r = calloc(1, sizeof(nodo));
	r->e = e;
	return r;
}

void DestroyNode(posicion p){
	if(p != NULL){
		DestroyNode(p->izq);
		DestroyNode(p->der);
		free(p);
	}
	return;
}

void Destroy(arbol_bin *A){
	DestroyNode(A->raiz);
	return;
}

//Operaciones de posicionamiento y búsqueda
posicion Root(arbol_bin *A){
	return A->raiz;
}

posicion ParentNode(posicion current, posicion p){
	posicion r = NULL;
	if(current->izq == p || current->der == p)
		return current;
	if(current->izq != NULL)
		r = ParentNode(current->izq, p);
	if(r == NULL && current->der != NULL)
		r = ParentNode(current->der, p);
	return r;
}

posicion Parent(arbol_bin *A, posicion p){
	if(A->raiz != p)
		return NULL;
	return ParentNode(A->raiz, p);
}

posicion LeftSon(arbol_bin *A, posicion p){
	posicion r = NULL;
	if(!NullNode(A, p))
		r = p->izq;
	return r;
}

posicion RightSon(arbol_bin *A, posicion p){
	posicion r = NULL;
	if(!NullNode(A, p))
		r = p->der;
	return r;
}

posicion SearchNode(posicion current, elemento e){
	posicion r = NULL;
	if(memcmp(&current->e, &e, sizeof(elemento)) != 0)
		return current;
	if(current->izq != NULL)
		r = SearchNode(current->izq, e);
	if(r == NULL && current->der != NULL)
		r = SearchNode(current->der, e);
	return r;
}

posicion Search(arbol_bin *A, elemento e){
	if(IsEmpty(A))
		return NULL;
	return SearchNode(A->raiz, e);
}

//Operaciones de consulta
boolean IsEmpty(arbol_bin *A){
	return A->raiz == NULL;
}

boolean NullNodeFromNode(posicion current, posicion p){
	boolean r = TRUE;
	if(current == p)
		return FALSE;
	if(current->izq != NULL)
		r = NullNodeFromNode(current->izq, p);
	if(r == TRUE && current->der != NULL)
		r = NullNodeFromNode(current->der, p);
	return r;
}

boolean NullNode(arbol_bin *A, posicion p){
	if(IsEmpty(A))
		return TRUE;
	return NullNodeFromNode(A->raiz, p);
}

elemento ReadNode(arbol_bin *A, posicion p){
	elemento e;
	if(!NullNode(A, p))
		e = p->e;
	return e;
}

boolean IsLeaf(posicion p){
	return p->izq == NULL && p->der == NULL;
}

//Operaciones de modificación
void NewLeftSon(arbol_bin *A, posicion p, elemento e){
	if(IsEmpty(A)){
		A->raiz = malloc(sizeof(nodo));
		A->raiz->izq = A->raiz->der = NULL;
		A->raiz->e = e;
	}else if(!NullNode(A, p) && p->izq == NULL){
		p->izq = malloc(sizeof(nodo));
		p->izq->izq = p->izq->der = NULL;
		p->izq->e = e;
	}
	return;
}

void NewRightSon(arbol_bin *A, posicion p, elemento e){
	if(IsEmpty(A)){
		A->raiz = malloc(sizeof(nodo));
		A->raiz->izq = A->raiz->der = NULL;
		A->raiz->e = e;
	}else if(!NullNode(A, p) && p->der == NULL){
		p->der = malloc(sizeof(nodo));
		p->der->izq = p->der->der = NULL;
		p->der->e = e;
	}
	return;
}

void DeleteLeftSon(arbol_bin *A, posicion p){
	if(!NullNode(A, p))
		DestroyNode(p->izq);
	return;
}

void DeleteRightSon(arbol_bin *A, posicion p){
	if(!NullNode(A, p))
		DestroyNode(p->der);
	return;
}

void DeleteNode(arbol_bin *A, posicion p){
	if(!NullNode(A, p))
		DestroyNode(p);
	return;
}

void ReplaceNode(arbol_bin *A, posicion p, elemento e){
	if(!NullNode(A, p))
		p->e = e;
	return;
}

arbol_bin * MergeTrees(arbol_bin *A, arbol_bin *B){
	arbol_bin * C = malloc(sizeof(arbol_bin));
	Initialize(C);
	C->raiz = malloc(sizeof(nodo));
	C->raiz->izq = A->raiz;
	C->raiz->der = B->raiz;
	return C;
}