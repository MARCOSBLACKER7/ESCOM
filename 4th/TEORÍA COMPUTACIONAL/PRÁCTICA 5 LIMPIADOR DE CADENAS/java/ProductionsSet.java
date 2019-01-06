import java.util.Stack;

public class ProductionsSet {

    protected int n = 0;
    protected Production[] C = new Production[99];

    public ProductionsSet() {
    }

    public int nroElems() {
        return this.n;
    }

    public void mostrar() {
        System.out.print("{");

        for (int i = 0; i < this.n; ++i) {
            System.out.println(this.C[i].getImpresion() + ", ");
        }

        System.out.println("} " + this.nroElems());
    }

    public void adicionar(Production X) {
        for (int i = 0; i < this.n; ++i) {
            if (this.C[i].esIgual(X)) {
                return;
            }
        }

        this.C[this.n] = X;
        ++this.n;
    }

    public void eliminar(int j) {
        for (int i = j; i < this.n; ++i) {
            this.C[i - 1] = this.C[i];
        }

        --this.n;
    }

    public String getImpresion() {
        String I = "";

        for (int i = 0; i < this.n; ++i) {
            I = I + "  " + this.C[i].getImpresion() + "\n";
        }

        return I;
    }

    public String[] getImpresionV() {
        String[] V = new String[this.n];

        for (int i = 0; i < this.n; ++i) {
            V[i] = this.C[i].getImpresion();
        }

        return V;
    }

    public Production getElemento(int i) {
        return this.C[i];
    }

    public ProductionsSet union(ProductionsSet B) {
        ProductionsSet U = new ProductionsSet();

        int i;
        for (i = 0; i < this.n; ++i) {
            U.adicionar(this.C[i]);
        }

        for (i = 0; i < B.n; ++i) {
            U.adicionar(B.C[i]);
        }

        return U;
    }

    public ProductionsSet interseccion(ProductionsSet B) {
        ProductionsSet I = new ProductionsSet();

        for (int i = 0; i < this.n; ++i) {
            for (int j = 0; j < B.n; ++j) {
                if (this.C[i].equals(B.C[j])) {
                    I.adicionar(this.C[i]);
                    break;
                }
            }
        }

        return I;
    }

    public boolean existeProduccion(char X, char Y) {
        for (int i = 0; i < this.nroElems(); ++i) {
            if (this.getElemento(i).getA() == X && this.getElemento(i).getB().charAt(0) == Y) {
                return true;
            }
        }

        return false;
    }

    public boolean esGenerada(char X, char Y) {
        Stack pila = new Stack();
        pila.push(X + "");

        for (boolean sw = false; !pila.isEmpty(); sw = true) {
            char W = ((String) pila.pop()).charAt(0);
            if (W == Y) {
                return true;
            }

            if (W == X && sw) {
                return false;
            }

            for (int i = 0; i < this.nroElems(); ++i) {
                if (this.getElemento(i).getA() == W) {
                    pila.push(this.getElemento(i).getB());
                }
            }
        }

        return false;
    }
}