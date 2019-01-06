public class Main {

    public static void main(String[] args) {
        Grammar G = new Grammar();
        G.adicionarProduccion(new Production('S', "S"));
        G.limpiar();
        G.mostrar();

        MainFrame V = new MainFrame();
        V.setVisible(true);
    }
}