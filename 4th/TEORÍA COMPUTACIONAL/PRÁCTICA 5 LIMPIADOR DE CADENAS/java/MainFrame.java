import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainFrame extends JFrame {

    private Grammar G;
    private Grammar G2;
    private GrammarDialog VG;
    private JButton bLimpieza;
    private JButton jButton1;
    private JButton jButton2;
    private JButton jButton3;
    private JButton jButton4;
    private JLabel jLabel1;
    private JLabel jLabel10;
    private JLabel jLabel11;
    private JLabel jLabel12;
    private JLabel jLabel2;
    private JLabel jLabel3;
    private JLabel jLabel5;
    private JLabel jLabel6;
    private JLabel jLabel7;
    private JLabel jLabel8;
    private JLabel jLabel9;
    private JPanel jPanel1;
    private JPanel jPanel2;
    private JPanel jPanel3;
    private JPanel jPanel4;
    private JPanel jPanel5;
    private JPanel jPanel6;
    private JPanel jPanel7;
    private JPanel jPanel9;
    private JScrollPane jScrollPane1;
    private JScrollPane jScrollPane2;
    private JTabbedPane jTabbedPane1;
    private JLabel lInformacion;
    private JTextArea taGramatica1;
    private JTextArea taGramatica2;

    public MainFrame() {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception var2) {
            var2.printStackTrace();
        }

        this.initComponents();
        this.VG = new GrammarDialog(this, true);
    }

    private void initComponents() {
        jTabbedPane1 = new JTabbedPane();
        jPanel1 = new JPanel();
        jPanel4 = new JPanel();
        jScrollPane1 = new JScrollPane();
        taGramatica1 = new JTextArea();
        jButton3 = new JButton();
        jPanel5 = new JPanel();
        jButton1 = new JButton();
        jButton2 = new JButton();
        jButton4 = new JButton();
        jPanel6 = new JPanel();
        jScrollPane2 = new JScrollPane();
        taGramatica2 = new JTextArea();
        jPanel7 = new JPanel();
        lInformacion = new JLabel();
        jPanel2 = new JPanel();
        bLimpieza = new JButton();
        jPanel3 = new JPanel();
        jLabel1 = new JLabel();
        jLabel2 = new JLabel();
        jLabel3 = new JLabel();
        jPanel9 = new JPanel();
        jLabel6 = new JLabel();
        jLabel7 = new JLabel();
        jLabel5 = new JLabel();
        jLabel8 = new JLabel();
        jLabel9 = new JLabel();
        jLabel10 = new JLabel();
        jLabel11 = new JLabel();
        jLabel12 = new JLabel();
        setDefaultCloseOperation(3);
        setTitle("Limpiador de Gramaticas");
        setBounds((Toolkit.getDefaultToolkit().getScreenSize().width - 680) / 2, (Toolkit.getDefaultToolkit().getScreenSize().height - 442) / 2, 680, 442);
        setCursor(new Cursor(0));
        setResizable(false);
        jPanel4.setBorder(BorderFactory.createTitledBorder("Gramatica"));
        taGramatica1.setColumns(20);
        taGramatica1.setFont(new Font("Consolas", 0, 13));
        taGramatica1.setRows(5);
        jScrollPane1.setViewportView(taGramatica1);
        jButton3.setText("Nueva Gramatica");
        jButton3.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                MainFrame.this.jButton3ActionPerformed(evt);
            }
        });
        GroupLayout jPanel4Layout = new GroupLayout(this.jPanel4);
        this.jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(jPanel4Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel4Layout.createSequentialGroup().addContainerGap().addGroup(jPanel4Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addComponent(this.jScrollPane1, GroupLayout.Alignment.TRAILING, -1, 200, 32767).addComponent(this.jButton3, GroupLayout.Alignment.TRAILING, -1, 200, 32767)).addContainerGap()));
        jPanel4Layout.setVerticalGroup(jPanel4Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup().addComponent(this.jScrollPane1, -1, 322, 32767).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jButton3).addContainerGap()));
        this.jPanel5.setBorder(BorderFactory.createTitledBorder("Eliminar Producciones"));
        //this.jButton1.setIcon(new ImageIcon(this.getClass().getResource("/tech/alvarez/grammarcleaner/images/Fireworks 2.png")));
        this.jButton1.setText("Renombradoras");
        this.jButton1.setHorizontalAlignment(2);
        this.jButton1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                MainFrame.this.jButton1ActionPerformed(evt);
            }
        });
        //this.jButton2.setIcon(new ImageIcon(this.getClass().getResource("/tech/alvarez/grammarcleaner/images/Sun.png")));
        this.jButton2.setText("Inutiles");
        this.jButton2.setHorizontalAlignment(2);
        this.jButton2.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                MainFrame.this.jButton2ActionPerformed(evt);
            }
        });
        //this.jButton4.setIcon(new ImageIcon(this.getClass().getResource("/tech/alvarez/grammarcleaner/images/Shamrock.png")));
        this.jButton4.setText("Inaccesibles");
        this.jButton4.setHorizontalAlignment(2);
        this.jButton4.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                MainFrame.this.jButton4ActionPerformed(evt);
            }
        });
        GroupLayout jPanel5Layout = new GroupLayout(this.jPanel5);
        this.jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(jPanel5Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel5Layout.createSequentialGroup().addContainerGap().addGroup(jPanel5Layout.createParallelGroup(GroupLayout.Alignment.TRAILING, false).addComponent(this.jButton4, GroupLayout.Alignment.LEADING, -1, -1, 32767).addComponent(this.jButton2, GroupLayout.Alignment.LEADING, -1, -1, 32767).addComponent(this.jButton1, GroupLayout.Alignment.LEADING, -1, -1, 32767)).addContainerGap(-1, 32767)));
        jPanel5Layout.setVerticalGroup(jPanel5Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel5Layout.createSequentialGroup().addComponent(this.jButton1).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jButton2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jButton4).addContainerGap(-1, 32767)));
        this.jPanel6.setBorder(BorderFactory.createTitledBorder("Gramática Resultante"));
        this.taGramatica2.setColumns(20);
        this.taGramatica2.setFont(new Font("Consolas", 0, 13));
        this.taGramatica2.setRows(5);
        this.jScrollPane2.setViewportView(this.taGramatica2);
        GroupLayout jPanel6Layout = new GroupLayout(this.jPanel6);
        this.jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(jPanel6Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel6Layout.createSequentialGroup().addContainerGap().addComponent(this.jScrollPane2, -1, 190, 32767).addContainerGap()));
        jPanel6Layout.setVerticalGroup(jPanel6Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel6Layout.createSequentialGroup().addComponent(this.jScrollPane2, -1, 351, 32767).addContainerGap()));
        this.jPanel7.setBackground(new Color(255, 255, 153));
        this.jPanel7.setBorder(BorderFactory.createTitledBorder(""));
        this.lInformacion.setText("Inserte una gramatica...");
        GroupLayout jPanel7Layout = new GroupLayout(this.jPanel7);
        this.jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(jPanel7Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel7Layout.createSequentialGroup().addContainerGap().addComponent(this.lInformacion).addContainerGap(53, 32767)));
        jPanel7Layout.setVerticalGroup(jPanel7Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addComponent(this.lInformacion));
        this.jPanel2.setBackground(new Color(153, 255, 153));
        this.jPanel2.setBorder(BorderFactory.createTitledBorder(""));
       // this.bLimpieza.setIcon(new ImageIcon(this.getClass().getResource("/tech/alvarez/grammarcleaner/images/Leaf.png")));
        this.bLimpieza.setText("Limpiar");
        this.bLimpieza.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                MainFrame.this.bLimpiezaActionPerformed(evt);
            }
        });
        GroupLayout jPanel2Layout = new GroupLayout(this.jPanel2);
        this.jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(jPanel2Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel2Layout.createSequentialGroup().addContainerGap().addComponent(this.bLimpieza, -1, 161, 32767).addContainerGap()));
        jPanel2Layout.setVerticalGroup(jPanel2Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addComponent(this.bLimpieza, -1, 88, 32767));
        GroupLayout jPanel1Layout = new GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addContainerGap().addComponent(this.jPanel4, -2, -1, -2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addGroup(jPanel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addComponent(this.jPanel5, GroupLayout.Alignment.TRAILING, -1, -1, 32767).addComponent(this.jPanel7, -1, -1, 32767).addComponent(this.jPanel2, -1, -1, 32767)).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jPanel6, -2, -1, -2).addContainerGap()));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup().addContainerGap().addGroup(jPanel1Layout.createParallelGroup(GroupLayout.Alignment.TRAILING).addComponent(this.jPanel4, GroupLayout.Alignment.LEADING, -1, -1, 32767).addComponent(this.jPanel6, GroupLayout.Alignment.LEADING, -1, -1, 32767).addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup().addComponent(this.jPanel5, -2, -1, -2).addGap(18, 18, 18).addComponent(this.jPanel2, -2, -1, -2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 22, 32767).addComponent(this.jPanel7, -2, -1, -2))).addContainerGap()));
        this.jTabbedPane1.addTab("Limpieza de Gramaticas", this.jPanel1);
        jLabel1.setFont(new Font("Consolas", 0, 30));
        jLabel1.setText("Limpiador de Grámaticas 1.1");
        jLabel2.setFont(new Font("Consolas", 0, 18));
        jLabel2.setText("Daniel Alvarez");
        jLabel3.setFont(new Font("Consolas", 0, 14));
        jLabel3.setText("http://alvarez.tech");
        jPanel9.setBackground(new Color(255, 255, 255));
        jPanel9.setBorder(BorderFactory.createTitledBorder(""));
        jLabel6.setFont(new Font("Tahoma", 2, 12));
        jLabel6.setText("Proyecto realizado para el curso de Lenguajes Formales");
        jLabel7.setFont(new Font("Tahoma", 2, 12));
        jLabel7.setText("de la carrera de Informática de la Universidad Mayor de San Andrés.");
       // jLabel5.setIcon(new ImageIcon(getClass().getResource("/tech/alvarez/grammarcleaner/images/UMSA - Copy.jpg")));
        jLabel8.setText("La Paz - Bolivia");
        jLabel9.setFont(new Font("Tahoma", 2, 12));
        jLabel9.setText("Los Algoritmos utilizados para la limpieza de grámaticas fueron");
        jLabel10.setFont(new Font("Tahoma", 2, 12));
        jLabel10.setText("extraidos del libro de \"LENGUAJES FORMALES\" de Lucio Torrico.");
        jLabel11.setText("Diciembre de 2009");
        jLabel12.setFont(new Font("Tahoma", 2, 12));
        jLabel12.setText("Programa escrito totalmente en Java.");

        GroupLayout jPanel9Layout = new GroupLayout(this.jPanel9);
        jPanel9.setLayout(jPanel9Layout);
        jPanel9Layout.setHorizontalGroup(jPanel9Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel9Layout.createSequentialGroup().addContainerGap().addGroup(jPanel9Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel9Layout.createSequentialGroup().addGroup(jPanel9Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addComponent(jLabel6).addComponent(this.jLabel7)).addContainerGap(69, 32767)).addGroup(GroupLayout.Alignment.TRAILING, jPanel9Layout.createSequentialGroup().addGroup(jPanel9Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel9Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(GroupLayout.Alignment.TRAILING, jPanel9Layout.createSequentialGroup().addComponent(this.jLabel10).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 10, 32767)).addGroup(GroupLayout.Alignment.TRAILING, jPanel9Layout.createSequentialGroup().addComponent(this.jLabel12).addGap(18, 18, 18)).addGroup(GroupLayout.Alignment.TRAILING, jPanel9Layout.createSequentialGroup().addComponent(this.jLabel8).addGap(148, 148, 148))).addGroup(GroupLayout.Alignment.TRAILING, jPanel9Layout.createSequentialGroup().addComponent(this.jLabel11).addGap(140, 140, 140))).addComponent(this.jLabel5)).addGroup(jPanel9Layout.createSequentialGroup().addComponent(this.jLabel9).addContainerGap(104, 32767)))));
        jPanel9Layout.setVerticalGroup(jPanel9Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel9Layout.createSequentialGroup().addContainerGap().addComponent(this.jLabel6).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jLabel7).addGap(26, 26, 26).addComponent(this.jLabel9).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 15, 32767).addGroup(jPanel9Layout.createParallelGroup(GroupLayout.Alignment.TRAILING).addComponent(this.jLabel5).addGroup(jPanel9Layout.createSequentialGroup().addComponent(this.jLabel12).addGap(18, 18, 18).addComponent(this.jLabel11).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jLabel8).addContainerGap()))).addGroup(jPanel9Layout.createSequentialGroup().addGap(94, 94, 94).addComponent(this.jLabel10).addContainerGap(105, 32767)));
        GroupLayout jPanel3Layout = new GroupLayout(this.jPanel3);
        this.jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(jPanel3Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup().addContainerGap(193, 32767).addComponent(this.jLabel2).addGap(186, 186, 186)).addGroup(jPanel3Layout.createSequentialGroup().addGap(323, 323, 323).addContainerGap(331, 32767)).addGroup(jPanel3Layout.createSequentialGroup().addGap(65, 65, 65).addComponent(this.jLabel1).addContainerGap(74, 32767)).addGroup(GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup().addContainerGap(111, 32767).addComponent(this.jPanel9, -2, -1, -2).addGap(108, 108, 108)).addGroup(GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup().addContainerGap(235, 32767).addComponent(this.jLabel3).addGap(228, 228, 228)).addGroup(GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup().addContainerGap(213, 32767).addGap(197, 197, 197)));
        jPanel3Layout.setVerticalGroup(jPanel3Layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(jPanel3Layout.createSequentialGroup().addContainerGap().addComponent(this.jLabel1).addGap(1, 1, 1).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jLabel2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addComponent(this.jLabel3).addGap(18, 18, 18).addComponent(this.jPanel9, -2, -1, -2).addPreferredGap(LayoutStyle.ComponentPlacement.RELATED).addContainerGap(19, 32767)));
        this.jTabbedPane1.addTab("Créditos", this.jPanel3);
        GroupLayout layout = new GroupLayout(this.getContentPane());
        this.getContentPane().setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addComponent(this.jTabbedPane1, -1, 684, 32767).addContainerGap()));
        layout.setVerticalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addComponent(this.jTabbedPane1, -1, 439, 32767).addContainerGap()));
        this.pack();
    }

    private void bLimpiezaActionPerformed(ActionEvent evt) {
        try {
            G2 = G;
            G2.limpiar();
            mostrarG2();
        } catch (Exception var3) {
            lInformacion.setText("Crea una grámatica !");
        }

    }

    private void jButton3ActionPerformed(ActionEvent evt) {
        VG.setVisible(true);
        VG.G = new Grammar();
        taGramatica2.setText("");
    }

    private void jButton1ActionPerformed(ActionEvent evt) {
        try {
            G2 = G;
            G2.eliminarProduccionesRenombradoras();
            mostrarG2();
        } catch (Exception var3) {
            lInformacion.setText("Crea una grámatica !");
        }

    }

    private void jButton2ActionPerformed(ActionEvent evt) {
        try {
            G2 = G;
            G2.eliminarNoTerminalesInutiles();
            mostrarG2();
        } catch (Exception var3) {
            lInformacion.setText("Crea una grámatica !");
        }

    }

    private void jButton4ActionPerformed(ActionEvent evt) {
        try {
            G2 = G;
            G2.eliminarNoTerminalesInaccesibles();
            mostrarG2();
        } catch (Exception var3) {
            lInformacion.setText("Crea una grámatica !");
        }

    }

    public void mostrarG1() {
        G = VG.getGramatica();
        taGramatica1.setText("");
        taGramatica1.append("G = (N, T, P, S)");
        taGramatica1.append("\n");
        taGramatica1.append(" N = " + G.getAlfabetoN().getImpresion());
        taGramatica1.append("\n");
        taGramatica1.append(" T = " + G.getAlfabetoT().getImpresion());
        taGramatica1.append("\n");
        taGramatica1.append(" P:\n" + G.getProducciones().getImpresion());
    }

    public void mostrarG2() {
        taGramatica2.setText("");
        taGramatica2.append("G = (N, T, P, S)");
        taGramatica2.append("\n");
        taGramatica2.append(" N = " + G2.getAlfabetoN().getImpresion());
        taGramatica2.append("\n");
        taGramatica2.append(" T = " + G2.getAlfabetoT().getImpresion());
        taGramatica2.append("\n");
        taGramatica2.append(" P:\n" + G2.getProducciones().getImpresion());
    }

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                (new MainFrame()).setVisible(true);
            }
        });
    }
}