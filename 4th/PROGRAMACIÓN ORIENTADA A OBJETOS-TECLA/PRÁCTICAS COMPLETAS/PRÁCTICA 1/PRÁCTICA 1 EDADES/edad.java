import java.awt.*;
import java.awt.event.*;
import java.applet.*;

public class edad extends Applet implements ActionListener {
    Button c;
    TextField ca;
	Label t, re;
    Image imagen;
        public void init(){
                t  = new Label ("NACIMIENTO: "); add(t);
                ca = new TextField(10); add(ca);
                c  = new Button("CALCULAR"); add(c);
                c.addActionListener(this);
		        re = new Label("------------"); add(re);
                imagen= getImage(getCodeBase(), "critiano5.jpg");

        }
        public void actionPerformed(ActionEvent e){
        		int a      = Integer.parseInt(ca.getText());
        		int actual = 2018;
        		int edad   = 0;
        		edad       = actual - a;
                        re.setText("Edad: "+ edad);
        }
        public static void main(String s[]){
                edad m   = new edad();
                m.init(); m.start();
                Frame f  = new Frame("CALCULO DE UNA EDAD"); 
                f.add("West", m);
                f.setSize(300, 300);
                f.setVisible(true);
        }

       public void paint(Graphics g) {
    g.drawImage(imagen, 2, 2, this);

  } 
}
