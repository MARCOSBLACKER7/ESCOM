import java.awt.*;
import java.awt.event.*;
import javax.swing.event.*;
import javax.swing.*;
import java.net.Socket;
import java.io.*;


public class MicroChat extends JPanel implements ActionListener{
    private JTextArea incoming;
    private JTextField outgoing;
    
    private ObjectInputStream entrada;
    private ObjectOutputStream salida;
    private String nombre;
   
    public MicroChat () {    
        super();
        //this.r=r;	
        nombre = JOptionPane.showInputDialog("Escriba su nombre", "TECLA PARRA ROBERTO");;
        setLayout(new GridLayout(2,1));
        incoming = new JTextArea(5,20);  // was 15,50
        incoming.setLineWrap(true);
        incoming.setWrapStyleWord(true);
        incoming.setEditable(false);
        JScrollPane qScroller = new JScrollPane(incoming);
        qScroller.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        qScroller.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);       
        outgoing = new JTextField(15);
        outgoing.addActionListener(this);
        add(outgoing);
        add(qScroller);

        try{
            Socket cl = new Socket("localhost",1234);
            salida = new ObjectOutputStream(cl.getOutputStream());
            entrada = new ObjectInputStream(cl.getInputStream());
        }catch(IOException e){}
    }
    
    public void actionPerformed(ActionEvent e) { 
        //System.out.println("actionPerformed if ("+outgoing.getText()+")");
    	//r.escribeRed(new Mensaje("Escom","jojo", outgoing.getText()));
        try{
            salida.writeObject(outgoing.getText());
            salida.flush();
            String cadenaRecibida=(String)entrada.readObject();
            incoming.setText(incoming.getText()+"\n"+nombre+": "+outgoing.getText()+"\n"+cadenaRecibida);
            outgoing.setText("");
        }catch(IOException |ClassNotFoundException ex){}
    }

    public void recibir(Mensaje mensa){
        System.out.println("recibir if ("+mensa.getTexto()+")");
        incoming.append(mensa.getTexto() + "\n");
        

    }
}
