public class Grammar {

    private Alphabet N = new Alphabet(1);
    private Alphabet T = new Alphabet(2);
    private ProductionsSet P = new ProductionsSet();
    private char S = 83;

    public Grammar() {
    }

    public void limpiar() {
        this.eliminarProduccionesRenombradoras();
        this.eliminarNoTerminalesInutiles();
        this.eliminarNoTerminalesInaccesibles();
    }

    public void eliminarNoTerminalesInutiles() {
        Alphabet[] Si = new Alphabet[99];
        Alphabet[] UTIL = new Alphabet[99];

        int u;
        for (u = 0; u < 99; ++u) {
            Si[u] = new Alphabet(3);
            UTIL[u] = new Alphabet(1);
        }

        Si[0] = this.T;
        boolean var9 = false;
        int INUTIL = 1;

        while (true) {
            Alphabet GX = new Alphabet(1);

            int j;
            for (j = 0; j < this.P.nroElems(); ++j) {
                if (this.P.getElemento(j).contiene(Si[INUTIL - 1])) {
                    GX.adicionar(this.P.getElemento(j).getA());
                }
            }

            UTIL[INUTIL] = UTIL[INUTIL - 1].union(GX);
            Si[INUTIL] = Si[INUTIL - 1].union(UTIL[INUTIL]);
            if (UTIL[INUTIL].esIgual(UTIL[INUTIL - 1])) {
                u = INUTIL;
                Alphabet var10 = new Alphabet(1);

                int c;
                for (int var11 = 0; var11 < this.N.nroElems(); ++var11) {
                    boolean var13 = false;

                    for (c = 0; c < UTIL[u].nroElems(); ++c) {
                        if (this.N.getElemento(var11) == UTIL[u].getElemento(c)) {
                            var13 = true;
                        }
                    }

                    if (!var13) {
                        var10.adicionar(this.N.getElemento(var11));
                    }
                }

                if (var10.nroElems() == 0) {
                    return;
                }

                Grammar var12 = new Grammar();

                for (j = 0; j < this.P.nroElems(); ++j) {
                    c = 0;

                    for (int i = 0; i < var10.nroElems(); ++i) {
                        if (!this.P.getElemento(j).tiene(var10.getElemento(i))) {
                            ++c;
                        }
                    }

                    if (c == var10.nroElems()) {
                        var12.adicionarProduccion(this.P.getElemento(j));
                    }
                }

                this.N = var12.N;
                this.T = var12.T;
                this.P = var12.P;
                return;
            }

            ++INUTIL;
        }
    }

    public void eliminarNoTerminalesInaccesibles() {
        Alphabet[] C = new Alphabet[99];

        int u;
        for (u = 0; u < 99; ++u) {
            C[u] = new Alphabet(1);
        }

        C[0].adicionar(this.S);
        boolean var9 = false;
        int INACCESIBLES = 1;

        while (true) {
            Alphabet GX = new Alphabet(1);

            int j;
            int c;
            int i;
            for (j = 0; j < C[INACCESIBLES - 1].nroElems(); ++j) {
                for (c = 0; c < this.P.nroElems(); ++c) {
                    for (i = 0; i < this.N.nroElems(); ++i) {
                        char Y = this.N.getElemento(i);
                        if (C[INACCESIBLES - 1].getElemento(j) == this.P.getElemento(c).getA() && this.P.getElemento(c).tieneEnI(Y)) {
                            GX.adicionar(Y);
                        }
                    }
                }
            }

            C[INACCESIBLES] = C[INACCESIBLES - 1].union(GX);
            if (C[INACCESIBLES].esIgual(C[INACCESIBLES - 1])) {
                u = INACCESIBLES;
                Alphabet var10 = new Alphabet(1);

                for (int var11 = 0; var11 < this.N.nroElems(); ++var11) {
                    boolean var13 = false;

                    for (c = 0; c < C[u].nroElems(); ++c) {
                        if (this.N.getElemento(var11) == C[u].getElemento(c)) {
                            var13 = true;
                        }
                    }

                    if (!var13) {
                        var10.adicionar(this.N.getElemento(var11));
                    }
                }

                if (var10.nroElems() == 0) {
                    return;
                }

                var10.mostrar();
                Grammar var12 = new Grammar();

                for (j = 0; j < this.P.nroElems(); ++j) {
                    c = 0;

                    for (i = 0; i < var10.nroElems(); ++i) {
                        if (!this.P.getElemento(j).tiene(var10.getElemento(i))) {
                            ++c;
                        }
                    }

                    if (c == var10.nroElems()) {
                        var12.adicionarProduccion(this.P.getElemento(j));
                    }
                }

                this.N = var12.N;
                this.T = var12.T;
                this.P = var12.P;
                return;
            }

            ++INACCESIBLES;
        }
    }

