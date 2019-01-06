import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class GrammarDialog extends JDialog {
    public Grammar G = new Grammar();
    private JButton bAdicionarProduccion;
    private JButton bEliminarProduccion;
    private JButton jButton1;
    private JLabel jLabel1;
    private JPanel jPanel1;
    private JScrollPane jScrollPane1;
    private JScrollPane jScrollPane2;
    private JLabel lInformacion;
    private JList lProducciones;
    private JPanel pGramatica;
    private JPanel pProducciones;
    private JTextArea taGramatica;
    private JTextField tfProduccionD;
    private JTextField tfProduccionI;

    public GrammarDialog(Frame parent, boolean modal) {
        super(parent, modal);
        this.initComponents();
    }

    public Grammar getGramatica() {
        return this.G;
    }

    private void initComponents() {
        this.pProducciones = new JPanel();
        this.tfProduccionI = new JTextField();
        this.tfProduccionD = new JTextField();
        this.jLabel1 = new JLabel();
        this.bAdicionarProduccion = new JButton();
        this.jScrollPane2 = new JScrollPane();
        this.lProducciones = new JList();
        this.bEliminarProduccion = new JButton();
        this.pGramatica = new JPanel();
        this.jScrollPane1 = new JScrollPane();
        this.taGramatica = new JTextArea();
        this.jPanel1 = new JPanel();
        this.lInformacion = new JLabel();
        this.jButton1 = new JButton();
        this.setDefaultCloseOperation(2);
        this.setTitle("Grámatica");
        this.setBounds((Toolkit.getDefaultToolkit().getScreenSize().width - 412) / 2, (Toolkit.getDefaultToolkit().getScreenSize().height - 341) / 2, 412, 341);
        this.setResizable(false);
        this.pProducciones.setBorder(BorderFactory.createTitledBorder("Producciones"));
        this.jLabel1.setText("->");
        this.bAdicionarProduccion.setText("Adicionar");
        this.bAdicionarProduccion.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                GrammarDialog.this.bAdicionarProduccionActionPerformed(evt);
            }
        });
        this.lProducciones.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent evt) {
                GrammarDialog.this.lProduccionesValueChanged(evt);
            }
        });
        this.jScrollPane2.setViewportView(this.lProducciones);
        this.bEliminarProduccion.setText("X");
        this.bEliminarProduccion.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                GrammarDialog.this.bEliminarProduccionActionPerformed(evt);
            }
        });
        GroupLayout pProduccionesLayout = new GroupLayout(this.pProducciones);
        this.pProducciones.setLayout(pProduccionesLayout);
        pProduccionesLayout.setHorizontalGroup(pProduccionesLayout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(pProduccionesLayout.createSequentialGroup().addContainerGap().addGroup(pProduccionesLayout.createParallelGroup(GroupLayout.Alignment.TRAILING).addComponent(this.jScrollPane2, GroupLayout.Alignment.LEADING, 0, 0, 32767).addGroup(GroupLayout.Alignment.LEADING, pProduccionesLayout.createParallelGroup(GroupLayout.Alignment.TRAILING, false).addGroup(GroupLayout.Alignment.LEADING, pProduccionesLayout.createSequentialGroup().addComponent(this.tfProduccionI, -2, 18, -2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jLabel1).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.tfProduccionD)).addGroup(GroupLayout.Alignment.LEADING, pProduccionesLayout.createSequentialGroup().addComponent(this.bAdicionarProduccion, -2, 119, -2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.bEliminarProduccion)))).addContainerGap(-1, 32767)));
        pProduccionesLayout.setVerticalGroup(pProduccionesLayout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(pProduccionesLayout.createSequentialGroup().addGroup(pProduccionesLayout.createParallelGroup(GroupLayout.Alignment.BASELINE).addComponent(this.tfProduccionI, -2, -1, -2).addComponent(this.jLabel1).addComponent(this.tfProduccionD, -2, -1, -2)).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addGroup(pProduccionesLayout.createParallelGroup(GroupLayout.Alignment.BASELINE).addComponent(this.bAdicionarProduccion).addComponent(this.bEliminarProduccion)).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jScrollPane2, -1, 193, 32767).addContainerGap()));
        this.pGramatica.setBorder(BorderFactory.createTitledBorder("Gramática"));
        this.taGramatica.setColumns(20);
        this.taGramatica.setFont(new Font("Consolas", 0, 13));
        this.taGramatica.setRows(5);
        this.jScrollPane1.setViewportView(this.taGramatica);
        GroupLayout pGramaticaLayout = new GroupLayout(this.pGramatica);
        this.pGramatica.setLayout(pGramaticaLayout);
        pGramaticaLayout.setHorizontalGroup(pGramaticaLayout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(pGramaticaLayout.createSequentialGroup().addContainerGap().addComponent(this.jScrollPane1, -1, 158, 32767).addContainerGap()));
        pGramaticaLayout.setVerticalGroup(pGramaticaLayout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(pGramaticaLayout.createSequentialGroup().addComponent(this.jScrollPane1, -1, 248, 32767).addContainerGap()));
        this.jPanel1.setBackground(new Color(255, 255, 153));
        this.jPanel1.setBorder(BorderFactory.createTitledBorder(""));
        this.lInformacion.setText("Crea tu gramática ...");
        GroupLayout jPanel1Layout = new GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addContainerGap().addComponent(this.lInformacion, -1, 230, 32767).addContainerGap()));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addComponent(this.lInformacion));
        this.jButton1.setText("Crear");
        this.jButton1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                GrammarDialog.this.jButton1ActionPerformed(evt);
            }
        });
        GroupLayout layout = new GroupLayout(this.getContentPane());
        this.getContentPane().setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(this.pProducciones, -2, -1, -2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.pGramatica, -1, -1, 32767)).addGroup(layout.createSequentialGroup().addComponent(this.jPanel1, -2, -1, -2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jButton1, -2, 124, -2))).addContainerGap()));
        layout.setVerticalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING, false).addComponent(this.pProducciones, -1, -1, 32767).addComponent(this.pGramatica, -1, -1, 32767)).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(GroupLayout.Alignment.TRAILING).addComponent(this.jButton1, -1, 27, 32767).addComponent(this.jPanel1, -2, -1, -2)).addContainerGap()));
        this.pack();
    }

    private void bAdicionarProduccionActionPerformed(ActionEvent evt) {
        try {
            if (this.esMayuscula(this.tfProduccionI.getText().charAt(0)) && !this.tfProduccionD.getText().equals("")) {
                Production e = new Production(this.tfProduccionI.getText().charAt(0), this.tfProduccionD.getText());
                this.G.adicionarProduccion(e);
                this.actualizar();
            } else {
                this.lInformacion.setText("Inserte una producción valida !");
            }

            this.tfProduccionI.setText("");
            this.tfProduccionD.setText("");
        } catch (Exception var3) {
            this.lInformacion.setText("Inserte una producción");
        }

    }

    public boolean esMayuscula(char x) {
        return x > 64 && x < 91;
    }

    private void bEliminarProduccionActionPerformed(ActionEvent evt) {
        try {
            this.G.eliminarProduccion(this.lProducciones.getSelectedIndex() + 1);
            ProductionsSet e = this.G.getProducciones();
            this.G = new Grammar();

            for (int i = 0; i < e.n; ++i) {
                this.G.adicionarProduccion(e.C[i]);
            }

            this.actualizar();
        } catch (Exception var4) {
            this.lInformacion.setText("Seleccione produccion a eliminar");
        }

    }

    private void lProduccionesValueChanged(ListSelectionEvent evt) {
    }

    private void jButton1ActionPerformed(ActionEvent evt) {
        if (this.G.getAlfabetoT().nroElems() != 0 && this.G.getAlfabetoN().nroElems() != 0) {
            this.setVisible(false);
            ((MainFrame) this.getParent()).mostrarG1();
        } else {
            this.lInformacion.setText("Inserte Grámatica valida !");
            this.G = new Grammar();
        }

        this.taGramatica.setText("");
        this.lProducciones.setListData(new String[0]);
    }

    public void actualizar() {
        this.taGramatica.setText("");
        this.taGramatica.append("G = (N, T, P, S)");
        this.taGramatica.append("\n");
        this.taGramatica.append(" N = " + this.G.getAlfabetoN().getImpresion());
        this.taGramatica.append("\n");
        this.taGramatica.append(" T = " + this.G.getAlfabetoT().getImpresion());
        this.taGramatica.append("\n");
        this.taGramatica.append(" P:\n" + this.G.getProducciones().getImpresion());
        this.lProducciones.setListData(this.G.getProducciones().getImpresionV());
    }

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                GrammarDialog dialog = new GrammarDialog(new JFrame(), true);
                dialog.addWindowListener(new WindowAdapter() {
                    public void windowClosing(WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }
}