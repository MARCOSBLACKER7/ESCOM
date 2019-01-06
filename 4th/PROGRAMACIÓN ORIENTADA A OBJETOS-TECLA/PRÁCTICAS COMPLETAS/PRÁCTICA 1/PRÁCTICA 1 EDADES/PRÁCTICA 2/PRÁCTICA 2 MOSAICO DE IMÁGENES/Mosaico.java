import java.awt.event.*;
import javax.swing.*;
import java.applet.*;
import java.awt.*;
import javax.imageio.*;
import java.io.*;
import java.awt.image.*;
import javax.swing.JFrame;
public class Mosaico extends JFrame implements ActionListener {

	JButton botones[]=new JButton[40];
	JLabel mensaje;
	BufferedImage bimas[];
	String s= "";
	int turno=0;
	Container c;
		public Mosaico(){
		
			c=getContentPane();
			 bimas   = new BufferedImage[40];
				setLayout(new GridLayout(5, 8, 1, 1));
						for(int i=0; i<40; i++){
							s= i+ ".jpg";
							bimas[i]       =leeImagen(s);
							add(botones[i] =new JButton(new ImageIcon(bimas[i])));
							mensaje = new JLabel(" ");
							c.add(mensaje);
							botones[i].addActionListener(this);
						}
	            setSize(3000, 3000); setVisible(true);  
	            
		}
		public void actionPerformed ( ActionEvent e ){
			JButton b=(JButton)e.getSource();
			mensaje.setIcon( b.getIcon() );
		}
		public static void main(String s[]){ new Mosaico(); }

		 public BufferedImage leeImagen(String nombre){
	  		BufferedImage imagen;
	   		try {
	      			imagen = ImageIO.read(new File(nombre));     
	   		} catch (IOException e){
	        		System.err.println(e+" "+nombre);
	        		return null;
	   		}
	   		return imagen;
	   	}
}

	