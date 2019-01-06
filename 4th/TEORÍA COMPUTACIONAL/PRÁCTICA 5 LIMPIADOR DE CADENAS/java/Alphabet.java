public class Alphabet {

    private int t;
    private int n = 0;
    private char[] C = new char[99];

    public Alphabet(int tipo) {
        this.t = tipo;
    }

    public void adicionar(String a) {
        for (int i = 0; i < a.length(); ++i) {
            if (this.t == 1 && this.esMayuscula(a.charAt(i))) {
                this.adicionar(a.charAt(i));
            }

            if (this.t == 2 && this.esMinuscula(a.charAt(i))) {
                this.adicionar(a.charAt(i));
            }

            if (this.t == 3) {
                this.adicionar(a.charAt(i));
            }
        }

    }

    public boolean esIgual(Alphabet X) {
        int c = 0;

        for (int i = 0; i < this.nroElems(); ++i) {
            for (int j = 0; j < X.nroElems(); ++j) {
                if (this.getElemento(i) == X.getElemento(j)) {
                    ++c;
                }
            }
        }

        if (c == this.nroElems()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean esMayuscula(char x) {
        return x > 64 && x < 91;
    }

    public boolean esMinuscula(char x) {
        return x > 96 && x < 123;
    }

    public int nroElems() {
        return this.n;
    }

    public void mostrar() {
        System.out.print("{");

        for (int i = 0; i < this.n; ++i) {
            System.out.print(this.C[i] + ", ");
        }

        System.out.println("} " + this.nroElems());
    }

    public void adicionar(char x) {
        for (int i = 0; i < this.n; ++i) {
            if (this.C[i] == x) {
                return;
            }
        }

        this.C[this.n++] = x;
    }

    public void eliminar(int j) {
        for (int i = j; i < this.n; ++i) {
            this.C[i - 1] = this.C[i];
        }

        --this.n;
    }

    public String getImpresion() {
        String I = "{";
        if (this.n == 0) {
            return I + " }";
        } else {
            for (int i = 0; i < this.n - 1; ++i) {
                I = I + this.C[i] + ", ";
            }

            return I + this.C[this.n - 1] + "}";
        }
    }

    public char getElemento(int i) {
        return this.C[i];
    }

    public Alphabet union(Alphabet B) {
        Alphabet U = new Alphabet(this.t);

        int i;
        for (i = 0; i < this.n; ++i) {
            U.adicionar(this.C[i]);
        }

        for (i = 0; i < B.n; ++i) {
            U.adicionar(B.C[i]);
        }

        return U;
    }

    public Alphabet interseccion(Alphabet B) {
        Alphabet I = new Alphabet(this.t);

        for (int i = 0; i < this.n; ++i) {
            for (int j = 0; j < B.n; ++j) {
                if (this.C[i] == B.C[j]) {
                    I.adicionar(this.C[i]);
                    break;
                }
            }
        }

        return I;
    }

}