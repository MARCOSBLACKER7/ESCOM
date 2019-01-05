/*
PROGRAMA:  Convex Hull o  cerco  convexo en  español
AUTOR:     Vázquez Moreno Marcos Oswaldo (C) Noviembre 2017
VERSIÓN:   1.1

DESCRIPCIÓN:  El cerco  convexo  es un  problema que pretende generar puntos aleatorios en  el  plano  xy 
			  y con  utilización del  producto punto cercar el  perimetro con  un  polígono de tal manera 
			  que ningun punto  del plano  quede fuera del polígono,  haciendo  así un  espacio vectorial
			  con  partículas dentro  de él.

*/


#include <bits/stdc++.h>
using namespace std;

const double ERROR = 1e-9;

// Tolerancia en flotantes.
bool Igual(double a, double b) { 
    return fabs(a - b) < ERROR;
}


// Punto en 2D.
struct Punto {
    double x, y;

    Punto() : x(), y() {}
    Punto(double X, double Y) : x(X), y(Y) {}

    // Izquierda a derecha, abajo a arriba.
    bool operator<(const Punto& cmp) const {
        if (!Igual(x, cmp.x)) return x < cmp.x;
        return Igual(y, cmp.y)? false: y < cmp.y;
    }
 
    bool operator==(const Punto& cmp) const {
        return Igual(x, cmp.x) && Igual(y, cmp.y);
    } 
};
//Renombramos a Poligono   
typedef vector<Punto> Poligono;

// Producto cruz entre vectores v y w.
double Cruz(const Punto& v, const Punto& w) {
    return v.x * w.y - v.y * w.x;
}

// Trasladar p tomando como origen al punto o .
Punto Trasladar(const Punto& o, const Punto& p) {
    return Punto(p.x - o.x, p.y - o.y);
}

//Producto cruz entre dos vectores
int ManoDerecha(const Punto& o, const Punto& p, const Punto& q) {
    double ccw = Cruz(Trasladar(o, p), Trasladar(o, q));
    return Igual(ccw, 0)? 0: (ccw < 0)? -1: 1;
}
	
	// Cerco convexo de un conjunto de puntos.
	Poligono CercoConvexo(vector<Punto> P)
	{
	    // Si ya esta ordenado, no usar sort.
	    sort(P.begin(), P.end());
	    Poligono arriba, abajo;
	    
	   		 for (int i = 0; i <= P.size(); ++i) {
	       		 while (arriba.size() > 1)
				{
	            	int p = arriba.size() - 1;
            	// Permitir colineales: <=
            	if (ManoDerecha(arriba[p - 1],
            	// <
                	arriba[p], P[i]) < 0) break;
            	arriba.pop_back();
        	}
        arriba.push_back(P[i]);
    }
    arriba.pop_back();
    for (int i = P.size() - 1; i >= 0; --i) {
        while (abajo.size() > 1) {
            int p = abajo.size() - 1;
            // Permitir colineales: <=
            if (ManoDerecha(abajo[p - 1],
                abajo[p], P[i]) < 0) break;
            abajo.pop_back();
        }
        abajo.push_back(P[i]);
    }
    arriba.insert(arriba.end(),
        abajo.begin(), abajo.end());
    return arriba; // Convex hull.
}

//Main declarado como  función "FuncionPrincipal" para volver a utilizarlo si se desea repetir el  proceso
FuncionPrincipal()
{
		int N ;
	char Y,K;
	ofstream salida("grafico.py"); 
	srand(time(NULL));
	
	printf("Cuantos puntos deseas colocar aleatoriamente?\n");
	cin >> N ;
	fflush(stdin);
	
	vector<Punto> pts(N); 
	
	for(int i = 0; i < N ; i++){
		int x, y ;
		x = rand()%492;
		y = rand()%492;
		pts[i].x = x+10;
		pts[i].y = y+10;
	
	
		}
	salida << "from graphics import *\n";
	salida << "def main():\n";
	salida << "\twin = GraphWin(\"ConvexHull\", 512, 512)\n";
	
	for(int i = 0 ; i < N ; i++){
		salida << "\tc" << i << " = Circle( Point(" << pts[i].x << ',' << pts[i].y << ") , 3 )\n";
		salida << "\tc" << i << ".setFill(\"black\")\n";
		salida << "\tc" << i << ".draw(win)\n";
	}
	salida <<'\n';
	
	Poligono P;
	P = CercoConvexo(pts);
// cambio aquí 	
	for(int i = 0 ; i <= P.size()-1 ; i++){
		salida << "\tl" << i << " = Line(Point("<<P[i].x << ","<< P[i].y << "),Point("<< P[i+1].x << ","<< P[i+1].y << "))\n";
		salida << "\tl" << i << ".setOutline(\"blue\")\n";
		salida << "\tl" << i << ".setWidth(3)\n";
		salida << "\tl" << i << ".draw(win)\n";
	}
	salida << "\tl" << P.size()-1 << " = Line(Point("<< P.back().x << ","<< P.back().y << "),Point("<< P[0].x << ","<< P[0].y << "))\n";
	salida << "\tl" << P.size()-1 << ".setOutline(\"blue\")\n";
	salida << "\tl" << P.size()-1 << ".setWidth(3)\n";
	salida << "\tl" << P.size()-1 << ".draw(win)\n";
		
	salida << "\twin.getMouse() \n";
	salida << "\twin.close()\n";
	salida << "main()\n";
	
	salida.close();
	
	system("python grafico.py");

	
}

int main (){
	char K;
	
	FuncionPrincipal();
	printf("Desea repetir el proceso? (Y/N)\n");
		
			cin >> K;
			if(K == 'y' || K == 'Y'){
				FuncionPrincipal();	
			}
			else{
				exit(0);
			}
			system("pause");
			}
