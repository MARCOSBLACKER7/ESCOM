/*  Hecho por Vázquez Moreno Marcos Oswaldo
    Boleta 2016601777
	El 16 de Marzo de 2018
	Materia Teoría Computacional 
	Práctica número 3 AUTÓMATA FINITO DETERMINISTA
	Fecha de inicio 01  de Abril
	Fecha de terminación 01 de Abril
*/

//Librerías
import java.awt.event.*;
import javax.swing.*;
import java.awt.*;
import java.util.regex.*;
import java.util.regex.Pattern.*;
import java.util.regex.Matcher.*;

//Declaración de la clase pública Lenguajes que se mostrará en un JFrame con la implementación de una acción a algún botón
public class Lenguajes extends JFrame implements ActionListener{
	//Declaración de la variables de tipo botón, Campo de escritura, Etiqueta, Contenedor
	JButton evaluar;
	JTextField campo;
	JLabel instrucciones, resultado;
	Container c;
	//Constructor
	public Lenguajes () {
		//Declaración del contenedor
		c = getContentPane ();
		//creador del título
		setTitle ("HASHTAG");
		//texto dentro de la etiqueta y asginación 
		instrucciones = new JLabel ("INGRESE UN HASHTAG SIN ESPACIOS NI CARACTERES, RECONDANDO QUE PUEDE USAR TANTO LETRAS MINUSCULAS COMO MAYUSCULAS"); c.add("North", instrucciones);
		//Texto dentro del botón, agregandolo al Frame a la izquierda
		evaluar = new JButton ("Evaluar Hashtag"); c.add("West", evaluar);
		//Acción cuando se le de clic para evaluar
		evaluar.addActionListener (this);
		//Campo para insertar la cadena, en este caso el Hashtag
		campo = new JTextField (5); c.add("Center", campo);
		//Etiqueta en donde dirá si es valida o no
		resultado = new JLabel ("                  "); c.add("South", resultado);
		setVisible(true); setSize(850, 150); setResizable(true);
	}
	//clase para que al hacer clic en el  botón se pueda validar la expresión regular
	public void actionPerformed ( ActionEvent e ){
			JButton b=(JButton)e.getSource();
			resultado.setIcon( b.getIcon() );
			//palabra reservada de Java en la que puedes insertar expresiones regulares
			//Aquí dentro de los paréntesis colocas tu E.R. siendo forzoso el # seguido de 
			//cualquier combinación de la a-z o A-Z o 0-9 o _
			Pattern p = Pattern.compile ("#[a-zA-Z0-9]*");
			Matcher m = p.matcher (campo.getText());
			//validador si es correcta
			if (m.matches ()){
				resultado.setText ("VALIDA");
			}
			else if(m.matches () == false) { //caso contrario para el estado q0 al q1
				resultado.setText ("DEL ESTADO Q0 AL Q1 SOLO SE PUEDE USAR ---> # ");
			}
			if (m.matches ()){
				resultado.setText ("VALIDA");
			}
			else { //caso contrario para la validación del q1 hasta qn ya que no hay límite
				resultado.setText ("DEL ESTADO Q0 AL Q1 SOLO SE PUEDE USAR ---> # ");
			}
			

			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public static void main (String s[]){
		Lenguajes ex = new Lenguajes ();
	}
}