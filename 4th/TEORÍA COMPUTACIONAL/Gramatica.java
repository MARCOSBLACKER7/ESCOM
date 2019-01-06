package com.danyalvarez.limpiadordegramaticas;


public class Gramatica {
    private Alfabeto N;
    private Alfabeto T;
    private ConjuntoProducciones P;
    private char S;

    public Gramatica() {
        N = new Alfabeto(1);
        T = new Alfabeto(2);
        P = new ConjuntoProducciones();
        S = 'S';
    }

    public void limpiar() {
        eliminarProduccionesRenombradoras();
        eliminarNoTerminalesInutiles();
        eliminarNoTerminalesInaccesibles();
    }

    public void eliminarNoTerminalesInutiles() {
        Alfabeto[] Si = new Alfabeto[99];
        Alfabeto[] UTIL = new Alfabeto[99];
        for (int i = 0; i < 99; i++) {
            Si[i] = new Alfabeto(3);
            UTIL[i] = new Alfabeto(1);
        }
        Si[0] = T;
        int u = 0;
        for (int i = 1; true; i++) {
            Alfabeto aux = new Alfabeto(1);
            for (int j = 0; j < P.nroElems(); j++) {
                if (P.getElemento(j).contiene(Si[i - 1]))
                    aux.adicionar(P.getElemento(j).getA());

            }
            UTIL[i] = UTIL[i - 1].union(aux);
            Si[i] = Si[i - 1].union(UTIL[i]);
            if (UTIL[i].esIgual(UTIL[i - 1])) {
                u = i;
                break;
            }
        }
        Alfabeto INUTIL = new Alfabeto(1);
        for (int i = 0; i < N.nroElems(); i++) {
            boolean sw = false;
            for (int j = 0; j < UTIL[u].nroElems(); j++)
                if (N.getElemento(i) == UTIL[u].getElemento(j))
                    sw = true;
            if (!sw)
                INUTIL.adicionar(N.getElemento(i));
        }

        if (INUTIL.nroElems() == 0)
            return;

        Gramatica GX = new Gramatica();

        for (int j = 0; j < P.nroElems(); j++) {
            int c = 0;
            for (int i = 0; i < INUTIL.nroElems(); i++)
                if (!P.getElemento(j).tiene(INUTIL.getElemento(i)))
                    c++;
            if (c == INUTIL.nroElems())
                GX.adicionarProduccion(P.getElemento(j));
        }

        N = GX.N;
        T = GX.T;
        P = GX.P;
    }

    public void eliminarNoTerminalesInaccesibles() {
        Alfabeto[] C = new Alfabeto[99];
        for (int i = 0; i < 99; i++)
            C[i] = new Alfabeto(1);

        C[0].adicionar(S);
        int u = 0;
        for (int i = 1; true; i++) {
            Alfabeto aux = new Alfabeto(1);

            for (int j = 0; j < C[i - 1].nroElems(); j++) {
                for (int k = 0; k < P.nroElems(); k++) {
                    for (int l = 0; l < N.nroElems(); l++) {
                        char Y = N.getElemento(l);
                        if (C[i - 1].getElemento(j) == P.getElemento(k).getA() && P.getElemento(k).tieneEnI(Y))
                            aux.adicionar(Y);
                    }
                }
            }

            C[i] = C[i - 1].union(aux);
            if (C[i].esIgual(C[i - 1])) {
                u = i;
                break;
            }
        }

        Alfabeto INACCESIBLES = new Alfabeto(1);
        for (int i = 0; i < N.nroElems(); i++) {
            boolean sw = false;
            for (int j = 0; j < C[u].nroElems(); j++)
                if (N.getElemento(i) == C[u].getElemento(j))
                    sw = true;
            if (!sw)
                INACCESIBLES.adicionar(N.getElemento(i));
        }

        if (INACCESIBLES.nroElems() == 0)
            return;

        INACCESIBLES.mostrar();

        Gramatica GX = new Gramatica();
        for (int j = 0; j < P.nroElems(); j++) {
            int c = 0;
            for (int i = 0; i < INACCESIBLES.nroElems(); i++)
                if (!P.getElemento(j).tiene(INACCESIBLES.getElemento(i)))
                    c++;
            if (c == INACCESIBLES.nroElems())
                GX.adicionarProduccion(P.getElemento(j));
        }
        N = GX.N;
        T = GX.T;
        P = GX.P;
    }