    public void eliminarProduccionesRenombradorasA() {
        Grammar GX = new Grammar();

        for (int i = 0; i < this.P.nroElems(); ++i) {
            if (!this.P.getElemento(i).esRenombradoraA()) {
                GX.adicionarProduccion(this.P.getElemento(i));
            }
        }

        this.N = GX.N;
        this.T = GX.T;
        this.P = GX.P;
    }

    public void eliminarProduccionesRenombradoras() {
        this.eliminarProduccionesRenombradorasA();
        Grammar GX = new Grammar();
        Alphabet[] DerivaDeVi = new Alphabet[this.N.nroElems()];
        ProductionsSet[] Pi = new ProductionsSet[this.N.nroElems() + 1];

        for (int R = 0; R < this.N.nroElems(); ++R) {
            DerivaDeVi[R] = new Alphabet(1);
            Pi[R] = new ProductionsSet();
        }

        ProductionsSet var9 = new ProductionsSet();

        int i;
        for (i = 0; i < this.P.nroElems(); ++i) {
            if (!this.P.getElemento(i).esRenombradora()) {
                Pi[0].adicionar(this.P.getElemento(i));
            } else {
                var9.adicionar(this.P.getElemento(i));
            }
        }

        for (i = 0; i < this.N.nroElems(); ++i) {
            for (int aux = 0; aux < this.N.nroElems(); ++aux) {
                if (i != aux && var9.esGenerada(this.N.getElemento(i), this.N.getElemento(aux))) {
                    DerivaDeVi[i].adicionar(this.N.getElemento(aux));
                }
            }
        }

        for (i = 1; i < this.N.nroElems() + 1; ++i) {
            ProductionsSet var10 = new ProductionsSet();

            for (int j = 0; j < Pi[i - 1].nroElems(); ++j) {
                for (int k = 0; k < DerivaDeVi[i - 1].nroElems(); ++k) {
                    if (Pi[i - 1].getElemento(j).getA() == DerivaDeVi[i - 1].getElemento(k)) {
                        var10.adicionar(new Production(this.N.getElemento(i - 1), Pi[i - 1].getElemento(j).getB()));
                    }
                }
            }

            Pi[i] = Pi[i - 1].union(var10);
        }

        for (i = 0; i < Pi[this.N.nroElems()].nroElems(); ++i) {
            GX.adicionarProduccion(Pi[this.N.nroElems()].getElemento(i));
        }

        this.N = GX.N;
        this.T = GX.T;
        this.P = GX.P;
    }

    public void adicionarProduccion(Production X) {
        this.N.adicionar(X.getA() + "");
        this.N.adicionar(X.getB());
        this.T.adicionar(X.getB());
        this.P.adicionar(X);
    }

    public void eliminarProduccion(int x) {
        this.P.eliminar(x);
    }

    public void mostrar() {
        this.N.mostrar();
        this.T.mostrar();
        this.P.mostrar();
        System.out.println("Raiz " + this.S);
    }

    public Alphabet getAlfabetoN() {
        return this.N;
    }

    public Alphabet getAlfabetoT() {
        return this.T;
    }

    public ProductionsSet getProducciones() {
        return this.P;
    }
}