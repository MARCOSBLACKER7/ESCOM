public class Production {
    private char a;
    private String b;

    public Production(char a, String b) {
        this.a = a;
        this.b = b;
    }

    public char getA() {
        return this.a;
    }

    public String getB() {
        return this.b;
    }

    public String getImpresion() {
        return this.a + " -> " + this.b;
    }

    public boolean esValida() {
        return true;
    }

    public void mostrar() {
        System.out.println(this.a + " -> " + this.b);
    }

    public boolean esRenombradora() {
        return this.b.length() == 1 && this.esMayuscula(this.b.charAt(0));
    }

    public boolean esRenombradoraA() {
        return this.a == this.b.charAt(0) && this.b.length() == 1;
    }

    public boolean esIgual(Production O) {
        return this.a == O.a && this.b.equals(O.b);
    }

    public boolean contiene(Alphabet A) {
        int c = 0;

        for (int i = 0; i < this.b.length(); ++i) {
            for (int j = 0; j < A.nroElems(); ++j) {
                if (this.b.charAt(i) == A.getElemento(j)) {
                    ++c;
                }
            }
        }

        if (c == this.b.length()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean tiene(char x) {
        if (this.a == x) {
            return true;
        } else {
            for (int i = 0; i < this.b.length(); ++i) {
                if (this.b.charAt(i) == x) {
                    return true;
                }
            }

            return false;
        }
    }

    public boolean tieneEnI(char x) {
        for (int i = 0; i < this.b.length(); ++i) {
            if (this.b.charAt(i) == x) {
                return true;
            }
        }

        return false;
    }

    public boolean esMayuscula(char x) {
        return x > 64 && x < 91;
    }

    public boolean esMinuscula(char x) {
        return x > 96 && x < 123;
    }
}