    // elimina producciones del tipo A -> A
    public void eliminarProduccionesRenombradorasA() {
        Gramatica GX = new Gramatica();
        for (int i = 0; i < P.nroElems(); i++)
            if (!P.getElemento(i).esRenombradoraA())
                GX.adicionarProduccion(P.getElemento(i));
        N = GX.N;
        T = GX.T;
        P = GX.P;
    }

    public void eliminarProduccionesRenombradoras() {
        eliminarProduccionesRenombradorasA();

        Gramatica GX = new Gramatica();
        Alfabeto[] DerivaDeVi = new Alfabeto[N.nroElems()];
        ConjuntoProducciones[] Pi = new ConjuntoProducciones[N.nroElems() + 1];
        // formatear
        for (int i = 0; i < N.nroElems(); i++) {
            DerivaDeVi[i] = new Alfabeto(1);
            Pi[i] = new ConjuntoProducciones();
        }
        ConjuntoProducciones R = new ConjuntoProducciones();
        // ponemos en Po todas las no renombradoras
        for (int i = 0; i < P.nroElems(); i++)
            if (!P.getElemento(i).esRenombradora())
                Pi[0].adicionar(P.getElemento(i));
            else
                R.adicionar(P.getElemento(i));

        for (int i = 0; i < N.nroElems(); i++)
            for (int j = 0; j < N.nroElems(); j++) {
                // System.out.println(N.getElemento(i) + "," + N.getElemento(j) + " > " + R.esGenerada(N.getElemento(i), N.getElemento(j)));
                if (i != j && R.esGenerada(N.getElemento(i), N.getElemento(j))) {
                    // System.out.println(N.getElemento(i) + "," + N.getElemento(j) + " > " + R.esGenerada(N.getElemento(i), N.getElemento(j)))
                    DerivaDeVi[i].adicionar(N.getElemento(j));
                }
            }


        for (int i = 1; i < N.nroElems() + 1; i++) {
            ConjuntoProducciones aux = new ConjuntoProducciones();
            for (int j = 0; j < Pi[i - 1].nroElems(); j++) {
                for (int k = 0; k < DerivaDeVi[i - 1].nroElems(); k++)
                    if (Pi[i - 1].getElemento(j).getA() == DerivaDeVi[i - 1].getElemento(k))
                        aux.adicionar(new Produccion(N.getElemento(i - 1), Pi[i - 1].getElemento(j).getB()));
            }
            Pi[i] = Pi[i - 1].union(aux);
        }
        for (int i = 0; i < Pi[N.nroElems()].nroElems(); i++)
            GX.adicionarProduccion(Pi[N.nroElems()].getElemento(i));

        N = GX.N;
        T = GX.T;
        P = GX.P;
    }


    public void adicionarProduccion(Produccion X) {
        N.adicionar(X.getA() + "");
        N.adicionar(X.getB());
        T.adicionar(X.getB());
        P.adicionar(X);
    }

    public void eliminarProduccion(int x) {
        P.eliminar(x);
    }

    public void mostrar() {
        N.mostrar();
        T.mostrar();
        P.mostrar();
        System.out.println("Raiz " + S);
    }

    public Alfabeto getAlfabetoN() {
        return N;
    }

    public Alfabeto getAlfabetoT() {
        return T;
    }

    public ConjuntoProducciones getProducciones() {
        return P;
    }
}