import java.awt.event.*;
import javax.swing.*;
import java.awt.*;
//import java.applet.*;
import java.util.regex.*;
import java.util.regex.Pattern.*;
import java.util.regex.Matcher.*;


public class ExpReg extends JFrame implements ActionListener{
	JButton evaluar;
	JTextField campo;
	JLabel instrucciones, resultado;
	Container c;
	public ExpReg () {
		c = getContentPane ();
		setTitle ("Verificador de placas");
		instrucciones = new JLabel ("Ingrese la placa sin guiones ni espacios"); c.add("North", instrucciones);
		evaluar = new JButton ("Evaluar Expresion"); c.add("East", evaluar);
		evaluar.addActionListener (this);
		campo = new JTextField (10); c.add("Center", campo);
		resultado = new JLabel ("                  "); c.add("South", resultado);
		setVisible(true); setSize(350, 150); setResizable(false);
	}

	public void actionPerformed ( ActionEvent e ){
			JButton b=(JButton)e.getSource();
			resultado.setIcon( b.getIcon() );
			Pattern p = Pattern.compile ("[0-9][1-9][A-Ca-c][0-9][A-Za-z&&[^IOÑQioñq]][A-Za-z&&[^IOÑQioñq]]");
			Matcher m = p.matcher (campo.getText());
			if (m.matches ()){
				resultado.setText ("Valida");
			}
			else {
				resultado.setText ("Invalida");
			}
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public static void main (String s[]){
		ExpReg ex = new ExpReg ();
	}
}